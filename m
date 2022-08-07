Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA4CC19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 17:37:42 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.15958.1659893858849582410
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 10:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hrzb61B1;
 spf=pass (domain: gmail.com, ip: 209.85.128.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-328303afa6eso61265807b3.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 10:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=8KdVnaw2ki6sIJSLVcK5cpumDzmwwebAdAIeK9GkfWs=;
        b=Hrzb61B19NEkBYgN63mOXM8uoUJjqYcVfWyfhdpnOt734kLRZ+esZ2dCoVkZKECvEY
         hG/jiMVKLibqJGzU4I6q9r22LkKpmYKZ1ZriMApcElO4QNMeFyCOzoidcr+vtnCMumKv
         JjgntnyANOtzSpbQbL9h+37eLtJuFa04qSDCqZ+hcmaCt4S/JFi2q3Dftq2/8bGm6vXm
         tQoDTOvwia8F8mrtGIec2FnpzI+Haq26Jqshz7FTz2j1V7/0lmV7ligsBfpYEjZYSEV3
         X6LLkm+fumiRe/z9feyv06vw8a0U/X93xmuS2rcOtPHN3ODasZql4IpQdzLmxGbZS5U+
         veUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=8KdVnaw2ki6sIJSLVcK5cpumDzmwwebAdAIeK9GkfWs=;
        b=oUBFOYXEFg8rDfw0wU2SJoALj/+VbeWtjqv4pZZ3ByLZeiKOlX5ZupL1cv1gIo+0AL
         rJKBS/0yVq0JCkU+y/DlFYWDeUqu7VUrmPRTh8Xhr5SxGqY+2WmEpsAkE1BSK9TDqZnL
         jBuxiFsSIACSTZt07ULkKqJdFHIVMA0XDyTB+al544R8ku/+Hh+vFa/KFh4MpvuLbaR5
         XhBIQLx/FSSsDKjnXkBP/F0IBsTee2a3njEJDD4qZsu4hWJsvDLTQbg30TNTDcU6F8HR
         XPSnvfKoNjLOWR1m7WzdDOjIJsIh6T1qIeOExK6wjGcNjXMD3kqQje0xbZesFfrIHZ5c
         zxqQ==
X-Gm-Message-State: ACgBeo1DnYlm3uXBTlqUV6p7yZ9o9EOB1dnblm7bPxg6Lb2Z6WpyDcOC
	hu5W87ylAB9gDCu+QcuVC9q3/hJ1Fl7yOG6mdr4=
X-Google-Smtp-Source: 
 AA6agR6QwFoMY9nwtQc/b0FSSPxjJ2H7K3DYPU5U48BLJ0Tzf9qskSpiUfnFNBJ++xLYu45Ub84DacPiMUymUdyOh2M=
X-Received: by 2002:a81:e84:0:b0:328:9b2b:e98b with SMTP id
 126-20020a810e84000000b003289b2be98bmr15059939ywo.422.1659893857921; Sun, 07
 Aug 2022 10:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220807160629.2112131-1-raj.khem@gmail.com>
 <CA+chaQcHJX84EmQgpRD3S+LS3ohPXSkET5u=drA1tU7RaPy6vw@mail.gmail.com>
In-Reply-To: 
 <CA+chaQcHJX84EmQgpRD3S+LS3ohPXSkET5u=drA1tU7RaPy6vw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Aug 2022 10:37:11 -0700
Message-ID: 
 <CAMKF1spY8cyJSv1jDWF4taAn-dYGXKa==8jUML=z34qkqd+b9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] binutils: Upgrade to 2.39 release
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 17:37:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169003

