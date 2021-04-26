Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.7630.1619447094358182364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 07:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hoQpZhNz;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id m11so39058434pfc.11
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Apr 2021 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=JWu4CIKsibeZVwwDnlmThP4Zt49LP1lh88T+8aPGHcA=;
        b=hoQpZhNzen0bSKfBxS8lb3Q/b9iRbBG2FhXUbvvY+nFxIwKyhdv+ti/DIDNY5FcZOS
         FgjNM1INwitWDp2Mx47w6nzXAJ1R0GbAXRC1FsFzRh5u7ZiDcnXgmIN1c0Hu21ivvgKT
         cn/hdafhTaKtAAwXaQ+elsEH453vB2EZWmd629jVluR4lZPfXGCoEndKcf4KeKR05teH
         Xdnz6WS97BbRP6CdOtMo3XY0TmghdgMe1xqQs0uHIcUPH6SMRq0RZvxE3m6CmPXfgXhk
         BCjFGYjvrSebu9C0052dVXQrZq+aL7L0tscdjx/KxOeY+IgOUFcGzLXHGipsmU9jGUAu
         03vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=JWu4CIKsibeZVwwDnlmThP4Zt49LP1lh88T+8aPGHcA=;
        b=NieKubAZjrG05urKa/0TYcK+kFuMDLPJQEbj0bIBWoilwFllBqIGQoFRCpxGaXYgqQ
         eH382HbWRrc2GymDy9ZOm7JF07OmCYjT63qvDYBsNdgxCUqgkuB06GCMAq5NE3U+UU7P
         PDO/tPXUr7HKTdBLoyGhKdVYPuupZ71zIXyvQK2pF5L0tQO62NaNkMcfLY1FRoPrrdRA
         oCwcyxixIHx13cyNyEnjN18x5uSheYPZHygx0/uEhhubrYvItey/VQKjvXjInqBcT1Aw
         JIFX+nmY6a5FzEfEf607+FfiY2V2tWZfNAmPNqUnhn4zcWbhXkspn90MMsbs/3CvVq0Y
         xYnw==
X-Gm-Message-State: AOAM5314FR+gCTQwDf7fhDDwW4rSg5+SJxTpHCdlmccySgiplsmo6uIj
	X8nnQxjgTMo3Ap1qRsw5f5zZg1uH6rhg7g==
X-Google-Smtp-Source: ABdhPJy7XIsaq+m3DHQxjGSoA87KCJWD0gDWZoQA2lA2+uWyy2b+HkUbp+YH4itYiqCv2d6HRP1Pwg==
X-Received: by 2002:aa7:989c:0:b029:253:a2c7:9b29 with SMTP id r28-20020aa7989c0000b0290253a2c79b29mr17818101pfl.39.1619447093636;
        Mon, 26 Apr 2021 07:24:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:1c81:c15:4155:b74d? ([2601:202:4180:a5c0:1c81:c15:4155:b74d])
        by smtp.gmail.com with ESMTPSA id gw19sm12618487pjb.4.2021.04.26.07.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 07:24:53 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/6] libseccomp: move recipe from meta-security to core
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210424155639.1131482-1-akuster808@gmail.com>
 <20210424155639.1131482-2-akuster808@gmail.com>
 <CAMKF1sqK5+BHjiDcY=JJeueeUHw+3WPpu0hE-4EddpBF0OFvLQ@mail.gmail.com>
 <6e9eb81e-5c30-1176-8ead-b385d9e9c15f@gmail.com>
 <CAMKF1spjy70QC18FmqM0mToYOjTwwcuDWtaoo57jqaMi0sLHWg@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <c8cb8449-fe11-189a-ef6c-e8e4be02f46e@gmail.com>
Date: Mon, 26 Apr 2021 07:24:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spjy70QC18FmqM0mToYOjTwwcuDWtaoo57jqaMi0sLHWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/25/21 5:10 PM, Khem Raj wrote:
> On Sun, Apr 25, 2021 at 11:26 AM akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 4/24/21 3:16 PM, Khem Raj wrote:
>>> riscv32 is not happy
>> that is not supported by libseccomp per their supported arch list. I
>> came across that yesterday.
> I think the problem is when we enable it by default in DISTRO_FEATURES
> perhaps we should add an explicit
>
> DISTRO_FEATURES_remove_riscv32 = "seccomp"
>
> in default-distrovars.inc
sounds good. libseccomp hit master this morning.

