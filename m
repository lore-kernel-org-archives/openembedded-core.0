Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.1177.1627667160238350059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 10:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uEjTQ98+;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id a20so12020209plm.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 10:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zajwQAOuShkn/tB+f2hF+32L0RnMCdiBIS/0ZRb9Xb4=;
        b=uEjTQ98+0q3pC9vYsDDDC9uleXuIIG1JoFix/3P38iInNGkbiqSXIYBmdXAYruacxM
         LGb/lktHZM/FIMT5pqbhUHmBjcc6xKwDMCs7RL0Zh8J2LjPfUQacV2u1ZS645+3eKDaU
         FM5MJlbGBW3n5K6vJmV39ouqqjcd3aq89pQiLINWjOR0HwFplGzuOsUFOzXzJ3wHP+sU
         0cWqXlql3xIHM6hGYGRCWtM1EqJTgfQUPy4wrM61eVhhaZ7wH3vUCBVm4d88sB49Oydb
         Iyd/4PLYV7TOZ/gSoVRk2DRbffFu0Zm/nrXsImaaYigh3e2/ZD8tTTc++AxTtxuESj2E
         MMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zajwQAOuShkn/tB+f2hF+32L0RnMCdiBIS/0ZRb9Xb4=;
        b=eaL7i47KVBB78xpHy83lWgaT0BL6adQRLa2G9cTh/bNFY2gszZ+nlqSYpcFdze1SoE
         WhnhCFav1sPoyWNSV2oHBa91el2LHR9Af4iE+uue0OGjI4hqmE6nEf0xZvXVAtRcHwMh
         oGzjq4BPCZ6ouMNtv3ghgeptWiS/1dQStw+WE1ZLg3kr5mOcbNH8tHxlDTeMferpWDWA
         vSro6ABEmqRV/EJTS+Jxo5LH03Ji2mCP+np3roMOYnUDanrZceIhb+0xbCWsbbLj/87j
         s9E5Ef2LF14defbGCev0ibfrPkHxYfo1p0C4Z0dgldJI+XHpGfd8GRMF/S9qov8jvRjJ
         a+Yg==
X-Gm-Message-State: AOAM531RhW3HEuW/sFAxWjNw0wh3zEQBp0n94yQuHxDRcqlu7EQnlKc+
	7aH9NZHE57un6ptAwPG+qfpOratwr45WDA==
X-Google-Smtp-Source: ABdhPJyMvPX6I/uMWQPV6LVL+MXDBDWgIISQWwcBTmvAw8fJJGe8DJULq4CVKVsdlL44cUnV70/PpQ==
X-Received: by 2002:a17:90b:3d6:: with SMTP id go22mr4091536pjb.40.1627667158903;
        Fri, 30 Jul 2021 10:45:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:1ca4:9b60:d985:839c? ([2601:646:9200:a0f0:1ca4:9b60:d985:839c])
        by smtp.gmail.com with ESMTPSA id r10sm2992541pff.7.2021.07.30.10.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 10:45:58 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] gcc: update 11.1 -> 11.2
To: bero@lindev.ch, openembedded-core@lists.openembedded.org
References: <20210729235242.1230800-1-bero@lindev.ch>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <3e853dae-7a3b-ddeb-dc61-d0956259e5ff@gmail.com>
Date: Fri, 30 Jul 2021 10:45:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729235242.1230800-1-bero@lindev.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Thanks Bero, this looks good, we also need to bump GCCVERSION in
meta/conf/distro/include/tcmode-default.inc
and RECIPE_MAINTAINER_pn-gcc-source-11.1.0 to 
RECIPE_MAINTAINER_pn-gcc-source-11.2.0 in 
meta/conf/distro/include/maintainers.inc


