Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.4826.1619375234789666183
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 11:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=guClNspn;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id p12so38624373pgj.10
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 11:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+pSMqgpVorgjtVH+YEN2a9pl9j3kr+TjTk2oyOEY/c8=;
        b=guClNspnMol/0jOBzzLsg+75zRxIsxtpzT3v9ytzL+GdzPe9Wrx5i5Q3rE0oE/OxKY
         iK97eji1aBn2OxnBrbh3yGMU9cROmjg29aNuaM7XFQYWX8AiMg5HYFvb3Q+i7WtvTh8L
         ODS112O4kuQog3CXlvviEHsbWnIvH8uEplInTBXqLyAqi2s/72DuliPqvZLw6J2sEJeC
         GTeFS05YYkSN8X8dZOX6ZPmBklvlLRyLUBIBUQ+GdxpV1+P78lNboTU3HnNlHYTihVJf
         gOVU9DwpvF/b5mSpTg7jGjLJJC/kB3KTutUOHUYX4ZUf5A57Buiflo26IYTlIwoi9Zqi
         pZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=+pSMqgpVorgjtVH+YEN2a9pl9j3kr+TjTk2oyOEY/c8=;
        b=LJ3q22vOM8g3wXt7Pi7FMgMJ0KUuOmnrcEONKsRUU6vuHKdlDSyzhqNnyoHyT6I+Jx
         L7YQDDa/ZeknUqfDdMquPI6mLMS4EvotU/DMTJS//C3zC9pHRR5TzqMq8BU2m/Gaqpp0
         vNSe0pjry1d5LarcMfcWm88Kh2ITJFRs0oJbb7hqo/3+rvXE+v4AGxRSOVAUWctPm6Bv
         efMN/XsEr32/Y6d/HmpHP+SZGjPL8HR1FlZmg0tSL2/oICVDbBOGc4uESAWTfNJfhbxX
         fXHPQpLP4b/RoU7LzwmgKn8Gt3RbnGWX6rqVJm6UcDP/1ss08kO3ROTcA1kzl7tn2j0P
         R75g==
X-Gm-Message-State: AOAM531yGX8NlvpK2MoxWLcC8/lyW6JRfTqUtP4MvEI8r0Zkcsyi+KXo
	eUdq0JNnjzNMEBNXC4AF8TTZtRf5jPWVFw==
X-Google-Smtp-Source: ABdhPJxGovQ3f/Qf82yEwxmpkcBpqJVYVH1KzBsOcj1ezMm6cwrvXj+sEG+kDxlgfesiSJE9CITW0Q==
X-Received: by 2002:a63:d111:: with SMTP id k17mr1910354pgg.362.1619375234190;
        Sun, 25 Apr 2021 11:27:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:880e:6a48:f6c3:8404? ([2601:202:4180:a5c0:880e:6a48:f6c3:8404])
        by smtp.gmail.com with ESMTPSA id w14sm3483265pfn.3.2021.04.25.11.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 11:27:13 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/6] libseccomp: move recipe from meta-security to core
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210424155639.1131482-1-akuster808@gmail.com>
 <20210424155639.1131482-2-akuster808@gmail.com>
 <CAMKF1sqK5+BHjiDcY=JJeueeUHw+3WPpu0hE-4EddpBF0OFvLQ@mail.gmail.com>
 <CAMKF1soMa-pBf3hFCqDQnJ7x-Ff1NcKB8udir2W9oEVRQieY7A@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <e7514d10-0ecc-bac5-0839-ac2d17f8834a@gmail.com>
Date: Sun, 25 Apr 2021 11:27:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soMa-pBf3hFCqDQnJ7x-Ff1NcKB8udir2W9oEVRQieY7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/24/21 8:46 PM, Khem Raj wrote:
> musl/x86 apt fails

Right. RP told me yesterday. I have been looking into it.

I say your patch. thanks.

-armin
>
> https://errors.yoctoproject.org/Errors/Details/577480/
>
> On Sat, Apr 24, 2021 at 3:16 PM Khem Raj <raj.khem@gmail.com> wrote:
>> riscv32 is not happy
>>
>> ERROR: Nothing PROVIDES 'libseccomp' (but
>> /home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-core/systemd/systemd_247.6.bb,
>> /home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-support/gnutls/gnutls_3.7.1.bb
>> DEPENDS on or otherwise requires it)
>> libseccomp was skipped: incompatible with host riscv32-yoe-linux (not
>> in COMPATIBLE_HOST)
>>
>> see
>> http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuriscv32/1123/consoleFull
>>
>> On Sat, Apr 24, 2021 at 8:56 AM Armin Kuster <akuster808@gmail.com> wrote:
>>> ptest results:
>>> Regression Test Summary
>>>  tests run: 1404
>>>  tests skipped: 369
>>>  tests passed: 1402
>>>  tests failed: 2
>>>  tests errored: 154
>>>
>>> Add feature_check so that the other recipes who can take
>>> advantage of this funtionality can enable it.
>>>
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>  .../libseccomp/files/run-ptest                |  4 ++
>>>  .../libseccomp/libseccomp_2.5.1.bb            | 49 +++++++++++++++++++
>>>  2 files changed, 53 insertions(+)
>>>  create mode 100644 meta/recipes-support/libseccomp/files/run-ptest
>>>  create mode 100644 meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>>>
>>> diff --git a/meta/recipes-support/libseccomp/files/run-ptest b/meta/recipes-support/libseccomp/files/run-ptest
>>> new file mode 100644
>>> index 00000000000..54b4a63cd2c
>>> --- /dev/null
>>> +++ b/meta/recipes-support/libseccomp/files/run-ptest
>>> @@ -0,0 +1,4 @@
>>> +#!/bin/sh
>>> +
>>> +cd tests
>>> +./regression -a
>>> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>>> new file mode 100644
>>> index 00000000000..667d5da8242
>>> --- /dev/null
>>> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>>> @@ -0,0 +1,49 @@
>>> +SUMMARY = "interface to seccomp filtering mechanism"
>>> +DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
>>> +SECTION = "security"
>>> +LICENSE = "LGPL-2.1"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
>>> +
>>> +DEPENDS += "gperf-native"
>>> +
>>> +SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
>>> +
>>> +SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5 \
>>> +           file://run-ptest \
>>> +           "
>>> +
>>> +COMPATIBLE_HOST_riscv32 = "null"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +inherit autotools-brokensep pkgconfig ptest features_check
>>> +
>>> +REQUIRED_DISTRO_FEATURES = "seccomp"
>>> +
>>> +PACKAGECONFIG ??= ""
>>> +PACKAGECONFIG[python] = "--enable-python, --disable-python, python3"
>>> +
>>> +DISABLE_STATIC = ""
>>> +
>>> +do_compile_ptest() {
>>> +    oe_runmake -C tests check-build
>>> +}
>>> +
>>> +do_install_ptest() {
>>> +    install -d ${D}${PTEST_PATH}/tests
>>> +    install -d ${D}${PTEST_PATH}/tools
>>> +    for file in $(find tests/* -executable -type f); do
>>> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
>>> +    done
>>> +    for file in $(find tests/*.tests -type f); do
>>> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
>>> +    done
>>> +    for file in $(find tools/* -executable -type f); do
>>> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
>>> +    done
>>> +}
>>> +
>>> +FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
>>> +FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
>>> +
>>> +RDEPENDS_${PN}-ptest = "coreutils bash"
>>> --
>>> 2.25.1
>>>
>>>
>>> 
>>>

