Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9783EC00528
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 08:39:18 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.2988.1690447157400957756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 01:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=EA70iBJv;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: zboszor@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3464c774f23so2332985ab.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 01:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690447156; x=1691051956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYl8A5NiC6sjBvmau0VRQI00baet8hMlqEHWBZ1CZy0=;
        b=EA70iBJvGJOHztACKfuqr2CzXZv/RIQipApyL0rn9ey4npkK87HVZGB/QC0R+xzqOh
         V/5DwcfAzCWM6NcGbM5on65yyezp6E83zLiHkApeJHDbe4bJyKmYidkFLEtFvUl4pdVO
         Oyp74rAdF49HDr814tQXk20Ktt7KR8tWgWv9MCrei6XVynYkzg2QFdnYVWJmNz8bOd79
         eUkZoPWFYeBSzSKj9CzmG9eWOliYcLXNaKCbrTYJIbVZ1JGoqgOgpc36dLZA6xg5fsPf
         N3Q6w20r5AksgEQS/sHi9WUagV1s4Z4+Ka2abzN4Ik8EdMIR5L3BKxIjoqVSV6Et17dd
         j8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690447156; x=1691051956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYl8A5NiC6sjBvmau0VRQI00baet8hMlqEHWBZ1CZy0=;
        b=aiSJO1V3MEslxmafbVIDvwmv6Hgr50mHzPYERr3ztr9D9GCS4Fham920VOiDxAlqcl
         Ghgacg/lwBfdhdHnvwA8VlA7YLosZ1EI8VjhSmO4iLolOZlnCUWofju0UrBp7kxnwsGp
         C92+ORWdLs4+QvRpjVdiaDhiLYbPmIPCfM/yKKUZnFoWTG8hUPfC5DhRI6P4gi/wDf4n
         MIN54NoSqNJjLLsfHpq2GM5cDtMw3Fynwy/EVCwmfI6FABi41z69+P1UUEqgAID9nc+i
         BlyBmtDeMwpGZ70pB525hw3iZ7XS3ghmlcEyLcB0iqtiZ+BsUZ4Hpr366atez3CiM349
         B6Fg==
X-Gm-Message-State: ABy/qLabxutYi3PhvDekd9D86NoSP8Uzk3X6xh9vCJLR/L2E597DFSmI
	BWnYpGoNt6RzwVMLuA9WR3/3NaVQKEU7kQ==
X-Google-Smtp-Source: APBJJlEPpN2qW44WblRImGqBxBmjtosMCs9Ja8NlyUW0/xnS3rKaur9JTeczQrusTPS24Z3lLXaxvQ==
X-Received: by 2002:a05:6e02:11ae:b0:348:cab1:4d5c with SMTP id 14-20020a056e0211ae00b00348cab14d5cmr4345780ilj.10.1690447156338;
        Thu, 27 Jul 2023 01:39:16 -0700 (PDT)
Received: from [192.168.2.51] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id u20-20020a02c054000000b0042b4f9ddecasm284691jam.85.2023.07.27.01.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 01:39:15 -0700 (PDT)
Message-ID: <0b393539-3a4b-f239-5933-70c5586b387d@gmail.com>
Date: Thu, 27 Jul 2023 10:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] rpm: Allow setting platform macro settings
 externally
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <Ross.Burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230725135719.388231-1-zboszor@gmail.com>
 <CANNYZj9_AbGN9YsahpHVHA8wqingZaKfv-DD_DPGURt4ezPn5Q@mail.gmail.com>
 <17756CA97DEFC46E.21334@lists.openembedded.org>
 <dfbfb13e-208b-4a63-b0a6-339452184c9c@gmail.com>
 <CANNYZj-7LvTF9qBuQu_grfX6LAMwQHG6fme8xE2+F-nA=0x7+Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-7LvTF9qBuQu_grfX6LAMwQHG6fme8xE2+F-nA=0x7+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 08:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184923

