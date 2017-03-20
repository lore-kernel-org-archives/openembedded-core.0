Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 08923779BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 21:02:38 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id 190so7386647itm.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 14:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=QDzA4K4g9lLEsYJz+MFy86j3Vkhojcidv9C74t623MM=;
	b=Trc9O72XgjnU1oCJ7onSUUnYnWnGnbaZIklEiPaZx289lUv0lH2paAUltyZTE7eCb3
	qb6U5Pqibtndm908ofxC+JqxIkeoioIxrdI7GyHmL44On+aMc0O57+MKu9jmFOqwTVEf
	RYHVr1xLM8Lv015TJTcL//BAlBhYpkBZT66oufuVEPzTBHck5NP4hIHchTGaT8NTWtc1
	rWcj7GWULYwJ6WJXebYeo7cRZeOt9WKto9enGmAu5xQn2g96ZqiTYSjxnsLhMe/wW+fW
	CIL4Dm8WjinqChms+TOdweyf7XH/r89l2+UGkXrp1kpW55qDV7RPosdLWW2YPBowCUVn
	ozEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=QDzA4K4g9lLEsYJz+MFy86j3Vkhojcidv9C74t623MM=;
	b=WQqppEVJXuDyKYl8VpRTBV5o5mfN3Eid2OgiQIWcDCsQKT8SY5EkA4vNXBMYYb9FRy
	2p2tSusrTTHXJJtar1qBQG7h5S4rWwLem4AL8rtvdsQzQiUSOqi6WCo1CuTCNN04/M0/
	oPcUKtG59y2bNKhwfXlLrmhO4YvsxWWEhHifizZQBikaBBELTdm0unDE7fjRMhEbCqLw
	59F6RuV+I0SIXmI3F4l47bhW5semsn2/BTk2/S2nthKPm2NND1hXoqVebURJwy5lOUqv
	Ft4bEc9HuPZgW+9GqkbUDxUyA82nqIzd4x7qd2j0zSi4Djo4yHi/E5grUyX4rQQWaiMU
	cU1g==
X-Gm-Message-State: AFeK/H1H76Bf4qz9AHRKfZkQtnUZ6MoAx8EDgxymr8UBNardm3rtaw2win4Nl8UrdaNUczFM
X-Received: by 10.36.204.136 with SMTP id x130mr98814itf.93.1490043759635;
	Mon, 20 Mar 2017 14:02:39 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C233.dip0.t-ipconnect.de. [93.232.194.51])
	by smtp.gmail.com with ESMTPSA id 202sm5745960ith.7.2017.03.20.14.02.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 14:02:38 -0700 (PDT)
Message-ID: <1490043755.6396.211.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "Neri, Ricardo" <ricardo.neri@intel.com>
Date: Mon, 20 Mar 2017 22:02:35 +0100
In-Reply-To: <CAMKF1sqY+nZsj2b9AOq0OUnKpGemjcvT+_wa0m5S7VoGv-r31g@mail.gmail.com>
References: <cover.1489534345.git.raj.khem@gmail.com>
	<2a1cd614717f323afc788e24fae76337cffa8816.1489534345.git.raj.khem@gmail.com>
	<CAHiDW_EvTOKpqOACTS6M9Y2_wofaEQ6sL89ThNHem4cPrxLFmQ@mail.gmail.com>
	<CAMKF1sqY+nZsj2b9AOq0OUnKpGemjcvT+_wa0m5S7VoGv-r31g@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: ovmf fails to build with musl (was: Re: [PATCH 5/6] musl: Update to latest)
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
X-List-Received-Date: Mon, 20 Mar 2017 21:02:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-03-20 at 07:43 -0700, Khem Raj wrote:
> On Mon, Mar 20, 2017 at 1:32 AM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
> >
> > On 15 March 2017 at 01:35, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Rich Felker (11):
> >>       fix ld-behavior-dependent crash in ppc64 ldso startup
> >>       rework ldso handling of global symbol table for consistency
> >>       reorder addend handling before symbol lookup in relocation code
> >>       emulate lazy relocation as deferrable relocation
> >>       fix free of uninitialized buffer pointer on error in regexec
> >>       in static dl_iterate_phdr, fix use of possibly-uninitialized aux
> >> data
> >>       fix possible fd leak, unrestored cancellation state on dns socket
> >> fail
> >>       fix wide scanf's use of a compound literal past its lifetime
> >>       fix one-byte overflow in legacy getpass function
> >>       avoid loading of multiple libc versions via explicit pathname
> >>       remove unused refcnt field for shared libraries
> >>
> >> Szabolcs Nagy (1):
> >>       treat STB_WEAK and STB_GNU_UNIQUE like STB_GLOBAL in find_sym
> >
> >
> >
> > Could the relocation changes here be responsible for these ovmf build
> > failures:
> >   "GenFw: ERROR 3000: Invalid ... unsupported ELF EM_386 relocation"
> > ?
> >
> Dont understand why musl would affect here.
> its using native gcc to build the artifacts its complaining about,

Yes, it is a bit puzzling how the libc on the target can influence the
compilation of ovmf. However, ovmf gets compiled for the target, so
there is at least some correlation.

Why it uses "gcc" is a good question, and I don't know. It happens to
work in practice because there's a long list of additional parameters
which selects the actual target architecture (in particular, -m64 vs.
-m32).

Perhaps this use of the host gcc is the reason why I can't reproduce it
locally.

