Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.3283.1630535732052137207
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 15:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GGAH7fQT;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id e131so1680420ybb.7
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 15:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pDz7K/GXGZIh6dPrI1B9o8M/hxz3/FVH4p4sEqioUpk=;
        b=GGAH7fQT/hkqNaRGFT4nchBcu9ryWuK3CfpsFc15aTLYZPPMcew09iWxMD2aMi3Z9b
         Ncc0VNjCLxn9ssYUx4BNGsYljYqA7qkExv7S2jxS4TSo9vIqJI1HaxBQVmGeH9g4Hm/4
         N2SKQXc8FvUtD2XeQegtgJJ2Aoo5znx1USPOcaTh3kVZmd5/mcgvB7NjNXd92SXFW87f
         QnYC+j4yEESemuEw10IbSpruC4+35L4PiYP7xfY9saOEi4BQN9YPvMEbUh0uXOOPvCVS
         EAZ+K0j4F5TyYKJrT2alSVyu97EzWDzDVOhXccau0Uhe0STjVEo7TZJWpS9VesCKQDcz
         lk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pDz7K/GXGZIh6dPrI1B9o8M/hxz3/FVH4p4sEqioUpk=;
        b=nPXv+LxcSoaGXNkHU5iRx7r/3q62DtRfUxDulRKwR81nRh04lmGJOSY/948bxgR6yV
         lbpGrCpSfk35dUnt+tHGBsVJZ3E6+J+cFNTNAxUtcTTYnb6Cq170co+QvIU47/tCNXtk
         sO+6CtaafrpCJEBIxQ+6y1/OUVUxxv49meZBbBWH19C+FgW9ZvMf0Lcd6gY91yW55R1w
         BVB/wTJiYQEAQaF1hDYnpnaV2c4oS3Mv5C/e0ODIf1i19pHOj5JHNZoavCVJqpbeGBRV
         zMWxeu0xSvB1yYYGiXT0uGVfc7Z7/Sa8xeq6Ne0pWpXmOCYCEddEcSyu7uA4HPBP1Is+
         jlPw==
X-Gm-Message-State: AOAM533ImO+ONh+D5bocb2spDUJtiOm/c1tqAQKHFzeqRRVSvicNYesL
	FEEX1Wupxe+DyjmFwoEZYMDyAc+ZjzwI8dCUuHI=
X-Google-Smtp-Source: ABdhPJwXz8kmiy5qttXP9Fqw1yHnRU0nVMWPXKYqq+WpumB5fFQ+VqCIwpd+1zcjI19WUwltCpGmcKraci8F/f/OIwQ=
X-Received: by 2002:a25:5bc5:: with SMTP id p188mr253201ybb.523.1630535731234;
 Wed, 01 Sep 2021 15:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210823101205.29267-1-andrej.valek@siemens.com>
 <20210826131549.2349482-1-andrej.valek@siemens.com> <3f9e5142ddd2b90cc3e150287d0f88456188d56b.camel@siemens.com>
In-Reply-To: <3f9e5142ddd2b90cc3e150287d0f88456188d56b.camel@siemens.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 1 Sep 2021 12:35:18 -1000
Message-ID: <CAGDS+n=1TESUosknrqcO2NePBtufzL+QwAp40zpq6MzH0mju2w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] vim: add option to disable NLS support
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 9:04 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> Hello Steve,
>
> Could you please cherry-pick this patch into dunfell branch too?

OK, will add this to my test queue.

Steve

>
> Thank you,
> Andrej
>
> On Thu, 2021-08-26 at 15:15 +0200, Andrej Valek wrote:
> > - Some distributions with UTF-8 locale have problem when National
> > Language
> > Support is enabled. Add there an option to disable it.
> >
> > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > ---
> >  meta/recipes-support/vim/vim.inc | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-
> > support/vim/vim.inc
> > index 17d1c24a7c..860fd24863 100644
> > --- a/meta/recipes-support/vim/vim.inc
> > +++ b/meta/recipes-support/vim/vim.inc
> > @@ -54,11 +54,12 @@ do_compile() {
> >      autotools_do_compile
> >  }
> >
> > -#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> > +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny selinux,
> > elfutils, nls
> >  PACKAGECONFIG ??= ""
> >  PACKAGECONFIG += " \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '',
> > d)} \
> > +    nls \
> >  "
> >
> >  PACKAGECONFIG[gtkgui] = "--enable-gui=gtk3,--enable-gui=no,gtk+3"
> > @@ -67,6 +68,7 @@ PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
> >  PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
> >  PACKAGECONFIG[selinux] = "--enable-selinux,--disable-
> > selinux,libselinux,"
> >  PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
> > +PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
> >
> >  EXTRA_OECONF = " \
> >      --disable-gpm \
>
>
> 
>
