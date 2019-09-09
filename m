Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 071A17F362
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 21:16:14 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id u17so8552364pgi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 14:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=y/hZrQdQZa38pLHINTz2/ff7oyYmsVV+mAytgF+lIyI=;
	b=DgJ8pwR8mXBDCMhfuKux64O/+esXJGz69ETD4OdjUZZ7+603qXl2OoG2rQBItQhy6O
	l4Pubr9MznSCCSgDIoms3qssyAIVI6uF7j4cC5eDOga3K5FXOklwrahyDoYQwYa8g2qx
	js9GN05tXnBis5gEmEm8R9UTbaJYrdAdgmyVv5zvFPhPJwy1GyTfJ5jEnVmd3/7EmdQ5
	AwFvV6mRNa0eUrf5EKQzGBUIFEASw4d6iWsUAogKqi68UmtaEQ6OqVThohSk12BxcSB4
	av86T9Xlln8ftvzU2P7//pdSzS9QmXcMTqWBG4Sohf51S4YxKBuHr50nPeg7IdiAua+v
	i3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=y/hZrQdQZa38pLHINTz2/ff7oyYmsVV+mAytgF+lIyI=;
	b=gpOBJjleH2iY8xhobOq5Eew7rE7rv0iRs1TcIAm8hkiCYEmJWyyM34BVNkR2q8hmBj
	/ZeBj98oztyBGAIz6Rx/Tt8igkS/RGAj20rvlixe6nIpFvaxnQs56x1lpNnBt1dFt8Od
	yrebk9+eu/5pFY6j5Zu0m26380rHsK03N+Vo361YOCgYSKvlnMIOWykeoslcy2T+31Qk
	Rn9n89HxXEU5IjBQMtz2UIuA9BpD05Vw4PJ0oRM7N2U85gy2gFi+7sYlFxFKxPVxkCrA
	bJ+c4e8i+i4mEHk0ga8ecWXsiEs+mX0H1EfKdl4NVLmx9tnUu5EyRTCH4Rm+wbJh8+0A
	Bn8A==
X-Gm-Message-State: APjAAAWUU+WV1YGguPUJWU2hP8CbfcxOj1C97Z+bJRMQyoVGCUlXi6Br
	adUh05nLkmF/NF7T/I5wSAVm4PrE
X-Google-Smtp-Source: APXvYqwBsruqp5wEV2OvXHJBuDs4pCyhopoVewRnxm9kgE0ukO2tjaD7X6qJ9dNhx/L30npOK4E3lA==
X-Received: by 2002:a65:6081:: with SMTP id t1mr24150792pgu.9.1568063774943;
	Mon, 09 Sep 2019 14:16:14 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:40d0:e8db:d820:c793?
	([2601:202:4180:c33:40d0:e8db:d820:c793])
	by smtp.gmail.com with ESMTPSA id
	z4sm15360398pfg.166.2019.09.09.14.16.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Sep 2019 14:16:14 -0700 (PDT)
To: msft.dantran@gmail.com, openembedded-core@lists.openembedded.org
References: <1568050285-7932-1-git-send-email-dantran@microsoft.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	mQINBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABtCFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT6JAj0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxC5Ag0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAGJAiUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <5e614257-5902-930b-dd16-3216143dedeb@gmail.com>
Date: Mon, 9 Sep 2019 14:16:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568050285-7932-1-git-send-email-dantran@microsoft.com>
Subject: Re: [thud] binutils: Fix 4 CVEs
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
X-List-Received-Date: Mon, 09 Sep 2019 21:16:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/9/19 10:31 AM, msft.dantran@gmail.com wrote:
> From: Dan Tran <dantran@microsoft.com>
>
> Fixes CVE-2018-20623, CVE-2018-20651, CVE-2018-20-671, and
> CVE-2018-1000876 for binutils 2.31.1.

thanks. in thud test stagging.( contrib: stable/thud-nmut )

