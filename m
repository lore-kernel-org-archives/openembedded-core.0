Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.6340.1604121738658626989
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 22:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jGzwrP4Z;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id e5so171980qvr.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 22:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lIdg2XdQdi4okxuN6vAE9OoBXrrAcLmgGb4Tnjw2+/w=;
        b=jGzwrP4ZlFcghBCsoXX6gpF9srbOezVnuzzFb/L3NlncVIjeXKgIB3bagN96ZXLLz7
         zaKKd5+H7RFeXK8QS/wQ8Lf98YrBgItJGtxFVeQCfTd+3QiUBaFxkyxegq86M2ILAJDi
         Yy7iaLW0UaD4c10ixfUaxPFBxrnmutHzIie8SC9V9c90k+90Kf3f1LewFTUCByvj93tu
         DEenRkiyVF3rJ9Z+x/2CnaC9QphV2tPOjhsQ+9dusWsEZ2bKVzGFh2K7Cxw6/EcvxY4N
         iAZ1oZh+cJKAcAlnATy13r9UtbCmCen3hPbBj7we42TZSqxIxktssWYtRMcrqRD4SngN
         852A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lIdg2XdQdi4okxuN6vAE9OoBXrrAcLmgGb4Tnjw2+/w=;
        b=C0JgE4cpXu1jfzIF+U0uoA+mE2qt8BfP46NmDmm6YAgIfE+oGY0ICxyO2pTL/Nkn6N
         uYdsxD0Vo9IPMsZAtgjuoGNpCgLSTln8myauPQ4CwX8MIof/GVZONSGjhABmM4XDMwxX
         7mCKzV78EFv0VNAw7QgXLwM+vOvt/qc/aNdDc1smIOfca4KUzs57WUrOr1koWrRCt4DK
         FitoBeMKL6C/mOUBpTdHAtzgL2rD7jqkVOrTD3PjNnWRFKfYoEx4fyZZGgHETi7km7PX
         3Q9ELL7aHdhdOFl5jsgf/NZlRO1DT0soOaRW2uGytaOpu2lRG8Q+MfOp33FP96l1mhQk
         uxqA==
X-Gm-Message-State: AOAM530iIj1u52efcRcRYmo1n8cZI1+7Af754HqDarsiezVDHAGY5Cgs
	klOZoTwQ3F7dz87+AatThA1esoE9677VHeNC3zU=
X-Google-Smtp-Source: ABdhPJz0XPDQjVwrb+LWUYu6PfQ2LnK5lT/t1cl5r8cZPpklXk/0qb8Pirz/Mo6oLJCByPOQPzKHxc9R+wIauDq5JuU=
X-Received: by 2002:a0c:e387:: with SMTP id a7mr12836469qvl.21.1604121737540;
 Fri, 30 Oct 2020 22:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201030201433.1776776-1-raj.khem@gmail.com> <395078c7524717b4fee84f188889ad7644edf7e2.camel@linuxfoundation.org>
In-Reply-To: <395078c7524717b4fee84f188889ad7644edf7e2.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 30 Oct 2020 22:21:50 -0700
Message-ID: <CAMKF1sqkwV8V30q4pNq7jmXvno69PqFEv7Jy0n=LKxBANQRnRw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb: Update to 10.x release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 30, 2020 at 3:44 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-10-30 at 13:14 -0700, Khem Raj wrote:
> > here is announcement [1]
> > [1] https://www.gnu.org/software/gdb/download/ANNOUNCEMENT
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Failed on genericx86:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/1538
>

yeah needed to enable static libctf , check out v2

> Cheers,
>
> Richard
>
