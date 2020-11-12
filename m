Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.9446.1605208330352084812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 11:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gQghm2LV;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id r7so6425379qkf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 11:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4U7PrqG+KmhxVsbe7I6t6Q4YL7SanVtCquOz1PsF6LA=;
        b=gQghm2LVZOLzx72pN/lPpBgkMdlxUd74XIWBrYeQ1xPg2Y0kKf/Qc1fhB5aELkwpxN
         zt0uE5YLY6oJ5DhJr6Caac9Z3jp3to7R6nQIuZmaeHNfFyeG3w6qsO2LDppgeqgUI3kD
         J0jHG/5aKoMdrNoHTIeOupUXfT1Lv33HkuMYbNdBzh41h2Zrh21jzFAjaftOF4Cquf67
         wPqf9SldXTSbVBM0CDV+tMtcqsoy1uUPid9avcpnz93dzzg/HF0j/DG1aLY1K2eNhG18
         hjCfNJ2k7yuVrOeQxJFhqvGDCEtVSO4RS+wBtptn61aAbnZYAOSIDkT+4PbSa2/uWrpq
         CIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4U7PrqG+KmhxVsbe7I6t6Q4YL7SanVtCquOz1PsF6LA=;
        b=Wl/sfOfDxw+jxgPOmtrVthVlCjBzXKPOSl3R+tBFSm5CMSXQ2tTO4+Yw2JEs6fJNLJ
         hAxC93UBuML74onc2Ip4r1DF/Z0ipmh4Ull3e05R6NV1koEIwIs+eZ6qmAVhemDreNFm
         ovY4EQKQ/T8qCewH4poCdboHkiz8cgk3nMNpFbdkqOxdej3dSKe/JXWlS7CW4x/AjvSI
         R2QrgP7CtHo2L9Mhe4FLICOyIlO+f8Vm44isW7xpHjhuLFNK+luplCxJQCUgNS9AhXqU
         H1EKODaQEeY4RvwEizvXktdMNCzIcJTx6OT6hGO7ssa2zgzoIiHiaO37WDe7duqXiY3H
         cDng==
X-Gm-Message-State: AOAM5308FLhXq0Tfo7DsW+bCHUGMF3zOiV61bI4TCSNzbL0yBtsFfJTK
	Euoy6mOHZtpOiAx4eb7i/5OU+drRkNoogmqbrps=
X-Google-Smtp-Source: ABdhPJwMLkICIY5+dDAoYO21vhBYMxl6QbHsmx++DH+C9S/copPwRiFWnYPNPQwzaCWo7jaKb5GCIRcPJjAQvvkVtQM=
X-Received: by 2002:a37:a70e:: with SMTP id q14mr1250518qke.337.1605208329394;
 Thu, 12 Nov 2020 11:12:09 -0800 (PST)
MIME-Version: 1.0
References: <20200120234818.13068-1-dan.callaghan@opengear.com>
 <20200121012412.6495-1-dan.callaghan@opengear.com> <1605166753-sup-2782@galangal.danc.bne.opengear.com>
In-Reply-To: <1605166753-sup-2782@galangal.danc.bne.opengear.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 12 Nov 2020 11:11:43 -0800
Message-ID: <CAMKF1srS1r4SjPLmP2_Z2tY4QcYa=+RUYUKyXkfL14mPbD7jSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gdb: add PACKAGECONFIG for xz (lzma) compression support
To: "Callaghan, Dan" <dan.callaghan@opengear.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2020 at 11:40 PM Dan Callaghan via
lists.openembedded.org
<dan.callaghan=opengear.com@lists.openembedded.org> wrote:
>
> Bump... I just noticed this patch was never applied. I have been
> carrying it locally all year and it still applies cleanly. Any issues
> preventing it from being applied?
>

thanks, I think this patch is fine.

> Excerpts from Dan Callaghan's message of 2020-01-21 11:24:12 +10:00:
> > Similar to elfutils, when xz support is built into gdb it will be able
> > to read xz-compressed ELF sections containing debuginfo. This is used by
> > the "mini debuginfo" format:
> > https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html
> >
> > Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> > ---
> >  meta/recipes-devtools/gdb/gdb-common.inc | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> > index 08f615addf..878a03715c 100644
> > --- a/meta/recipes-devtools/gdb/gdb-common.inc
> > +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> > @@ -21,7 +21,7 @@ EXPAT = "--with-expat --with-libexpat-prefix=${STAGING_DIR_HOST}"
> >
> >  EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
> >                  --with-curses --disable-multilib --disable-sim \
> > -                --without-lzma --without-guile \
> > +                --without-guile \
> >                  ${GDBPROPREFIX} ${EXPAT} \
> >                  ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
> >                  --disable-rpath \
> > @@ -37,6 +37,7 @@ PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python
> >  PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
> >  # ncurses is already a hard DEPENDS, but would be added here if it weren't
> >  PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
> > +PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
> >
> >  GDBPROPREFIX = "--program-prefix=''"
> >
>
> --
> Dan Callaghan <dan.callaghan@digi.com>
> Software Engineer
> Opengear <https://opengear.com/>
>
> 
>