- armin
>
> Signed-off-by: Dan Tran <dantran@microsoft.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.31.inc   |   4 +
>  .../binutils/binutils/CVE-2018-1000876.patch       | 180 +++++++++++++++++++++
>  .../binutils/binutils/CVE-2018-20623.patch         |  74 +++++++++
>  .../binutils/binutils/CVE-2018-20651.patch         |  35 ++++
>  .../binutils/binutils/CVE-2018-20671.patch         |  49 ++++++
>  5 files changed, 342 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-1000876.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-20623.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-20651.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-20671.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
> index 62acec5..ba9272a 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.31.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
> @@ -46,6 +46,10 @@ SRC_URI = "\
>       file://CVE-2018-18605.patch \
>       file://CVE-2018-18606.patch \
>       file://CVE-2018-18607.patch \
> +     file://CVE-2018-20623.patch \
> +     file://CVE-2018-20651.patch \
> +     file://CVE-2018-20671.patch \
> +     file://CVE-2018-1000876.patch \
>  "
>  S  = "${WORKDIR}/git"
>  
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-1000876.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-1000876.patch
> new file mode 100644
> index 0000000..ff85351
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-1000876.patch
> @@ -0,0 +1,180 @@
> +From efec0844fcfb5692f5a78f4082994d63e420ecd9 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Sun, 16 Dec 2018 23:02:50 +1030
> +Subject: [PATCH] PR23994, libbfd integer overflow
> +
> +	PR 23994
> +	* aoutx.h: Include limits.h.
> +	(get_reloc_upper_bound): Detect long overflow and return a file
> +	too big error if it occurs.
> +	* elf.c: Include limits.h.
> +	(_bfd_elf_get_symtab_upper_bound): Detect long overflow and return
> +	a file too big error if it occurs.
> +	(_bfd_elf_get_dynamic_symtab_upper_bound): Likewise.
> +	(_bfd_elf_get_dynamic_reloc_upper_bound): Likewise.
> +
> +CVE: CVE-2018-1000876
> +Upstream-Status: Backport
> +[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=3a551c7a1b80fca579461774860574eabfd7f18f]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + bfd/aoutx.h | 40 +++++++++++++++++++++-------------------
> + bfd/elf.c   | 32 ++++++++++++++++++++++++--------
> + 2 files changed, 45 insertions(+), 27 deletions(-)
> +
> +diff --git a/bfd/aoutx.h b/bfd/aoutx.h
> +index 023843b0be..78eaa9c503 100644
> +--- a/bfd/aoutx.h
> ++++ b/bfd/aoutx.h
> +@@ -117,6 +117,7 @@ DESCRIPTION
> + #define KEEPIT udata.i
> + 
> + #include "sysdep.h"
> ++#include <limits.h>
> + #include "bfd.h"
> + #include "safe-ctype.h"
> + #include "bfdlink.h"
> +@@ -2491,6 +2492,8 @@ NAME (aout, canonicalize_reloc) (bfd *abfd,
> + long
> + NAME (aout, get_reloc_upper_bound) (bfd *abfd, sec_ptr asect)
> + {
> ++  bfd_size_type count;
> ++
> +   if (bfd_get_format (abfd) != bfd_object)
> +     {
> +       bfd_set_error (bfd_error_invalid_operation);
> +@@ -2498,26 +2501,25 @@ NAME (aout, get_reloc_upper_bound) (bfd *abfd, sec_ptr asect)
> +     }
> + 
> +   if (asect->flags & SEC_CONSTRUCTOR)
> +-    return sizeof (arelent *) * (asect->reloc_count + 1);
> +-
> +-  if (asect == obj_datasec (abfd))
> +-    return sizeof (arelent *)
> +-      * ((exec_hdr (abfd)->a_drsize / obj_reloc_entry_size (abfd))
> +-	 + 1);
> +-
> +-  if (asect == obj_textsec (abfd))
> +-    return sizeof (arelent *)
> +-      * ((exec_hdr (abfd)->a_trsize / obj_reloc_entry_size (abfd))
> +-	 + 1);
> +-
> +-  if (asect == obj_bsssec (abfd))
> +-    return sizeof (arelent *);
> +-
> +-  if (asect == obj_bsssec (abfd))
> +-    return 0;
> ++    count = asect->reloc_count;
> ++  else if (asect == obj_datasec (abfd))
> ++    count = exec_hdr (abfd)->a_drsize / obj_reloc_entry_size (abfd);
> ++  else if (asect == obj_textsec (abfd))
> ++    count = exec_hdr (abfd)->a_trsize / obj_reloc_entry_size (abfd);
> ++  else if (asect == obj_bsssec (abfd))
> ++    count = 0;
> ++  else
> ++    {
> ++      bfd_set_error (bfd_error_invalid_operation);
> ++      return -1;
> ++    }
> + 
> +-  bfd_set_error (bfd_error_invalid_operation);
> +-  return -1;
> ++  if (count >= LONG_MAX / sizeof (arelent *))
> ++    {
> ++      bfd_set_error (bfd_error_file_too_big);
> ++      return -1;
> ++    }
> ++  return (count + 1) * sizeof (arelent *);
> + }
> + 
> + long
> +diff --git a/bfd/elf.c b/bfd/elf.c
> +index 828241d48a..10037176a3 100644
> +--- a/bfd/elf.c
> ++++ b/bfd/elf.c
> +@@ -35,6 +35,7 @@ SECTION
> + /* For sparc64-cross-sparc32.  */
> + #define _SYSCALL32
> + #include "sysdep.h"
> ++#include <limits.h>
> + #include "bfd.h"
> + #include "bfdlink.h"
> + #include "libbfd.h"
> +@@ -8114,11 +8115,16 @@ error_return:
> + long
> + _bfd_elf_get_symtab_upper_bound (bfd *abfd)
> + {
> +-  long symcount;
> ++  bfd_size_type symcount;
> +   long symtab_size;
> +   Elf_Internal_Shdr *hdr = &elf_tdata (abfd)->symtab_hdr;
> + 
> +   symcount = hdr->sh_size / get_elf_backend_data (abfd)->s->sizeof_sym;
> ++  if (symcount >= LONG_MAX / sizeof (asymbol *))
> ++    {
> ++      bfd_set_error (bfd_error_file_too_big);
> ++      return -1;
> ++    }
> +   symtab_size = (symcount + 1) * (sizeof (asymbol *));
> +   if (symcount > 0)
> +     symtab_size -= sizeof (asymbol *);
> +@@ -8129,7 +8135,7 @@ _bfd_elf_get_symtab_upper_bound (bfd *abfd)
> + long
> + _bfd_elf_get_dynamic_symtab_upper_bound (bfd *abfd)
> + {
> +-  long symcount;
> ++  bfd_size_type symcount;
> +   long symtab_size;
> +   Elf_Internal_Shdr *hdr = &elf_tdata (abfd)->dynsymtab_hdr;
> + 
> +@@ -8140,6 +8146,11 @@ _bfd_elf_get_dynamic_symtab_upper_bound (bfd *abfd)
> +     }
> + 
> +   symcount = hdr->sh_size / get_elf_backend_data (abfd)->s->sizeof_sym;
> ++  if (symcount >= LONG_MAX / sizeof (asymbol *))
> ++    {
> ++      bfd_set_error (bfd_error_file_too_big);
> ++      return -1;
> ++    }
> +   symtab_size = (symcount + 1) * (sizeof (asymbol *));
> +   if (symcount > 0)
> +     symtab_size -= sizeof (asymbol *);
> +@@ -8209,7 +8220,7 @@ _bfd_elf_canonicalize_dynamic_symtab (bfd *abfd,
> + long
> + _bfd_elf_get_dynamic_reloc_upper_bound (bfd *abfd)
> + {
> +-  long ret;
> ++  bfd_size_type count;
> +   asection *s;
> + 
> +   if (elf_dynsymtab (abfd) == 0)
> +@@ -8218,15 +8229,20 @@ _bfd_elf_get_dynamic_reloc_upper_bound (bfd *abfd)
> +       return -1;
> +     }
> + 
> +-  ret = sizeof (arelent *);
> ++  count = 1;
> +   for (s = abfd->sections; s != NULL; s = s->next)
> +     if (elf_section_data (s)->this_hdr.sh_link == elf_dynsymtab (abfd)
> + 	&& (elf_section_data (s)->this_hdr.sh_type == SHT_REL
> + 	    || elf_section_data (s)->this_hdr.sh_type == SHT_RELA))
> +-      ret += ((s->size / elf_section_data (s)->this_hdr.sh_entsize)
> +-	      * sizeof (arelent *));
> +-
> +-  return ret;
> ++      {
> ++	count += s->size / elf_section_data (s)->this_hdr.sh_entsize;
> ++	if (count > LONG_MAX / sizeof (arelent *))
> ++	  {
> ++	    bfd_set_error (bfd_error_file_too_big);
> ++	    return -1;
> ++	  }
> ++      }
> ++  return count * sizeof (arelent *);
> + }
> + 
> + /* Canonicalize the dynamic relocation entries.  Note that we return the
> +-- 
> +2.22.0.vfs.1.1.57.gbaf16c8
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-20623.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-20623.patch
> new file mode 100644
> index 0000000..b44d448
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-20623.patch
> @@ -0,0 +1,74 @@
> +From 90cce28d4b59f86366d4f562d01a8d439d514234 Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Wed, 9 Jan 2019 12:25:16 +0000
> +Subject: [PATCH] Fix a heap use after free memory access fault when displaying
> + error messages about malformed archives.
> +
> +	PR 14049
> +	* readelf.c (process_archive): Use arch.file_name in error
> +	messages until the qualified name is available.
> +
> +CVE: CVE-2018-20623
> +Upstream-Status: Backport
> +[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=28e817cc440bce73691c03e01860089a0954a837]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + binutils/readelf.c | 13 ++++++++-----
> + 1 file changed, 8 insertions(+), 5 deletions(-)
> +
> +diff --git a/binutils/readelf.c b/binutils/readelf.c
> +index f4df697a7d..280023d8de 100644
> +--- a/binutils/readelf.c
> ++++ b/binutils/readelf.c
> +@@ -19061,7 +19061,7 @@ process_archive (Filedata * filedata, bfd_boolean is_thin_archive)
> +       /* Read the next archive header.  */
> +       if (fseek (filedata->handle, arch.next_arhdr_offset, SEEK_SET) != 0)
> +         {
> +-          error (_("%s: failed to seek to next archive header\n"), filedata->file_name);
> ++          error (_("%s: failed to seek to next archive header\n"), arch.file_name);
> +           return FALSE;
> +         }
> +       got = fread (&arch.arhdr, 1, sizeof arch.arhdr, filedata->handle);
> +@@ -19069,7 +19069,10 @@ process_archive (Filedata * filedata, bfd_boolean is_thin_archive)
> +         {
> +           if (got == 0)
> + 	    break;
> +-          error (_("%s: failed to read archive header\n"), filedata->file_name);
> ++	  /* PR 24049 - we cannot use filedata->file_name as this will
> ++	     have already been freed.  */
> ++	  error (_("%s: failed to read archive header\n"), arch.file_name);
> ++	    
> +           ret = FALSE;
> +           break;
> +         }
> +@@ -19089,7 +19092,7 @@ process_archive (Filedata * filedata, bfd_boolean is_thin_archive)
> +       name = get_archive_member_name (&arch, &nested_arch);
> +       if (name == NULL)
> + 	{
> +-	  error (_("%s: bad archive file name\n"), filedata->file_name);
> ++	  error (_("%s: bad archive file name\n"), arch.file_name);
> + 	  ret = FALSE;
> + 	  break;
> + 	}
> +@@ -19098,7 +19101,7 @@ process_archive (Filedata * filedata, bfd_boolean is_thin_archive)
> +       qualified_name = make_qualified_name (&arch, &nested_arch, name);
> +       if (qualified_name == NULL)
> + 	{
> +-	  error (_("%s: bad archive file name\n"), filedata->file_name);
> ++	  error (_("%s: bad archive file name\n"), arch.file_name);
> + 	  ret = FALSE;
> + 	  break;
> + 	}
> +@@ -19144,7 +19147,7 @@ process_archive (Filedata * filedata, bfd_boolean is_thin_archive)
> + 	  if (nested_arch.file == NULL)
> + 	    {
> + 	      error (_("%s: contains corrupt thin archive: %s\n"),
> +-		     filedata->file_name, name);
> ++		     qualified_name, name);
> + 	      ret = FALSE;
> + 	      break;
> + 	    }
> +-- 
> +2.22.0.vfs.1.1.57.gbaf16c8
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-20651.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-20651.patch
> new file mode 100644
> index 0000000..24fb031
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-20651.patch
> @@ -0,0 +1,35 @@
> +From 6a29d95602b09bb83d2c82b45ed935157fb780aa Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Mon, 31 Dec 2018 15:40:08 +1030
> +Subject: [PATCH] PR24041, Invalid Memory Address Dereference in
> + elf_link_add_object_symbols
> +
> +	PR 24041
> +	* elflink.c (elf_link_add_object_symbols): Don't segfault on
> +	crafted ET_DYN with no program headers.
> +
> +CVE: CVE-2018-20651
> +Upstream-Status: Backport
> +[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=54025d5812ff100f5f0654eb7e1ffd50f2e37f5f]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + bfd/elflink.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/bfd/elflink.c b/bfd/elflink.c
> +index 46091b6341..557c550082 100644
> +--- a/bfd/elflink.c
> ++++ b/bfd/elflink.c
> +@@ -4178,7 +4178,7 @@ error_free_dyn:
> + 	 all sections contained fully therein.  This makes relro
> + 	 shared library sections appear as they will at run-time.  */
> +       phdr = elf_tdata (abfd)->phdr + elf_elfheader (abfd)->e_phnum;
> +-      while (--phdr >= elf_tdata (abfd)->phdr)
> ++      while (phdr-- > elf_tdata (abfd)->phdr)
> + 	if (phdr->p_type == PT_GNU_RELRO)
> + 	  {
> + 	    for (s = abfd->sections; s != NULL; s = s->next)
> +-- 
> +2.22.0.vfs.1.1.57.gbaf16c8
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-20671.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-20671.patch
> new file mode 100644
> index 0000000..9bd9207
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-20671.patch
> @@ -0,0 +1,49 @@
> +From 8a5f4f2ebe7f35ac5646060fa51e3332f6ef388c Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Fri, 4 Jan 2019 13:44:34 +0000
> +Subject: [PATCH] Fix a possible integer overflow problem when examining
> + corrupt binaries using a 32-bit binutil.
> +
> +	PR 24005
> +	* objdump.c (load_specific_debug_section): Check for integer
> +	overflow before attempting to allocate contents.
> +
> +CVE: CVE-2018-20671
> +Upstream-Status: Backport
> +[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=11fa9f134fd658075c6f74499c780df045d9e9ca]
> +
> +Signed-off-by: Dan Tran <dantran@microsoft.com>
> +---
> + binutils/objdump.c | 13 ++++++++++---
> + 1 file changed, 10 insertions(+), 3 deletions(-)
> +
> +diff --git a/binutils/objdump.c b/binutils/objdump.c
> +index f468fcdb59..89ca688938 100644
> +--- a/binutils/objdump.c
> ++++ b/binutils/objdump.c
> +@@ -2503,12 +2503,19 @@ load_specific_debug_section (enum dwarf_section_display_enum debug,
> +   section->reloc_info = NULL;
> +   section->num_relocs = 0;
> +   section->address = bfd_get_section_vma (abfd, sec);
> ++  section->user_data = sec;
> +   section->size = bfd_get_section_size (sec);
> +   amt = section->size + 1;
> ++  if (amt == 0 || amt > bfd_get_file_size (abfd))
> ++    {
> ++      section->start = NULL;
> ++      free_debug_section (debug);
> ++      printf (_("\nSection '%s' has an invalid size: %#llx.\n"),
> ++	      section->name, (unsigned long long) section->size);
> ++      return FALSE;
> ++    }
> +   section->start = contents = malloc (amt);
> +-  section->user_data = sec;
> +-  if (amt == 0
> +-      || section->start == NULL
> ++  if (section->start == NULL
> +       || !bfd_get_full_section_contents (abfd, sec, &contents))
> +     {
> +       free_debug_section (debug);
> +-- 
> +2.22.0.vfs.1.1.57.gbaf16c8
> +


