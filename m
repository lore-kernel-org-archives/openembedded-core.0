Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qpgyg-0000f4-Iw
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 15:31:47 +0200
Received: by pzk2 with SMTP id 2so6185929pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Aug 2011 06:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=Y3427UYaU1S3PGkcwVMAeePqixzbcjsEvK0BmcQYAgM=;
	b=wrHoktir6X90u1AsULU/NImQWwQBVa95mVry2xC+g19HlLjxfpbwMiSRA2UrirZF3B
	Pg1T6tlmRS5acrrpleuw8GPzMp/8Yb80KgNHtfCvFL7iYJGnm0mIHy03NbGEJvEhTjZ7
	HT/3y3I24LK6hUl4UoBRfQRaJtaGi/mZo2gZc=
Received: by 10.142.239.13 with SMTP id m13mr3061347wfh.109.1312637236638;
	Sat, 06 Aug 2011 06:27:16 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id i2sm1567807wfd.20.2011.08.06.06.27.15
	(version=SSLv3 cipher=OTHER); Sat, 06 Aug 2011 06:27:15 -0700 (PDT)
Message-ID: <4E3D4132.9090900@gmail.com>
Date: Sat, 06 Aug 2011 06:27:14 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110801 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1312612601.git.sgw@linux.intel.com>
	<7492851d3b19ac495e050d0624ddd9ae6ee46f59.1312612601.git.sgw@linux.intel.com>
In-Reply-To: <7492851d3b19ac495e050d0624ddd9ae6ee46f59.1312612601.git.sgw@linux.intel.com>
X-Enigmail-Version: 1.2pre
Subject: Re: [CONSOLIDATED PULL 6/9] gdb: Update to 7.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Aug 2011 13:31:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/05/2011 11:38 PM, Saul Wold wrote:
> This has one upstream patch removed and a couple rebased
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com> --- 
> meta/recipes-devtools/gdb/gdb-common.inc           |    5 ++- 
> ...s-canadian_7.2.bb => gdb-cross-canadian_7.3.bb} |    2 +- 
> .../gdb/{gdb-cross_7.2.bb => gdb-cross_7.3.bb}     |    2 +- 
> meta/recipes-devtools/gdb/gdb.inc                  |    2 +- 
> .../fix_for_build_error_internal_error_call.patch  |   20
> ----------- .../gdb/gdb/gdbserver-cflags-last.diff             |   16
> +++++---- .../gdb/gdb/kill_arm_map_symbols.patch             |   36
> ++++++++++---------- .../gdb/{gdb_7.2.bb => gdb_7.3.bb}
> |    4 +-- 8 files changed, 34 insertions(+), 53 deletions(-) rename
> meta/recipes-devtools/gdb/{gdb-cross-canadian_7.2.bb =>
> gdb-cross-canadian_7.3.bb} (87%) rename
> meta/recipes-devtools/gdb/{gdb-cross_7.2.bb => gdb-cross_7.3.bb}
> (83%) delete mode 100644
> meta/recipes-devtools/gdb/gdb/fix_for_build_error_internal_error_call.patch
>
> 
rename meta/recipes-devtools/gdb/{gdb_7.2.bb => gdb_7.3.bb} (68%)
> 
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc
> b/meta/recipes-devtools/gdb/gdb-common.inc index 8ec3735..e9a38b6
> 100644 --- a/meta/recipes-devtools/gdb/gdb-common.inc +++
> b/meta/recipes-devtools/gdb/gdb-common.inc @@ -2,7 +2,9 @@
> DESCRIPTION = "gdb - GNU debugger" HOMEPAGE =
> "http://www.gnu.org/software/gdb/" LICENSE="GPLv3+" SECTION =
> "devel" -DEPENDS = "ncurses readline elfutils" +DEPENDS = "ncurses
> readline elfutils lttng-ust" + +INC_PR = "r2"

should it be r0 ?

> 
> LIC_FILES_CHKSUM =
> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \ 
> file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \ @@ -29,7
> +31,6 @@ EXPAT = "--without-expat" EXTRA_OECONF = "--disable-gdbtk
> --disable-tui --disable-x \ --with-curses --disable-multilib
> --with-system-readline --disable-sim \ ${GDBPROPREFIX}
> --with-libelf=${STAGING_DIR_TARGET} ${EXPAT} \ -
> --without-ust \ "

