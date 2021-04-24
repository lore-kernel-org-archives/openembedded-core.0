Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.1047.1619283308612249445
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 09:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NbCHQvSp;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id w6so21584162pfc.8
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 09:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2Rni9sGNup+Oiugz/0QE6xr8JRF+qKIgQlwLt9ZRPcQ=;
        b=NbCHQvSpBXuybbhxFscKbbwqZz2EqeUU0/SKYTxKBCQi9HdNZyKpyViG5nzdqLutmZ
         d67NxKEAUt+b980sq7xaKNZu/NMTMPuj5qFeitBVCoEslz2m9dDsdEJ/fpdISacXoO/O
         tlfjq4IVvb6UYNiasFtV7lzTN5H3wvHsWJIvWzXSF1WVI+5rVzu2EwGGG8Dm5yrbc5zz
         2ZKNRcAlUAyiUfgDGsu1q1NIFzFS+YmI/Jh3wVV9QZve/hyM1lNqsw5QnivtaUG5nysH
         rUF09CJHq1EqnlI6OzeXZG0oKpJQMrVoDsSVXtTDPLXTOjj5FSwwqjbHpSPDQzFy+Qon
         q3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=2Rni9sGNup+Oiugz/0QE6xr8JRF+qKIgQlwLt9ZRPcQ=;
        b=a7l5kH5HX40r+20KsmQtqQ7E85ININUw0ApTOhrRB/ePbK/MxMgK93wwxDt1QB3JfE
         l8XlnaL0xKYJc3muvpvI3WWUyKgwj4jb7xlR8RtBYrd3Az2Gto37MhaEMcC1lh/BjCMU
         10ONyMJzzdrCIAzWaVxoESwHOVET8ly1ish27a34B/lCsPdLvMS6o/W3SiVqZw8QoGnE
         WSt6ZqSkCYtvWWYJU2KOR2lpGOSEAgB9Wlij1lXnbRjzyOuwD8Jojao9aJDcC9n4Tccj
         05U8HA9ndwZN/WV8NDOfdYB2KIqLIKGKHvZl4F3Ex3FPMKJC3bqd9hFIgEYdkCeo35OJ
         CTAA==
X-Gm-Message-State: AOAM531SgFOIANRb3btj7pI7yVSyQA3uqratQhQLJuIWemN62c73/DsI
	iNnYyy/EfQsDYmWspmj/js3FAnElJBZG8A==
X-Google-Smtp-Source: ABdhPJxzCFoZseUjwpZMgj+GNwUTNEscK3n8ILvVXGhGqWkuxRL+bBiiXcASsQY/Fr31LGwSbDwBbw==
X-Received: by 2002:a63:6244:: with SMTP id w65mr6373383pgb.66.1619283307813;
        Sat, 24 Apr 2021 09:55:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:9c11:697b:fdac:256e? ([2601:202:4180:a5c0:9c11:697b:fdac:256e])
        by smtp.gmail.com with ESMTPSA id y189sm7081093pfy.8.2021.04.24.09.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Apr 2021 09:55:07 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/6] libseccomp: move recipe from meta-security to core
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210424155639.1131482-1-akuster808@gmail.com>
 <20210424155639.1131482-2-akuster808@gmail.com>
 <CAMKF1spzMi=8N1+GevuLQzykUXdmaLyDDOPYh64uPEqpKYS8sw@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <a5ec37e7-b020-89a2-9c54-b70a37bec44a@gmail.com>
Date: Sat, 24 Apr 2021 09:55:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spzMi=8N1+GevuLQzykUXdmaLyDDOPYh64uPEqpKYS8sw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 4/24/21 9:19 AM, Khem Raj wrote:
> On Sat, Apr 24, 2021 at 8:56 AM Armin Kuster <akuster808@gmail.com> wrote:
>> ptest results:
>> Regression Test Summary
>>  tests run: 1404
>>  tests skipped: 369
>>  tests passed: 1402
>>  tests failed: 2
>>  tests errored: 154
>>
>> Add feature_check so that the other recipes who can take
>> advantage of this funtionality can enable it.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../libseccomp/files/run-ptest                |  4 ++
>>  .../libseccomp/libseccomp_2.5.1.bb            | 49 +++++++++++++++++++
>>  2 files changed, 53 insertions(+)
>>  create mode 100644 meta/recipes-support/libseccomp/files/run-ptest
>>  create mode 100644 meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>>
>> diff --git a/meta/recipes-support/libseccomp/files/run-ptest b/meta/recipes-support/libseccomp/files/run-ptest
>> new file mode 100644
>> index 00000000000..54b4a63cd2c
>> --- /dev/null
>> +++ b/meta/recipes-support/libseccomp/files/run-ptest
>> @@ -0,0 +1,4 @@
>> +#!/bin/sh
>> +
>> +cd tests
>> +./regression -a
>> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>> new file mode 100644
>> index 00000000000..667d5da8242
>> --- /dev/null
>> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>> @@ -0,0 +1,49 @@
>> +SUMMARY = "interface to seccomp filtering mechanism"
>> +DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
>> +SECTION = "security"
>> +LICENSE = "LGPL-2.1"
>> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
>> +
>> +DEPENDS += "gperf-native"
>> +
>> +SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
>> +
>> +SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5 \
>> +           file://run-ptest \
>> +           "
>> +
>> +COMPATIBLE_HOST_riscv32 = "null"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit autotools-brokensep pkgconfig ptest features_check
>> +
>> +REQUIRED_DISTRO_FEATURES = "seccomp"
>> +
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG[python] = "--enable-python, --disable-python, python3"
>> +
>> +DISABLE_STATIC = ""
> do we need apps to use some static libs ? if so which library is it,
> Or is it all internal?

The commit that added that:

commit 2153c59b429293120095a2bd4562f4f7553c1ae7
Author: Stefan Agner <stefan.agner@toradex.com>
Date:   Sun Sep 1 21:48:13 2019 +0200

    libseccomp: build static library always
   
    Always build static library. This is required e.g. for runc from
    meta-virtualization in its default configuration.

Meta-virt is one of the reasons I am this patch set.

-armin
>
>> +
>> +do_compile_ptest() {
>> +    oe_runmake -C tests check-build
>> +}
>> +
>> +do_install_ptest() {
>> +    install -d ${D}${PTEST_PATH}/tests
>> +    install -d ${D}${PTEST_PATH}/tools
>> +    for file in $(find tests/* -executable -type f); do
>> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
>> +    done
>> +    for file in $(find tests/*.tests -type f); do
>> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
>> +    done
>> +    for file in $(find tools/* -executable -type f); do
>> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
>> +    done
>> +}
>> +
>> +FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
>> +FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
>> +
>> +RDEPENDS_${PN}-ptest = "coreutils bash"
>> --
>> 2.25.1
>>
>>
>> 
>>

