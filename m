Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F4BC3A5A1
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.6027.1650450000174053561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 03:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=cFfM/I3v;
 spf=pass (domain: burtonini.com, ip: 209.85.128.49,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f49.google.com with SMTP id x3so863525wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 03:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nqaconEvf/QQx0RpGRrngdXIkE+6MAoropGa+Rxt5y4=;
        b=cFfM/I3v7voa9eS307Es8TpQCqdoXpq33MfE097mbtnGh+j5LjQAcK0GTkacWQirXw
         ZAzkEjK4iKDfm1Zvxdr4IhWQyPhouXB0KzowDrKJsUg3ADGXqU6V3q8frhiIfKO/GPAg
         2vWAAH1qKwoU1TxIxRQWIxCqCMJGABFRCxhRJaWMdxc1TV3RZAvN2A5XIqZROf4a0ZZd
         7xIiDEua0bFMEUsFG60cWxPafh/Morq1VIWTJ4V6Rpryd431tsNpqMEUhuNV86s+ZBOw
         dGCoJl2hSaJk/U1eKzejED2cIV8vo1ntcW55rDlTWzG3fGIRLvoo3WWB78tuZre+CoPi
         g8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nqaconEvf/QQx0RpGRrngdXIkE+6MAoropGa+Rxt5y4=;
        b=O4PY2C1GkiXAQQxzKfeUYV/B6BGrH6NYYqQ3cZlAP9df42COpUcvQf9nOAgjG9Cl6R
         Oroj91EoswGN+GTQj/Tp2w9jknhH17pQelCrqxuibsn73m4sDBXQa7eE+cth1QMDvhvI
         DpnCvG3nJ3DdBmW/DrNJKnZySmYL2OfFsdnCDvVWwaI2saDW0CxnMLApvcPHgvx6QrXJ
         PJBaviwBToDwAKGaPtZc4oyHO0jDoVtZjbuzt96tcMI9MNaebo5hpj5N4CcqJCPzd9ir
         uHs8F5vBTmYprcRA8vUHlrfTYFIVjGhnPdjv5vKJV4lSiVPyEhZ1yAHP17URWwXdWiB9
         YIEA==
X-Gm-Message-State: AOAM530HmtNunlYMTywfqPcSscHWuslXAt0MobK3RAuu7uVCYA0UXe4X
	dRgbI/wD1GOc+gTZDFLRjdWTj7LI1eOALrNzyaa5Hw==
X-Google-Smtp-Source: 
 ABdhPJwdCy2J/3CTUO+xkklMS7hgmtQtkEsj+72tt8d9aKGhlbEEAJ9bgMmbFwwfWj5wYqbvH7BYXPoxD/scyRTy534=
X-Received: by 2002:a7b:c105:0:b0:38e:b992:a035 with SMTP id
 w5-20020a7bc105000000b0038eb992a035mr2899670wmi.106.1650449998230; Wed, 20
 Apr 2022 03:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <1650427819-28266-1-git-send-email-wangmy@fujitsu.com>
 <1650427819-28266-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1650427819-28266-3-git-send-email-wangmy@fujitsu.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 20 Apr 2022 11:19:47 +0100
Message-ID: 
 <CAAnfSTs9Lc6OJSXabup15biU6rd=DQB=BSkqYTCtZQLamr-DHg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xdpyinfo: upgrade 1.3.2 -> 1.3.3
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164662

On Wed, 20 Apr 2022 at 05:10, wangmy <wangmy@fujitsu.com> wrote:
> temporarily override SRC_URI which is hard-coded in xorg-app-common.inc
> since new versions of packages use a new compression format - .tar.xz

Why would this be temporary?  Do you expect xorg to stop using tar.xz,
or do you expect *every* package to move to .xz?  I don't see either
happening in the short term, so I'd say the solution here would be to
parameterise the compression in xorg-app-common.inc.  For now default
to .gz but in the long run if the majority are .xz that can change.

Ross