On 7/29/21 4:52 PM, Bernhard Rosenkränzer via lists.openembedded.org wrote:
> Update gcc, drop patches that have been merged upstream
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@lindev.ch>
> ---
>   .../gcc/{gcc-11.1.inc => gcc-11.2.inc}        |  12 +-
>   ...ian_11.1.bb => gcc-cross-canadian_11.2.bb} |   0
>   .../{gcc-cross_11.1.bb => gcc-cross_11.2.bb}  |   0
>   ...-crosssdk_11.1.bb => gcc-crosssdk_11.2.bb} |   0
>   ...cc-runtime_11.1.bb => gcc-runtime_11.2.bb} |   0
>   ...itizers_11.1.bb => gcc-sanitizers_11.2.bb} |   0
>   ...{gcc-source_11.1.bb => gcc-source_11.2.bb} |   0
>   ...nstallation-of-python-hooks-PR-99453.patch |  57 ----
>   ...arc-Update-64bit-move-split-patterns.patch | 290 ------------------
>   .../0039-arc-Fix-u-maddhisi-patterns.patch    | 127 --------
>   .../0040-arc-Update-doloop_end-patterns.patch | 105 -------
>   .../gcc/{gcc_11.1.bb => gcc_11.2.bb}          |   0
>   ...initial_11.1.bb => libgcc-initial_11.2.bb} |   0
>   .../gcc/{libgcc_11.1.bb => libgcc_11.2.bb}    |   0
>   ...ibgfortran_11.1.bb => libgfortran_11.2.bb} |   0
>   15 files changed, 3 insertions(+), 588 deletions(-)
>   rename meta/recipes-devtools/gcc/{gcc-11.1.inc => gcc-11.2.inc} (88%)
>   rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.1.bb => gcc-cross-canadian_11.2.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-cross_11.1.bb => gcc-cross_11.2.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.1.bb => gcc-crosssdk_11.2.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-runtime_11.1.bb => gcc-runtime_11.2.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.1.bb => gcc-sanitizers_11.2.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-source_11.1.bb => gcc-source_11.2.bb} (100%)
>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-installation-of-python-hooks-PR-99453.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patterns.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.patch
>   rename meta/recipes-devtools/gcc/{gcc_11.1.bb => gcc_11.2.bb} (100%)
>   rename meta/recipes-devtools/gcc/{libgcc-initial_11.1.bb => libgcc-initial_11.2.bb} (100%)
>   rename meta/recipes-devtools/gcc/{libgcc_11.1.bb => libgcc_11.2.bb} (100%)
>   rename meta/recipes-devtools/gcc/{libgfortran_11.1.bb => libgfortran_11.2.bb} (100%)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
> similarity index 88%
> rename from meta/recipes-devtools/gcc/gcc-11.1.inc
> rename to meta/recipes-devtools/gcc/gcc-11.2.inc
> index c21242af58..31dbc072b8 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -2,11 +2,11 @@ require gcc-common.inc
>   
>   # Third digit in PV should be incremented after a minor release
>   
> -PV = "11.1.0"
> +PV = "11.2.0"
>   
>   # BINV should be incremented to a revision after a minor gcc release
>   
> -BINV = "11.1.1"
> +BINV = "11.2.0"
>   
>   FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
>   
> @@ -27,7 +27,6 @@ LIC_FILES_CHKSUM = "\
>   #BASEURI ?= "https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip;downloadfilename=gcc-${PV}-${RELEASE}.zip"
>   
>   BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz \
> -            http://downloads.yoctoproject.org/mirror/sources/gcc-11.1.0-9ee61d2b51df012c659359873637cc2162ecccf3.patch;apply=yes;name=backports \
>              "
>   SRC_URI = "\
>              ${BASEURI} \
> @@ -68,13 +67,8 @@ SRC_URI = "\
>              file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
>              file://0036-mingw32-Enable-operation_not_supported.patch \
>              file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
> -           file://0001-libstdc-Fix-installation-of-python-hooks-PR-99453.patch \
> -           file://0038-arc-Update-64bit-move-split-patterns.patch \
> -           file://0039-arc-Fix-u-maddhisi-patterns.patch \
> -           file://0040-arc-Update-doloop_end-patterns.patch \
>   "
> -SRC_URI[sha256sum] = "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf"
> -SRC_URI[backports.sha256sum] = "69274bebd6c069a13443d4af61070e854740a639ec4d66eedf3e80070363587b"
> +SRC_URI[sha256sum] = "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
>   
>   S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>   
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_11.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_11.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.1.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_11.2.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_11.1.bb b/meta/recipes-devtools/gcc/gcc-cross_11.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross_11.1.bb
> rename to meta/recipes-devtools/gcc/gcc-cross_11.2.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_11.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_11.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-crosssdk_11.1.bb
> rename to meta/recipes-devtools/gcc/gcc-crosssdk_11.2.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-runtime_11.1.bb
> rename to meta/recipes-devtools/gcc/gcc-runtime_11.2.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_11.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_11.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-sanitizers_11.1.bb
> rename to meta/recipes-devtools/gcc/gcc-sanitizers_11.2.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-source_11.1.bb b/meta/recipes-devtools/gcc/gcc-source_11.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-source_11.1.bb
> rename to meta/recipes-devtools/gcc/gcc-source_11.2.bb
> diff --git a/meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-installation-of-python-hooks-PR-99453.patch b/meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-installation-of-python-hooks-PR-99453.patch
> deleted file mode 100644
> index d82f533cb4..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-installation-of-python-hooks-PR-99453.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From ad4c21f0f59b52357019148ec94d767aa2acd8f2 Mon Sep 17 00:00:00 2001
> -From: Jonathan Wakely <jwakely@redhat.com>
> -Date: Tue, 1 Jun 2021 11:00:16 +0100
> -Subject: [PATCH] libstdc++: Fix installation of python hooks [PR 99453]
> -
> -When no shared library is installed, the new code to determine the name
> -of the -gdb.py file yields an empty string. Use the name of the static
> -library in that case.
> -
> -libstdc++-v3/ChangeLog:
> -
> -	PR libstdc++/99453
> -	* python/Makefile.am: Use archive name for printer hook if no
> -	dynamic library name is available.
> -	* python/Makefile.in: Regenerate.
> -
> -(cherry picked from commit 9f7bc160b4a0f27dce248d1226e3ae7104b0e67b)
> ----
> - libstdc++-v3/python/Makefile.am | 4 ++++
> - libstdc++-v3/python/Makefile.in | 4 ++++
> - 2 files changed, 8 insertions(+)
> -
> -diff --git a/libstdc++-v3/python/Makefile.am b/libstdc++-v3/python/Makefile.am
> -index 0c2b207b86e..8efefa5725c 100644
> ---- a/libstdc++-v3/python/Makefile.am
> -+++ b/libstdc++-v3/python/Makefile.am
> -@@ -48,5 +48,9 @@ install-data-local: gdb.py
> - ## the correct name.
> - 	@libname=`sed -ne "/^library_names=/{s/.*='//;s/'$$//;s/ .*//;p;}" \
> - 	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
> -+	if [ -z "$$libname" ]; then \
> -+	  libname=`sed -ne "/^old_library=/{s/.*='//;s/'$$//;s/ .*//;p;}" \
> -+		  $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
> -+	fi; \
> - 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py"; \
> - 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
> -diff --git a/libstdc++-v3/python/Makefile.in b/libstdc++-v3/python/Makefile.in
> -index 2efe0b96a19..9904a9197de 100644
> ---- a/libstdc++-v3/python/Makefile.in
> -+++ b/libstdc++-v3/python/Makefile.in
> -@@ -609,6 +609,10 @@ install-data-local: gdb.py
> - 	@$(mkdir_p) $(DESTDIR)$(toolexeclibdir)
> - 	@libname=`sed -ne "/^library_names=/{s/.*='//;s/'$$//;s/ .*//;p;}" \
> - 	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
> -+	if [ -z "$$libname" ]; then \
> -+	  libname=`sed -ne "/^old_library=/{s/.*='//;s/'$$//;s/ .*//;p;}" \
> -+		  $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
> -+	fi; \
> - 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py"; \
> - 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
> -
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patterns.patch b/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patterns.patch
> deleted file mode 100644
> index 37fe95d711..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patterns.patch
> +++ /dev/null
> @@ -1,290 +0,0 @@
> -From 0061fabeb9393c362601486105202cfe837a5a68 Mon Sep 17 00:00:00 2001
> -From: Claudiu Zissulescu <claziss@synopsys.com>
> -Date: Wed, 9 Jun 2021 12:12:57 +0300
> -Subject: [PATCH] arc: Update 64bit move split patterns.
> -
> -ARCv2HS can use a limited number of instructions to implement 64bit
> -moves. The VADD2 is used as a 64bit move, the LDD/STD are 64 bit loads
> -and stores. All those instructions are not baseline, hence we need to
> -provide alternatives when they are not available or cannot be generate
> -due to instruction restriction.
> -
> -This patch is cleaning up those move patterns, and updates splits
> -instruction lengths.
> -
> -This is a backport from mainline gcc.
> -
> -gcc/
> -2021-06-09  Claudiu Zissulescu  <claziss@synopsys.com>
> -
> -	* config/arc/arc-protos.h (arc_split_move_p): New prototype.
> -	* config/arc/arc.c (arc_split_move_p): New function.
> -	(arc_split_move): Clean up.
> -	* config/arc/arc.md (movdi_insn): Clean up, use arc_split_move_p.
> -	(movdf_insn): Likewise.
> -	* config/arc/simdext.md (mov<VWH>_insn): Likewise.
> -
> -Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=0061fabeb9393c362601486105202cfe837a5a68]
> -
> -Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
> -(cherry picked from commit c0ba7a8af5366c37241f20e8be41e362f7260389)
> -Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ----
> - gcc/config/arc/arc-protos.h |  1 +
> - gcc/config/arc/arc.c        | 44 ++++++++++++----------
> - gcc/config/arc/arc.md       | 91 +++++++++------------------------------------
> - gcc/config/arc/simdext.md   | 38 ++++---------------
> - 4 files changed, 52 insertions(+), 122 deletions(-)
> -
> -diff --git a/gcc/config/arc/arc-protos.h b/gcc/config/arc/arc-protos.h
> -index 1f56a0d82e4..62d7e45d29d 100644
> ---- a/gcc/config/arc/arc-protos.h
> -+++ b/gcc/config/arc/arc-protos.h
> -@@ -50,6 +50,7 @@ extern void arc_split_ior (rtx *);
> - extern bool arc_check_mov_const (HOST_WIDE_INT );
> - extern bool arc_split_mov_const (rtx *);
> - extern bool arc_can_use_return_insn (void);
> -+extern bool arc_split_move_p (rtx *);
> - #endif /* RTX_CODE */
> -
> - extern bool arc_ccfsm_branch_deleted_p (void);
> -diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
> -index 3201c3fefd7..db541bc11f5 100644
> ---- a/gcc/config/arc/arc.c
> -+++ b/gcc/config/arc/arc.c
> -@@ -10129,6 +10129,31 @@ arc_process_double_reg_moves (rtx *operands)
> -   return true;
> - }
> -
> -+
> -+/* Check if we need to split a 64bit move.  We do not need to split it if we can
> -+   use vadd2 or ldd/std instructions.  */
> -+
> -+bool
> -+arc_split_move_p (rtx *operands)
> -+{
> -+  machine_mode mode = GET_MODE (operands[0]);
> -+
> -+  if (TARGET_LL64
> -+      && ((memory_operand (operands[0], mode)
> -+	   && (even_register_operand (operands[1], mode)
> -+	       || satisfies_constraint_Cm3 (operands[1])))
> -+	  || (memory_operand (operands[1], mode)
> -+	      && even_register_operand (operands[0], mode))))
> -+    return false;
> -+
> -+  if (TARGET_PLUS_QMACW
> -+      && even_register_operand (operands[0], mode)
> -+      && even_register_operand (operands[1], mode))
> -+    return false;
> -+
> -+  return true;
> -+}
> -+
> - /* operands 0..1 are the operands of a 64 bit move instruction.
> -    split it into two moves with operands 2/3 and 4/5.  */
> -
> -@@ -10146,25 +10171,6 @@ arc_split_move (rtx *operands)
> -       return;
> -   }
> -
> --  if (TARGET_LL64
> --      && ((memory_operand (operands[0], mode)
> --	   && (even_register_operand (operands[1], mode)
> --	       || satisfies_constraint_Cm3 (operands[1])))
> --	  || (memory_operand (operands[1], mode)
> --	      && even_register_operand (operands[0], mode))))
> --    {
> --      emit_move_insn (operands[0], operands[1]);
> --      return;
> --    }
> --
> --  if (TARGET_PLUS_QMACW
> --      && even_register_operand (operands[0], mode)
> --      && even_register_operand (operands[1], mode))
> --    {
> --      emit_move_insn (operands[0], operands[1]);
> --      return;
> --    }
> --
> -   if (TARGET_PLUS_QMACW
> -       && GET_CODE (operands[1]) == CONST_VECTOR)
> -     {
> -diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
> -index 7a52551eef5..91a838a38e4 100644
> ---- a/gcc/config/arc/arc.md
> -+++ b/gcc/config/arc/arc.md
> -@@ -1329,47 +1329,20 @@ core_3, archs4x, archs4xd, archs4xd_slow"
> -   "register_operand (operands[0], DImode)
> -    || register_operand (operands[1], DImode)
> -    || (satisfies_constraint_Cm3 (operands[1])
> --      && memory_operand (operands[0], DImode))"
> --  "*
> --{
> --  switch (which_alternative)
> --    {
> --    default:
> --      return \"#\";
> --
> --    case 0:
> --    if (TARGET_PLUS_QMACW
> --	&& even_register_operand (operands[0], DImode)
> --	&& even_register_operand (operands[1], DImode))
> --      return \"vadd2%?\\t%0,%1,0\";
> --    return \"#\";
> --
> --    case 2:
> --    if (TARGET_LL64
> --        && memory_operand (operands[1], DImode)
> --	&& even_register_operand (operands[0], DImode))
> --      return \"ldd%U1%V1 %0,%1%&\";
> --    return \"#\";
> --
> --    case 3:
> --    if (TARGET_LL64
> --	&& memory_operand (operands[0], DImode)
> --	&& (even_register_operand (operands[1], DImode)
> --	    || satisfies_constraint_Cm3 (operands[1])))
> --     return \"std%U0%V0 %1,%0\";
> --    return \"#\";
> --    }
> --}"
> --  "&& reload_completed"
> -+       && memory_operand (operands[0], DImode))"
> -+  "@
> -+   vadd2\\t%0,%1,0
> -+   #
> -+   ldd%U1%V1\\t%0,%1
> -+   std%U0%V0\\t%1,%0"
> -+  "&& reload_completed && arc_split_move_p (operands)"
> -   [(const_int 0)]
> -   {
> -    arc_split_move (operands);
> -    DONE;
> -   }
> -   [(set_attr "type" "move,move,load,store")
> --   ;; ??? The ld/st values could be 4 if it's [reg,bignum].
> --   (set_attr "length" "8,16,*,*")])
> --
> -+   (set_attr "length" "8,16,16,16")])
> -
> - ;; Floating point move insns.
> -
> -@@ -1408,50 +1381,22 @@ core_3, archs4x, archs4xd, archs4xd_slow"
> - (define_insn_and_split "*movdf_insn"
> -   [(set (match_operand:DF 0 "move_dest_operand"      "=D,r,r,r,r,m")
> - 	(match_operand:DF 1 "move_double_src_operand" "r,D,r,E,m,r"))]
> --  "register_operand (operands[0], DFmode)
> --   || register_operand (operands[1], DFmode)"
> --  "*
> --{
> -- switch (which_alternative)
> --   {
> --    default:
> --      return \"#\";
> --
> --    case 2:
> --    if (TARGET_PLUS_QMACW
> --	&& even_register_operand (operands[0], DFmode)
> --	&& even_register_operand (operands[1], DFmode))
> --      return \"vadd2%?\\t%0,%1,0\";
> --    return \"#\";
> --
> --    case 4:
> --    if (TARGET_LL64
> --	&& ((even_register_operand (operands[0], DFmode)
> --	     && memory_operand (operands[1], DFmode))
> --	    || (memory_operand (operands[0], DFmode)
> --	        && even_register_operand (operands[1], DFmode))))
> --      return \"ldd%U1%V1 %0,%1%&\";
> --    return \"#\";
> --
> --    case 5:
> --    if (TARGET_LL64
> --	&& ((even_register_operand (operands[0], DFmode)
> --	     && memory_operand (operands[1], DFmode))
> --	    || (memory_operand (operands[0], DFmode)
> --		&& even_register_operand (operands[1], DFmode))))
> --     return \"std%U0%V0 %1,%0\";
> --    return \"#\";
> --   }
> --}"
> --  "reload_completed"
> -+  "(register_operand (operands[0], DFmode)
> -+    || register_operand (operands[1], DFmode))"
> -+  "@
> -+   #
> -+   #
> -+   vadd2\\t%0,%1,0
> -+   #
> -+   ldd%U1%V1\\t%0,%1
> -+   std%U0%V0\\t%1,%0"
> -+  "&& reload_completed && arc_split_move_p (operands)"
> -   [(const_int 0)]
> -   {
> -    arc_split_move (operands);
> -    DONE;
> -   }
> -   [(set_attr "type" "move,move,move,move,load,store")
> --   (set_attr "predicable" "no,no,no,yes,no,no")
> --   ;; ??? The ld/st values could be 16 if it's [reg,bignum].
> -    (set_attr "length" "4,16,8,16,16,16")])
> -
> - (define_insn_and_split "*movdf_insn_nolrsr"
> -diff --git a/gcc/config/arc/simdext.md b/gcc/config/arc/simdext.md
> -index f0900757452..36f41a5c3d0 100644
> ---- a/gcc/config/arc/simdext.md
> -+++ b/gcc/config/arc/simdext.md
> -@@ -1402,41 +1402,19 @@
> - 	(match_operand:VWH 1 "general_operand"    "i,r,m,r"))]
> -   "(register_operand (operands[0], <MODE>mode)
> -        || register_operand (operands[1], <MODE>mode))"
> --  "*
> --{
> --  switch (which_alternative)
> --    {
> --     default:
> --       return \"#\";
> --
> --     case 1:
> --       if (TARGET_PLUS_QMACW
> --           && even_register_operand (operands[0], <MODE>mode)
> --	   && even_register_operand (operands[1], <MODE>mode))
> --         return \"vadd2%?\\t%0,%1,0\";
> --       return \"#\";
> --
> --     case 2:
> --       if (TARGET_LL64)
> --         return \"ldd%U1%V1 %0,%1\";
> --       return \"#\";
> --
> --     case 3:
> --       if (TARGET_LL64)
> --	   return \"std%U0%V0 %1,%0\";
> --	 return \"#\";
> --    }
> --}"
> --  "reload_completed"
> -+  "@
> -+   #
> -+   vadd2\\t%0,%1,0
> -+   ldd%U1%V1\\t%0,%1
> -+   std%U0%V0\\t%1,%0"
> -+  "&& reload_completed && arc_split_move_p (operands)"
> -   [(const_int 0)]
> -   {
> -    arc_split_move (operands);
> -    DONE;
> -   }
> --  [(set_attr "type" "move,multi,load,store")
> --   (set_attr "predicable" "no,no,no,no")
> --   (set_attr "iscompact"  "false,false,false,false")
> --   ])
> -+  [(set_attr "type" "move,move,load,store")
> -+   (set_attr "length" "16,8,16,16")])
> -
> - (define_expand "movmisalign<mode>"
> -  [(set (match_operand:VWH 0 "general_operand" "")
> ---
> -2.16.2
> -
> diff --git a/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch b/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch
> deleted file mode 100644
> index 9c5a2b8b33..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patch
> +++ /dev/null
> @@ -1,127 +0,0 @@
> -From 4186b7e93be73f8d68dc0fcc00a4cc8cc83e99a8 Mon Sep 17 00:00:00 2001
> -From: Claudiu Zissulescu <claziss@synopsys.com>
> -Date: Wed, 9 Jun 2021 12:12:57 +0300
> -Subject: [PATCH] arc: Fix (u)maddhisi patterns
> -
> -Rework the (u)maddhisi4 patterns and use VMAC2H(U) instruction instead
> -of the 64bit MAC(U) instruction.
> -This fixes the next execute.exp failures:
> -     arith-rand-ll.c   -O2  execution test
> -     arith-rand-ll.c   -O3  execution test
> -     pr78726.c   -O2  execution test
> -     pr78726.c   -O3  execution test
> -
> -gcc/
> -2021-06-09  Claudiu Zissulescu  <claziss@synopsys.com>
> -
> -	* config/arc/arc.md (maddhisi4): Use VMAC2H instruction.
> -	(machi): New pattern.
> -	(umaddhisi4): Use VMAC2HU instruction.
> -	(umachi): New pattern.
> -
> -Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=4186b7e93be73f8d68dc0fcc00a4cc8cc83e99a8]
> -
> -Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
> -(cherry picked from commit dd4778a59b4693777c732075021375e19eee6a76)
> -Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ----
> - gcc/config/arc/arc.md | 66 ++++++++++++++++++++++++++++++++-------------------
> - 1 file changed, 41 insertions(+), 25 deletions(-)
> -
> -diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
> -index 91a838a38e4..2a7e087ff72 100644
> ---- a/gcc/config/arc/arc.md
> -+++ b/gcc/config/arc/arc.md
> -@@ -6053,48 +6053,64 @@ core_3, archs4x, archs4xd, archs4xd_slow"
> -
> - ;; MAC and DMPY instructions
> -
> --; Use MAC instruction to emulate 16bit mac.
> -+; Use VMAC2H(U) instruction to emulate scalar 16bit mac.
> - (define_expand "maddhisi4"
> -   [(match_operand:SI 0 "register_operand" "")
> -    (match_operand:HI 1 "register_operand" "")
> -    (match_operand:HI 2 "extend_operand"   "")
> -    (match_operand:SI 3 "register_operand" "")]
> --  "TARGET_PLUS_DMPY"
> -+  "TARGET_PLUS_MACD"
> -   "{
> --   rtx acc_reg = gen_rtx_REG (DImode, ACC_REG_FIRST);
> --   rtx tmp1 = gen_reg_rtx (SImode);
> --   rtx tmp2 = gen_reg_rtx (SImode);
> --   rtx accl = gen_lowpart (SImode, acc_reg);
> --
> --   emit_move_insn (accl, operands[3]);
> --   emit_insn (gen_rtx_SET (tmp1, gen_rtx_SIGN_EXTEND (SImode, operands[1])));
> --   emit_insn (gen_rtx_SET (tmp2, gen_rtx_SIGN_EXTEND (SImode, operands[2])));
> --   emit_insn (gen_mac (tmp1, tmp2));
> --   emit_move_insn (operands[0], accl);
> -+   rtx acc_reg = gen_rtx_REG (SImode, ACC_REG_FIRST);
> -+
> -+   emit_move_insn (acc_reg, operands[3]);
> -+   emit_insn (gen_machi (operands[1], operands[2]));
> -+   emit_move_insn (operands[0], acc_reg);
> -    DONE;
> -   }")
> -
> --; The same for the unsigned variant, but using MACU instruction.
> -+(define_insn "machi"
> -+  [(set (reg:SI ARCV2_ACC)
> -+	(plus:SI
> -+	 (mult:SI (sign_extend:SI (match_operand:HI 0 "register_operand" "%r"))
> -+		  (sign_extend:SI (match_operand:HI 1 "register_operand" "r")))
> -+	 (reg:SI ARCV2_ACC)))]
> -+  "TARGET_PLUS_MACD"
> -+  "vmac2h\\t0,%0,%1"
> -+  [(set_attr "length" "4")
> -+   (set_attr "type" "multi")
> -+   (set_attr "predicable" "no")
> -+   (set_attr "cond" "nocond")])
> -+
> -+; The same for the unsigned variant, but using VMAC2HU instruction.
> - (define_expand "umaddhisi4"
> -   [(match_operand:SI 0 "register_operand" "")
> -    (match_operand:HI 1 "register_operand" "")
> --   (match_operand:HI 2 "extend_operand"   "")
> -+   (match_operand:HI 2 "register_operand" "")
> -    (match_operand:SI 3 "register_operand" "")]
> --  "TARGET_PLUS_DMPY"
> -+  "TARGET_PLUS_MACD"
> -   "{
> --   rtx acc_reg = gen_rtx_REG (DImode, ACC_REG_FIRST);
> --   rtx tmp1 = gen_reg_rtx (SImode);
> --   rtx tmp2 = gen_reg_rtx (SImode);
> --   rtx accl = gen_lowpart (SImode, acc_reg);
> --
> --   emit_move_insn (accl, operands[3]);
> --   emit_insn (gen_rtx_SET (tmp1, gen_rtx_ZERO_EXTEND (SImode, operands[1])));
> --   emit_insn (gen_rtx_SET (tmp2, gen_rtx_ZERO_EXTEND (SImode, operands[2])));
> --   emit_insn (gen_macu (tmp1, tmp2));
> --   emit_move_insn (operands[0], accl);
> -+   rtx acc_reg = gen_rtx_REG (SImode, ACC_REG_FIRST);
> -+
> -+   emit_move_insn (acc_reg, operands[3]);
> -+   emit_insn (gen_umachi (operands[1], operands[2]));
> -+   emit_move_insn (operands[0], acc_reg);
> -    DONE;
> -   }")
> -
> -+(define_insn "umachi"
> -+  [(set (reg:SI ARCV2_ACC)
> -+	(plus:SI
> -+	 (mult:SI (zero_extend:SI (match_operand:HI 0 "register_operand" "%r"))
> -+		  (zero_extend:SI (match_operand:HI 1 "register_operand" "r")))
> -+	 (reg:SI ARCV2_ACC)))]
> -+  "TARGET_PLUS_MACD"
> -+  "vmac2hu\\t0,%0,%1"
> -+  [(set_attr "length" "4")
> -+   (set_attr "type" "multi")
> -+   (set_attr "predicable" "no")
> -+   (set_attr "cond" "nocond")])
> -+
> - (define_expand "maddsidi4"
> -   [(match_operand:DI 0 "register_operand" "")
> -    (match_operand:SI 1 "register_operand" "")
> ---
> -2.16.2
> -
> diff --git a/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.patch b/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.patch
> deleted file mode 100644
> index 5f0bf8df8f..0000000000
> --- a/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.patch
> +++ /dev/null
> @@ -1,105 +0,0 @@
> -From 5a9b6a004f89fdd95b0470e1324dc4dee8c41d24 Mon Sep 17 00:00:00 2001
> -From: Claudiu Zissulescu <claziss@synopsys.com>
> -Date: Wed, 9 Jun 2021 12:12:57 +0300
> -Subject: [PATCH] arc: Update doloop_end patterns
> -
> -ARC processor can use LP instruction to implement zero overlay loops.
> -The current inplementation doesn't handle the unlikely situation when
> -the loop iterator is located in memory.  Refurbish the loop_end insn
> -pattern into a define_insn_and_split pattern.
> -
> -gcc/
> -2021-07-09  Claudiu Zissulescu  <claziss@synopsys.com>
> -
> -	* config/arc/arc.md (loop_end): Change it to
> -	define_insn_and_split.
> -
> -Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5a9b6a004f89fdd95b0470e1324dc4dee8c41d24]
> -
> -Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
> -(cherry picked from commit 174e75a210753b68de0f2c398a13ace0f512e35b)
> -Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ----
> - gcc/config/arc/arc.md | 46 ++++++++++++++++++++--------------------------
> - 1 file changed, 20 insertions(+), 26 deletions(-)
> -
> -diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
> -index 2a7e087ff72..d704044c13f 100644
> ---- a/gcc/config/arc/arc.md
> -+++ b/gcc/config/arc/arc.md
> -@@ -4986,7 +4986,7 @@ core_3, archs4x, archs4xd, archs4xd_slow"
> - (define_expand "doloop_end"
> -   [(parallel [(set (pc)
> - 		   (if_then_else
> --		    (ne (match_operand 0 "" "")
> -+		    (ne (match_operand 0 "nonimmediate_operand")
> - 			(const_int 1))
> - 		    (label_ref (match_operand 1 "" ""))
> - 		    (pc)))
> -@@ -5012,44 +5012,38 @@ core_3, archs4x, archs4xd, archs4xd_slow"
> -
> - ;; if by any chance the lp_count is not used, then use an 'r'
> - ;; register, instead of going to memory.
> --(define_insn "loop_end"
> --  [(set (pc)
> --	(if_then_else (ne (match_operand:SI 2 "nonimmediate_operand" "0,m")
> --			  (const_int 1))
> --		      (label_ref (match_operand 1 "" ""))
> --		      (pc)))
> --   (set (match_operand:SI 0 "nonimmediate_operand" "=r,m")
> --	(plus (match_dup 2) (const_int -1)))
> --   (unspec [(const_int 0)] UNSPEC_ARC_LP)
> --   (clobber (match_scratch:SI 3 "=X,&r"))]
> --  ""
> --  "; ZOL_END, begins @%l1"
> --  [(set_attr "length" "0")
> --   (set_attr "predicable" "no")
> --   (set_attr "type" "loop_end")])
> --
> - ;; split pattern for the very slim chance when the loop register is
> - ;; memory.
> --(define_split
> -+(define_insn_and_split "loop_end"
> -   [(set (pc)
> --	(if_then_else (ne (match_operand:SI 0 "memory_operand")
> -+	(if_then_else (ne (match_operand:SI 0 "nonimmediate_operand" "+r,!m")
> - 			  (const_int 1))
> --		      (label_ref (match_operand 1 ""))
> -+		      (label_ref (match_operand 1 "" ""))
> - 		      (pc)))
> -    (set (match_dup 0) (plus (match_dup 0) (const_int -1)))
> -    (unspec [(const_int 0)] UNSPEC_ARC_LP)
> --   (clobber (match_scratch:SI 2))]
> --  "memory_operand (operands[0], SImode)"
> -+   (clobber (match_scratch:SI 2 "=X,&r"))]
> -+  ""
> -+  "@
> -+   ; ZOL_END, begins @%l1
> -+   #"
> -+  "reload_completed && memory_operand (operands[0], Pmode)"
> -   [(set (match_dup 2) (match_dup 0))
> --   (set (match_dup 2) (plus:SI (match_dup 2) (const_int -1)))
> -+   (parallel
> -+    [(set (reg:CC_ZN CC_REG)
> -+	  (compare:CC_ZN (plus:SI (match_dup 2) (const_int -1))
> -+			 (const_int 0)))
> -+     (set (match_dup 2) (plus:SI (match_dup 2) (const_int -1)))])
> -    (set (match_dup 0) (match_dup 2))
> --   (set (reg:CC CC_REG) (compare:CC (match_dup 2) (const_int 0)))
> -    (set (pc)
> --	(if_then_else (ne (reg:CC CC_REG)
> -+	(if_then_else (ne (reg:CC_ZN CC_REG)
> - 			  (const_int 0))
> - 		      (label_ref (match_dup 1))
> - 		      (pc)))]
> --  "")
> -+  ""
> -+  [(set_attr "length" "0,24")
> -+   (set_attr "predicable" "no")
> -+   (set_attr "type" "loop_end")])
> -
> - (define_insn "loop_fail"
> -   [(set (reg:SI LP_COUNT)
> ---
> -2.16.2
> -
> diff --git a/meta/recipes-devtools/gcc/gcc_11.1.bb b/meta/recipes-devtools/gcc/gcc_11.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc_11.1.bb
> rename to meta/recipes-devtools/gcc/gcc_11.2.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_11.1.bb b/meta/recipes-devtools/gcc/libgcc-initial_11.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc-initial_11.1.bb
> rename to meta/recipes-devtools/gcc/libgcc-initial_11.2.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc_11.1.bb b/meta/recipes-devtools/gcc/libgcc_11.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc_11.1.bb
> rename to meta/recipes-devtools/gcc/libgcc_11.2.bb
> diff --git a/meta/recipes-devtools/gcc/libgfortran_11.1.bb b/meta/recipes-devtools/gcc/libgfortran_11.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgfortran_11.1.bb
> rename to meta/recipes-devtools/gcc/libgfortran_11.2.bb
> 
> 
> 
> 
> 
