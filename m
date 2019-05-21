Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id EFC9B7E25A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 12:29:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x64so2792547wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 05:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=r8L3uS6STN9OWIbBsc5WN5M1hYurkdKJYkfVN/pmkDc=;
	b=NzQDDblsd+GzPq+kCmVfZWPug5BpT3PPBEnH/HQh236vhwiIKNMfqPF8JwTPZXJ0H0
	vjVTMYCl/Di1OQ5OfsV8A1mJQhT8qVlEEy1HH8KF4cwAYdtqfGwgCpmXAwgLC0qwMqSo
	DTDCT9XKmwBzkGNC4VrzlPcAsEssJBXVKjqFva/HZMZ9b5nv9o5qV4riCbtEYpzhzxgH
	5KIRch9LtTZbmhcV/spb/q0Lyuhh3eFiR1lLH2s3xYgZAcw78FUdw6kVR+EOumhz5G4r
	jDfS8DGNv6A7A7rqseGpob3nrZirE6iwUn017A+Kt87YTJ2QFK1t38Am8Eq6lr0Iu4Zm
	E7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=r8L3uS6STN9OWIbBsc5WN5M1hYurkdKJYkfVN/pmkDc=;
	b=SN5pHy08+l/laBzR7+FKlaIowB7n8+TiczK/jAIZKAUkRRuF4P8WPKCyMo6Qw3uYX8
	UgYM0niSkX6R98lK8VasUtS/5pB7/MTa1CDSzNbPzNgcUCisVxyfRmbyzTqV3J43p1me
	eK5gTqkLPMgMC9bBciczaVYskylYbstYkWeGH4XQzYx5tMFnxSqN952WJiAuIFfDHNzj
	ClywIDuykC2qsxkfxf06D5QTOrkiRc1dOIzp4EkgsMLEERR2D4BVv6MZX5n9L/B4ldL9
	0iImLs1v0DiykIoR4g2uH/AshQNKsmAOPnIrbq5Nzz6rP86Ow02zRVLPTJIKvQUlqnXT
	XvQQ==
X-Gm-Message-State: APjAAAXmpJad5udPflNbvWaTURwJ/eButRR1BFRAzzaSyutdwB4AwOJl
	xzZwYPoiuLRPZHlv8Lqszq8BRp3i
X-Google-Smtp-Source: APXvYqy7Hwd9NtpDPXBVKgpK07SyPvbUQYvSWqRUQuj4WJbI3+AGq46myixfC1GG77gFvAk54zkuIQ==
X-Received: by 2002:a1c:2dcd:: with SMTP id t196mr3256256wmt.141.1558441778239;
	Tue, 21 May 2019 05:29:38 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id n1sm2477741wmc.19.2019.05.21.05.29.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 05:29:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 21 May 2019 14:29:46 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20190521122946.GC23597@jama>
References: <20190511161656.2005-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190511161656.2005-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [PATCH] kexec-tools: refresh patches with devtool
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
X-List-Received-Date: Tue, 21 May 2019 12:29:38 -0000
X-Groupsio-MsgNum: 124788
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline

--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 11, 2019 at 04:16:56PM +0000, Martin Jansa wrote:
> * to make it easier to rebase

ping?

I know this change alone doesn't look very useful (but it was useful
for me when rebasing other patches in other layers).


> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...owerpc-change-the-memory-size-limit.patch} | 12 ++---
>  ...purgatory-Pass-r-directly-to-linker.patch} | 13 ++---
>  ...ix-add_buffer_phys_virt-align-issue.patch} |  7 +--
>  ...t-to-build-kexec-tools-with-x32-ABI.patch} | 47 ++++++++++---------
>  ...tch =3D> 0005-Disable-PIE-during-link.patch} |  7 +--
>  .../kexec/kexec-tools_2.0.19.bb               | 18 +++----
>  6 files changed, 50 insertions(+), 54 deletions(-)
>  rename meta/recipes-kernel/kexec/kexec-tools/{0002-powerpc-change-the-me=
mory-size-limit.patch =3D> 0001-powerpc-change-the-memory-size-limit.patch}=
 (75%)
