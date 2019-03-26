Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4907D120
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 18:15:57 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d13so11064198qth.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 11:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AnBL8t7yEGx+MlrVeeYVkHX8zIOqVVpXAbDGgagfoCg=;
	b=cuabgYCrZik5poL2g9SiBo+y86pue6y9Wly/WzyMx+k9DL5TTPWxU/4glPJ1k2Nln9
	nG5hR7PEEP+tV5FLVlqjDBYFGKcpMqUUAIgaLl8bOLRBRtaWPFPR8BML8S38pKrud1VS
	q80ilif37gGuIrYXVy5gRiSe6z3XKa24t0tAKKAJkplPlQFqRKkEvI9ojuVjZmL5txZw
	yAs2N41BHZ3Fd4sHerPNuP+iVGHTGa9FxY5R0E9Wt9U/9ZqdIYG6Y0M8q/iHVQ2lgvX1
	ZEiK8Pkp82S/ya/DjTTM9VKJgzNljZ344EWXtSjhT6fIQzLnztyq2/vAPn74om263vO8
	+U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AnBL8t7yEGx+MlrVeeYVkHX8zIOqVVpXAbDGgagfoCg=;
	b=UKS8AUvmaxfZuqUUFQwu2KT8fqYAuqQRVUt5oh8KEaXHXLY8NlL468M1dxCUY3mbbl
	ZFPDOfCT8gzwYWRrrpiYGbfokECxUO7furN/P6jKguGGQgvOIOgCXbBVsOLJ3PCRDxO8
	xt60p4fT6522opLK7BnUKbbXia6+tveyKhyfQEg+vRfxZWBImFRuBo3dod27bIn7A4R/
	NInLp9Arz+ogvquMlrQeyFwloIk9+VVemxiBvUhPd4BGr6FzB6YlxEl1C2TDxWnnKrN3
	TPdXfByqb7FzwXEQR+lm8N5ZXbVczh+X3oV1vp+SAu67mKR5vwt/kUApQXEtY18pbLSP
	U89A==
X-Gm-Message-State: APjAAAUrAyr/7PLdbJSRsvkVNJ6VPdroaD3WtVYgY35ABQD7ckChqSji
	Dnd4/RsJsxHkipUXmVAXZdy3Gvqz6d/dn3FRS7g=
X-Google-Smtp-Source: APXvYqzkMrS+xBA1GP3TyrECYDW3WnfUtZSdQ+XmpiycNAKCoziATW5QlMNI4q3xeroYxCoG1tsAiRd4JdsNbXyt55s=
X-Received: by 2002:ac8:2f59:: with SMTP id k25mr26322609qta.254.1553624158075;
	Tue, 26 Mar 2019 11:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190326180735.26818-1-ricardo@foundries.io>
In-Reply-To: <20190326180735.26818-1-ricardo@foundries.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Mar 2019 11:15:31 -0700
Message-ID: <CAMKF1srhLjy9OTWwUtL6Df0Zo68Kq_Dd3wfAB2PDL1o8i0-H6A@mail.gmail.com>
To: Ricardo Salveti <ricardo@foundries.io>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-8.3: add back GLIBC_DYNAMIC_LINKER riscv changes
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
X-List-Received-Date: Tue, 26 Mar 2019 18:15:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 26, 2019 at 11:07 AM Ricardo Salveti <ricardo@foundries.io> wrote:
>
> The riscv GLIBC_DYNAMIC_LINKER changes were dropped during the gcc 8.3
> update, breaking usrmerge support.
>

ah thanks for noticing that, this should be fine to apply

> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> ---
>  ...NAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-8.3/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-8.3/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> index 91a55c556f..d3be10f207 100644
> --- a/meta/recipes-devtools/gcc/gcc-8.3/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> +++ b/meta/recipes-devtools/gcc/gcc-8.3/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> @@ -1,4 +1,4 @@
> -From 4a697387eeab14ece2796c01382cca30e8467ffa Mon Sep 17 00:00:00 2001
> +From 6f8649936df3677109b8396f563c716ae8b237fe Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 09:24:50 +0400
>  Subject: [PATCH 12/40] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> @@ -23,11 +23,12 @@ Upstream-Status: Inappropriate [OE configuration]
>   gcc/config/i386/linux64.h    |  6 +++---
>   gcc/config/linux.h           |  8 ++++----
>   gcc/config/mips/linux.h      | 12 ++++++------
> + gcc/config/riscv/linux.h     |  2 +-
>   gcc/config/rs6000/linux64.h  | 16 ++++++----------
>   gcc/config/sh/linux.h        |  2 +-
>   gcc/config/sparc/linux.h     |  2 +-
>   gcc/config/sparc/linux64.h   |  4 ++--
> - 11 files changed, 29 insertions(+), 33 deletions(-)
> + 12 files changed, 30 insertions(+), 34 deletions(-)
>
>  diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
>  index 36b74dc1993..02373578af8 100644
> @@ -152,6 +153,19 @@ index 2dfd0c18b90..12057c51b5e 100644
>
>   #undef MUSL_DYNAMIC_LINKER32
>   #define MUSL_DYNAMIC_LINKER32 \
> +diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
> +index aa8a28d5d31..ebf9551c955 100644
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
>  index 44eab40a234..54aa8d957e7 100644
>  --- a/gcc/config/rs6000/linux64.h
> --
> 2.17.1
>

