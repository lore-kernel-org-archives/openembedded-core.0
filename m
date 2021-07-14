Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.3116.1626241990909895832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 22:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WaV4J/mr;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id s6so518109qkc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jul 2021 22:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SpN7Vtp55sbxj3cttgHcbuoB7Km0TypE4PQ6vHp1zbs=;
        b=WaV4J/mra7GvlPOPKEYj/J9ffCLI9youVJu2yv+asG/hDTqknQboRg+/3PmRyovQxX
         CdAKKdqI3XZYNCe5SF6vIgeyzfjTN9I1ilR66Uqjs8hM8Onc2cyJxwAlF+VcUKZIbip7
         baJJNTiDIon/7lhbbSH4ds3w/50oCHaVs3oPaTeMYV3eG2rU+Xi127I8Gac4zs69muEG
         2StlK9hky0P9bnb90lqdjzFgD3mxEL1072GLpxPWn+H56hLMbwK7/7U4pu/L0OraLVwL
         El8ePWkoBS32OTzKkjQH+yfjvmBG/leQOHurYAFbDUaMtf3vVXflC7MA4Dhf6xBU0E9q
         ZscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SpN7Vtp55sbxj3cttgHcbuoB7Km0TypE4PQ6vHp1zbs=;
        b=A7bXdesZ0RFrrfUrryiNUeznZ/fEefrRNja6iE0cw6d63kwSoT+eVHQx7jgnH7T3zK
         96E5woFPplJQbMAIyqHbGA3br74Mn1GIzyM0iI9WtcT3FtikVXDkMj9BTsOg0+Hc/kox
         hizANjnX+XYKTojlV4G62Ykw5Nk2i68tkyqI7JQ6aWbEsv0JvqEBxiPbeRAvWz/uZHBF
         URe6KWwV4zGIgGdZ7QutazlXp3evqmBTbhEPbA7uouCYiq5/6ZOH5bo4H2dZv/66csCR
         fYNjpbmP56jCZ1lyujC1P1cX4WPDHVJEu2d/5nEdB22pNfLSNqGzkjXq/DHK5TPGVFOk
         NSkg==
X-Gm-Message-State: AOAM531waZ7uLoKKp2ymzEOLpBNCsIUv1XL7MrZzZzyse64jRegb2gII
	pSQRMizzQJEeqyabruuG9tqkQDwKiInHPJiFArQ=
X-Google-Smtp-Source: ABdhPJxp3WZRJHe1TLPav3UbGX4hdrKkivCPpZEbuVqkK2nmlkYZO2hhBXEJ3Ek6sThpzeNouYde0lPRetPiNvLLHKY=
X-Received: by 2002:a37:58b:: with SMTP id 133mr8217939qkf.125.1626241990036;
 Tue, 13 Jul 2021 22:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210714021322.1245535-1-raj.khem@gmail.com> <CA+chaQdp4LxhM6LP+xGd3f3j6MEo6h0h1s3Mt_xCpcyfSfOxkQ@mail.gmail.com>
In-Reply-To: <CA+chaQdp4LxhM6LP+xGd3f3j6MEo6h0h1s3Mt_xCpcyfSfOxkQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 13 Jul 2021 22:52:44 -0700
Message-ID: <CAMKF1spUvOoR8q5yQBovskkvFEhxb7m2bKdNz012yB6p1r0kdA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libseccomp: Update to main branch
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 13, 2021 at 10:46 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Did you forget to replace AUTOREV with new SRCREV when you were done?
>

hmm yes i did

> On Wed, Jul 14, 2021 at 4:13 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Get RV32 imlementation
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...-configure.ac-Bump-version-to-2.5.99.patch | 26 +++++++++++++++++++
>>  .../libseccomp/libseccomp_2.5.1.bb            |  7 +++--
>>  2 files changed, 29 insertions(+), 4 deletions(-)
>>  create mode 100644 meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
>>
>> diff --git a/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch b/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
>> new file mode 100644
>> index 0000000000..f30ca77465
>> --- /dev/null
>> +++ b/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
>> @@ -0,0 +1,26 @@
>> +From 00b6bc440a75443f9bea431bbb41df50469b5093 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 8 Jun 2021 23:13:20 -0700
>> +Subject: [PATCH] configure.ac: Bump version to 2.5.99
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + configure.ac | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 3e87734..48e796f 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -19,7 +19,7 @@ dnl #
>> + dnl ####
>> + dnl libseccomp defines
>> + dnl ####
>> +-AC_INIT([libseccomp], [0.0.0])
>> ++AC_INIT([libseccomp], [2.5.99])
>> +
>> + dnl ####
>> + dnl autoconf configuration
>> +--
>> +2.32.0
>> +
>> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>> index 8fe1023901..5f79f3dbcb 100644
>> --- a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
>> @@ -7,14 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357c
>>
>>  DEPENDS += "gperf-native"
>>
>> -SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
>> +SRCREV = "${AUTOREV}"
>>
>> -SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5 \
>> +SRC_URI = "git://github.com/kraj/libseccomp.git;branch=riscv32 \
>> +           file://0001-configure.ac-Bump-version-to-2.5.99.patch \
>>             file://run-ptest \
>>             "
>>
>> -COMPATIBLE_HOST_riscv32 = "null"
>> -
>>  S = "${WORKDIR}/git"
>>
>>  inherit autotools-brokensep pkgconfig ptest features_check
>> --
>> 2.32.0
>>
>>
>> 
>>
