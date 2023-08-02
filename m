Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6661CC001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 19:28:27 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.5303.1691004504503037784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 12:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GfCsqa1+;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-522462d8416so120607a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691004503; x=1691609303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MsU0y1Hrg04xlpSy5hnB14hf+crXfDKsCHKBGZ2GDFM=;
        b=GfCsqa1+OCXEmSOVvje5A3a1HOnqoUiM9/JDYzx5f1vSkmTtsVj491k1feBuiJitlU
         eapLz9jiRgMK0uxQ92WSkO1BY3Vnv5G8W3BdsRNaQ+ob4G0UxcqPdCL6mugTHBjGwH3w
         Q5cjK1nNUbZDMyp/XY5ptz6xt+PGHZgPm6P+pOiZ90b4kItXwVhgebFryBtiqdHhXulD
         17X8woejNHVIC+J4OLaAheO2vBS3rqR9g0SbgaBKWsWsHKjae4Q3uwKsROriKSlA7s/i
         xr89IQ6V+F3ajXn2YaI103crD/Ha4UG5wghrbQ0/avADZ6ATF7rwIJhz+SrdUKXvwY+B
         n06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691004503; x=1691609303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MsU0y1Hrg04xlpSy5hnB14hf+crXfDKsCHKBGZ2GDFM=;
        b=CRdBJS3dnZMOdhKvP+RK4cO58GXrIgi8conOedw0Ib9iASSlvrDI9eJjApZFBv1D+T
         +rYd/GgpqO/aGbdFkwkkA8sRm1pgh4aCfutwYzJVpeaB9XlKDhA4Lc7Yu3/M0mpPWsJg
         pHCjuqThQW/ZhbT1gJDEfjCxnDWaf3d9UZ0hhqlM65ZC2kqSqY6PNF/7Veb+jcMR+TPj
         LKcwndkUctge6up3OIA/2yiRlxjbn9ZlYzdsrNzh5fDnftyJOWhsOmtg+pyBMKvmKHll
         0kPKCqBpdEYZZXLCHbcqeM/nSDUWp6iGGyz9EQkk8eq3BtARlh933QUzPqZegU3OOLEu
         8vKg==
X-Gm-Message-State: AOJu0YzWlmNM5P0g5e6CU59NbUDOHMykSNJWROwAZxiOKcN/9844gUZl
	E7ACKO7Dc3+23S+PdbxP580=
X-Google-Smtp-Source: AGHT+IHy1I2WplpyfOyXkldilISOtLEWM3xahJp8l8/W4SWm//WmAZwMX9kAir+UPqBgWnsidMDZcg==
X-Received: by 2002:aa7:d918:0:b0:523:78c:166c with SMTP id a24-20020aa7d918000000b00523078c166cmr872881edr.16.1691004502704;
        Wed, 02 Aug 2023 12:28:22 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id v23-20020aa7d817000000b0051ff2b6139esm8992963edq.5.2023.08.02.12.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 12:28:22 -0700 (PDT)
Message-ID: <e4dcb013-25f0-63f8-4713-8d4b71757cb4@gmail.com>
Date: Wed, 2 Aug 2023 21:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH v6] rpm: Allow setting platform macro settings
 externally
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <Ross.Burton@arm.com>, Alexander Kanavin
 <alex.kanavin@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230801132957.401557-1-zboszor@gmail.com>
 <20230802134131db3e0b1e@mail.local>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20230802134131db3e0b1e@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 19:28:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185431

Some clues please. What does this error mean? How to solve it?

