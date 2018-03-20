Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id DF57471A0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 21:27:52 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id f5-v6so1808898plj.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 14:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jIyQBjNnHkwcNyefVCUuFVvjNQBgqgbakIiMl4Lr+9c=;
	b=Uym+j1dP7Iv+z2BAmH23l5uRxAr2JKqPdETqY/Z744vGus4hwF1B8fLaIEEgZudjKn
	Mi8FARiDUChn+kNCpFzgY7a02/5j1Ykb8W8WxRl55tV0WmP0ZlX4M5Hl2vIDB32gfimE
	bgUfmmOlP/56vis2CeTEOxt/nC0EzM7IEMcZXjMkWvOMSmPBXlqzS6tH/CCR94B+0PgT
	yvdqJffS7Au040sGB685lZWq0qnkr3J/WOh5rgA9T+mhA+9jxz45bLm7Hgc0Tb6gHlGy
	biysVWDCSV+2HZiuiiQXmPYQ3jgTqwn1d/W5POLfIRjM/61fkeZJL768GNMrrXtxHIhg
	649A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jIyQBjNnHkwcNyefVCUuFVvjNQBgqgbakIiMl4Lr+9c=;
	b=o/GQwval2+5rypOAeUWnyuf186Q1BMIIiy4HlUigge4ch25ynPUoDBiHfAtIz8qFRm
	15vF/Hb/6egCx+F9CHpouRtNVZUVQK++ffJHqH/x/9BlrFv7E7sP59Q7qWEpgPJbn6SX
	hK+t+gQt60BXDOtFiFDg0l4ZomqC90p7ypjMveggEOiXB7OU1i8/5Cd10TPQHDsUvmTp
	yCc9UaF0HmXkA60SJA6/0oFq3hrOmzPkIFjyC9zOJS07dnsDNigYaAGKjc7c0dI30XHJ
	VQCD4K8JGaA3cAWnNRz2LOQ07lMWeeB4VrPvZpaiI7kCuvfX589oodhc3NeEDjge6fBx
	ZZMg==
X-Gm-Message-State: AElRT7FJ9yCZ6myEksRYbqLPKZxHQ6WVmEG//JZGV2XGMDsKzeElZ6qg
	8BP4KRoQ57vmS5Z3sNTsMit3KQDRNCKDRLCP5XZWow==
X-Google-Smtp-Source: AG47ELsKgJdGTmZwHoMx277+WPXt3ohh+edWQQzkgdWdEnuLEhXDoxpu/nhmhifXUVJpCFh4P8I0faLK4BgsKol62rI=
X-Received: by 2002:a17:902:43e4:: with SMTP id
	j91-v6mr286113pld.118.1521581273511; 
	Tue, 20 Mar 2018 14:27:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Tue, 20 Mar 2018 14:27:22 -0700 (PDT)
In-Reply-To: <CAMKF1sqQtYaMFV75k76-e+xqv7roh2c4oLKFunKOCX=vPAqHyA@mail.gmail.com>
References: <20180320052114.32323-1-raj.khem@gmail.com>
	<CAMKF1sqQtYaMFV75k76-e+xqv7roh2c4oLKFunKOCX=vPAqHyA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Mar 2018 14:27:22 -0700
Message-ID: <CAMKF1srLzawPwfXbfMtBQEaYBsasBpDQ2KVoXNDh3SmEqzqdCw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-2.27: Update to bring in 2.27 bug fixes since release
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
X-List-Received-Date: Tue, 20 Mar 2018 21:27:53 -0000
Content-Type: text/plain; charset="UTF-8"

OK please take this in, the issue was not glibc issue but a pilot
error. This has bug/security fixes since 2.27 release

On Mon, Mar 19, 2018 at 11:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
> hold on to this patch, I am seeing a runtime
> regression.
>
> On Mon, Mar 19, 2018 at 10:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Here is full list of fixes
>>
>> https://sourceware.org/git/?p=glibc.git;a=shortlog;h=df3ff4e49d4ee3cbbdaeb0b1cb5dc2344c08be98;hp=23158b08a0908f381459f273a984c6fd328363cb
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-core/glibc/cross-localedef-native_2.27.bb | 2 +-
>>  meta/recipes-core/glibc/glibc_2.27.bb                  | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
>> index f1e4a657cf..d80c8c2a55 100644
>> --- a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
>> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
>> @@ -21,7 +21,7 @@ SRCBRANCH ?= "release/${PV}/master"
>>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
>>
>> -SRCREV_glibc ?= "23158b08a0908f381459f273a984c6fd328363cb"
>> +SRCREV_glibc ?= "df3ff4e49d4ee3cbbdaeb0b1cb5dc2344c08be98"
>>  SRCREV_localedef ?= "de5bdbd5e76b5403a4151b9b9f958b6cca36b3e7"
>>
>>  SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>> diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
>> index c4042d16fe..326804d6d5 100644
>> --- a/meta/recipes-core/glibc/glibc_2.27.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.27.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
>>
>>  DEPENDS += "gperf-native bison-native"
>>
>> -SRCREV ?= "23158b08a0908f381459f273a984c6fd328363cb"
>> +SRCREV ?= "df3ff4e49d4ee3cbbdaeb0b1cb5dc2344c08be98"
>>
>>  SRCBRANCH ?= "release/${PV}/master"
>>
>> --
>> 2.16.2
>>