The recipe has some code which tries to change the "gcc" invocations
into something else. I think it is meant to work like this (don't ask
how long it took me to figure this out):
      * ovmf-native patches BaseTools/Conf/tools_def.template such that
        ${TARGET_PREFIX}gcc is used (do_fix_toolchain)
      * ovmf picks up the path to that modified tools_def.template and
        uses it as Conf/tools_def.txt
        (0002-ovmf-update-path-to-native-BaseTools.patch +
        do_fix_basetools_location)

Ricardo, is that correct?

However, TARGET_PREFIX is empty in ovmf-native. So instead of
i586-poky-linux-musl-gcc or i586-poky-linux-musl-gcc-ar we end up
building with gcc and gcc-ar from the host, which probably wasn't the
intention.

Below a patch which compiles for me using the right tools. More testing
has to wait until tomorrow.

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index a658c9d1154..9ee60feb1f1 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -11,7 +11,6 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[secureboot] = ",,,"
 
 SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
-	file://0001-BaseTools-Force-tools-variables-to-host-toolchain.patch \
 	file://0002-ovmf-update-path-to-native-BaseTools.patch \
 	file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
 	file://VfrCompile-increase-path-length-limit.patch \
@@ -53,8 +52,8 @@ OVMF_SECURE_BOOT_FLAGS = "-DSECURE_BOOT_ENABLE=TRUE ${OVMF_SECURE_BOOT_EXTRA_FLA
 
 do_patch_append_class-native() {
     bb.build.exec_func('do_fix_iasl', d)
-    bb.build.exec_func('do_fix_toolchain', d)
 }
+do_patch[postfuncs] += "do_fix_toolchain"
 
 do_fix_basetools_location() {
     sed -i -e 's#BBAKE_EDK_TOOLS_PATH#${STAGING_BINDIR_NATIVE}/${EDK_TOOLS_DIR}#' ${S}/OvmfPkg/build.sh
@@ -69,13 +68,42 @@ do_fix_iasl() {
     sed -i -e 's#/usr/bin/iasl#${STAGING_BINDIR_NATIVE}/iasl#' ${S}/BaseTools/Conf/tools_def.template
 }
 
-do_fix_toolchain(){
-    sed -i -e 's#DEF(ELFGCC_BIN)/#${TARGET_PREFIX}#' ${S}/BaseTools/Conf/tools_def.template
-    sed -i -e 's#DEF(GCC.*PREFIX)#${TARGET_PREFIX}#' ${S}/BaseTools/Conf/tools_def.template
-    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS += ${BUILD_LDFLAGS}#" ${S}/BaseTools/Source/C/Makefiles/app.makefile
-    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS += ${BUILD_CFLAGS}#" ${S}/BaseTools/Source/C/Makefiles/app.makefile
-    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS += ${BUILD_LDFLAGS}#" ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
-    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS += ${BUILD_CFLAGS}#" ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
+# Inject CC and friends into the build. LINKER already is in GNUmakefile.
+# Must be idempotent and thus remove old assignments that were inserted
+# earlier.
+do_fix_toolchain() {
+    sed -i \
+        -e '/^\(CC\|CXX\|AS\|AR\|LD\|LINKER\) =/d' \
+        -e '/^APPLICATION/a CC = ${CC}\nCXX = ${CXX}\nAS = ${AS}\nAR = ${AR}\nLD = ${LD}\nLINKER = $(CC)' \
+        ${S}/BaseTools/Source/C/Makefiles/app.makefile
+    sed -i \
+        -e '/^\(CC\|CXX\|AS\|AR\|LD\)/d' \
+        -e '/^VFR_CPPFLAGS/a CC = ${CC}\nCXX = ${CXX}\nAS = ${AS}\nAR = ${AR}\nLD = ${LD}' \
+        ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
+}
+do_fix_toolchain_append_class-native() {
+    # This tools_def.template is going to be used by the target ovmf, which uses
+    # the GCC*_BIN env variables to choose the right gcc for the target.
+    # We can't do that here because HOST_PREFIX and TARGET_PREFIX are both
+    # empty in a native recipe.
+    #
+    # However, tools_def.txt also uses the same variable (indirectly) for
+    # finding make, which wouldn't work. So we reduce that to just plain
+    # make without a prefix here.
+    sed -i \
+        -e 's#DEF(GCC.*_PREFIX)make#make#' \
+        ${S}/BaseTools/Conf/tools_def.template
+    sed -i \
+        -e '/^\(LFLAGS\|CFLAGS\) +=/d' \
+        -e '/^LINKER/a LFLAGS += ${BUILD_LDFLAGS}\nCFLAGS += ${BUILD_CFLAGS}' \
+        ${S}/BaseTools/Source/C/Makefiles/app.makefile \
+        ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
+}
+do_fix_toolchain_append_class-target() {
+    sed -i \
+        -e 's#DEF(ELFGCC_BIN)/#${HOST_PREFIX}#' \
+        -e 's#DEF(GCC.*PREFIX)#${HOST_PREFIX}#' \
+        ${S}/BaseTools/Conf/tools_def.template
 }
 
 GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
@@ -129,6 +157,7 @@ do_compile_class-target() {
     fi
     FIXED_GCCVER=$(fixup_target_tools ${GCC_VER})
     bbnote FIXED_GCCVER is ${FIXED_GCCVER}
+    eval "${FIXED_GCCVER}_BIN=${HOST_PREFIX}; export ${FIXED_GCCVER}_BIN"
     build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
 
     bbnote "Building without Secure Boot."


-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