>  rename meta/recipes-kernel/kexec/kexec-tools/{0001-purgatory-Pass-r-dire=
ctly-to-linker.patch =3D> 0002-purgatory-Pass-r-directly-to-linker.patch} (=
83%)
>  rename meta/recipes-kernel/kexec/kexec-tools/{0010-kexec-ARM-Fix-add_buf=
fer_phys_virt-align-issue.patch =3D> 0003-kexec-ARM-Fix-add_buffer_phys_vir=
t-align-issue.patch} (94%)
>  rename meta/recipes-kernel/kexec/kexec-tools/{kexec-x32.patch =3D> 0004-=
x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch} (59%)
>  rename meta/recipes-kernel/kexec/kexec-tools/{0001-Disable-PIE-during-li=
nk.patch =3D> 0005-Disable-PIE-during-link.patch} (88%)
>=20
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-th=
e-memory-size-limit.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-powe=
rpc-change-the-memory-size-limit.patch
> similarity index 75%
> rename from meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-the=
-memory-size-limit.patch
> rename to meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-m=
emory-size-limit.patch
> index dc97d930e9..029650f35c 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-the-memor=
y-size-limit.patch
> +++ b/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memor=
y-size-limit.patch
> @@ -1,4 +1,4 @@
> -From b19b68eab567aa534cf8dec79fe18e3dc0e14043 Mon Sep 17 00:00:00 2001
> +From 211cae4b6a02a4d9d37bfcd76f3702696e095fc3 Mon Sep 17 00:00:00 2001
>  From: Quanyang Wang <quanyang.wang@windriver.com>
>  Date: Tue, 16 Jun 2015 12:59:57 +0800
>  Subject: [PATCH] powerpc: change the memory size limit
> @@ -20,11 +20,11 @@ Signed-off-by: Quanyang Wang <quanyang.wang@windriver=
=2Ecom>
>   kexec/arch/ppc/kexec-ppc.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
> -Index: kexec-tools-2.0.10/kexec/arch/ppc/kexec-ppc.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- kexec-tools-2.0.10.orig/kexec/arch/ppc/kexec-ppc.h
> -+++ kexec-tools-2.0.10/kexec/arch/ppc/kexec-ppc.h
> -@@ -42,7 +42,7 @@ void dol_ppc_usage(void);
> +diff --git a/kexec/arch/ppc/kexec-ppc.h b/kexec/arch/ppc/kexec-ppc.h
> +index 04e728e..6bae9ec 100644
> +--- a/kexec/arch/ppc/kexec-ppc.h
> ++++ b/kexec/arch/ppc/kexec-ppc.h
> +@@ -44,7 +44,7 @@ void dol_ppc_usage(void);
>    * During inital setup the kernel does not map the whole memory but a p=
art of
>    * it. On Book-E that is 64MiB, 601 24MiB or 256MiB (if possible).
>    */
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Pass-r-=
directly-to-linker.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-purga=
tory-Pass-r-directly-to-linker.patch
> similarity index 83%
> rename from meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Pass-r-d=
irectly-to-linker.patch
> rename to meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-dir=
ectly-to-linker.patch
> index bfd077daf0..363d5da4ae 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Pass-r-directl=
y-to-linker.patch
> +++ b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directl=
y-to-linker.patch
> @@ -1,4 +1,4 @@
> -From a1135b3170963ba956f2364c1283864c35541295 Mon Sep 17 00:00:00 2001
> +From a04bcf8f683c1a5a7d015920124457ad56fb7cf0 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 7 Sep 2015 07:59:45 +0000
>  Subject: [PATCH] purgatory: Pass -r directly to linker
> @@ -8,17 +8,17 @@ where as gcc knows how to deal with it and passes it do=
wn to linker
>  unfiltered
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> =20
> +Upstream-Status: Pending
> +---
>   purgatory/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/purgatory/Makefile b/purgatory/Makefile
> -index 2b5c061..b251353 100644
> +index 2dd6c47..416e6b9 100644
>  --- a/purgatory/Makefile
>  +++ b/purgatory/Makefile
> -@@ -61,7 +61,7 @@ $(PURGATORY): CPPFLAGS=3D$($(ARCH)_PURGATORY_EXTRA_CFL=
AGS) \
> +@@ -60,7 +60,7 @@ $(PURGATORY): CPPFLAGS=3D$($(ARCH)_PURGATORY_EXTRA_CFL=
AGS) \
>   			-I$(shell $(CC) -print-file-name=3Dinclude)
>   $(PURGATORY): LDFLAGS=3D$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
>   			-Wl,--no-undefined -nostartfiles -nostdlib \
> @@ -27,6 +27,3 @@ index 2b5c061..b251353 100644
>   			-Wl,-Map=3D$(PURGATORY_MAP)
>  =20
>   $(PURGATORY): $(PURGATORY_OBJS)
> ---=20
> -2.5.1
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0010-kexec-ARM-Fix-add=
_buffer_phys_virt-align-issue.patch b/meta/recipes-kernel/kexec/kexec-tools=
/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
> similarity index 94%
> rename from meta/recipes-kernel/kexec/kexec-tools/0010-kexec-ARM-Fix-add_=
buffer_phys_virt-align-issue.patch
> rename to meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_bu=
ffer_phys_virt-align-issue.patch
> index 6c6c66d885..832fe67716 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools/0010-kexec-ARM-Fix-add_buffer=
_phys_virt-align-issue.patch
> +++ b/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer=
_phys_virt-align-issue.patch
> @@ -1,4 +1,4 @@
> -From 78e497fb69950665e639cfab8f4fb50cc404a1eb Mon Sep 17 00:00:00 2001
> +From 55e583d20651e829afbbc8dba0f8ec3017cda2d5 Mon Sep 17 00:00:00 2001
>  From: Haiqing Bai <Haiqing.Bai@windriver.com>
>  Date: Mon, 9 Jan 2017 15:26:29 +0800
>  Subject: [PATCH] kexec: ARM: Fix add_buffer_phys_virt() align issue
> @@ -17,7 +17,7 @@ Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
>   1 file changed, 4 insertions(+), 1 deletion(-)
> =20
>  diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-a=
rm.c
> -index 245c21a..12139c3 100644
> +index daa4788..3f72b38 100644
>  --- a/kexec/arch/arm/crashdump-arm.c
>  +++ b/kexec/arch/arm/crashdump-arm.c
>  @@ -240,6 +240,7 @@ int load_crashdump_segments(struct kexec_info *info,=
 char *mod_cmdline)
