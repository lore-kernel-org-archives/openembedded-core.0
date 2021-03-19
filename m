Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.2807.1616136211955387633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 23:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dkVDJV9D;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id d10so4517918qve.7
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 23:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6URO3ujJn8MXHPw0Kjn1i+DDVHB9pVLSo+Tb6txAKDs=;
        b=dkVDJV9DCAgnrVmt5aGqMNMmMjSun3pN9vPT1nxwzdz57/Hy9ZQCwV5EzZwBVxSkVy
         EH4AQMyVkwLDOL4+Ek2AH38N8NeDpTttN9sXBH0T3RqrMNW3Pz5Te9MbAF5k+G3xrcC9
         dltovMs8lMzNBAlCy2Dqn6xbWAZXt99/m2Oj4myM+UnOECIxTpjFM2wW98CmYEim1yZN
         jSXGZ0af/oiUhsBCd5XN+P+avdDtFFulCNGmU5neAVBhQKrgZRYQC+jy3QsxFK1nguZa
         88D1qM/CSq35axUIxERBZq20re6m44XYzpQODjQ4hv3DJ4TSXhQsyVPbNykrYxpLOooQ
         sUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6URO3ujJn8MXHPw0Kjn1i+DDVHB9pVLSo+Tb6txAKDs=;
        b=MoyiFD4tCnOgq6TWx2tKUbP7W4+sV76YSdW0B3L1qWbY1wVUFLthRkSMhlP+SVXf0t
         9ez85yOFQasp9lLmheoLWgZyGlGxLEszZwmiTKM7DxM/2Nu/oyrNwnI1FMGi0CahAB87
         oewJDumQSwtQwImvfqs8aHKf1UCFCqp7Yxe4S29LQVyXvkXk8iF7d57PqAC1v4q8nGmX
         HdvEocNk8jONkFotEwh3htUTcNofvv/n8V56bBvZ0xwXN3/BfWjeb2rPcGzX3oQdd1VH
         WvDjx+YIBH3H9oQIfgZaNd1V6OdM8jHIRxeKQLkWMzwFRE3OmhTVPoZPRDuUmIIhsaWn
         8iZQ==
X-Gm-Message-State: AOAM533JGnFA2QnoEJtGHic1MDo0TPtbNcvrEfMQKo41gh/H5AyBQzCW
	ogN/SN+dPBWZ/D/wQDRpJAiGjQvjH1hKSN4Qt98=
X-Google-Smtp-Source: ABdhPJy6WI/FB0rC4hrX6gh7CINyxjeqtFj8kFfi2YKCGaytF1wTD4y0KMRded2Vs3+dqhjaLoUJ6XZjdF11cE0X14E=
X-Received: by 2002:a05:6214:80d:: with SMTP id df13mr8042879qvb.55.1616136210873;
 Thu, 18 Mar 2021 23:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <1616003424-27799-1-git-send-email-zhengrq.fnst@cn.fujitsu.com> <CAMKF1sqaVqJxEuSL=HtR-JP46d_g4R=YrF2yYtG1w9UYuYwaoA@mail.gmail.com>
In-Reply-To: <CAMKF1sqaVqJxEuSL=HtR-JP46d_g4R=YrF2yYtG1w9UYuYwaoA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 18 Mar 2021 23:43:04 -0700
Message-ID: <CAMKF1so1mviZtHDZXNn-P9Lt5s64GVi-rDWAhxWpAAW6v4ghEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] stress-ng: upgrade 0.12.04 -> 0.12.05
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

here is full error report on qemux86/musl
https://errors.yoctoproject.org/Errors/Details/574204/

On Thu, Mar 18, 2021 at 11:28 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> failed on musl
>
> | core-shim.o:core-shim.c:function shim_pidfd_open: error: undefined
> reference to 'pidfd_open'
> | stress-pthread.o:stress-pthread.c:function stress_pthread: error:
> undefined reference to 'pthread_sigqueue'
> | collect2: error: ld returned 1 exit status
>
> On Wed, Mar 17, 2021 at 1:51 AM zhengruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
> >
> > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > ---
> >  .../stress-ng/{stress-ng_0.12.04.bb => stress-ng_0.12.05.bb}    | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-extended/stress-ng/{stress-ng_0.12.04.bb => stress-ng_0.12.05.bb} (90%)
> >
> > diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
> > similarity index 90%
> > rename from meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb
> > rename to meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
> > index 28887204d9..eb6bdb4a81 100644
> > --- a/meta/recipes-extended/stress-ng/stress-ng_0.12.04.bb
> > +++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
> > @@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
> >             file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
> >             file://no_daddr_t.patch \
> >             "
> > -SRC_URI[sha256sum] = "b4e34bda8db4ed37e33b7a861bc06ad77cbbd234d63236da2cb58f02e3f3218e"
> > +SRC_URI[sha256sum] = "af7779aee38e6d94726ed7d5cf36384a64d50c86e42fff89c141d8609913f425"
> >
> >  DEPENDS = "coreutils-native"
> >
> > --
> > 2.25.1
> >
> >
> > 
> >
