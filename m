Return-Path: <chase.qi@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D28C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 06:50:48 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web12.511.1667976640566207112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 22:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uV344LKO;
 spf=pass (domain: linaro.org, ip: 209.85.166.46, mailfrom: chase.qi@linaro.org)
Received: by mail-io1-f46.google.com with SMTP id p141so13259064iod.6
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 22:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v0bO8SViZO0EuCCjjJI7GNXlkD2b842taMHOSBdmSMk=;
        b=uV344LKO5GZOiLnY168iP5L2dZKh70QPTpy/cK5lo4eJvvqqh3vI1JxJmJ9Fu2QUk1
         JvSW8EVC7fKI0JSpJGPRtJ4PZsi2qKFaOvZ64Bboh7ew9m5WjZtfkglqo2GBMYFgUhLM
         zEREcqzMgaopScIBO9Mr5DumQx5XxoxMTvdHi5WOflZXZTpRtxVLCFbbP117GPUpkTlx
         dluMXp7F1rAVeQBBDq4vbpEnMRGGnT5q47Am6jPbVHFx/9HHWAkC6zxB63rqUBpz1o72
         T6ANPpy3i3o+YIY4bmlRxwNwdc9SmKRuZf/zGvIzYz8ga5DrlSCjStPVnriOX4VFaXnK
         0Qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0bO8SViZO0EuCCjjJI7GNXlkD2b842taMHOSBdmSMk=;
        b=ddr41ZU7VHXRd/K2qDY43/AlmHGn2RrL5RcPhJcfpMEl7qT9mZWJXOVCff86denFjl
         m+2fmavdIWlnR0Mgg/7gs8U+RCtUiqncQiMPdBM2zK74LF3F7aGmygtYaAODt502SA4D
         hmLwsUpM57urZA9Cn4gB9iUvez2lWaFTdegUH87YNMHZo6PrrqwknJnxxyg0bQ6mOfDM
         hTmUN8SQfIQtPAfvr+LINKe9vzzi4KAvjI4kMHKPtnATUq7NBjO5IFT4FS/ywieJpneX
         Cjr3EqKBo7GAiaJYrDaMu6Oa0AndtgnmhswcfpWxwAu8eQqCljMO52a+SvkicYXXo6Ea
         wJSg==
X-Gm-Message-State: ACrzQf2uvebXjpcww9iwEgUOukua/nzc5Wsrl8ygbzFMXJe8rL4d0HI+
	t6lA+rxDcHhyiIj2cnzQhrRcLtt9Xx4Yf/Jvtc7w4A==
X-Google-Smtp-Source: AMsMyM4oHg8uoyBpNMb+U3wd9Og73uAm0NZaIptCJRjpEM7intKyYYf37phzaergqo8VUiUENcEH2eq8Pxd85pfaA24=
X-Received: by 2002:a5d:9c50:0:b0:6d5:5fcc:1790 with SMTP id
 16-20020a5d9c50000000b006d55fcc1790mr19861995iof.160.1667976639927; Tue, 08
 Nov 2022 22:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20221108034233.3452233-1-chase.qi@linaro.org> <Y2qzD8cb//AgUXco@mail.local>
In-Reply-To: <Y2qzD8cb//AgUXco@mail.local>
From: Chase Qi <chase.qi@linaro.org>
Date: Wed, 9 Nov 2022 14:50:29 +0800
Message-ID: <CACLiBhBOyWrKGU3Ps79GP0qGVkGNVmgyQs=cUVGLrp_XXzcQdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] libc-test: add libc testsuite for musl
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173013

Hi Alexandre,

On Wed, 9 Nov 2022 at 03:50, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> This fails with:
> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> libc-test (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-core/musl/libc-test_git.bb)
>

Thanks for pointing this out. I have sent v4. I added myself as the
maintainer of the recipe. I am fine to change it to any of the oe-core
core maintainers if that makes more sense.

- Chase

