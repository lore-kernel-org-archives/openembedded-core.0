Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 436596D230
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 18:06:06 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id i21so3458895ljj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 11:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jlxYZAwuuszSFrKPuNZ2ZAvkHQ5b6al9egooH4Hqn34=;
	b=JIpIbCYTXNh+2SXmwWRUh0gDTNxsZJrPX2zhT9sRIBEEMOSX8XIICd0PE5XJAa9b6m
	DJG1eJm33gaDDcSWTsP40mox9zW69UvYFlgk2zLb5iUpoXXIAfcWWf2PDPXyuBW0UPKl
	zSNjgEGwdjWhrbTTjun/KnL7q6HqogJevBzd3yM40WpAvi4B+G6WXANuztvIVB2txZWI
	N46lWQafEDt5xhOahMcdiUYG2zBVQagZMFVS2d/QzAiKwKhicMYPDDZNCv8aqIzHmwQY
	zPMF7JxFBxhPjkdNnDY7hpZ+Vx46mqLQgbFJayJroz4f4hpzd9B4zuW0kLVvaD5TZm03
	n6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jlxYZAwuuszSFrKPuNZ2ZAvkHQ5b6al9egooH4Hqn34=;
	b=MyPjtyk7727vr1Ch0tda/B7VS+J86cgIxujiiTozpX99UWWSxaUO6N3RYvaage/PgQ
	YkRauHQek8o+qK9+4CMtfxLqlUVb5KBHIQRZfUWKPsQ9YxyX/lUoGvbEKsWMZ835WBeb
	utHy8N44nTlqrlVw4s3/BXOQfaLqTK42rcfJ4cIgWsIvYRrBtxhwFugS4avXKW77eKdR
	W98CFHMKQE0A0IpIRDGOuhYg4KlhwwnxSGVqK8SAWbfTSGEcYYBCnymZ9E8ObA4iNOIj
	uPFSXaqAelnuQ7XOmj4yQ0O6O2bVwIro/nZhKAXqiJkJknXAWqVNB2MS/xAEWlhpwScm
	qRXg==
X-Gm-Message-State: APjAAAVlVJcK4L6E8MwrKsFQd7x+mfYBP1YFQScg+y0cERBGVT6CJbMd
	szJ/YxfxUuuhv+rfAR5OvaWS8ewfXNm8ox6k0YN+xtVa
X-Google-Smtp-Source: APXvYqwPkEy+iCv90qe/XDJWR4ltomIz64zVVwkmSA0FgU68cYAW8ZS+2c95PGPQo8pPVsHYFcsfKq7juaRTacfR+Cw=
X-Received: by 2002:a2e:9188:: with SMTP id f8mr16629819ljg.33.1562177166813; 
	Wed, 03 Jul 2019 11:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190703160441.19644-1-ricardo@foundries.io>
In-Reply-To: <20190703160441.19644-1-ricardo@foundries.io>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Jul 2019 11:03:02 -0700
Message-ID: <CAKmqyKPnATUYzb90uRz9xtpxqVnzceUFJDkBTYSVST0qec4vbg@mail.gmail.com>
To: Ricardo Salveti <ricardo@foundries.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-9.1: add back GLIBC_DYNAMIC_LINKER riscv changes
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
X-List-Received-Date: Wed, 03 Jul 2019 18:06:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 3, 2019 at 9:05 AM Ricardo Salveti <ricardo@foundries.io> wrote:
>
> The riscv GLIBC_DYNAMIC_LINKER changes were dropped during the gcc 9.1
> update, breaking usrmerge support.
>
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 28 ++++++++++++++-----
>  1 file changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-9.1/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> index f23a314c13..1ff85c8073 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.1/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> +++ b/meta/recipes-devtools/gcc/gcc-9.1/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> @@ -1,4 +1,4 @@
> -From 492f008dce784749e39e1c396aeea6fa1d977374 Mon Sep 17 00:00:00 2001
> +From 0e13b09ae400d8c8755e2869c72a158ed0dbc0b6 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 09:24:50 +0400
>  Subject: [PATCH 12/37] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
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
> @@ -152,11 +153,24 @@ index 6f79ac9c01a..25de96f9561 100644
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
> -index bcc540b5ff2..982ca274621 100644
> +index 5380f6a6a6f..c0f2dc1f43e 100644
>  --- a/gcc/config/rs6000/linux64.h
>  +++ b/gcc/config/rs6000/linux64.h
> -@@ -428,24 +428,19 @@ extern int dot_symbols;
> +@@ -435,24 +435,19 @@ extern int dot_symbols;
>   #undef        LINK_OS_DEFAULT_SPEC
>   #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
>
> @@ -200,10 +214,10 @@ index c9897b7aca5..82f275319cc 100644
>   #undef SUBTARGET_LINK_EMUL_SUFFIX
>   #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
>  diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> -index 2db9ea2172e..1979cfff5d3 100644
> +index 08476f1d94d..80440e712ad 100644
>  --- a/gcc/config/sparc/linux.h
>  +++ b/gcc/config/sparc/linux.h
> -@@ -83,7 +83,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
> +@@ -84,7 +84,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
>      When the -shared link option is used a final link is not being
>      done.  */
>
> @@ -213,7 +227,7 @@ index 2db9ea2172e..1979cfff5d3 100644
>   #undef  LINK_SPEC
>   #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
>  diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> -index 21e13001951..d39c38a531f 100644
> +index 789d1df4bd5..b920c680fb1 100644
>  --- a/gcc/config/sparc/linux64.h
>  +++ b/gcc/config/sparc/linux64.h
>  @@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
> --
> 2.22.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

