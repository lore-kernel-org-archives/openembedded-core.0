Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web12.1928.1588275478493881643
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 12:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Te7QR3FR;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id z16so2908461uae.11
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 12:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=IQnm0t0u37xoadGb1Telehgnz5H0Mdd3Yv1SUFafb1Q=;
        b=Te7QR3FRmFu7aAlzSoTYE3Ot7g2sR4Qke1nQjeZQ/go4dXN7OzBdi5j0NWekCV2LdH
         gg/PSk+q++Kxsl75yGsM3NFTu/+wq/QI2bl6uv5ALoHo1XveBcq6iRfg6eu/dKs99TIu
         PlXx32lNC9HibRaNpynJKHCklo7CPetQcgFstmaukaVcS8M2yfktPWTtJ8wLBsw0r27S
         bJq05hwYcmmNrf9DBpEM5MkrSAKxISlzLjITbBEiZ28ex6SUDOISjgg3oVcqD38fd75Y
         kIeVGPYptc5EGg9bvV/pbm2XwhYyfB6YzssJ5bIICHLkwm8oyl/8xT6eWPNHcqdTU2t7
         QfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=IQnm0t0u37xoadGb1Telehgnz5H0Mdd3Yv1SUFafb1Q=;
        b=d1PQxMcaZgiLHyriFK0UlhVlDYaTzHOsVh6S+Vdr5017PIuPHBC6a99XGndideijKg
         hY/0cElqTNp6xVXLGF4hJHvX4P08jgoByLK1GSMmUZzWvb01uubxM6gIJOeXJuVpSusO
         Gva5DePCMBnRtDBUoxNjJuXiPYT26Er1C47Y+RMFwO6ZYfsV51u1TgtrZIK54vKRwVV+
         yeRm1g8BEOUy/pxFEv0beFGIiPOG2JxPxpXREAvaUMj3QQZlxVJMe2Haa683a2GctSaF
         yGsW/Pv94/1LAiSOn7Lf9LKjbgcGETCVX+uK8WzJaQSWjaTnr6BxzU3eJh/CD07As5/y
         10Zw==
X-Gm-Message-State: AGi0PubOzpQFe90qgh0FJeSGJEW7vzCwd42JO6JMJia4jmP25zl4XCnm
	oWfOtpCOnsU6JZNRkWtsdLyr6EfN/glaDSfZ1sMGxQ==
X-Google-Smtp-Source: APiQypKiqoEmggy/OQJOC4KCuMOIumq276mYeFMH+7uCFhG9zT0Ng+nnMM4WZUWZnpifFJ4S2h6v8bvDQ1pmt1R72rM=
X-Received: by 2002:ab0:2095:: with SMTP id r21mr275061uak.92.1588275476601;
 Thu, 30 Apr 2020 12:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588175775.git.steve@sakoman.com> <f03ee1a2a697394f3c4168350089526ef6b87de6.1588175775.git.steve@sakoman.com>
 <CAJ86T=WRV+Uny9-4J--0sS2cr5CAtA=D4gFXHgm=-pXsX=BjKg@mail.gmail.com>
 <160A69FC1635E57D.20868@lists.openembedded.org> <CAGDS+nn9dTG9hG2p3v_J7Pf55pD-1vxx6xUOGTBTeeK2s+bQbw@mail.gmail.com>
In-Reply-To: <CAGDS+nn9dTG9hG2p3v_J7Pf55pD-1vxx6xUOGTBTeeK2s+bQbw@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 30 Apr 2020 12:37:47 -0700
Message-ID: <CAJ86T=UFi-sfcRJ7u0wuym-dtPiutPnO0v1uHf0O0tArzCW0Cg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 02/16] bzip2/pbzip2: Correct license information
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 30, 2020 at 8:53 AM Steve Sakoman <sakoman@gmail.com> wrote:
>
> On Wed, Apr 29, 2020 at 12:12 PM Steve Sakoman via
> lists.openembedded.org <sakoman=gmail.com@lists.openembedded.org>
> wrote:
>
> > > The corresponding update to the busybox recipe should be merged too.
> >
> > Thanks, I'm picking that one up in the next batch.
>
> In fact, I'm going to move this patch to my next set and group all the
> bzip license changes and fixes together.

Sounds like the safest approach while the issues with this change are
still being fixed. Note that it's going to affect anyone with their
own custom recipe for busybox too, but maybe it's early enough in the
3.1 release cycle that it's still OK to break a few external recipes.
