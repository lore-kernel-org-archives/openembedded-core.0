Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DF17E77B39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 17:28:54 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x124so502841wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 10:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wNCjmWB8koNVYh/o38WUtjbV1//VQSJZ17h/aCvbqVY=;
	b=DqqnqrSk9WYtvemJqrfhZOwcqXqjW1HvPl46eg6HXgaG9d0vlb1ZxNlmQR2ZbiUaif
	MjGkgszc2JewMdoHM7WJexzi6bYZJd9YrL+4dGJ4MhYv2IEGVENElmiACrco3Xc3L+mn
	4AJ+ahKyM8JTiMdoAH6W13kzjwf+YWys1+u+fnsYiE+rhKHvWkLa0s7yBp2hIhNiNWX2
	uGPL6b1zIr/JxiinY4bMl4Yk13hMBqqCEFJPFe50etPtEXQVwgq8ceXFHlgIFQIcc8ZJ
	lblWMd6EfhzGKaDK+o2NqflgtOLJLR6e904vOkivZeKxrdHf2nW9/qPVgtNLPamJx8BS
	nGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wNCjmWB8koNVYh/o38WUtjbV1//VQSJZ17h/aCvbqVY=;
	b=lGB9pKK6cRxl9Q3js6si5D3cl1Vl7TL1NBzIgXnaR+JpTAbD4wyCf4JVV30Ogm2O7b
	kJo4d6aZMW1v+XliQUIq+QpIASxkwLiplvShatOqnHJs/10iOMmTYVn3bKvJ+p9cLZGt
	DZBqMLsEiTvQDVGV+WiX2YUYw531Kpq/rIWwsdVC4bSngdfX1T8sTy12bAd8zqtvBLhG
	6EMI9dOLh9KAfQ2h4vc0lqsEvJAPcfXacTyL6hBnDR+KoGa3kOJHMPC+hWIG5Ufo0O5t
	u+gcVGj0/CDY7BZID3PXqX8KY3NvZjP3uPmEGDHfa6fS7JJvzBubkizUaYaB5z8Z0LGk
	yhPg==
X-Gm-Message-State: AFeK/H1uIDMbYok3weDDuFgs+45vh8HicjAEo4oZyo82mJX65V8AUZrKiIg4JnQh3v7/FA6BnYPxzW3GxZZXiA==
X-Received: by 10.28.165.145 with SMTP id o139mr14779536wme.13.1490290135564; 
	Thu, 23 Mar 2017 10:28:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Thu, 23 Mar 2017 10:28:24 -0700 (PDT)
In-Reply-To: <CA+chaQfEoP3sybT01_BkywgHAfQV=_aEkgFAap6Gf_V=4zJZpw@mail.gmail.com>
References: <cover.1490028304.git.raj.khem@gmail.com>
	<4fc23dd9c0d1dc198d2dec0a8277e2b96f014c32.1490028304.git.raj.khem@gmail.com>
	<CA+chaQfEoP3sybT01_BkywgHAfQV=_aEkgFAap6Gf_V=4zJZpw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Mar 2017 10:28:24 -0700
Message-ID: <CAMKF1sppB9H9Uvwcnq-T9uBCJhCARUA-sFVDmjC6MuSeMv8qZA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] openssl: Fix build with clang
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Mar 2017 17:28:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 23, 2017 at 1:26 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> This breaks build with default gcc with thumb enabled:
>

These are straight backports from upstream. I wonder if this breakage
was just a break in waiting with newer release