> @@ -47,6 +47,3 @@ index 245c21a..12139c3 100644
>   					  crash_kernel_mem.start,
>   					  crash_kernel_mem.end, -1, 0);
>  =20
> ---=20
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch b/meta=
/recipes-kernel/kexec/kexec-tools/0004-x86_64-Add-support-to-build-kexec-to=
ols-with-x32-ABI.patch
> similarity index 59%
> rename from meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
> rename to meta/recipes-kernel/kexec/kexec-tools/0004-x86_64-Add-support-t=
o-build-kexec-tools-with-x32-ABI.patch
> index 26d18eb6fe..a809d5ba8e 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
> +++ b/meta/recipes-kernel/kexec/kexec-tools/0004-x86_64-Add-support-to-bu=
ild-kexec-tools-with-x32-ABI.patch
> @@ -1,4 +1,10 @@
> -x86_64: Add support to build kexec-tools with x32 ABI
> +From 8c9a5076543eb3d497e016b3d7707e93d6311883 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?An=3DC3=3DADbal=3D20Lim=3DC3=3DB3n?=3D <anibal.limon@l=
inux.intel.com>
> +Date: Mon, 15 Jul 2013 23:32:36 -0700
> +Subject: [PATCH] x86_64: Add support to build kexec-tools with x32 ABI
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> =20
>  Summary of changes,
> =20
> @@ -13,7 +19,6 @@ Upstream-Status: Submitted
> =20
>  Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
>  Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> -
>  ---
>   configure.ac                             | 9 +++++++++
>   kexec/arch/x86_64/kexec-elf-rel-x86_64.c | 4 ++++
> @@ -21,11 +26,11 @@ Signed-off-by: Mariano Lopez <mariano.lopez@linux.int=
el.com>
>   purgatory/arch/x86_64/Makefile           | 4 +++-
>   4 files changed, 20 insertions(+), 1 deletion(-)
> =20
> -Index: kexec-tools-2.0.10/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- kexec-tools-2.0.10.orig/configure.ac
> -+++ kexec-tools-2.0.10/configure.ac
> -@@ -56,6 +56,15 @@ case $target_cpu in
> +diff --git a/configure.ac b/configure.ac
> +index c2b0c68..60882b8 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -54,6 +54,15 @@ case $target_cpu in
>   		;;
>   	ia64|x86_64|alpha|m68k )
>   		ARCH=3D"$target_cpu"
> @@ -41,11 +46,11 @@ Index: kexec-tools-2.0.10/configure.ac
>   		;;
>   	* )
>   		AC_MSG_ERROR([unsupported architecture $target_cpu])
> -Index: kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- kexec-tools-2.0.10.orig/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
> -+++ kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
> -@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_eh
> +diff --git a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c b/kexec/arch/x86_6=
4/kexec-elf-rel-x86_64.c
> +index db85b44..0ce1172 100644
> +--- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
> ++++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
> +@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_ehdr *ehdr)
>   	if (ehdr->ei_data !=3D ELFDATA2LSB) {
>   		return 0;
>   	}
> @@ -57,10 +62,10 @@ Index: kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf=
-rel-x86_64.c
>   		return 0;
>   	}
>   	if (ehdr->e_machine !=3D EM_X86_64) {
> -Index: kexec-tools-2.0.10/kexec/kexec-syscall.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- kexec-tools-2.0.10.orig/kexec/kexec-syscall.h
> -+++ kexec-tools-2.0.10/kexec/kexec-syscall.h
> +diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
> +index dac1c1f..e9479b7 100644
> +--- a/kexec/kexec-syscall.h
> ++++ b/kexec/kexec-syscall.h
>  @@ -31,8 +31,12 @@
>   #define __NR_kexec_load		268
>   #endif
> @@ -74,11 +79,11 @@ Index: kexec-tools-2.0.10/kexec/kexec-syscall.h
>   #ifdef __s390x__
>   #define __NR_kexec_load		277
>   #endif
> -Index: kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- kexec-tools-2.0.10.orig/purgatory/arch/x86_64/Makefile
> -+++ kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
> -@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS +=3D purgatory/arch/
> +diff --git a/purgatory/arch/x86_64/Makefile b/purgatory/arch/x86_64/Make=
file
> +index 7300937..4af11e4 100644
> +--- a/purgatory/arch/x86_64/Makefile
> ++++ b/purgatory/arch/x86_64/Makefile
> +@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS +=3D purgatory/arch/i386/console=
-x86.c
>   x86_64_PURGATORY_SRCS +=3D purgatory/arch/i386/vga.c
>   x86_64_PURGATORY_SRCS +=3D purgatory/arch/i386/pic.c
>  =20
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-durin=
g-link.patch b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-durin=
g-link.patch
> similarity index 88%
> rename from meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during=
-link.patch
> rename to meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-l=
ink.patch
> index 3f2f85e337..7a4b8548ca 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during-link.=
patch
> +++ b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.=
patch
> @@ -1,4 +1,4 @@
> -From ea7be6d71b85880e8e8a2c8a4f49a696c5f31ae4 Mon Sep 17 00:00:00 2001
> +From c54488ad5fd657e0f154d76d7456d9080be24836 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 10 Jun 2017 11:18:49 -0700
>  Subject: [PATCH] Disable PIE during link
> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/purgatory/Makefile b/purgatory/Makefile
> -index 564bdb7..a08e41f 100644
> +index 416e6b9..f00edb4 100644
>  --- a/purgatory/Makefile
>  +++ b/purgatory/Makefile
>  @@ -59,7 +59,7 @@ $(PURGATORY): CPPFLAGS=3D$($(ARCH)_PURGATORY_EXTRA_CFL=
AGS) \
> @@ -26,6 +26,3 @@ index 564bdb7..a08e41f 100644
>   			-nodefaultlibs -e purgatory_start -Wl,-r \
>   			-Wl,-Map=3D$(PURGATORY_MAP)
>  =20
> ---=20
> -2.13.1
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb b/meta/recip=
es-kernel/kexec/kexec-tools_2.0.19.bb
> index f65cd9f106..3439899070 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
> @@ -10,15 +10,15 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dea5bed2f60=
d357618ca161ad539f7c0a \
>  DEPENDS =3D "zlib xz"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${=
PV}.tar.gz \
> -           file://kdump \
> -           file://kdump.conf \
> -           file://kdump.service \
> -           file://0002-powerpc-change-the-memory-size-limit.patch \
> -           file://0001-purgatory-Pass-r-directly-to-linker.patch \
> -           file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.pa=
tch \
> -           file://kexec-x32.patch \
> -           file://0001-Disable-PIE-during-link.patch \
> -           "
> +    file://kdump \
> +    file://kdump.conf \
> +    file://kdump.service \
> +    file://0001-powerpc-change-the-memory-size-limit.patch \
> +    file://0002-purgatory-Pass-r-directly-to-linker.patch \
> +    file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
> +    file://0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.pat=
ch \
> +    file://0005-Disable-PIE-during-link.patch \
> +"
> =20
>  SRC_URI[md5sum] =3D "052458f0a35c2a3b0d2302caa3318e9f"
>  SRC_URI[sha256sum] =3D "913c8dee918e5855a4ba60d609371390978144b4c8d15d64=
46ca0057b7bc5e58"
> --=20
> 2.17.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXOPvOQAKCRA3VSO3ZXaA
HI2jAJ9hZIttT8F/UW/oJ4lSB9i2UYXbQwCeI2Ab9f5h+XawOIqjnUJn45y14DQ=
=ZnM0
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--