could you try to see if it builds on uclibc with ust ?
> 
> GDBPROPREFIX = "--program-prefix=''" diff --git
> a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.2.bb
> b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.bb similarity
> index 87% rename from
> meta/recipes-devtools/gdb/gdb-cross-canadian_7.2.bb rename to
> meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.bb index
> ca44b3c..58c20c4 100644 ---
> a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.2.bb +++
> b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.bb @@ -1,7 +1,7
> @@ require gdb-common.inc require gdb-cross-canadian.inc
> 
> -PR = "r1" +PR = "${INC_PR}.0"
> 
> GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'" EXPAT =
> "--with-expat" diff --git
> a/meta/recipes-devtools/gdb/gdb-cross_7.2.bb
> b/meta/recipes-devtools/gdb/gdb-cross_7.3.bb similarity index 83% 
> rename from meta/recipes-devtools/gdb/gdb-cross_7.2.bb rename to
> meta/recipes-devtools/gdb/gdb-cross_7.3.bb index b5a8bea..9c2ed07
> 100644 --- a/meta/recipes-devtools/gdb/gdb-cross_7.2.bb +++
> b/meta/recipes-devtools/gdb/gdb-cross_7.3.bb @@ -3,4 +3,4 @@ require
> gdb-cross.inc SRC_URI += "file://sim-install-6.6.patch;patch=1" EXPAT
> = "--with-expat"
> 
> -PR = "r0" +PR = "${INC_PR}.0" diff --git
> a/meta/recipes-devtools/gdb/gdb.inc
> b/meta/recipes-devtools/gdb/gdb.inc index efa3cbf..9f5f34f 100644 ---
> a/meta/recipes-devtools/gdb/gdb.inc +++
> b/meta/recipes-devtools/gdb/gdb.inc @@ -4,7 +4,7 @@ inherit gettext
> 
> SRC_URI += "file://kill_arm_map_symbols.patch \ 
> file://gdbserver-cflags-last.diff;striplevel=0 \ -
> file://fix_for_build_error_internal_error_call.patch " +           " 
> #LDFLAGS_append = " -s" #export CFLAGS_append=" -L${STAGING_LIBDIR}"
> 
> diff --git
> a/meta/recipes-devtools/gdb/gdb/fix_for_build_error_internal_error_call.patch
> b/meta/recipes-devtools/gdb/gdb/fix_for_build_error_internal_error_call.patch
>
> 
deleted file mode 100644
> index afb1783..0000000 ---
> a/meta/recipes-devtools/gdb/gdb/fix_for_build_error_internal_error_call.patch
>
> 
+++ /dev/null
> @@ -1,20 +0,0 @@ -Upstream-Status: Pending - -The prototype of
> function internall_error has changed. And one place in the code was
> not synced up with the new prototype, causing build error. This
> patche fixes that. - -Nitin A Kamble <nitin.a.kamble@intel.com> 
> -2010/11/12 - -Index: gdb-7.2/gdb/gdbserver/linux-i386-ipa.c 
> -=================================================================== 
> ---- gdb-7.2.orig/gdb/gdbserver/linux-i386-ipa.c -+++
> gdb-7.2/gdb/gdbserver/linux-i386-ipa.c -@@ -178,7 +178,7 @@
> supply_static_tracepoint_registers (stru - 	    } - 	    break; -
> default: --	    internal_error ("unhandled register size: %d", -+
> internal_error (__FILE__, __LINE__, "unhandled register size: %d", -
> i386_st_collect_regmap[i].size); - 	  } -       } diff --git
> a/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
> b/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff index
> 0475a42..8256f17 100644 ---
> a/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff +++
> b/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff @@ -2,16
> +2,18 @@ Upstream-Status: Pending
> 
> Index: gdb/gdbserver/Makefile.in 
> =================================================================== 
> ---- gdb/gdbserver/Makefile.in.orig -+++ gdb/gdbserver/Makefile.in 
> -@@ -89,8 +89,8 @@ WARN_CFLAGS = -Wall +---
> gdb/gdbserver/Makefile.in.orig	2011-03-09 23:32:02.000000000 -0800 
> ++++ gdb/gdbserver/Makefile.in	2011-08-05 21:16:43.592202579 -0700 
> +@@ -94,10 +94,10 @@ CFLAGS = @CFLAGS@
> 
> # INTERNAL_CFLAGS is the aggregate of all other *CFLAGS macros. 
> --INTERNAL_CFLAGS =  $(WARN_CFLAGS) ${CFLAGS} ${GLOBAL_CFLAGS} \ --
> ${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} -+INTERNAL_CFLAGS =
> $(WARN_CFLAGS) ${GLOBAL_CFLAGS} \ -+	${PROFILE_CFLAGS}
> ${INCLUDE_CFLAGS} ${CFLAGS} +-INTERNAL_CFLAGS_BASE =  ${CFLAGS}
> ${GLOBAL_CFLAGS} \ ++INTERNAL_CFLAGS_BASE =  ${GLOBAL_CFLAGS} \ +
> ${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} + INTERNAL_WARN_CFLAGS =
> ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS) +-INTERNAL_CFLAGS =
> ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ++INTERNAL_CFLAGS =
> ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${CFLAGS}
> 
> # LDFLAGS is specifically reserved for setting from the command line 
> # when running make. diff --git
> a/meta/recipes-devtools/gdb/gdb/kill_arm_map_symbols.patch
> b/meta/recipes-devtools/gdb/gdb/kill_arm_map_symbols.patch index
> c1756f7..9fc45b9 100644 ---
> a/meta/recipes-devtools/gdb/gdb/kill_arm_map_symbols.patch +++
> b/meta/recipes-devtools/gdb/gdb/kill_arm_map_symbols.patch @@ -1,26
> +1,26 @@ Upstream-Status: Inappropriate [embedded specific]
> 
> -Index: gdb-6.3/gdb/arm-tdep.c +Index: gdb-7.3/gdb/arm-tdep.c 
> =================================================================== 
> ---- gdb-6.3.orig/gdb/arm-tdep.c	2004-08-03 02:02:20.000000000 +0000 
> -+++ gdb-6.3/gdb/arm-tdep.c	2005-11-09 15:13:29.000000000 +0000 -@@
> -2491,6 +2491,19 @@ +--- gdb-7.3.orig/gdb/arm-tdep.c	2011-05-17
> 14:27:01.000000000 -0700 ++++ gdb-7.3/gdb/arm-tdep.c	2011-08-05
> 22:29:58.784201850 -0700 +@@ -7806,6 +7806,19 @@ static void 
> arm_elf_make_msymbol_special(asymbol *sym, struct minimal_symbol
> *msym) { + -+   /* FIXME: We want gdb to ignore the ARM ELF mapping
> symbols when -+      displaying disassembly so we use this horrible
> hack here to -+      artifically set their address to the highest
> possible value. -+      This is wrong of course, and it prevents the
> symbols from being -+      used for their intended purpose - to
> distinguish between ARM -+      and THUMB code.  So we ought to find
> a better way to do this.  */ -+  if (bfd_asymbol_name (sym) -+
> && bfd_asymbol_name (sym)[0] == '$' -+       && bfd_asymbol_name
> (sym)[1] != 0 -+       && bfd_asymbol_name (sym)[2] == 0) -+
> SYMBOL_VALUE_ADDRESS(msym) = (CORE_ADDR) 0x7ffffffc; ++    /* FIXME:
> We want gdb to ignore the ARM ELF mapping symbols when ++	displaying
> disassembly so we use this horrible hack here to ++	artifically set
> their address to the highest possible value. ++	This is wrong of
> course, and it prevents the symbols from being ++	used for their
> intended purpose - to distinguish between ARM ++	and THUMB code.  So
> we ought to find a better way to do this.  */ ++    if
> (bfd_asymbol_name (sym) ++	&& bfd_asymbol_name (sym)[0] == '$' ++	&&
> bfd_asymbol_name (sym)[1] != 0 ++	&& bfd_asymbol_name (sym)[2] == 0) 
> ++      SYMBOL_VALUE_ADDRESS(msym) = (CORE_ADDR) 0x7ffffffc; + -   /*
> Thumb symbols are of type STT_LOPROC, (synonymous with -
> STT_ARM_TFUNC).  */ -   if (ELF_ST_TYPE (((elf_symbol_type
> *)sym)->internal_elf_sym.st_info) +   if (ARM_SYM_BRANCH_TYPE
> (&((elf_symbol_type *)sym)->internal_elf_sym) +       ==
> ST_BRANCH_TO_THUMB) +     MSYMBOL_SET_SPECIAL (msym); diff --git
> a/meta/recipes-devtools/gdb/gdb_7.2.bb
> b/meta/recipes-devtools/gdb/gdb_7.3.bb similarity index 68% rename
> from meta/recipes-devtools/gdb/gdb_7.2.bb rename to
> meta/recipes-devtools/gdb/gdb_7.3.bb index 501efb4..5e21858 100644 
> --- a/meta/recipes-devtools/gdb/gdb_7.2.bb +++
> b/meta/recipes-devtools/gdb/gdb_7.3.bb @@ -4,7 +4,5 @@
> LIC_FILES_CHKSUM =
> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \ 
> file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \ 
> file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \ 
> file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674" -PR = "r0" 
> +PR = "${INC_PR}.0"
> 
> -SRC_URI[md5sum] = "950b766466bee748e554765c86b8b495" 
> -SRC_URI[sha256sum] =
> "34919cb51334c8149ae36ed086f35e79fe3fa2b2a85b568d7c0edad20cd972d4"

I guess the checksums are missing in new recipes

- -- 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk49QTEACgkQuwUzVZGdMxR8/gCfXEUfIDxcObKgTe7hc0oMKBNU
y5IAn1DG6xVbIA/5Ytksqxp47EsZ0OSY
=pAto
-----END PGP SIGNATURE-----