> arm-oe-linux-gnueabi-gcc  -march=armv7-a -mthumb -mfpu=neon
> -mfloat-abi=softfp -mcpu=cortex-a9 -mtune=cortex-a9 -funwind-tables
> -rdynamic --sysroot=WORKDIR/recipe-sysroot -I.. -I../.. -I../modes -I../asn1
> -I../evp -I../../include  -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT
> -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN        -DTERMIO  -O2 -pipe -g
> -feliminate-unused-debug-types
> -fdebug-prefix-map=WORKDIR=/usr/src/debug/openssl/1.0.2k-r0
> -fdebug-prefix-map=WORKDIR/recipe-sysroot-native=
> -fdebug-prefix-map=WORKDIR/recipe-sysroot=  -Wall -Wa,--noexecstack
> -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS -DOPENSSL_BN_ASM_MONT
> -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DAES_ASM
> -DBSAES_ASM -DGHASH_ASM -c   -c -o ghash-armv4.o ghash-armv4.S
> ghash-armv4.S: Assembler messages:
> ghash-armv4.S:88: conditional infixes are deprecated in unified syntax
> ghash-armv4.S:88: Error: thumb conditional instruction should be in IT block
> -- `ldrplb r12,[r2,r3]'
> ghash-armv4.S:98: conditional infixes are deprecated in unified syntax
> ghash-armv4.S:98: Error: thumb conditional instruction should be in IT block
> -- `ldrplb r8,[r0,r3]'
> ghash-armv4.S:105: Error: thumb conditional instruction should be in IT
> block -- `eorpl r12,r12,r8'
> ghash-armv4.S:107: Error: thumb conditional instruction should be in IT
> block -- `andpl r14,r12,#0xf0'
> ghash-armv4.S:108: Error: thumb conditional instruction should be in IT
> block -- `andpl r12,r12,#0x0f'
> ghash-armv4.S:144: conditional infixes are deprecated in unified syntax
> ghash-armv4.S:144: Error: thumb conditional instruction should be in IT
> block -- `ldrneb r12,[r2,#15]'
> ghash-armv4.S:231: conditional infixes are deprecated in unified syntax
> ghash-armv4.S:231: Error: thumb conditional instruction should be in IT
> block -- `ldrplb r12,[r0,r3]'
> ghash-armv4.S:248: Error: thumb conditional instruction should be in IT
> block -- `andpl r14,r12,#0xf0'
> ghash-armv4.S:249: Error: thumb conditional instruction should be in IT
> block -- `andpl r12,r12,#0x0f'
> make[2]: *** [ghash-armv4.o] Error 1
>
>
>
> On Mon, Mar 20, 2017 at 5:47 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...build-with-clang-using-external-assembler.patch | 49
>> ++++++++++++++++++++++
>>  .../recipes-connectivity/openssl/openssl_1.0.2k.bb |  5 ++-
>>  2 files changed, 52 insertions(+), 2 deletions(-)
>>  create mode 100644
>> meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
>>
>> diff --git
>> a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
>> b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
>> new file mode 100644
>> index 0000000000..47b83a5896
>> --- /dev/null
>> +++
>> b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
>> @@ -0,0 +1,49 @@
>> +From 2f6026cb8b16cf00726e3c5625c023f196680f07 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Fri, 17 Mar 2017 12:52:08 -0700
>> +Subject: [PATCH] Fix build with clang using external assembler
>> +
>> +Cherry-picked from
>>
>> +https://github.com/openssl/openssl/commit/11208dcfb9105e8afa37233185decefd45e89e17
>>
>> +https://github.com/openssl/openssl/commit/fbab8baddef8d3346ae40ff068871e2ddaf10270
>>
>> +https://github.com/openssl/openssl/commit/6cf412c473d8145562b76219ce3da73b201b3255
>> +
>> +Fixes
>> +
>> +| ghash-armv4.S: Assembler messages:
>> +| ghash-armv4.S:81: Error: bad instruction `ldrbpl r12,[r2,r3]'
>> +| ghash-armv4.S:91: Error: bad instruction `ldrbpl r8,[r0,r3]'
>> +| ghash-armv4.S:137: Error: bad instruction `ldrbne r12,[r2,#15]'
>> +| ghash-armv4.S:224: Error: bad instruction `ldrbpl r12,[r0,r3]'
>> +| clang-4.0: error: assembler command failed with exit code 1 (use -v to
>> see invocation)
>> +| make[2]: *** [<builtin>: ghash-armv4.o] Error 1
>> +
>> +Upstream-Status: Backport
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + crypto/modes/asm/ghash-armv4.pl | 7 +++++++
>> + 1 file changed, 7 insertions(+)
>> +
>> +diff --git a/crypto/modes/asm/ghash-armv4.pl
>> b/crypto/modes/asm/ghash-armv4.pl
>> +index 8ccc963ef..442fed4da 100644
>> +--- a/crypto/modes/asm/ghash-armv4.pl
>> ++++ b/crypto/modes/asm/ghash-armv4.pl
>> +@@ -124,7 +124,14 @@ $code=<<___;
>> + #include "arm_arch.h"
>> +
>> + .text
>> ++#if defined(__thumb2__) || defined(__clang__)
>> ++.syntax       unified
>> ++#endif
>> ++#if defined(__thumb2__)
>> ++.thumb
>> ++#else
>> + .code 32
>> ++#endif
>> +
>> + #ifdef __clang__
>> + #define ldrplb        ldrbpl
>> +--
>> +2.12.0
>> +
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
>> b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
>> index 922819b3d5..1c1041428c 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
>> @@ -37,12 +37,13 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>>              file://Makefiles-ptest.patch \
>>              file://ptest-deps.patch \
>>              file://openssl-1.0.2a-x32-asm.patch \
>> -            file://ptest_makefile_deps.patch  \
>> +            file://ptest_makefile_deps.patch \
>>              file://configure-musl-target.patch \
>>              file://parallel.patch \
>>              file://openssl-util-perlpath.pl-cwd.patch \
>>              file://Use-SHA256-not-MD5-as-default-digest.patch \
>> -           "
>> +
>> file://0001-Fix-build-with-clang-using-external-assembler.patch \
>> +            "
>>  SRC_URI[md5sum] = "f965fc0bf01bf882b31314b61391ae65"
>>  SRC_URI[sha256sum] =
>> "6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0"
>>
>> --
>> 2.12.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

