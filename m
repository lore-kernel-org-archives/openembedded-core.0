Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5662060557
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 15:35:45 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q76so3507782pfq.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 08:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RAWC+kTmPoR7oAxBdNjH7/4BgRxBQ5HgcK3oXZ4f6f0=;
	b=ZZ2FyUT1TC2pq+/2r/MN9dvxgZmwEBc3pIRd+cnfmKdFYMaapnOFHLrzsKOL0v9r1h
	vI2B27L+2t/DZxGI3N1bw5eQzOwp1OhEEVSS5fp8dYep+16esz0jP1BUWF/SqRits5G2
	WaOAJ4lfKVUCR8NMsLMlDLHjzBQvH+6OgPKGarUE5rW4wmJQoWbO8fYC5FBHSM1E/F53
	jv8kOdgsCXIyKlv47ogaCNQP7Y65KH68uAA6XH6KQ0hmGU4OB8NbAZNJndWdBtyU8UfW
	A7PqMyoyfp/6OddrfwqtZG3MO32BihXwFcbIkhJSQwo7JZgEva+tZon6OfqzDP588C2d
	ZeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RAWC+kTmPoR7oAxBdNjH7/4BgRxBQ5HgcK3oXZ4f6f0=;
	b=eZDhvvI5CV5KwAohze6ubFd3Oob1bfsnhzkAU/OUwwFpolaSxJtWOoCzDo/YBHUcnU
	DEtpgWHM3mCzFAi2VjEKwaJRKf4G97mNsOGLFqK0kkUZC+VaGHx40+SP5d8fqJ87u7H2
	V/qXRjVXAtj7K19F2WQRVGRK1c+uXs/p6vW8eo/TSMnE3FCO98IfmUP9PYFVj9PVQtAH
	CMxGmLHEBi/Goyqx8xPqkksmQY0F25Kli18NWC1g6cvffaluv8GyMedeuU6PSWTMt9q9
	4DxDBUeucAYcdL0Q4TfFzK6PeSIHHMiIkzDYsD/j05Ip1hoQfb9w3QcEVXbJugHsvveh
	++Xg==
X-Gm-Message-State: AHPjjUhDUOQ8R2f/FncQxLeQMNgPnOMTF2Bur7HYfVuUq8glpJK54xpi
	dca0BT6BpqZoga2tfSdx9DFC1ZoLGWZbtTmHvVQ=
X-Google-Smtp-Source: ADKCNb72nOkYtdzyYNkwhQUAXRJrSz7nNm9/tns/E0bXGM85aGrlwBUQSTzWRKJEopq0eDHb2QziDnZmWwvHkP/vIn0=
X-Received: by 10.84.138.1 with SMTP id 1mr31941533plo.404.1505662547430; Sun,
	17 Sep 2017 08:35:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Sun, 17 Sep 2017 08:35:16 -0700 (PDT)
In-Reply-To: <CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
	<CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Sep 2017 08:35:16 -0700
Message-ID: <CAMKF1spThq_ChRsvqVsRBuJhH6SBcwDZ_m5UPm8KPn=Arbt=wg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Sun, 17 Sep 2017 15:35:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 17, 2017 at 2:18 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Is anyone seeing u-boot-fw-utils.do_install failure with this?
>

I am seeing same failures too. havent yet dug into it.

> u-boot-fw-utils/1_2017.09-r0/git/tools/env/fw_printenv: No such file or
> directory
>
> I've tried u-boot-fw-utils-cross, but it fails as well even sooner in
> do_compile:
>
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 32 ARCH=arm CC=gcc
> -isystemwork/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/usr/include
> -O2 -pipe
> -Lwork/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/usr/lib
> -Lwork/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/lib
> -Wl,-rpath-link,work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/lib
> -Wl,-rpath,work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/usr/lib
> -Wl,-rpath,work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/lib
> -Wl,-O1 V=1 rpi_3_32b_config
> | make -f ./scripts/Makefile.build obj=scripts/basic
> |   cc -Wp,-MD,scripts/basic/.fixdep.d -Wall -Wstrict-prototypes -O2
> -fomit-frame-pointer      -o scripts/basic/fixdep scripts/basic/fixdep.c
> | /bin/sh: 1: cc: not found
> | make[1]: *** [scripts/basic/fixdep] Error 127
> | make: *** [scripts_basic] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/temp/log.do_compile.12859)
> ERROR: Task
> (virtual:cross:oe-core/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb:do_compile)
> failed with exit code '1'
>
>
> On Mon, Sep 11, 2017 at 10:30 PM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> This upgrades the U-Boot to the 2017.09 release.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>>  .../u-boot/{u-boot-common_2017.07.inc => u-boot-common_2017.09.inc}     |
>> 2 +-
>>  .../u-boot/{u-boot-fw-utils_2017.07.bb => u-boot-fw-utils_2017.09.bb}   |
>> 0
>>  .../u-boot/{u-boot-mkimage_2017.07.bb => u-boot-mkimage_2017.09.bb}     |
>> 0
>>  meta/recipes-bsp/u-boot/{u-boot_2017.07.bb => u-boot_2017.09.bb}        |
>> 0
>>  4 files changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.07.inc =>
>> u-boot-common_2017.09.inc} (89%)
>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.07.bb =>
>> u-boot-fw-utils_2017.09.bb} (100%)
>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.07.bb =>
>> u-boot-mkimage_2017.09.bb} (100%)
>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.07.bb => u-boot_2017.09.bb}
>> (100%)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>> b/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
>> similarity index 89%
>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
>> index e37f5fd409..02e51242cb 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
>> @@ -7,7 +7,7 @@ PE = "1"
>>
>>  # We use the revision in order to avoid having to fetch it from the
>>  # repo during parse
>> -SRCREV = "d85ca029f257b53a96da6c2fb421e78a003a9943"
>> +SRCREV = "c98ac3487e413c71e5d36322ef3324b21c6f60f9"
>>
>>  SRC_URI = "git://git.denx.de/u-boot.git \
>>      file://MPC8315ERDB-enable-DHCP.patch \
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
>> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
>> similarity index 100%
>> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
>> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
>> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb
>> similarity index 100%
>> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
>> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.07.bb
>> b/meta/recipes-bsp/u-boot/u-boot_2017.09.bb
>> similarity index 100%
>> rename from meta/recipes-bsp/u-boot/u-boot_2017.07.bb
>> rename to meta/recipes-bsp/u-boot/u-boot_2017.09.bb
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