2023. 08. 02. 15:41 keltezéssel, Alexandre Belloni írta:
> Hello,
>
> This causes
> sstatetests.SStateHashSameSigs3.test_sstate_sametune_samesigs to fail:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5572/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5538/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5547/steps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5495/steps/14/logs/stdio
>
> On 01/08/2023 15:29:57+0200, Zoltan Boszormenyi wrote:
>> Feed platform settings to installplatform externally. Based on the patch
>> submitted under https://github.com/rpm-software-management/rpm/pull/2585
>>
>> Patch against INSTALL was backported for rpm 4.18.1
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   ...atform-macro-settings-externally-258.patch | 119 ++++++++++++++++++
>>   meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  20 +++
>>   2 files changed, 139 insertions(+)
>>   create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
>>
>> diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
>> new file mode 100644
>> index 0000000000..a32ce38533
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
>> @@ -0,0 +1,119 @@
>> +From e58c607dcdb303ff3ba1b22fd23eb20e374b6ed3 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
>> + <zboszor@gmail.com>
>> +Date: Fri, 28 Jul 2023 12:16:56 +0200
>> +Subject: [PATCH] Allow setting platform macro settings externally (#2585)
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +* Allow setting platform macro settings externally
>> +
>> +By default, rpm installs a series of default platforms based on
>> +the CPU architecture names in subdirectories called
>> +
>> +    /usr/lib/platform/<arch>-<os>
>> +
>> +This is enough for regular Linux distributions. However, some
>> +distributions may use more specific platform names that refer to
>> +particular computer systems, like SBCs or specific CPU tuning when
>> +compiling.
>> +
>> +If the platform subdirectory does not exist in /usr/lib/platform
>> +then rpmbuild does not work.
>> +
>> +Allow creating such custom platform subdirectory with feeding
>> +the necessary data using external variables: RPM_CUSTOM_ARCH,
>> +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
>> +and RPM_CUSTOM_CANONCOLOR
>> +
>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> +Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/fde03ae33d55b160a31a6c54946880dcdf8fd0d6]
>> +
>> +---------
>> +
>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> +Co-authored-by: Florian Festi <ffesti@redhat.com>
>> +---
>> + INSTALL         | 37 +++++++++++++++++++++++++++++++++++++
>> + installplatform |  9 ++++++++-
>> + 2 files changed, 45 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/INSTALL b/INSTALL
>> +index 13d0d8a83..5e035cf6a 100644
>> +--- a/INSTALL
>> ++++ b/INSTALL
>> +@@ -148,6 +148,43 @@ and then install with:
>> +
>> +     make install
>> +
>> ++
>> ++By default, rpm installs a series of default platforms based on the CPU
>> ++architecture names in subdirectories called
>> ++
>> ++    /usr/lib/platform/<arch>-<os>
>> ++
>> ++This is enough for many distributions. However, some distributions
>> ++may use more specific platform names that refer to particular computer
>> ++systems, like SBCs or specific CPU tuning when compiling. Examples of such
>> ++platform names are: "genericx86_64", "intel_skylake_64", "raspberrypi_armv7",
>> ++"raspberrypi_armv8", etc.
>> ++
>> ++If the platform name is put into /etc/rpm/platform, then rpmbuild uses it
>> ++and the only macros file rpmbuild looks for is
>> ++
>> ++    /usr/lib/platform/`cat /etc/rpm/platform`-<os>/macros
>> ++
>> ++If this file does not exist, many rpm macros will not have their expected
>> ++values set and e.g. %configure will fail when trying to run rpmbuild.
>> ++
>> ++To allow creating the macros file for such a custom platform, the shell
>> ++variables listed below must be set. If RPM_CUSTOM_ARCH is not set, the rest
>> ++is ignored.
>> ++
>> ++    export RPM_CUSTOM_ARCH=genericx86_64
>> ++    export RPM_CUSTOM_ISANAME=x86
>> ++    export RPM_CUSTOM_ISABITS=64
>> ++    export RPM_CUSTOM_CANONARCH=x86_64
>> ++    export RPM_CUSTOM_CANONCOLOR=0 # to use /usr/lib for %_libdir
>> ++    export RPM_CUSTOM_CANONCOLOR=3 # to use /usr/lib64 for %_libdir
>> ++
>> ++    make install
>> ++
>> ++This also creates and installs the new platform file e.g.
>> ++/usr/lib/platform/genericx86_64-linux/macros
>> ++
>> ++
>> + Rpm comes with an automated self-test suite. The test-suite relies heavily
>> + on fakechroot (https://github.com/dex4er/fakechroot/) and cannot be executed
>> + without it. Provided that fakechroot was found during configure,
>> +diff --git a/installplatform b/installplatform
>> +index a5ad7c5b8..59f57697b 100755
>> +--- a/installplatform
>> ++++ b/installplatform
>> +@@ -11,7 +11,7 @@ VENDOR="${4}"
>> + OS="${5}"
>> + RPMRC_GNU="${6}"
>> +
>> +-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
>> ++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2` ${RPM_CUSTOM_ARCH:+custom}; do
>> +   RPMRC_OPTFLAGS="`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
>> +   RPMRC_OPTFLAGS="`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
>> +   case $RPMRC_OPTFLAGS in
>> +@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
>> +   CANONCOLOR=
>> +   FILTER=cat
>> +   case "${ARCH}" in
>> ++    custom)
>> ++	ARCH=$RPM_CUSTOM_ARCH
>> ++	ISANAME=$RPM_CUSTOM_ISANAME
>> ++	ISABITS=$RPM_CUSTOM_ISABITS
>> ++	CANONARCH=$RPM_CUSTOM_CANONARCH
>> ++	CANONCOLOR=$RPM_CUSTOM_CANONCOLOR
>> ++    ;;
>> +     sparc64*)
>> + 	ISANAME=sparc
>> + 	ISABITS=64
>> +--
>> +2.41.0
>> +
>> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>> index 95a9e92f96..0b8ebebb51 100644
>> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>> @@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
>>              file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
>>              file://fix-declaration.patch \
>>              file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
>> +           file://0001-Allow-setting-platform-macro-settings-externally-258.patch \
>>              "
>>   
>>   PE = "1"
>> @@ -128,10 +129,29 @@ do_install:append:class-nativesdk() {
>>   	EOF
>>   }
>>   
>> +def rpm_isaname(d):
>> +    import re
>> +    arch = d.getVar('TARGET_ARCH')
>> +    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
>> +        return "x86"
>> +    # Add more platform tweaks for ISANAME as needed
>> +    return arch
>> +
>> +# Add the custom BSP platform "macros" file
>> +do_install:prepend:class-target() {
>> +    export RPM_CUSTOM_ARCH="${MACHINE_ARCH}"
>> +    export RPM_CUSTOM_ISANAME="${@rpm_isaname(d)}"
>> +    export RPM_CUSTOM_ISABITS="${SITEINFO_BITS}"
>> +    export RPM_CUSTOM_CANONARCH="${TARGET_ARCH}"
>> +    # CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for a 64-bit platform
>> +    export RPM_CUSTOM_CANONCOLOR="${@bb.utils.contains('DISTRO_FEATURES', 'multilib', '3', '0', d)}"
>> +}
>> +
>>   # Rpm's make install creates var/tmp which clashes with base-files packaging
>>   do_install:append:class-target() {
>>       rm -rf ${D}/var
>>   }
>> +
>>   do_install:append:class-nativesdk() {
>>       rm -rf ${D}${SDKPATHNATIVE}/var
>>       # Ensure find-debuginfo is located correctly inside SDK
>> -- 
>> 2.41.0
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#185245): https://lists.openembedded.org/g/openembedded-core/message/185245
>> Mute This Topic: https://lists.openembedded.org/mt/100483574/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>


