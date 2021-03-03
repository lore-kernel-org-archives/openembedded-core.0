Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.9169.1614788896270195685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 08:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vpr4vH7u;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.46, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f46.google.com with SMTP id n4so6901795wmq.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 08:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tGxk5EHOCkKl8hXh81xI0JZkogVBzzUZfXyREzwFQFY=;
        b=vpr4vH7uLJvgkGMstY1a236TghTlp2UefdVRj/+OSRlWRurBbcMkBqhegeKqjVI4+V
         5ecHzGrctOWDHzfYjZxRGrwaTInC0fUdHjqIVdjIFxIIPDensNiLj2uwQoRMp85WHXXc
         MwzwJC47nfYZBVx/QOMLm2LP/9S3ZEzA/1rkoDHVuyhhZgk/aFWRZkbnLN7fFKKr2B+u
         Pex3wVZL2h6OxnTU4TRhi1jgcA1TJJnkQ7dqXmg2WQs/yDvYBGBut58LxTiF0ZNR3F3z
         TE7fKb2dMMpM8NEIS39oWl37ngxAv2o0KWmuUHCIKrsYcC38OULjeblTPSYaGySeMkJV
         vAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tGxk5EHOCkKl8hXh81xI0JZkogVBzzUZfXyREzwFQFY=;
        b=QBODrhirFUNXDXY9lxAHL5ad7PtGgaahqwoDoUveYKFs2UXk+nNvIRjLcWx8wKGILB
         2Npy7y4knc5/s3o12pld2L2tsaNw0VPwGux78wFi044TtcSBtJi2ep3ivLLG2n9+TiXK
         zVsjvcrcSO+ROfn8GjOoqK9R6jhPUzN8tGk24XZ/N7ty6nzy1NSzBdbgzQVPdYVsIUT/
         9y3jopqmwIAZfVsQJCdiQf1i3SOVvp9/MIfm2Lo7Qd3PfKQj9I3/ng/7WFcCtVt+KYt1
         RcMmC4Ku5Exo0L9ks1ZERMvZevECItmOJfztQc4OsSbajdDze8x7XKbx44fUXrIpPghQ
         ETwA==
X-Gm-Message-State: AOAM532fmHjp1sYAY/b9jSYQ2EvCh0kEZpV+OQzoxB0vjufxiixi0Rye
	AAKbxsr05ToLB/iZJtSXhixNY6Zc1w6Qzw7b4TZyFw==
X-Google-Smtp-Source: ABdhPJzNuJqr0k6eJqdcjwyJ2jXHwhPSwHyypLKwtx/fO1eUcF4BX7QMJAziyoBiHli8OWnRg0fkuuwElzkv+joCiZo=
X-Received: by 2002:a1c:67d6:: with SMTP id b205mr4367720wmc.118.1614788894524;
 Wed, 03 Mar 2021 08:28:14 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8ynCZ5fF4=rzdAkv=yGFyOtF97WD-c5MknNON_9HMxfA@mail.gmail.com>
 <28099.1614691555012100324@lists.openembedded.org> <CANNYZj81J+HqeEGRBesa2VW=+UDA6+bpp=0M7=MXjRzGUuwLYw@mail.gmail.com>
In-Reply-To: <CANNYZj81J+HqeEGRBesa2VW=+UDA6+bpp=0M7=MXjRzGUuwLYw@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 3 Mar 2021 06:28:02 -1000
Message-ID: <CAOSpxdaNZ3s69-GAEQcdgR1T1nhAu5zyMrT7iBHEz9_+fVMJTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] dosfstools: update 4.1 -> 4.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Colin Finck <c.finck@enlyze.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 2, 2021 at 3:36 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Tue, 2 Mar 2021 at 14:26, Colin Finck <c.finck@enlyze.com> wrote:

>> Who decides about backporting or not backporting dosfstools 4.2 to Dunfell?
>> I can only stress again that a large number of devices in the wild are currently running on FAT boot partitions, and come with a dosfschk version that likes to destroy these boot partitions.
> That would be Steve. It's best if you cherry-pick the needed patches into current dunfell tip, and send them here with [dunfell] prefix, adding the rationale to the commit messages.

Yes, please cherry-pick the required patches onto dunfell and send to
the list with as much justification as possible (and highlight any
downsides).  SInce this may result in failures in other layers I want
this proposed change to get as much review as possible.

Thanks!

Steve