-armin
>
>>> ERROR: Nothing PROVIDES 'libseccomp' (but
>>> /home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-core/systemd/systemd_247.6.bb,
>>> /home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-support/gnutls/gnutls_3.7.1.bb
>>> DEPENDS on or otherwise requires it)
>>> libseccomp was skipped: incompatible with host riscv32-yoe-linux (not
>>> in COMPATIBLE_HOST)
>> I suspect we need to exclude the arch for now. I didn't notice any patch
>> to add that yet.
>>
>> -armin
>>> see
>>> http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuriscv32/1123/consoleFull
>>>
>>> On Sat, Apr 24, 2021 at 8:56 AM Armin Kuster <akuster808@gmail.com> wrote:
>>>> ptest results:
>>>> Regression Test Summary
>>>>  tests run: 1404
>>>>  tests skipped: 369
>>>>  tests passed: 1402
>>>>  tests failed: 2
>>>>  tests errored: 154
>>>>
>>>> Add feature_check so that the other recipes who can take
>>>> advantage of this funtionality can enable it.
>>>>
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>  .../libseccomp/files/run-ptest                |  4 ++
>>>>  .../libseccomp/libseccomp_2.5.1.bb            | 49 +++++++++++++++++++
>>>>  2 files changed, 53 insertions(+)
>>>>  create mode 100644 meta/recipes-support/libseccomp/files/run-ptest
>>>>  create mode 100644 meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>>>>
>>>> diff --git a/meta/recipes-support/libseccomp/files/run-ptest b/meta/recipes-support/libseccomp/files/run-ptest
>>>> new file mode 100644
>>>> index 00000000000..54b4a63cd2c
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/libseccomp/files/run-ptest
>>>> @@ -0,0 +1,4 @@
>>>> +#!/bin/sh
>>>> +
>>>> +cd tests
>>>> +./regression -a
>>>> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>>>> new file mode 100644
>>>> index 00000000000..667d5da8242
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>>>> @@ -0,0 +1,49 @@
>>>> +SUMMARY = "interface to seccomp filtering mechanism"
>>>> +DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
>>>> +SECTION = "security"
>>>> +LICENSE = "LGPL-2.1"
>>>> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
>>>> +
>>>> +DEPENDS += "gperf-native"
>>>> +
>>>> +SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
>>>> +
>>>> +SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5 \
>>>> +           file://run-ptest \
>>>> +           "
>>>> +
>>>> +COMPATIBLE_HOST_riscv32 = "null"
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +
>>>> +inherit autotools-brokensep pkgconfig ptest features_check
>>>> +
>>>> +REQUIRED_DISTRO_FEATURES = "seccomp"
>>>> +
>>>> +PACKAGECONFIG ??= ""
>>>> +PACKAGECONFIG[python] = "--enable-python, --disable-python, python3"
>>>> +
>>>> +DISABLE_STATIC = ""
>>>> +
>>>> +do_compile_ptest() {
>>>> +    oe_runmake -C tests check-build
>>>> +}
>>>> +
>>>> +do_install_ptest() {
>>>> +    install -d ${D}${PTEST_PATH}/tests
>>>> +    install -d ${D}${PTEST_PATH}/tools
>>>> +    for file in $(find tests/* -executable -type f); do
>>>> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
>>>> +    done
>>>> +    for file in $(find tests/*.tests -type f); do
>>>> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
>>>> +    done
>>>> +    for file in $(find tools/* -executable -type f); do
>>>> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
>>>> +    done
>>>> +}
>>>> +
>>>> +FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
>>>> +FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
>>>> +
>>>> +RDEPENDS_${PN}-ptest = "coreutils bash"
>>>> --
>>>> 2.25.1
>>>>
>>>>
>>>> 
>>>>
>>

