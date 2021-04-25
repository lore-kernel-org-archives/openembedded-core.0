Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.5584.1619378267746631076
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 12:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u5I8u4oE;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so3915907pjh.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 12:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7MbwhtXMxnMGgzfjBDxDr2c80b9qP2pTpbsLwkIZGwg=;
        b=u5I8u4oEqQZeu7c7t3rdID+PHErshBe+bqVV2wRf+xOWKjlUd9hb5Jy9V4adeOY2hq
         kBdX4bjnv/n4B/qkHZggqMbFrZB9y0itgKX+fp0Wk1phm8mwf6KDfHzsQLXctkeLn3LE
         Reqgc1Ryba9+b/sKHER/b0Jkt68ip4I/DS9Raso6Rr/lW/uVJQ7aRSP+MVPZN6cCogkq
         6DTqqihuvtJFB8PnuNmFmOY51F4wLzGDOPA/vx6d+uZjyGsDW1sn7J06QIMDCwQ2M8Hg
         uFMev7vAbieLZHVcnFUH9983Y8D4i8fqOggoVTAYTlrewsnVHZEk27vJPUu4MUkmDn2V
         kVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7MbwhtXMxnMGgzfjBDxDr2c80b9qP2pTpbsLwkIZGwg=;
        b=LvgInga43W8TDOdzgbnNuxbz21av0pA23ffwE4/46QhTcovW6dq0i14/X0DEGfnG5W
         t7WHi1sP9xQt1I13apAQDJHDRATRs4sk8C+Va8FpcPiWlPMLJTF5KGoUB+tRAicEFO7N
         kCC2zF4yjUAHc1WJ7f9pEMxifhWHiLv2ko3JC5dwT6AVH4Cx+2QGC48HilpknbIrIl6p
         7i3EwJO0OU3v3jFtpEqLJMMtmZVz1+XPF/I/3/r3t6Fcw2LLENdlDCIqLxS6FLDxRKp+
         7LQkUkt8bgBPRAwoyXkCzA+D/1z30kDVdvjm4d+QLO9Id8EH4OHLfFEgBE8q62m2Oegu
         nmrQ==
X-Gm-Message-State: AOAM531wEKmcVALHWqCbCikYn0Gy5Fr2CrK1W2dIDX92FAu0hIWixubi
	OXi9jr2NUuf0sG56fRYBy2+H7sZuerUb7Q==
X-Google-Smtp-Source: ABdhPJzwl/I6QRqfe5K6vuf9VwMxbYF1NDYOZ6He4lVvVLFpo1GbNaNOTyO8O4inxFnPJjhd+uTp4A==
X-Received: by 2002:a17:90b:1486:: with SMTP id js6mr9813440pjb.210.1619378266852;
        Sun, 25 Apr 2021 12:17:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:880e:6a48:f6c3:8404? ([2601:202:4180:a5c0:880e:6a48:f6c3:8404])
        by smtp.gmail.com with ESMTPSA id 23sm9444089pgo.53.2021.04.25.12.17.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 12:17:46 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/6] libseccomp: move recipe from meta-security to core
To: openembedded-core@lists.openembedded.org
References: <20210424155639.1131482-1-akuster808@gmail.com>
 <1678D666E2EA61E5.6439@lists.openembedded.org>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <811ff190-d7ed-d290-ce86-0c67024762ed@gmail.com>
Date: Sun, 25 Apr 2021 12:17:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1678D666E2EA61E5.6439@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 4/24/21 8:56 AM, Armin Kuster via lists.openembedded.org wrote:
> ptest results:
> Regression Test Summary
>  tests run: 1404
>  tests skipped: 369
>  tests passed: 1402
>  tests failed: 2
>  tests errored: 154

Ptest  on x86 musl with the patches in master-next many thanks to
Richard and Khem for their fixes.

Regression Test Summary
 tests run: 8150
 tests skipped: 114
 tests passed: 8148
 tests failed: 2
 tests errored: 0


Many of the skipped are do to missing valgrind or wrong arch.

-armin
>
> Add feature_check so that the other recipes who can take
> advantage of this funtionality can enable it.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../libseccomp/files/run-ptest                |  4 ++
>  .../libseccomp/libseccomp_2.5.1.bb            | 49 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-support/libseccomp/files/run-ptest
>  create mode 100644 meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>
> diff --git a/meta/recipes-support/libseccomp/files/run-ptest b/meta/recipes-support/libseccomp/files/run-ptest
> new file mode 100644
> index 00000000000..54b4a63cd2c
> --- /dev/null
> +++ b/meta/recipes-support/libseccomp/files/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +cd tests
> +./regression -a
> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> new file mode 100644
> index 00000000000..667d5da8242
> --- /dev/null
> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> @@ -0,0 +1,49 @@
> +SUMMARY = "interface to seccomp filtering mechanism"
> +DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
> +SECTION = "security"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
> +
> +DEPENDS += "gperf-native"
> +
> +SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
> +
> +SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5 \
> +           file://run-ptest \
> +           "
> +
> +COMPATIBLE_HOST_riscv32 = "null"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools-brokensep pkgconfig ptest features_check
> +
> +REQUIRED_DISTRO_FEATURES = "seccomp"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[python] = "--enable-python, --disable-python, python3"
> +
> +DISABLE_STATIC = ""
> +
> +do_compile_ptest() {
> +    oe_runmake -C tests check-build
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    install -d ${D}${PTEST_PATH}/tools
> +    for file in $(find tests/* -executable -type f); do
> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> +    done
> +    for file in $(find tests/*.tests -type f); do
> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> +    done
> +    for file in $(find tools/* -executable -type f); do
> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
> +    done
> +}
> +
> +FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
> +FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
> +
> +RDEPENDS_${PN}-ptest = "coreutils bash"
>
> 
>