2023. 07. 27. 10:30 keltezéssel, Alexander Kanavin írta:
> I was hoping to get a reaction from Panu (who's the maintainer; Neal
> is a contributor), but then I remembered he's a Finn, and this time of
> the year all Finns disappear into summer cabins - temperatures above
> +20 are still rare in that country, and actual sun in the sky is even
> more precious :)

:-)

> So I'm slightly torn: I don't have anything against the patch, I just
> don't want to carry (and maintain) something that upstream rejected.
> We've had plenty of such incidents with rpm in the past.

No problem. I can carry the patch and recipe change internally in
bbappend form until it's decided. Apparently, it's only me where
the use case to need rpmbuild on a target machine ever occurred.

Thanks.

>
> Alex
>
> On Thu, 27 Jul 2023 at 09:32, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> Patch approved with the requested changes.
>>
>> I sent a v2 with using the approved patch and adding
>> the exports only to do_install:class-target because
>> that's where it's needed.
>>
>> 2023. 07. 26. 15:05 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
>>> 2023. 07. 25. 18:30 keltezéssel, Alexander Kanavin írta:
>>>> I would want to hold this until we have a reaction from upstream.
>>> Now we have reaction. Both PRs were closed because they were not
>>> against master, my bad. Now reopened against master as
>>> https://github.com/rpm-software-management/rpm/pull/2585
>>>
>>> But there was some real comment here:
>>> https://github.com/rpm-software-management/rpm/pull/2580#issuecomment-1651647277
>>>
>>> The discussion may/should be taken to the issue at
>>> https://github.com/rpm-software-management/rpm/issues/2578
>>>
>>>> RPM_CUSTOM_* exports should go to specific tasks where they are needed.
>>>>
>>>> Alex
>>>>
>>>> On Tue, 25 Jul 2023 at 15:57, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>>>>> Feed platform settings to installplatform externally. Based on the patch
>>>>> submitted under https://github.com/rpm-software-management/rpm/pull/2579
>>>>>
>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>> ---
>>>>>    ...ng-plaform-macro-settings-externally.patch | 56 +++++++++++++++++++
>>>>>    meta/recipes-devtools/rpm/rpm_4.18.1.bb       | 17 ++++++
>>>>>    2 files changed, 73 insertions(+)
>>>>>    create mode 100644
>>>>> meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch
>>>>>
>>>>> diff --git
>>>>> a/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch
>>>>> b/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch
>>>>>
>>>>> new file mode 100644
>>>>> index 0000000000..8b3220f114
>>>>> --- /dev/null
>>>>> +++
>>>>> b/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-settings-externally.patch
>>>>> @@ -0,0 +1,56 @@
>>>>> +From 320f4f3861dad70342f065004311eac143d6522d Mon Sep 17 00:00:00 2001
>>>>> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
>>>>> + <zboszor@gmail.com>
>>>>> +Date: Tue, 25 Jul 2023 10:56:44 +0200
>>>>> +Subject: [PATCH] Allow setting plaform macro settings externally
>>>>> +MIME-Version: 1.0
>>>>> +Content-Type: text/plain; charset=UTF-8
>>>>> +Content-Transfer-Encoding: 8bit
>>>>> +
>>>>> +Yocto has their own way to set the platform names via BSPs
>>>>> +(Board Support Packages). These names are more specific than
>>>>> +basic CPU architectures, and such a platform name ends up in
>>>>> +/etc/rpm/platform but the corresponding subdirectory under
>>>>> +/usr/lib/rpm/platform does not exist.
>>>>> +
>>>>> +Allow creating such custom platform subdirectory with feeding
>>>>> +the necessary data using external variables: RPM_CUSTOM_ARCH,
>>>>> +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
>>>>> +and RPM_CUSTOM_CANONCOLOR
>>>>> +
>>>>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>> +Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/2579]
>>>>> +---
>>>>> + installplatform | 9 ++++++++-
>>>>> + 1 file changed, 8 insertions(+), 1 deletion(-)
>>>>> +
>>>>> +diff --git a/installplatform b/installplatform
>>>>> +index a5ad7c5b8..59f57697b 100755
>>>>> +--- a/installplatform
>>>>> ++++ b/installplatform
>>>>> +@@ -11,7 +11,7 @@ VENDOR="${4}"
>>>>> + OS="${5}"
>>>>> + RPMRC_GNU="${6}"
>>>>> +
>>>>> +-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
>>>>> ++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`
>>>>> ${RPM_CUSTOM_ARCH:+custom}; do
>>>>> +   RPMRC_OPTFLAGS="`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
>>>>> +   RPMRC_OPTFLAGS="`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
>>>>> +   case $RPMRC_OPTFLAGS in
>>>>> +@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
>>>>> +   CANONCOLOR=
>>>>> +   FILTER=cat
>>>>> +   case "${ARCH}" in
>>>>> ++    custom)
>>>>> ++      ARCH=$RPM_CUSTOM_ARCH
>>>>> ++      ISANAME=$RPM_CUSTOM_ISANAME
>>>>> ++      ISABITS=$RPM_CUSTOM_ISABITS
>>>>> ++      CANONARCH=$RPM_CUSTOM_CANONARCH
>>>>> ++      CANONCOLOR=$RPM_CUSTOM_CANONCOLOR
>>>>> ++    ;;
>>>>> +     sparc64*)
>>>>> +       ISANAME=sparc
>>>>> +       ISABITS=64
>>>>> +--
>>>>> +2.41.0
>>>>> +
>>>>> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>>>> b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>>>> index 95a9e92f96..bc036fc843 100644
>>>>> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>>>> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>>>> @@ -40,6 +40,7 @@ SRC_URI =
>>>>> "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
>>>>> file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
>>>>>               file://fix-declaration.patch \
>>>>> file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
>>>>> + file://0001-Allow-setting-plaform-macro-settings-externally.patch \
>>>>>               "
>>>>>
>>>>>    PE = "1"
>>>>> @@ -103,6 +104,21 @@ WRAPPER_TOOLS = " \
>>>>>       ${libdir}/rpm/rpmdeps \
>>>>>    "
>>>>>
>>>>> +def rpm_isaname(d):
>>>>> +    import re
>>>>> +    arch = d.getVar('TARGET_ARCH')
>>>>> +    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
>>>>> +        return "x86"
>>>>> +    # Add more platform tweaks for ISANAME as needed
>>>>> +    return arch
>>>>> +
>>>>> +export RPM_CUSTOM_ARCH = "${MACHINE_ARCH}"
>>>>> +export RPM_CUSTOM_ISANAME = "${@rpm_isaname(d)}"
>>>>> +export RPM_CUSTOM_ISABITS = "${SITEINFO_BITS}"
>>>>> +export RPM_CUSTOM_CANONARCH = "${TARGET_ARCH}"
>>>>> +# CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for a 64-bit platform
>>>>> +export RPM_CUSTOM_CANONCOLOR = "${@bb.utils.contains('DISTRO_FEATURES', 'multilib',
>>>>> '3', '0', d)}"
>>>>> +
>>>>>    do_configure:prepend() {
>>>>>            mkdir -p ${S}/build-aux
>>>>>    }
>>>>> @@ -132,6 +148,7 @@ do_install:append:class-nativesdk() {
>>>>>    do_install:append:class-target() {
>>>>>        rm -rf ${D}/var
>>>>>    }
>>>>> +
>>>>>    do_install:append:class-nativesdk() {
>>>>>        rm -rf ${D}${SDKPATHNATIVE}/var
>>>>>        # Ensure find-debuginfo is located correctly inside SDK
>>>>> --
>>>>> 2.41.0
>>>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#184883): https://lists.openembedded.org/g/openembedded-core/message/184883
>>> Mute This Topic: https://lists.openembedded.org/mt/100350661/3617728
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


