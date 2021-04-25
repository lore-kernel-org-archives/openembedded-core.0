Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web12.7480.1619322425716394705
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 20:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fS9lbXW/;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id h15so15923498qvu.4
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 20:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Y8QsbRI25W3NrRkvXM5Qc0WPp7jo5M360/R0R8HSJM=;
        b=fS9lbXW/WJ1Zphmci+EIc/zS3lR0HVX4ItfwLIybcpbXR2FLbvmzPGGI6u2heFg3r1
         AITSoJV7taC6NFIHQSuDzmfNOSySVTr9lSCUNXrWErN5cOalk7y+0cg2hPe5vGwalUoC
         i7axmHJiqzLiikdeDa3D5p2DhpSflpaNINRGGVPsRxmdoPmyiF5l/o9ocBpTI2xANUuT
         YvGUn17RSY6HTfR2nBZqx/EIWr+bZCjaqnO5jrhZxJZYB37YWy8hkxepz2+j7CvY/R91
         bqxUQTCE0qCPWjmhOQffkbEFC7Ev9xJxQLXQEh/O279dobpBqRSIO9W+ABdeb+aLGT0L
         BVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Y8QsbRI25W3NrRkvXM5Qc0WPp7jo5M360/R0R8HSJM=;
        b=XKEAPpU76lCstKOlb17lH3iJlTwn97r1Cx7mPBQIl1U08bcZ6LbzGeUsluSCCUD3s6
         WxWPvBaLJUGx8IPhwk3yGrkyv4/4Gk/DDPzAegFJTo8NL1Jug3SJECtSUO7XHEbNlf7f
         +3lU9cR82hTMT1RUCFout9+TLrqsViSOxMUbanuFaV8mR8S25+dTdHu9cGgNnoh6tNxz
         ABRivMs8KhUleDbaWx/3K7EO79KrLgUBWTA3purlVzZzF7I71fXqzUrFRmIpkIyJ1Eru
         to57zMNXj9isZJvvX/pk4m5uz5FATHzYzYpep9pLIQBUj0UF6alnyAROk4+o8MetFQgC
         SK3w==
X-Gm-Message-State: AOAM530jbh0lVvegnCTXkH0fcCgVXscuaoyGTHcQQI7DP5cOS27NcC2V
	HcdS6cii/NpMK7Tii6706LhOpCmiQApK2jpeYqg=
X-Google-Smtp-Source: ABdhPJy8P7IDyziNeuu3QnSM79UTEgVXxtdT1TXaObT1ATsGttU++ysXavyfpo8fPX/r5DkwcaQdqrvM5Kovul1KnM8=
X-Received: by 2002:a0c:b218:: with SMTP id x24mr11835146qvd.55.1619322424672;
 Sat, 24 Apr 2021 20:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210424155639.1131482-1-akuster808@gmail.com>
 <20210424155639.1131482-2-akuster808@gmail.com> <CAMKF1sqK5+BHjiDcY=JJeueeUHw+3WPpu0hE-4EddpBF0OFvLQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqK5+BHjiDcY=JJeueeUHw+3WPpu0hE-4EddpBF0OFvLQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 24 Apr 2021 20:46:37 -0700
Message-ID: <CAMKF1soMa-pBf3hFCqDQnJ7x-Ff1NcKB8udir2W9oEVRQieY7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] libseccomp: move recipe from meta-security to core
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

musl/x86 apt fails

https://errors.yoctoproject.org/Errors/Details/577480/

On Sat, Apr 24, 2021 at 3:16 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> riscv32 is not happy
>
> ERROR: Nothing PROVIDES 'libseccomp' (but
> /home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-core/systemd/systemd_247.6.bb,
> /home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-support/gnutls/gnutls_3.7.1.bb
> DEPENDS on or otherwise requires it)
> libseccomp was skipped: incompatible with host riscv32-yoe-linux (not
> in COMPATIBLE_HOST)
>
> see
> http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuriscv32/1123/consoleFull
>
> On Sat, Apr 24, 2021 at 8:56 AM Armin Kuster <akuster808@gmail.com> wrote:
> >
> > ptest results:
> > Regression Test Summary
> >  tests run: 1404
> >  tests skipped: 369
> >  tests passed: 1402
> >  tests failed: 2
> >  tests errored: 154
> >
> > Add feature_check so that the other recipes who can take
> > advantage of this funtionality can enable it.
> >
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >  .../libseccomp/files/run-ptest                |  4 ++
> >  .../libseccomp/libseccomp_2.5.1.bb            | 49 +++++++++++++++++++
> >  2 files changed, 53 insertions(+)
> >  create mode 100644 meta/recipes-support/libseccomp/files/run-ptest
> >  create mode 100644 meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> >
> > diff --git a/meta/recipes-support/libseccomp/files/run-ptest b/meta/recipes-support/libseccomp/files/run-ptest
> > new file mode 100644
> > index 00000000000..54b4a63cd2c
> > --- /dev/null
> > +++ b/meta/recipes-support/libseccomp/files/run-ptest
> > @@ -0,0 +1,4 @@
> > +#!/bin/sh
> > +
> > +cd tests
> > +./regression -a
> > diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> > new file mode 100644
> > index 00000000000..667d5da8242
> > --- /dev/null
> > +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> > @@ -0,0 +1,49 @@
> > +SUMMARY = "interface to seccomp filtering mechanism"
> > +DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
> > +SECTION = "security"
> > +LICENSE = "LGPL-2.1"
> > +LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
> > +
> > +DEPENDS += "gperf-native"
> > +
> > +SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
> > +
> > +SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5 \
> > +           file://run-ptest \
> > +           "
> > +
> > +COMPATIBLE_HOST_riscv32 = "null"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit autotools-brokensep pkgconfig ptest features_check
> > +
> > +REQUIRED_DISTRO_FEATURES = "seccomp"
> > +
> > +PACKAGECONFIG ??= ""
> > +PACKAGECONFIG[python] = "--enable-python, --disable-python, python3"
> > +
> > +DISABLE_STATIC = ""
> > +
> > +do_compile_ptest() {
> > +    oe_runmake -C tests check-build
> > +}
> > +
> > +do_install_ptest() {
> > +    install -d ${D}${PTEST_PATH}/tests
> > +    install -d ${D}${PTEST_PATH}/tools
> > +    for file in $(find tests/* -executable -type f); do
> > +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> > +    done
> > +    for file in $(find tests/*.tests -type f); do
> > +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> > +    done
> > +    for file in $(find tools/* -executable -type f); do
> > +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
> > +    done
> > +}
> > +
> > +FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
> > +FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
> > +
> > +RDEPENDS_${PN}-ptest = "coreutils bash"
> > --
> > 2.25.1
> >
> >
> > 
> >
