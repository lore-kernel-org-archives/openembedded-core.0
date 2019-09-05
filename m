Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7331C7E093
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 22:00:20 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id d5so4057452lja.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 15:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qbtXFlyQEQaSRQ1ngf7I3vVnQ4YN4RzkWqsTbxNjuyE=;
	b=OneVs0g+tWQLQ3Q7tWPaqgQ0Fy7WUyP7QSnha1/DhYJBi2c3ELEHMGntTvz5zihkdq
	J4vH4kTf+EoMfHVb+SmLm2VudJnhKsQfWMyA85rUnXZJDsYIY+fDqxUBhK91P8GAED14
	KZ8YE4ceQN4Z9+johGEiSEZMpuVrJOlKf+1Oe9OaPU0g9lzd0P9dRG2Lvx3426LmFdhU
	HGPrcc4imYVAQ8UYF9CLbJ0TlmQ5YGZcZG6EaaRroe0GYPiWlc3l8Wx+r5do1uTTgQ7y
	HXDS1OUvFKgt/ftxLgVv7FmZ+d226wcNta0Kpk0aPuxNhFjSuGDgnORxdKuW9T3DQ4oy
	lWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qbtXFlyQEQaSRQ1ngf7I3vVnQ4YN4RzkWqsTbxNjuyE=;
	b=eem/Cd8gbJZowdXz15qAo1Il2uFWkb3vogN8oFv6twAphR6ip74joUFqW119Rqhno9
	kVmy47wP7JIuTBaoR+P8UnNs1CI75mIZnkQv8KmWrOK2fUyH2/JDHbGr6JoSMxDHQe+e
	a3MNluMDMazLiHcueD1aGPgNYy4j+4d5uoZSMcMABHcyG0iUUchgyzcJa8O3RxZD3zEk
	RGsS56Cn1zwCc14PkMfFu32fNtQ7/ZY3zxusn3MyETLxOdl1mAWYzft0uig1ElQjSc2x
	m7hCSzieIIVgbuxb4JL6QUINFiS4YuSCj2wme+aumCVr9HUnbZpQwbY0wy82hTUZwUkm
	K7Bw==
X-Gm-Message-State: APjAAAUIVEt7LqjqA8B7wZ/lubfUN4W4QMeMaoc63SEfw3Rwfa1JW0EL
	5FMkYWtDjcPjxkdjN49A+71Z6Zxu4ZR9XifQuXE=
X-Google-Smtp-Source: APXvYqwgEsmys/WMSAy8wmsv1CF+ZD5ImU2a6klu2vxa3GYyudCGMlcpRGx7l3yvwTyxxsLFj722Zp6ZvcRc0LlKh/g=
X-Received: by 2002:a05:651c:1023:: with SMTP id
	w3mr3504257ljm.94.1567720820787; 
	Thu, 05 Sep 2019 15:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190905012958.5888-1-raj.khem@gmail.com>
In-Reply-To: <20190905012958.5888-1-raj.khem@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 Sep 2019 14:59:54 -0700
Message-ID: <CAKmqyKMMpO8q+BwieH4+TZ6VefDKyADOzrjCJaDtNRz+xUz+2A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-9.2: Fix risc-v dynamic linker relocation
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
X-List-Received-Date: Thu, 05 Sep 2019 22:00:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 4, 2019 at 6:30 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Accidentally dropped in 9.2 update
>
> Reported-by: Ricardo Salveti <ricardo@foundries.io>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

This fixes the RV64 build for me.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-9.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> index 21908bce9b..66fb24d4cd 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> +++ b/meta/recipes-devtools/gcc/gcc-9.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> @@ -1,7 +1,7 @@
> -From a93743732b2125aebd9a6d65e999d7506b01d6b3 Mon Sep 17 00:00:00 2001
> +From 72fc3975bcd720b2f8040fa87cd23d3db4c5975a Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 09:24:50 +0400
> -Subject: [PATCH 11/36] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> +Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
>   relative to SYSTEMLIBS_DIR
>
>  This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> @@ -23,11 +23,12 @@ Upstream-Status: Inappropriate [OE configuration]
>   gcc/config/i386/linux64.h    |  6 +++---
>   gcc/config/linux.h           |  8 ++++----
>   gcc/config/mips/linux.h      | 12 ++++++------
> + gcc/config/riscv/linux.h     |  2 +-
>   gcc/config/rs6000/linux64.h  | 15 +++++----------
>   gcc/config/sh/linux.h        |  2 +-
>   gcc/config/sparc/linux.h     |  2 +-
>   gcc/config/sparc/linux64.h   |  4 ++--
> - 11 files changed, 28 insertions(+), 33 deletions(-)
> + 12 files changed, 29 insertions(+), 34 deletions(-)
>
>  diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
>  index 824861befec..6afacce3292 100644
> @@ -152,6 +153,19 @@ index 6f79ac9c01a..25de96f9561 100644
>
>   #undef MUSL_DYNAMIC_LINKER32
>   #define MUSL_DYNAMIC_LINKER32 \
> +diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
> +index 58dd18b89f3..112ba9cd764 100644
> +--- a/gcc/config/riscv/linux.h
> ++++ b/gcc/config/riscv/linux.h
> +@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
> +     GNU_USER_TARGET_OS_CPP_BUILTINS();                                \
> +   } while (0)
> +
> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
> +
> + #define MUSL_ABI_SUFFIX \
> +   "%{mabi=ilp32:-sf}" \
>  diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
>  index 9946d3fed94..45a9a7cae59 100644
>  --- a/gcc/config/rs6000/linux64.h
> @@ -227,6 +241,3 @@ index 789d1df4bd5..b920c680fb1 100644
>
>   #ifdef SPARC_BI_ARCH
>
> ---
> -2.22.1
> -
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

