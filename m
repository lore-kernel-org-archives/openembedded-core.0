Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED816079F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:47:05 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id o145so15108111lff.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OR7E6YfWAiJMs+u87pPxGRDnt+rjHSelsHG0GC5FFbw=;
	b=X0e2DLM5OHT4zFfr1Xh+JqJefXB4t9kebpkcamwYV5pku0ExM87X3aH/7TCkLXADSi
	rrD6kXV6T23pbEbAmkVxq+tcqoKwcNFFfIRwy+H9DvRz+nTLT4fPtIUmMAF+3Qo+ZpBY
	YxFI1leMWAXJuaDLQ5A/ahvgY9iC6F+ltYPw+5jMp2zxFxpUR4x9nOezyF030Zv6W7ZW
	5PcQ+6pvb7zrz06XClR0YyTm9XZL1QbCdzdAYGsF4ITWKpuc/vfoC1od8cZ4VQNV7lw6
	Scd12RnCy7l+Zma56X7NCVtJU1X0gVR7IYHI3jwDCK4ynPxSV8mq4VIW9VsagQkAxz/h
	QdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OR7E6YfWAiJMs+u87pPxGRDnt+rjHSelsHG0GC5FFbw=;
	b=IT/EIHTAnpHHAxRP6e4kQ5y91Zwc6zTESfUqT1vLVOBg7hnkyjl+g+2QxwBSv2P1+A
	QmYrmtWBYMo/sDomHY1JEg5JRkeogVPZsGPoLfAzdY85dQcWqLkmBxUxbNC51h461mhT
	M8MIFMr8zgB1BGmNE6mFQ0kkqsMWWVyF1fNTo++s/fOkuZTvYgT3wONjILnQYqBRiJ7W
	XOh7Jl6958pacuRyidkCZBrKbqfIQcUHpno5aA+8S+FPztaYa4UYtPgWPhQihDGjM03D
	2wmjnscvGgCkSwsYJlkeVCr576DnsBSEq0jhdiOr4WzecVqlzi4Sow8ddqV9llZldqHu
	Y0PA==
X-Gm-Message-State: AElRT7HgsRBnc8AzjcAnP90bHA82+HwOs6zj9gWVQzvx0XKcy+OAIywN
	odWM7mquojtjijeJz6+aOevrBKj+aq3uq8Xaj9RVr3pX
X-Google-Smtp-Source: AG47ELvw4e8cqZT21sETUR1C36NTMAwHM/r0SJwjdUVJuPlpBgSECIH6hRRa2nuLHvrxxLpdIMX+p/KMzXUrSU0TRUc=
X-Received: by 10.46.42.67 with SMTP id q64mr4673696ljq.133.1520023626428;
	Fri, 02 Mar 2018 12:47:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Fri, 2 Mar 2018 12:47:05 -0800 (PST)
In-Reply-To: <20180302175256.29044-3-raj.khem@gmail.com>
References: <20180302175256.29044-1-raj.khem@gmail.com>
	<20180302175256.29044-3-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 2 Mar 2018 15:47:05 -0500
Message-ID: <CADkTA4MHrD5W0WZ2pHkOx8f6J9ZyB4ZXdJDQs+Nb1gfNtRdVkA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] musl-utils: Add package
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
X-List-Received-Date: Fri, 02 Mar 2018 20:47:06 -0000
Content-Type: text/plain; charset="UTF-8"

I've tested this against my new kernel-devsrc package when built on
musl, and I can
confirm that it works. There's a warning about the flags, but
everything still builds
and runs .. unlike before!

Cheers,

Bruce

root@qemux86-64:/lib/modules/4.14.19-yocto-standard/build# make ARCH=x86 scripts

getconf: LFS_CFLAGS: unknown variable
getconf: LFS_LDFLAGS: unknown variable
getconf: LFS_LIBS: unknown variable
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/basic/bin2c
getconf: LFS_CFLAGS: unknown variable
getconf: LFS_LDFLAGS: unknown variable
getconf: LFS_LIBS: unknown variable
  HOSTCC  scripts/kconfig/conf.o
  SHIPPED scripts/kconfig/zconf.tab.c
  SHIPPED scripts/kconfig/zconf.lex.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --silentoldconfig Kconfig
  WRAP    arch/x86/include/generated/asm/clkdev.h
  WRAP    arch/x86/include/generated/asm/dma-contiguous.h
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  WRAP    arch/x86/include/generated/asm/mm-arch-hooks.h
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  CC      scripts/mod/devicetable-offsets.s
  CHK     scripts/mod/devicetable-offsets.h
  UPD     scripts/mod/devicetable-offsets.h
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/conmakehash
  HOSTCC  scripts/recordmcount

root@qemux86-64:~# mv hellomod_makefile Makefile
root@qemux86-64:~# make
make -C /usr/src/kernel M=/home/root modules
make[1]: Entering directory '/lib/modules/4.14.19-yocto-standard/build'
getconf: LFS_CFLAGS: unknown variable
getconf: LFS_LDFLAGS: unknown variable
getconf: LFS_LIBS: unknown variable
  CC [M]  /home/root/hellomod.o
  Building modules, stage 2.
  MODPOST 1 modules
  CC      /home/root/hellomod.mod.o
  LD [M]  /home/root/hellomod.ko
make[1]: Leaving directory '/lib/modules/4.14.19-yocto-standard/build'

root@qemux86-64:~# insmod hellomod.ko
[  109.391703] hellomod: loading out-of-tree module taints kernel.
[  109.402032] Hello world!

Bruce


On Fri, Mar 2, 2018 at 12:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> This contains getconf, getent and iconv glibc compat utils
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl-utils.bb | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta/recipes-core/musl/musl-utils.bb
>
> diff --git a/meta/recipes-core/musl/musl-utils.bb b/meta/recipes-core/musl/musl-utils.bb
> new file mode 100644
> index 0000000000..74b846df59
> --- /dev/null
> +++ b/meta/recipes-core/musl/musl-utils.bb
> @@ -0,0 +1,25 @@
> +# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION = "getconf, getent and iconv implementations for musl"
> +HOMEPAGE = "https://git.alpinelinux.org/cgit/aports/tree/main/musl"
> +LICENSE = "BSD-2-Clause & GPL-2.0+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9d08215e611db87b357e8674b4b42564"
> +SECTION = "utils"
> +
> +# Date of the commit in SRCREV
> +PV = "20170421"
> +
> +SRCREV = "fb5630138ccabbbc14a19d372096a04e42573c7d"
> +SRC_URI = "git://github.com/boltlinux/musl-utils"
> +
> +inherit autotools
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGES =+ "${PN}-iconv"
> +
> +FILES_${PN}-iconv = "${bindir}/iconv"
> +
> +COMPATIBLE_HOST = ".*-musl.*"
> +
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