On Sun, Aug 7, 2022 at 9:41 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
>
>
> On Sun, Aug 7, 2022 at 6:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Details of changes [1]
>>
>> [1] https://sourceware.org/pipermail/binutils/2022-August/122246.html
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> v2: Remove trailing .0 from PV
>>
>>  meta/conf/distro/include/tcmode-default.inc   |    2 +-
>>  .../{binutils-2.38.inc => binutils-2.39.inc}  |   26 +-
>>  ....38.bb => binutils-cross-canadian_2.39.bb} |    0
>>  ...38.bb => binutils-cross-testsuite_2.39.bb} |    0
>>  ...s-cross_2.38.bb => binutils-cross_2.39.bb} |    0
>>  ...ssdk_2.38.bb => binutils-crosssdk_2.39.bb} |    0
>>  ...s-crosssdk-Generate-relocatable-SDKs.patch |    2 +-
>>  ...o-not-generate-linker-script-directo.patch |    2 +-
>>  ...dk-Search-for-alternative-ld.so.conf.patch |   16 +-
>>  ...004-Point-scripts-location-to-libdir.patch |   10 +-
>>  ...tro-compiler-point-to-the-wrong-ins.patch} |    2 +-
>>  ...system-directories-when-cross-linki.patch} |   42 +-
>>  ...ct-assembling-for-ppc-wait-mnemonic.patch} |    8 +-
>>  ...l-2.4.patch => 0008-Use-libtool-2.4.patch} | 2131 ++++++++---------
>>  ...-in-libtool-when-sysroot-is-enabled.patch} |    2 +-
>>  ...> 0010-sync-with-OE-libtool-changes.patch} |    2 +-
>>  ...r-clang-before-checking-gcc-version.patch} |   10 +-
>>  ...RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} |   17 +-
>>  .../0013-Avoid-as-info-race-condition.patch   |   75 -
>>  .../binutils/0014-CVE-2019-1010204.patch      |   49 -
>>  .../{binutils_2.38.bb => binutils_2.39.bb}    |    0
>>  21 files changed, 1129 insertions(+), 1267 deletions(-)
>>  rename meta/recipes-devtools/binutils/{binutils-2.38.inc => binutils-2.39.inc} (60%)
>>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.38.bb => binutils-cross-canadian_2.39.bb} (100%)
>>  rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.38.bb => binutils-cross-testsuite_2.39.bb} (100%)
>>  rename meta/recipes-devtools/binutils/{binutils-cross_2.38.bb => binutils-cross_2.39.bb} (100%)
>>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.38.bb => binutils-crosssdk_2.39.bb} (100%)
>>  rename meta/recipes-devtools/binutils/binutils/{0006-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch => 0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch} (94%)
>>  rename meta/recipes-devtools/binutils/binutils/{0007-warn-for-uses-of-system-directories-when-cross-linki.patch => 0006-warn-for-uses-of-system-directories-when-cross-linki.patch} (91%)
>>  rename meta/recipes-devtools/binutils/binutils/{0008-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch => 0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch} (85%)
>>  rename meta/recipes-devtools/binutils/binutils/{0009-Use-libtool-2.4.patch => 0008-Use-libtool-2.4.patch} (95%)
>>  rename meta/recipes-devtools/binutils/binutils/{0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch => 0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch} (96%)
>>  rename meta/recipes-devtools/binutils/binutils/{0011-sync-with-OE-libtool-changes.patch => 0010-sync-with-OE-libtool-changes.patch} (97%)
>>  rename meta/recipes-devtools/binutils/binutils/{0012-Check-for-clang-before-checking-gcc-version.patch => 0011-Check-for-clang-before-checking-gcc-version.patch} (84%)
>>  rename meta/recipes-devtools/binutils/binutils/{0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch => 0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} (70%)
>>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0013-Avoid-as-info-race-condition.patch
>>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch
>>  rename meta/recipes-devtools/binutils/{binutils_2.38.bb => binutils_2.39.bb} (100%)
>
>
> I'm seeing bunch of libtool erros with this applied, see:
> http://errors.yoctoproject.org/Errors/Details/664878/

yes. gprofng is a new tool and I have forgotten to upgrade it to use
libtool 2.4 since I have it disabed in my testing. I have done so now
and sent a v3. Try it out.

