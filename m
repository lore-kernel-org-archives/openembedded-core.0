Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id CDA576011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 17:59:47 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id b35so6854892uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 09:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fdm1wkwDM4db5ofJ28cSekLWV1PaUSpxQ93K+f6RLxI=;
	b=eDdt/qwRIGGr+FYvFMRzye09YnCpdiP5Z2oLSKgYJPbv6xyDiVdcxuRt/rTbUlv1Iy
	zSEmjQWwEpGQM5wr51R4cIojicmiHU9GqUGBo+V12RpsU0dOCTtzJSiIT9omT9WWSLff
	6X6kZU6PdEDfIwik60AkcFdbKLM9zw2N+vkPPQKu6wSzEQB99ElaLhxWoleP5YxbQ314
	2pDKw91S0FQiVp5vjnAKYXpOOf5sS0BhD9p0ToyxRTu2Ajp2Ka54kAVRKams5vUphU0D
	ekcVAOJq7/kg4PmXVPT4vaoONTAP+QUw0ss3fREvYVaR1SKcwFjtOZtKD/ngWkkbBfxF
	wVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fdm1wkwDM4db5ofJ28cSekLWV1PaUSpxQ93K+f6RLxI=;
	b=T5mO4I2SwS9EmYWEaCEbCjVPA97T5+3b8PHeXaQAyncp8ENWreXvQSx1Unnc0VTgcd
	hHYFMDdo6IH4WLgYNRitCW4WAuoKG3A5L4KjE/Q8e9IT0/Z9IriZof9C3n94lzmOwcX/
	4m/KgNJRFOCFq+jqb2yTzhNtp8qFheI/TKDR+OCb0FWzC6Or+9XPCd9XYnhUYnLqVYJE
	sVA8AmCr9KsYz/3d2FYG52L8DAeWgkCmm2WQamX6vP2t1vAKTTy2jS4FWl7fPrmDDcg7
	PTzwOjsAGnxWiy3TMJ9iqauV4gnYTyeiB7CVMgUh3e+4zWnzTo0akxGRdh8CHoMt/PY8
	NUFw==
X-Gm-Message-State: ABUngvesx83nTS/6kc60fN+Hdgt6kz2gqeBtLRFG6feINE8R0Cl75SiZxlu/T56hdbTiRqgul4Vb/q+5692E1Q==
X-Received: by 10.159.48.146 with SMTP id j18mr10186266uab.6.1479146388712;
	Mon, 14 Nov 2016 09:59:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Mon, 14 Nov 2016 09:59:18 -0800 (PST)
In-Reply-To: <1479126495-14047-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1479126495-14047-1-git-send-email-fabio.berton@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Nov 2016 09:59:18 -0800
Message-ID: <CAMKF1srpVQbKG75NsWctbyWjWP1c_xpP7QWip11W8XAHMAZiBQ@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Fix build for c293pcie PPC machine
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
X-List-Received-Date: Mon, 14 Nov 2016 17:59:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 14, 2016 at 4:28 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> The following patch fix build for c293pcie PPC machine :
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=8941017b
>
> This patch is a backport from master branch.
>
> Fix error:
> /
> |ERROR: binutils-2.27-r0 do_package: runstrip: ''powerpc-fslc-linux-gnuspe-strip'
> |--remove-section=.comment --remove-section=.note --strip-unneeded
> |'../tmp/work/ppce500v2-fslc-linux-gnuspe/binutils/2.27-r0/package/usr/lib/
> |libbfd-2.27.0.20160806.so'' strip command failed with 1
> |(b'powerpc-fslc-linux-gnuspe-strip: ../tmp/work/ppce500v2-fslc-linux-gnuspe/
> |binutils/2.27-r0/package/usr/lib/stJMAEnm: Not enough room for program headers,
> |try linking with -N\npowerpc-fslc-linux-gnuspe-strip:../tmp/work/
> |ppce500v2-fslc-linux-gnuspe/binutils/2.27-r0/package/usr/lib/stJMAEnm
> |[.note.gnu.build-id]: Bad value\n')
> \

This is ok.

>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  meta/recipes-devtools/binutils/binutils-2.27.inc   |  1 +
>  ...01-ppc-apuinfo-for-spe-parsed-incorrectly.patch | 37 ++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
> index fc81721..75180ea 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.27.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
> @@ -37,6 +37,7 @@ SRC_URI = "\
>       file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
>       file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch \
>       file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch \
> +     file://0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch \
>  "
>  S  = "${WORKDIR}/git"
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch b/meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch
> new file mode 100644
> index 0000000..d82a0b6
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch
> @@ -0,0 +1,37 @@
> +From 8941017bc0226b60ce306d5271df15820ce66a53 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Tue, 30 Aug 2016 20:57:32 +0930
> +Subject: [PATCH] ppc apuinfo for spe parsed incorrectly
> +Organization: O.S. Systems Software LTDA.
> +
> +apuinfo saying SPE resulted in mach = bfd_mach_ppc_vle due to a
> +missing break.
> +
> +       PR 20531
> +       * elf32-ppc.c (_bfd_elf_ppc_set_arch): Add missing "break".
> +
> +
> +Backport from :
> +https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=8941017b
> +
> +Upstream-Status: Backport
> +Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> +---
> + bfd/elf32-ppc.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/bfd/elf32-ppc.c b/bfd/elf32-ppc.c
> +index 95ce1dc..e42ef1c 100644
> +--- a/bfd/elf32-ppc.c
> ++++ b/bfd/elf32-ppc.c
> +@@ -2246,6 +2246,7 @@ _bfd_elf_ppc_set_arch (bfd *abfd)
> +               case PPC_APUINFO_BRLOCK:
> +                 if (mach != bfd_mach_ppc_vle)
> +                   mach = bfd_mach_ppc_e500;
> ++                break;
> +
> +               case PPC_APUINFO_VLE:
> +                 mach = bfd_mach_ppc_vle;
> +--
> +2.1.4
> +
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

