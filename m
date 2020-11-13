Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web12.6234.1605282517225503935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 07:48:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KHK24Khj;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id l14so4976672ybq.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 07:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=chETI9PkwarQOWJ0uPFvTOW1waeYioVhMIslF03khdo=;
        b=KHK24KhjhRXKg4rJfQJmRRRLDmU1fzpb2Ti+Y/qw5lXLQndFDzmi1LeAh7a1gWpUiX
         TW0sJe/uL7ptLASEgNR9B+d7BhaPd8OfkhRGAYvddDxak9KhJLNaaRI0/RUAOmXNCMny
         pb6HCYjevIXqahAV2STPWV1x8sKk/r/oEVcZ4TCN0xzUUXFKXcdTGw91Svy9vRMBokFs
         JYKJvrQbL5aLC03hN/4MQU0W8ye++61Du/L0Yfqc8gtXa51cANsPz5lyY4ApHAJCp7pz
         x4TBx3uA6oapldUq/KIJ98FeOcJxtNASFT1XeCU9Ko8HRLmCrDcnbqL+9Yk/4aJKWImQ
         CIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=chETI9PkwarQOWJ0uPFvTOW1waeYioVhMIslF03khdo=;
        b=Dkh6a7c71FOu/k5HMPdvACe9NzhmT0hzShuOXpl7gCAvRG7Rde7E1oLCTUtqiyxO6d
         CiRV6kZ4l59PYsoCxPiarF3SEQnCGRhypoYEjC/EZAA5drHl1Qk6G8lVsxZMiNa7sgfW
         /vo8m5LZR6bEdQHtu22nJduGj2YvCoeLLNwEpOTOuVJUF/7B9YJqzAR+0N6q3khoI745
         P9iDc3zXXw9UqyNcn8hpxu75RvhBf6Mw76bc2vPMVQm4/j2cCIGDiCiim1Y3BeEvooCE
         WiVNzhTcvBIgf/lL+ERE4Lm6ShzOrJMVdb+/gUr8Gikr1SHKTzMgVC9MlJ+vsan/zLDf
         axsw==
X-Gm-Message-State: AOAM531J3cYpAUDmt1cqVA4mafWrlfy49XXUXKHrP7Umr0Sklm3KjBrW
	JGrCpdCvh5wpr8/vsJJe7MoZaSSIukT4/yxX3Cg=
X-Google-Smtp-Source: ABdhPJxZ3sQOIpjYhoYCnmc1J8LvYlkPMO7+qITNwCefkCQg5lg6w7izN9wZyBuCONS5HyVjMtXsmm2a3ixOaE+lkew=
X-Received: by 2002:a25:9705:: with SMTP id d5mr2654465ybo.290.1605282510720;
 Fri, 13 Nov 2020 07:48:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605278902.git.steve@sakoman.com> <324a890cf711efc732e3a27325f81a27c92173d8.1605278902.git.steve@sakoman.com>
 <d69129bae24c3b73ec40105d2a7e16d90f85ace7.camel@intel.com>
In-Reply-To: <d69129bae24c3b73ec40105d2a7e16d90f85ace7.camel@intel.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 13 Nov 2020 05:48:19 -1000
Message-ID: <CAGDS+nkWfAuFw2RJpxksU=tn0J0cv6UiXWWpgUhdVkW8tGe5Nw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 16/18] openssh: upgrade 8.3p1 -> 8.4p1 to fix CVE-2020-14145 and CVE-2020-15778
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2020 at 5:34 AM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> Hi Steve,
>
> On Fri, 2020-11-13 at 04:52 -1000, Steve Sakoman wrote:
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> > CVE-2020-14145
> >
> > The client side in OpenSSH 5.7 through 8.3 has an Observable
> > Discrepancy leading to an information leak in the algorithm
> > negotiation. This allows man-in-the-middle attackers to target
> > initial connection attempts (where no host key for the server
> > has been cached by the client).
>
> I am not sure if this CVE should be considered fixed. Please see
> Section 3.1:
>
> https://www.fzi.de/fileadmin/user_upload/2020-06-26-FSA-2020-2.pdf

I hadn't seen this.  I'll drop the version upgrade from the pull request.

Hopefully someone can submit a patch set that does fix these issues.

Steve


> Also, this isn't a bug fix release and has potentially incompatible
> changes that may affect existing configurations as per the release
> notes:
>
> https://www.openssh.com/txt/release-8.4
>
> Thanks,
>
> Anuj
>
>
> 
>