> On 08/11/2022 03:42:33+0000, Chase Qi wrote:
> > libc-test is a collection of unit test to measure the correctness and
> > robustness of a C/POSIX standard library implementation. It is developed
> > as part of the musl project.
> >
> > Signed-off-by: Chase Qi <chase.qi@linaro.org>
> > ---
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  meta/recipes-core/musl/libc-test/run-ptest    | 28 ++++++++++
> >  meta/recipes-core/musl/libc-test_git.bb       | 51 +++++++++++++++++++
> >  3 files changed, 80 insertions(+)
> >  create mode 100644 meta/recipes-core/musl/libc-test/run-ptest
> >  create mode 100644 meta/recipes-core/musl/libc-test_git.bb
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> > index 32b0e5297a..3c9ff43bd9 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -105,6 +105,7 @@ PTESTS_SLOW = "\
> >
> >  PTESTS_SLOW:remove:riscv64 = "valgrind-ptest"
> >  PTESTS_PROBLEMS:append:riscv64 = "valgrind-ptest"
> > +PTESTS_SLOW:append:libc-musl = " libc-test-ptest"
> >
> >  #    ruby-ptest \ # Timeout
> >  #    lz4-ptest \ # Needs a rewrite
> > diff --git a/meta/recipes-core/musl/libc-test/run-ptest b/meta/recipes-core/musl/libc-test/run-ptest
> > new file mode 100644
> > index 0000000000..0b4b687dec
> > --- /dev/null
> > +++ b/meta/recipes-core/musl/libc-test/run-ptest
> > @@ -0,0 +1,28 @@
> > +#!/bin/sh
> > +
> > +set -e
> > +
> > +cd /opt/libc-test
> > +make cleanall
> > +make run || true
> > +
> > +echo ""
> > +echo "--- ptest result ---"
> > +# libc-test runs tests by module(e.g. src/api) and generates sub-module test
> > +# report(e.g. src/api/REPORT) first. After all tests finish, it generates the
> > +# consolidated report file src/REPORT.
> > +report="/opt/libc-test/src/REPORT"
> > +if ! [ -f "${report}" ]; then
> > +    echo "${report} not found!"
> > +    echo "FAIL: libc-test"
> > +    exit 1
> > +# libc-test prints error on failure and prints nothing on success.
> > +elif grep -q '^FAIL src.*\.exe.*' "${report}"; then
> > +    # Print test failure in ptest format.
> > +    # e.g. "FAIL src/api/main.exe [status 1]" -> "FAIL: api_main"
> > +    grep '^FAIL src.*\.exe.*' "${report}" \
> > +        | sed 's|^FAIL src/|FAIL: |;s|/|_|;s|\.exe.*\]||'
> > +    exit 1
> > +else
> > +    echo "PASS: libc-test"
> > +fi
> > diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
> > new file mode 100644
> > index 0000000000..b5bfc6e34c
> > --- /dev/null
> > +++ b/meta/recipes-core/musl/libc-test_git.bb
> > @@ -0,0 +1,51 @@
> > +SUMMARY = "Musl libc unit tests"
> > +HOMEPAGE = "https://wiki.musl-libc.org/libc-test.html"
> > +DESCRIPTION = "libc-test is a collection of unit tests to measure the \
> > +correctness and robustness of a C/POSIX standard library implementation. It is \
> > +developed as part of the musl project."
> > +SECTION = "tests"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=43ed1245085be90dc934288117d55a3b"
> > +
> > +inherit ptest
> > +
> > +SRCREV = "18e28496adee3d84fefdda6efcb9c5b8996a2398"
> > +SRC_URI = " \
> > +    git://repo.or.cz/libc-test;branch=master \
> > +    file://run-ptest \
> > +"
> > +
> > +PV = "0+git${SRCPV}"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +# libc-test 'make' or 'make run' command is designed to build and run tests. It
> > +# reports both build and test failures. The commands should be run on target.
> > +do_compile() {
> > +    :
> > +}
> > +
> > +RDEPENDS:${PN} = " \
> > +    bash \
> > +    grep \
> > +    musl \
> > +    packagegroup-core-buildessential \
> > +"
> > +
> > +RDEPENDS:${PN}-ptest = " \
> > +     ${PN} \
> > +     sed \
> > +"
> > +
> > +install_path = "/opt/${PN}"
> > +FILES:${PN} += "${install_path}/*"
> > +
> > +do_install () {
> > +    install -d ${D}${install_path}/
> > +    cp ${S}/Makefile ${D}${install_path}
> > +    cp ${S}/config.mak.def ${D}${install_path}/config.mak
> > +    cp -r ${S}/src ${D}${install_path}
> > +}
> > +
> > +COMPATIBLE_HOST = "null"
> > +COMPATIBLE_HOST:libc-musl = "(.*)"
> > --
> > 2.25.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#172948): https://lists.openembedded.org/g/openembedded-core/message/172948
> > Mute This Topic: https://lists.openembedded.org/mt/94883839/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

