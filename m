Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3D51F72F7E;
	Tue, 28 Feb 2017 08:58:06 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id u48so4040952wrc.0;
	Tue, 28 Feb 2017 00:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0c8neuTEQJHeOGijNeHwwOJCmBIYXdGrrBS7SVkr/7c=;
	b=RjjGBLvw4Uzr0BLDrysS3bdmxfW85p7vIQRUTsx1EqChexFi2i/x+Xe+c6/TU8YE2B
	g+1MYxUtvgmvYwZ0oina8VyCpEW7qQ3SjoPDzd7mtLTnpoI7ugBZjgbVAaquYd2hnalq
	cxcJLiUlZ25pdEqlSduZ6asDu8s/PteLOxj5w7Z1a/RlwG0lCaJfOXhHDTuZM156qKcF
	w8Uqtym1yXIMJPV+pSWMoowkW7W3wkzCU/ndgNQxn2QsmduvwfcHZDTbX+Yhwil+hgml
	sXXtw1+tWZ6IaOz7ylXWyQL46f5AR1iIDR52ra4OcDf2LSQv9tL0XaHPo3YqotiBTsCd
	l0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0c8neuTEQJHeOGijNeHwwOJCmBIYXdGrrBS7SVkr/7c=;
	b=nwPyg+uClhfr1znNZR+wwDzpvxNqBrO03TxtWx/KZqWZNstyLd6BSA5V7u+M9j323a
	Ymmz3PuuvieLUhVXunCpmIrtNw2JLO8zbY1T5LL0HyyGcGjuKYsmWZQ8kyiX3RECRKPj
	rUJBcucL/dLxXG9zupmbb91WYAoTpc5+Qa/6D23R+CO31pNmRIonKfAPko2u5MyMAzfZ
	qaWLpprjcZ2CZIRVLMSnyNaZc2hjw1V7VvB4rGiwQMhMWkVWOhXAOU6hbxA+OleNAYR+
	t7iABvXX4Rr5qtgshypU4lLoUdqG9gOhhJ3SLyjv9dnXqzIanb5qKRiAOAfsbymBMTAf
	+SgA==
X-Gm-Message-State: AMke39lJjN3yubSWgpVim97e+9PyocG7oIzd6LJBQPL2OUigTUM/zBDQGxgTCJ1ngyxgj1okrXpSQ7SNTTRVSQ==
X-Received: by 10.223.154.149 with SMTP id a21mr1116539wrc.145.1488272287960; 
	Tue, 28 Feb 2017 00:58:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Tue, 28 Feb 2017 00:58:07 -0800 (PST)
In-Reply-To: <o93cl0$sqp$1@blaine.gmane.org>
References: <1488244198-1976-1-git-send-email-california.l.sullivan@intel.com>
	<o93cl0$sqp$1@blaine.gmane.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Feb 2017 09:58:07 +0100
Message-ID: <CA+chaQcMnaTRrfVy-1xz_zHZCH-hQ5NS9pYqsHN_pUPDkHTbLg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] recipes-extended: Move efivar from meta-openembedded to oe-core
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
X-List-Received-Date: Tue, 28 Feb 2017 08:58:07 -0000
Content-Type: multipart/alternative; boundary=f403045f53f20db0c605499365c9

--f403045f53f20db0c605499365c9
Content-Type: text/plain; charset=UTF-8

Agreed with Koen.

Everything outside oe-core is meant to be nice little colorful boxes which
don't depend on each other (as discussed on OEDAM), but whatever intel
needs has to go to oe-core.

> We are aware that this was recently blacklisted in meta-oe, but we were unable
to reproduce the issue under any circumstances.

And it still fails to build and it will continue to fail even from oe-core.

On Tue, Feb 28, 2017 at 9:33 AM, Koen Kooi <koen@dominion.thruhere.net>
wrote:

> Op 28-02-17 om 02:09 schreef California Sullivan:
> > BSPs for platforms using UEFI, such as meta-intel, would like to have
> > this more widely available
>
> I guess you're saying "one less git repo to clone"? I don't think that's a
> good enough reason to move it to OE-core.
>
> > for future support enhancements.
>
> I'm having trouble parsing this, it seems like you're saying that having it
> in meta-oe precludes you from contributing to it?
>
> >
> > This is a direct copy of the recipe from meta-openembedded/meta-oe.
> >
> > Signed-off-by: California Sullivan
> > <california.l.sullivan@intel.com> --- We
> > are aware that this was recently blacklisted in meta-oe, but we were
> > unable to reproduce the issue under any circumstances.
> >
> > .../efivar/0001-efivar-fix-for-cross-compile.patch | 35
> > +++++++++++++++++ .../efivar/efivar/0002-disable-static-build.patch  |
> 33
> > ++++++++++++++++ .../efivar/0003-efivar-fix-for-cross-compile.patch | 44
> > +++++++++++++++++++++ .../0004-fix-unknow-option-for-gold-linker.patch
> > | 38 ++++++++++++++++++ .../allow-multi-definitions-for-native.patch
> > | 23 +++++++++++ .../fix-compile-failure-with-host-gcc-4.6.patch    | 45
> > ++++++++++++++++++++++ meta/recipes-extended/efivar/efivar_0.24.bb
> > | 43 +++++++++++++++++++++ 7 files changed, 261 insertions(+) create mode
> > 100644
> > meta/recipes-extended/efivar/efivar/0001-efivar-fix-for-
> cross-compile.patch
> >
> >
> create mode 100644
> meta/recipes-extended/efivar/efivar/0002-disable-static-build.patch
> > create mode 100644
> > meta/recipes-extended/efivar/efivar/0003-efivar-fix-for-
> cross-compile.patch
> >
> >
> create mode 100644
> meta/recipes-extended/efivar/efivar/0004-fix-unknow-option-
> for-gold-linker.patch
> > create mode 100644
> > meta/recipes-extended/efivar/efivar/allow-multi-
> definitions-for-native.patch
> >
> >
> create mode 100644
> meta/recipes-extended/efivar/efivar/fix-compile-failure-
> with-host-gcc-4.6.patch
> > create mode 100644 meta/recipes-extended/efivar/efivar_0.24.bb
> >
> > diff --git
> > a/meta/recipes-extended/efivar/efivar/0001-efivar-fix-
> for-cross-compile.patch
> > b/meta/recipes-extended/efivar/efivar/0001-efivar-fix-
> for-cross-compile.patch
> >
> >
> new file mode 100644
> > index 0000000..6f6ca64 --- /dev/null +++
> > b/meta/recipes-extended/efivar/efivar/0001-efivar-fix-
> for-cross-compile.patch
> >
> >
> @@ -0,0 +1,35 @@
> > +From 9a3c480af653b37e62d1be04d49fe7a60a80168f Mon Sep 17 00:00:00 2001
> > +From: Kai Kang <kai.kang@windriver.com> +Date:
> > Fri, 25 Sep 2015 18:14:31 +0800 +Subject: [PATCH 1/2] efivar: fix for
> > cross compile + +It builds and calls elf file makeguids to generate a
> > header file which +doesn't work for cross compile. Fix it. +
> > +Signed-off-by: Kai Kang
> > <kai.kang@windriver.com> + +Upstream-Status:
> > Pending +Signed-off-by: Hongxu Jia
> > <hongxu.jia@windriver.com> + +--- +
> > src/Makefile | 4 ++-- + 1 file changed, 2 insertions(+), 2 deletions(-)
> > + +diff --git a/src/Makefile b/src/Makefile +index 5fc7887..1829d22
> > 100644 +--- a/src/Makefile ++++ b/src/Makefile +@@ -29,8 +29,8 @@ all :
> > deps $(TARGETS) + ./guid-symbols.c : include/efivar/efivar-guids.h +
> > ./guids.bin : include/efivar/efivar-guids.h + ./names.bin :
> > include/efivar/efivar-guids.h +-include/efivar/efivar-guids.h :
> makeguids
> > guids.txt +-  ./makeguids guids.txt guids.bin names.bin \
> > ++include/efivar/efivar-guids.h : guids.txt ++        makeguids
> guids.txt
> > guids.bin names.bin \ +               guid-symbols.c
> include/efivar/efivar-guids.h +
> >  + makeguids : CPPFLAGS+=-DEFIVAR_BUILD_ENVIRONMENT +-- +2.4.3 + diff
> > --git
> > a/meta/recipes-extended/efivar/efivar/0002-disable-static-build.patch
> > b/meta/recipes-extended/efivar/efivar/0002-disable-static-build.patch
> new
> > file mode 100644 index 0000000..951b159 --- /dev/null +++
> > b/meta/recipes-extended/efivar/efivar/0002-disable-static-build.patch @@
> > -0,0 +1,33 @@ +From 126e0d3c1ad74cf5b0abe9e98ec444bcc3c83159 Mon Sep 17
> > 00:00:00 2001 +From: Koen Kooi
> > <koen.kooi@linaro.org> +Date: Fri, 4 Mar
> > 2016 14:53:55 +0100 +Subject: [PATCH 2/2] disable static build +
> > +Signed-off-by: Koen Kooi
> > <koen.kooi@linaro.org> + +Upstream-Status:
> > Inappropriate [meta-oe specific] +Signed-off-by: Hongxu Jia
> > <hongxu.jia@windriver.com> + +--- +
> > src/Makefile | 4 ++-- + 1 file changed, 2 insertions(+), 2 deletions(-)
> > + +diff --git a/src/Makefile b/src/Makefile +index 1829d22..c7a0ca3
> > 100644 +--- a/src/Makefile ++++ b/src/Makefile +@@ -8,9 +8,9 @@ include
> > $(TOPDIR)/Make.defaults + + LIBTARGETS=libefivar.so libefiboot.so +
> > STATICLIBTARGETS=libefivar.a libefiboot.a +-BINTARGETS=efivar
> > efivar-static ++BINTARGETS=efivar + PCTARGETS=efivar.pc efiboot.pc
> > +-TARGETS=$(LIBTARGETS) $(STATICLIBTARGETS) $(BINTARGETS) $(PCTARGETS)
> > ++TARGETS=$(LIBTARGETS) $(BINTARGETS) $(PCTARGETS) + + LIBEFIBOOT_SOURCES
> > = crc32.c creator.c disk.c gpt.c linux.c loadopt.c + LIBEFIBOOT_OBJECTS =
> > $(patsubst %.c,%.o,$(LIBEFIBOOT_SOURCES)) +-- +2.4.3 + diff --git
> > a/meta/recipes-extended/efivar/efivar/0003-efivar-fix-
> for-cross-compile.patch
> > b/meta/recipes-extended/efivar/efivar/0003-efivar-fix-
> for-cross-compile.patch
> >
> >
> new file mode 100644
> > index 0000000..3f43f2a --- /dev/null +++
> > b/meta/recipes-extended/efivar/efivar/0003-efivar-fix-
> for-cross-compile.patch
> >
> >
> @@ -0,0 +1,44 @@
> > +From 7ead29ca6bb5e280ae07551cc3521281ecf73682 Mon Sep 17 00:00:00 2001
> > +From: Hongxu Jia <hongxu.jia@windriver.com>
> > +Date: Sat, 7 May 2016 02:06:47 -0400 +Subject: [PATCH] Makefile: fix
> > efivar.pc not found + +It fixes efivar.pc not found: +... +| install -d
> > -m 755 efivar/0.23-r0/image/usr/lib/pkgconfig/ +| install -m 644
> > efivar.pc efivar/0.23-r0/image/usr/lib/pkgconfig/ +;  install -m 644
> > efiboot.pc efivar/0.23-r0/image/usr/lib/pkgconfig/ +; +| install: cannot
> > stat 'efivar.pc': No such file or directory +| install: cannot stat
> > 'efiboot.pc': No such file or directory +| make[1]: *** [install] Error
> > 1 +| make[1]: Leaving directory `efivar/0.23-r0/git/src' +| make: ***
> > [install] Error 2 +| ERROR: oe_runmake failed +... + +Upstream-Status:
> > Pending + +Signed-off-by: Hongxu Jia
> > <hongxu.jia@windriver.com> +--- + src/Makefile
> > | 4 +++- + 1 file changed, 3 insertions(+), 1 deletion(-) + +diff --git
> > a/src/Makefile b/src/Makefile +index c7a0ca3..ad9c427 100644 +---
> > a/src/Makefile ++++ b/src/Makefile +@@ -78,7 +78,9 @@ install : all +
> > ln -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x).$(MAJOR_VERSION);\ +
>       ln
> > -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x); ) +     $(INSTALL) -d -m
> 755
> > $(DESTDIR)$(PCDIR) +- $(foreach x, $(PCTARGETS), $(INSTALL) -m 644 $(x)
> > $(DESTDIR)$(PCDIR) ;) ++      $(foreach x, $(PCTARGETS), $(INSTALL) -m
> 644
> > $(TOPDIR)/src/$(x).in $(DESTDIR)$(PCDIR)/$(x) ;\ ++           sed -i -e
> > "s:@@LIBDIR@@:$(libdir):g" -e "s:@@VERSION@@:$(VERSION):g" \ ++
> > $(DESTDIR)$(PCDIR)/$(x); ) +  $(INSTALL) -d -m 755
> > $(DESTDIR)$(includedir)/efivar +      $(foreach x, $(wildcard
> > $(TOPDIR)/src/include/efivar/*.h), $(INSTALL) -m 644 $(x)
> > $(DESTDIR)$(includedir)/efivar/$(notdir $(x));) +     $(INSTALL) -d -m
> 755
> > $(DESTDIR)$(bindir) +-- +2.8.1 + diff --git
> > a/meta/recipes-extended/efivar/efivar/0004-fix-unknow-
> option-for-gold-linker.patch
> > b/meta/recipes-extended/efivar/efivar/0004-fix-unknow-
> option-for-gold-linker.patch
> >
> >
> new file mode 100644
> > index 0000000..5d50c19 --- /dev/null +++
> > b/meta/recipes-extended/efivar/efivar/0004-fix-unknow-
> option-for-gold-linker.patch
> >
> >
> @@ -0,0 +1,38 @@
> > +From b3d35e7dd27a755df5acbe050837885914dbb28b Mon Sep 17 00:00:00 2001
> > +From: Hongxu Jia <hongxu.jia@windriver.com>
> > +Date: Tue, 10 May 2016 11:34:50 -0400 +Subject: [PATCH]  fix unknow
> > option for gold linker + +- Revert the following patch, since oe-core
> > work with gcc 5 +... +commit 3055a3797f16693dfdd855fa68bc57fd900dc408
> > +Author: Peter Jones <pjones@redhat.com>
> > +Date:   Mon Feb 15 14:15:40 2016 -0500 + +    Make gcc.specs work with
> > gcc 6 / binutils 2.26 + +    Apparently binutils 2.26 gets real picky
> > about "ld -PIC" vs "ld -fPIC". + +    Signed-off-by: Peter Jones
> > <pjones@redhat.com> +... + +- Remove unknown
> > option '--add-needed' + +Signed-off-by: Hongxu Jia
> > <hongxu.jia@windriver.com> +--- + gcc.specs | 2
> > +- + 1 file changed, 1 insertion(+), 1 deletion(-) + +diff --git
> > a/gcc.specs b/gcc.specs +index 24fabc2..5b0fdef 100644 +--- a/gcc.specs
> > ++++ b/gcc.specs +@@ -14,4 +14,4 @@ + + %{!shared:%{!static:%{!r:-pie}}}
> > %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now}
> > + + *link: +-+ %{!static:--fatal-warnings} --no-undefined-version
> > --no-allow-shlib-undefined --add-needed -z now --build-id
> > %{!static:%{!shared:-PIE}} %{shared:-z relro -PIC} %{static:%<pie} +++
> > %{!static:--fatal-warnings} --no-undefined-version
> > --no-allow-shlib-undefined -z now --build-id %{!static:%{!shared:-pie}}
> > %{shared:-z relro -fPIC} %{static:%<pie} +-- +2.8.1 + diff --git
> > a/meta/recipes-extended/efivar/efivar/allow-multi-
> definitions-for-native.patch
> > b/meta/recipes-extended/efivar/efivar/allow-multi-
> definitions-for-native.patch
> >
> >
> new file mode 100644
> > index 0000000..87f5555 --- /dev/null +++
> > b/meta/recipes-extended/efivar/efivar/allow-multi-
> definitions-for-native.patch
> >
> >
> @@ -0,0 +1,23 @@
> > +Upstream-Status: Pending + +It fails to create .so file when build
> > efivar-native: + +| lib.o:(*IND*+0x0): multiple definition of
> > `efi_set_variable' +| lib.o:lib.c:(.text+0xa0): first defined here + +Add
> > link option '-z muldefs' to fix it. + +Signed-off-by: Kai Kang
> > <kai.kang@windriver.com> +--- +diff --git
> > a/Make.rules b/Make.rules +index d9c0609..874bce0 100644 +---
> > a/Make.rules ++++ b/Make.rules +@@ -20,6 +20,7 @@ include
> > $(TOPDIR)/Make.version +      $(CCLD) $(ccldflags) $(CPPFLAGS)
> $(SOFLAGS) \ +
> > -Wl,-soname,$@.$(MAJOR_VERSION) \ +     -Wl,--version-script=$(MAP) \ ++
> > -Wl,-z,muldefs \ +      -o $@ $^ $(LDLIBS) + + %.o : %.c diff --git
> > a/meta/recipes-extended/efivar/efivar/fix-compile-
> failure-with-host-gcc-4.6.patch
> > b/meta/recipes-extended/efivar/efivar/fix-compile-
> failure-with-host-gcc-4.6.patch
> >
> >
> new file mode 100644
> > index 0000000..1c68a29 --- /dev/null +++
> > b/meta/recipes-extended/efivar/efivar/fix-compile-
> failure-with-host-gcc-4.6.patch
> >
> >
> @@ -0,0 +1,45 @@
> > +From 1361225abbaba878960f970df39a4570bbc39553 Mon Sep 17 00:00:00 2001
> > +From: Hongxu Jia <hongxu.jia@windriver.com>
> > +Date: Thu, 26 May 2016 21:50:01 -0400 +Subject: [PATCH] fix compile
> > failure with older host gcc (<=4.6) + +While host gcc version is 4.6.3 in
> > ubuntu 1204, it +did not recognize -std=gnu11 and -Wmaybe-uninitialized.
> > + +While host gcc version is 4.4.7 in centos6, it +did not recognize
> > -std=gnu11, -Wmaybe-uninitialized, +and -flto. + +For native build, use
> > -std=gnu99 to replace -std=gnu11, +and directly remove
> > -Wmaybe-uninitialized and -flto. + +Upstream-Status: Pending +
> > +Signed-off-by: Hongxu Jia
> > <hongxu.jia@windriver.com> +--- + gcc.specs | 4
> > ++-- + 1 file changed, 2 insertions(+), 2 deletions(-) + +diff --git
> > a/gcc.specs b/gcc.specs +index 0d4bbda..3802ca6 100644 +--- a/gcc.specs
> > ++++ b/gcc.specs +@@ -2,13 +2,13 @@ + + -D_GNU_SOURCE + +
> > *efivar_cpp_options: +- -Werror -Wall -std=gnu11 -Wextra ++ -Werror -Wall
> > -std=gnu99 -Wextra + + *cpp_options: + + %(efivar_cpp_options) + +
> > *cc1_options: +-+ %(efivar_cpp_options) -Wmaybe-uninitialized
> > -fno-merge-constants -flto -fvisibility=hidden
> > %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}} +++
> > %(efivar_cpp_options) -fno-merge-constants -fvisibility=hidden
> > %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}} + +
> > *self_spec: + + %{!shared:%{!static:%{!r:-pie}}}
> > %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now}
> > +-- +2.8.1 + diff --git a/meta/recipes-extended/efivar/efivar_0.24.bb
> > b/meta/recipes-extended/efivar/efivar_0.24.bb new file mode 100644 index
> > 0000000..efffde5 --- /dev/null +++
> > b/meta/recipes-extended/efivar/efivar_0.24.bb @@ -0,0 +1,43 @@ +SUMMARY
> =
> > "Tools to manipulate UEFI variables" +DESCRIPTION = "efivar provides a
> > simple command line interface to the UEFI variable facility" +HOMEPAGE =
> > "https://github.com/rhinstaller/efivar" + +LICENSE = "LGPLv2.1"
> > +LIC_FILES_CHKSUM =
> > "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393" + +DEPENDS =
> > "popt" +DEPENDS_append_class-target = " efivar-native" + +COMPATIBLE_HOST
> > = "(i.86|x86_64|arm|aarch64).*-linux" + +SRCREV =
> > "963cb2e5adc145fe00717f94e382f2973f80e753" +SRC_URI =
> > "git://github.com/rhinstaller/efivar.git \ +
> > file://0002-disable-static-build.patch \ +" +SRC_URI_append_class-target
> > = " file://0001-efivar-fix-for-cross-compile.patch \ +
> > file://0003-efivar-fix-for-cross-compile.patch \ +
> > ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> > 'file://0004-fix-unknow-option-for-gold-linker.patch', '', d)} \ +
> > " +SRC_URI_append_class-native = "
> > file://fix-compile-failure-with-host-gcc-4.6.patch \ +
> > file://allow-multi-definitions-for-native.patch \ +
> > " + +S = "${WORKDIR}/git" + +# Setting CROSS_COMPILE breaks pkgconfig, so
> > just set AR +EXTRA_OEMAKE = "AR=${TARGET_PREFIX}gcc-ar" +
> > +do_compile_prepend() { +    sed -i -e s:-Werror::g ${S}/gcc.specs +} +
> > +do_install() { +    oe_runmake install DESTDIR=${D} +} +
> > +do_install_append_class-native() { +    install -D -m 0755
> > ${B}/src/makeguids ${D}${bindir}/makeguids +} + +BBCLASSEXTEND =
> > "native" +
> >
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045f53f20db0c605499365c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Agreed with Koen.<div><br></div><div>Everything outside oe=
-core is meant to be nice little colorful boxes which don&#39;t depend on e=
ach other (as discussed on OEDAM), but whatever intel needs has to go to oe=
-core.</div><div><br></div><div>&gt;=C2=A0<span style=3D"font-size:12.8px">=
We are aware that this was recently blacklisted in meta-oe, but we were=C2=
=A0</span><span style=3D"font-size:12.8px">unable to reproduce the issue un=
der any circumstances.</span></div><div><span style=3D"font-size:12.8px"><b=
r></span><div>And it still fails to build and it will continue to fail even=
 from oe-core.</div></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Tue, Feb 28, 2017 at 9:33 AM, Koen Kooi <span dir=3D"lt=
r">&lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=3D"_blank">koen=
@dominion.thruhere.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Op 28-02-17 om 02:09 schreef California Sullivan:<br>
<span class=3D"">&gt; BSPs for platforms using UEFI, such as meta-intel, wo=
uld like to have<br>
&gt; this more widely available<br>
<br>
</span>I guess you&#39;re saying &quot;one less git repo to clone&quot;? I =
don&#39;t think that&#39;s a<br>
good enough reason to move it to OE-core.<br>
<br>
&gt; for future support enhancements.<br>
<br>
I&#39;m having trouble parsing this, it seems like you&#39;re saying that h=
aving it<br>
in meta-oe precludes you from contributing to it?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; This is a direct copy of the recipe from meta-openembedded/meta-oe.<br=
>
&gt;<br>
&gt; Signed-off-by: California Sullivan<br>
&gt; &lt;<a href=3D"mailto:california.l.sullivan@intel.com">california.l.su=
llivan@intel.<wbr>com</a>&gt; --- We<br>
&gt; are aware that this was recently blacklisted in meta-oe, but we were<b=
r>
&gt; unable to reproduce the issue under any circumstances.<br>
&gt;<br>
&gt; .../efivar/0001-efivar-fix-<wbr>for-cross-compile.patch | 35<br>
&gt; +++++++++++++++++ .../efivar/efivar/0002-<wbr>disable-static-build.pat=
ch=C2=A0 | 33<br>
&gt; ++++++++++++++++ .../efivar/0003-efivar-fix-<wbr>for-cross-compile.pat=
ch | 44<br>
&gt; +++++++++++++++++++++ .../0004-fix-unknow-option-<wbr>for-gold-linker.=
patch<br>
&gt; | 38 ++++++++++++++++++ .../allow-multi-definitions-<wbr>for-native.pa=
tch<br>
&gt; | 23 +++++++++++ .../fix-compile-failure-with-<wbr>host-gcc-4.6.patch=
=C2=A0 =C2=A0 | 45<br>
&gt; ++++++++++++++++++++++ meta/recipes-extended/efivar/<a href=3D"http://=
efivar_0.24.bb" rel=3D"noreferrer" target=3D"_blank">e<wbr>fivar_0.24.bb</a=
><br>
&gt; | 43 +++++++++++++++++++++ 7 files changed, 261 insertions(+) create m=
ode<br>
&gt; 100644<br>
&gt; meta/recipes-extended/efivar/<wbr>efivar/0001-efivar-fix-for-<wbr>cros=
s-compile.patch<br>
&gt;<br>
&gt;<br>
create mode 100644<br>
meta/recipes-extended/efivar/<wbr>efivar/0002-disable-static-<wbr>build.pat=
ch<br>
&gt; create mode 100644<br>
&gt; meta/recipes-extended/efivar/<wbr>efivar/0003-efivar-fix-for-<wbr>cros=
s-compile.patch<br>
&gt;<br>
&gt;<br>
create mode 100644<br>
meta/recipes-extended/efivar/<wbr>efivar/0004-fix-unknow-option-<wbr>for-go=
ld-linker.patch<br>
&gt; create mode 100644<br>
&gt; meta/recipes-extended/efivar/<wbr>efivar/allow-multi-<wbr>definitions-=
for-native.patch<br>
&gt;<br>
&gt;<br>
create mode 100644<br>
meta/recipes-extended/efivar/<wbr>efivar/fix-compile-failure-<wbr>with-host=
-gcc-4.6.patch<br>
&gt; create mode 100644 meta/recipes-extended/efivar/<a href=3D"http://efiv=
ar_0.24.bb" rel=3D"noreferrer" target=3D"_blank">e<wbr>fivar_0.24.bb</a><br=
>
&gt;<br>
&gt; diff --git<br>
&gt; a/meta/recipes-extended/<wbr>efivar/efivar/0001-efivar-fix-<wbr>for-cr=
oss-compile.patch<br>
&gt; b/meta/recipes-extended/<wbr>efivar/efivar/0001-efivar-fix-<wbr>for-cr=
oss-compile.patch<br>
&gt;<br>
&gt;<br>
new file mode 100644<br>
&gt; index 0000000..6f6ca64 --- /dev/null +++<br>
&gt; b/meta/recipes-extended/<wbr>efivar/efivar/0001-efivar-fix-<wbr>for-cr=
oss-compile.patch<br>
&gt;<br>
&gt;<br>
@@ -0,0 +1,35 @@<br>
&gt; +From 9a3c480af653b37e62d1be04d49fe7<wbr>a60a80168f Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.kang=
@windriver.com</a>&gt; +Date:<br>
&gt; Fri, 25 Sep 2015 18:14:31 +0800 +Subject: [PATCH 1/2] efivar: fix for<=
br>
&gt; cross compile + +It builds and calls elf file makeguids to generate a<=
br>
&gt; header file which +doesn&#39;t work for cross compile. Fix it. +<br>
&gt; +Signed-off-by: Kai Kang<br>
&gt; &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.kang@windriver.com</=
a>&gt; + +Upstream-Status:<br>
&gt; Pending +Signed-off-by: Hongxu Jia<br>
&gt; &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.c=
om</a>&gt; + +--- +<br>
&gt; src/Makefile | 4 ++-- + 1 file changed, 2 insertions(+), 2 deletions(-=
)<br>
&gt; + +diff --git a/src/Makefile b/src/Makefile +index 5fc7887..1829d22<br=
>
&gt; 100644 +--- a/src/Makefile ++++ b/src/Makefile +@@ -29,8 +29,8 @@ all =
:<br>
&gt; deps $(TARGETS) + ./guid-symbols.c : include/efivar/efivar-guids.h +<b=
r>
&gt; ./guids.bin : include/efivar/efivar-guids.h + ./names.bin :<br>
&gt; include/efivar/efivar-guids.h +-include/efivar/efivar-guids.<wbr>h : m=
akeguids<br>
&gt; guids.txt +-=C2=A0 ./makeguids guids.txt guids.bin names.bin \<br>
&gt; ++include/efivar/efivar-guids.<wbr>h : guids.txt ++=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 makeguids guids.txt<br>
&gt; guids.bin names.bin \ +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0guid-symbols.c include/efivar/efivar-guids.h +<br>
&gt;=C2=A0 + makeguids : CPPFLAGS+=3D-DEFIVAR_BUILD_<wbr>ENVIRONMENT +-- +2=
.4.3 + diff<br>
&gt; --git<br>
&gt; a/meta/recipes-extended/<wbr>efivar/efivar/0002-disable-<wbr>static-bu=
ild.patch<br>
&gt; b/meta/recipes-extended/<wbr>efivar/efivar/0002-disable-<wbr>static-bu=
ild.patch new<br>
&gt; file mode 100644 index 0000000..951b159 --- /dev/null +++<br>
&gt; b/meta/recipes-extended/<wbr>efivar/efivar/0002-disable-<wbr>static-bu=
ild.patch @@<br>
&gt; -0,0 +1,33 @@ +From 126e0d3c1ad74cf5b0abe9e98ec444<wbr>bcc3c83159 Mon =
Sep 17<br>
&gt; 00:00:00 2001 +From: Koen Kooi<br>
&gt; &lt;<a href=3D"mailto:koen.kooi@linaro.org">koen.kooi@linaro.org</a>&g=
t; +Date: Fri, 4 Mar<br>
&gt; 2016 14:53:55 +0100 +Subject: [PATCH 2/2] disable static build +<br>
&gt; +Signed-off-by: Koen Kooi<br>
&gt; &lt;<a href=3D"mailto:koen.kooi@linaro.org">koen.kooi@linaro.org</a>&g=
t; + +Upstream-Status:<br>
&gt; Inappropriate [meta-oe specific] +Signed-off-by: Hongxu Jia<br>
&gt; &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.c=
om</a>&gt; + +--- +<br>
&gt; src/Makefile | 4 ++-- + 1 file changed, 2 insertions(+), 2 deletions(-=
)<br>
&gt; + +diff --git a/src/Makefile b/src/Makefile +index 1829d22..c7a0ca3<br=
>
&gt; 100644 +--- a/src/Makefile ++++ b/src/Makefile +@@ -8,9 +8,9 @@ includ=
e<br>
&gt; $(TOPDIR)/Make.defaults + + LIBTARGETS=3Dlibefivar.so libefiboot.so +<=
br>
&gt; STATICLIBTARGETS=3Dlibefivar.a libefiboot.a +-BINTARGETS=3Defivar<br>
&gt; efivar-static ++BINTARGETS=3Defivar + PCTARGETS=3Defivar.pc efiboot.pc=
<br>
&gt; +-TARGETS=3D$(LIBTARGETS) $(STATICLIBTARGETS) $(BINTARGETS) $(PCTARGET=
S)<br>
&gt; ++TARGETS=3D$(LIBTARGETS) $(BINTARGETS) $(PCTARGETS) + + LIBEFIBOOT_SO=
URCES<br>
&gt; =3D crc32.c creator.c disk.c gpt.c linux.c loadopt.c + LIBEFIBOOT_OBJE=
CTS =3D<br>
&gt; $(patsubst %.c,%.o,$(LIBEFIBOOT_SOURCES)) +-- +2.4.3 + diff --git<br>
&gt; a/meta/recipes-extended/<wbr>efivar/efivar/0003-efivar-fix-<wbr>for-cr=
oss-compile.patch<br>
&gt; b/meta/recipes-extended/<wbr>efivar/efivar/0003-efivar-fix-<wbr>for-cr=
oss-compile.patch<br>
&gt;<br>
&gt;<br>
new file mode 100644<br>
&gt; index 0000000..3f43f2a --- /dev/null +++<br>
&gt; b/meta/recipes-extended/<wbr>efivar/efivar/0003-efivar-fix-<wbr>for-cr=
oss-compile.patch<br>
&gt;<br>
&gt;<br>
@@ -0,0 +1,44 @@<br>
&gt; +From 7ead29ca6bb5e280ae07551cc35212<wbr>81ecf73682 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hong=
xu.jia@windriver.com</a>&gt;<br>
&gt; +Date: Sat, 7 May 2016 02:06:47 -0400 +Subject: [PATCH] Makefile: fix<=
br>
&gt; efivar.pc not found + +It fixes efivar.pc not found: +... +| install -=
d<br>
&gt; -m 755 efivar/0.23-r0/image/usr/lib/<wbr>pkgconfig/ +| install -m 644<=
br>
&gt; efivar.pc efivar/0.23-r0/image/usr/lib/<wbr>pkgconfig/ +;=C2=A0 instal=
l -m 644<br>
&gt; efiboot.pc efivar/0.23-r0/image/usr/lib/<wbr>pkgconfig/ +; +| install:=
 cannot<br>
&gt; stat &#39;efivar.pc&#39;: No such file or directory +| install: cannot=
 stat<br>
&gt; &#39;efiboot.pc&#39;: No such file or directory +| make[1]: *** [insta=
ll] Error<br>
&gt; 1 +| make[1]: Leaving directory `efivar/0.23-r0/git/src&#39; +| make: =
***<br>
&gt; [install] Error 2 +| ERROR: oe_runmake failed +... + +Upstream-Status:=
<br>
&gt; Pending + +Signed-off-by: Hongxu Jia<br>
&gt; &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.c=
om</a>&gt; +--- + src/Makefile<br>
&gt; | 4 +++- + 1 file changed, 3 insertions(+), 1 deletion(-) + +diff --gi=
t<br>
&gt; a/src/Makefile b/src/Makefile +index c7a0ca3..ad9c427 100644 +---<br>
&gt; a/src/Makefile ++++ b/src/Makefile +@@ -78,7 +78,9 @@ install : all +<=
br>
&gt; ln -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x).$(<wbr>MAJOR_VERSION);=
\ +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln<br>
&gt; -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x); ) +=C2=A0 =C2=A0 =C2=A0$=
(INSTALL) -d -m 755<br>
&gt; $(DESTDIR)$(PCDIR) +- $(foreach x, $(PCTARGETS), $(INSTALL) -m 644 $(x=
)<br>
&gt; $(DESTDIR)$(PCDIR) ;) ++=C2=A0 =C2=A0 =C2=A0 $(foreach x, $(PCTARGETS)=
, $(INSTALL) -m 644<br>
&gt; $(TOPDIR)/src/$(x).in $(DESTDIR)$(PCDIR)/$(x) ;\ ++=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e<br>
&gt; &quot;s:@@LIBDIR@@:$(libdir):g&quot; -e &quot;s:@@VERSION@@:$(VERSION)=
:g&quot; \ ++<br>
&gt; $(DESTDIR)$(PCDIR)/$(x); ) +=C2=A0 $(INSTALL) -d -m 755<br>
&gt; $(DESTDIR)$(includedir)/efivar +=C2=A0 =C2=A0 =C2=A0 $(foreach x, $(wi=
ldcard<br>
&gt; $(TOPDIR)/src/include/efivar/*<wbr>.h), $(INSTALL) -m 644 $(x)<br>
&gt; $(DESTDIR)$(includedir)/<wbr>efivar/$(notdir $(x));) +=C2=A0 =C2=A0 =
=C2=A0$(INSTALL) -d -m 755<br>
&gt; $(DESTDIR)$(bindir) +-- +2.8.1 + diff --git<br>
&gt; a/meta/recipes-extended/<wbr>efivar/efivar/0004-fix-unknow-<wbr>option=
-for-gold-linker.patch<br>
&gt; b/meta/recipes-extended/<wbr>efivar/efivar/0004-fix-unknow-<wbr>option=
-for-gold-linker.patch<br>
&gt;<br>
&gt;<br>
new file mode 100644<br>
&gt; index 0000000..5d50c19 --- /dev/null +++<br>
&gt; b/meta/recipes-extended/<wbr>efivar/efivar/0004-fix-unknow-<wbr>option=
-for-gold-linker.patch<br>
&gt;<br>
&gt;<br>
@@ -0,0 +1,38 @@<br>
&gt; +From b3d35e7dd27a755df5acbe05083788<wbr>5914dbb28b Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hong=
xu.jia@windriver.com</a>&gt;<br>
&gt; +Date: Tue, 10 May 2016 11:34:50 -0400 +Subject: [PATCH]=C2=A0 fix unk=
now<br>
&gt; option for gold linker + +- Revert the following patch, since oe-core<=
br>
&gt; work with gcc 5 +... +commit 3055a3797f16693dfdd855fa68bc57<wbr>fd900d=
c408<br>
&gt; +Author: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com">pjones@r=
edhat.com</a>&gt;<br>
&gt; +Date:=C2=A0 =C2=A0Mon Feb 15 14:15:40 2016 -0500 + +=C2=A0 =C2=A0 Mak=
e gcc.specs work with<br>
&gt; gcc 6 / binutils 2.26 + +=C2=A0 =C2=A0 Apparently binutils 2.26 gets r=
eal picky<br>
&gt; about &quot;ld -PIC&quot; vs &quot;ld -fPIC&quot;. + +=C2=A0 =C2=A0 Si=
gned-off-by: Peter Jones<br>
&gt; &lt;<a href=3D"mailto:pjones@redhat.com">pjones@redhat.com</a>&gt; +..=
. + +- Remove unknown<br>
&gt; option &#39;--add-needed&#39; + +Signed-off-by: Hongxu Jia<br>
&gt; &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.c=
om</a>&gt; +--- + gcc.specs | 2<br>
&gt; +- + 1 file changed, 1 insertion(+), 1 deletion(-) + +diff --git<br>
&gt; a/gcc.specs b/gcc.specs +index 24fabc2..5b0fdef 100644 +--- a/gcc.spec=
s<br>
&gt; ++++ b/gcc.specs +@@ -14,4 +14,4 @@ + + %{!shared:%{!static:%{!r:-pie}=
<wbr>}}<br>
&gt; %{static:-Wl,-no-fatal-<wbr>warnings -Wl,-static -static -Wl,-z,relro,=
-z,now}<br>
&gt; + + *link: +-+ %{!static:--fatal-warnings} --no-undefined-version<br>
&gt; --no-allow-shlib-undefined --add-needed -z now --build-id<br>
&gt; %{!static:%{!shared:-PIE}} %{shared:-z relro -PIC} %{static:%&lt;pie} =
+++<br>
&gt; %{!static:--fatal-warnings} --no-undefined-version<br>
&gt; --no-allow-shlib-undefined -z now --build-id %{!static:%{!shared:-pie}=
}<br>
&gt; %{shared:-z relro -fPIC} %{static:%&lt;pie} +-- +2.8.1 + diff --git<br=
>
&gt; a/meta/recipes-extended/<wbr>efivar/efivar/allow-multi-<wbr>definition=
s-for-native.patch<br>
&gt; b/meta/recipes-extended/<wbr>efivar/efivar/allow-multi-<wbr>definition=
s-for-native.patch<br>
&gt;<br>
&gt;<br>
new file mode 100644<br>
&gt; index 0000000..87f5555 --- /dev/null +++<br>
&gt; b/meta/recipes-extended/<wbr>efivar/efivar/allow-multi-<wbr>definition=
s-for-native.patch<br>
&gt;<br>
&gt;<br>
@@ -0,0 +1,23 @@<br>
&gt; +Upstream-Status: Pending + +It fails to create .so file when build<br=
>
&gt; efivar-native: + +| lib.o:(*IND*+0x0): multiple definition of<br>
&gt; `efi_set_variable&#39; +| lib.o:lib.c:(.text+0xa0): first defined here=
 + +Add<br>
&gt; link option &#39;-z muldefs&#39; to fix it. + +Signed-off-by: Kai Kang=
<br>
&gt; &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.kang@windriver.com</=
a>&gt; +--- +diff --git<br>
&gt; a/Make.rules b/Make.rules +index d9c0609..874bce0 100644 +---<br>
&gt; a/Make.rules ++++ b/Make.rules +@@ -20,6 +20,7 @@ include<br>
&gt; $(TOPDIR)/Make.version +=C2=A0 =C2=A0 =C2=A0 $(CCLD) $(ccldflags) $(CP=
PFLAGS) $(SOFLAGS) \ +<br>
&gt; -Wl,-soname,$@.$(MAJOR_<wbr>VERSION) \ +=C2=A0 =C2=A0 =C2=A0-Wl,--vers=
ion-script=3D$(MAP) \ ++<br>
&gt; -Wl,-z,muldefs \ +=C2=A0 =C2=A0 =C2=A0 -o $@ $^ $(LDLIBS) + + %.o : %.=
c diff --git<br>
&gt; a/meta/recipes-extended/<wbr>efivar/efivar/fix-compile-<wbr>failure-wi=
th-host-gcc-4.6.<wbr>patch<br>
&gt; b/meta/recipes-extended/<wbr>efivar/efivar/fix-compile-<wbr>failure-wi=
th-host-gcc-4.6.<wbr>patch<br>
&gt;<br>
&gt;<br>
new file mode 100644<br>
&gt; index 0000000..1c68a29 --- /dev/null +++<br>
&gt; b/meta/recipes-extended/<wbr>efivar/efivar/fix-compile-<wbr>failure-wi=
th-host-gcc-4.6.<wbr>patch<br>
&gt;<br>
&gt;<br>
@@ -0,0 +1,45 @@<br>
&gt; +From 1361225abbaba878960f970df39a45<wbr>70bbc39553 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hong=
xu.jia@windriver.com</a>&gt;<br>
&gt; +Date: Thu, 26 May 2016 21:50:01 -0400 +Subject: [PATCH] fix compile<b=
r>
&gt; failure with older host gcc (&lt;=3D4.6) + +While host gcc version is =
4.6.3 in<br>
&gt; ubuntu 1204, it +did not recognize -std=3Dgnu11 and -Wmaybe-uninitiali=
zed.<br>
&gt; + +While host gcc version is 4.4.7 in centos6, it +did not recognize<b=
r>
&gt; -std=3Dgnu11, -Wmaybe-uninitialized, +and -flto. + +For native build, =
use<br>
&gt; -std=3Dgnu99 to replace -std=3Dgnu11, +and directly remove<br>
&gt; -Wmaybe-uninitialized and -flto. + +Upstream-Status: Pending +<br>
&gt; +Signed-off-by: Hongxu Jia<br>
&gt; &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.c=
om</a>&gt; +--- + gcc.specs | 4<br>
&gt; ++-- + 1 file changed, 2 insertions(+), 2 deletions(-) + +diff --git<b=
r>
&gt; a/gcc.specs b/gcc.specs +index 0d4bbda..3802ca6 100644 +--- a/gcc.spec=
s<br>
&gt; ++++ b/gcc.specs +@@ -2,13 +2,13 @@ + + -D_GNU_SOURCE + +<br>
&gt; *efivar_cpp_options: +- -Werror -Wall -std=3Dgnu11 -Wextra ++ -Werror =
-Wall<br>
&gt; -std=3Dgnu99 -Wextra + + *cpp_options: + + %(efivar_cpp_options) + +<b=
r>
&gt; *cc1_options: +-+ %(efivar_cpp_options) -Wmaybe-uninitialized<br>
&gt; -fno-merge-constants -flto -fvisibility=3Dhidden<br>
&gt; %{!r:%{!fpie:%{!fPIE:%{!fpic:%<wbr>{!fPIC:%{!fno-pic:-fPIE}}}}}} +++<b=
r>
&gt; %(efivar_cpp_options) -fno-merge-constants -fvisibility=3Dhidden<br>
&gt; %{!r:%{!fpie:%{!fPIE:%{!fpic:%<wbr>{!fPIC:%{!fno-pic:-fPIE}}}}}} + +<b=
r>
&gt; *self_spec: + + %{!shared:%{!static:%{!r:-pie}<wbr>}}<br>
&gt; %{static:-Wl,-no-fatal-<wbr>warnings -Wl,-static -static -Wl,-z,relro,=
-z,now}<br>
&gt; +-- +2.8.1 + diff --git a/meta/recipes-extended/<wbr>efivar/<a href=3D=
"http://efivar_0.24.bb" rel=3D"noreferrer" target=3D"_blank">efivar_0.24.bb=
</a><br>
&gt; b/meta/recipes-extended/<wbr>efivar/<a href=3D"http://efivar_0.24.bb" =
rel=3D"noreferrer" target=3D"_blank">efivar_0.24.bb</a> new file mode 10064=
4 index<br>
&gt; 0000000..efffde5 --- /dev/null +++<br>
&gt; b/meta/recipes-extended/<wbr>efivar/<a href=3D"http://efivar_0.24.bb" =
rel=3D"noreferrer" target=3D"_blank">efivar_0.24.bb</a> @@ -0,0 +1,43 @@ +S=
UMMARY =3D<br>
&gt; &quot;Tools to manipulate UEFI variables&quot; +DESCRIPTION =3D &quot;=
efivar provides a<br>
&gt; simple command line interface to the UEFI variable facility&quot; +HOM=
EPAGE =3D<br>
&gt; &quot;<a href=3D"https://github.com/rhinstaller/efivar" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/<wbr>rhinstaller/efivar</a>&quot;=
 + +LICENSE =3D &quot;LGPLv2.1&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://COPYING;md5=3D<wbr>6626bb1e20189cfa95f2c508ba2863<wbr>93&=
quot; + +DEPENDS =3D<br>
&gt; &quot;popt&quot; +DEPENDS_append_class-target =3D &quot; efivar-native=
&quot; + +COMPATIBLE_HOST<br>
&gt; =3D &quot;(i.86|x86_64|arm|aarch64).*-<wbr>linux&quot; + +SRCREV =3D<b=
r>
&gt; &quot;<wbr>963cb2e5adc145fe00717f94e382f2<wbr>973f80e753&quot; +SRC_UR=
I =3D<br>
&gt; &quot;git://<a href=3D"http://github.com/rhinstaller/efivar.git" rel=
=3D"noreferrer" target=3D"_blank">github.com/rhinstaller/<wbr>efivar.git</a=
> \ +<br>
&gt; file://0002-disable-static-<wbr>build.patch \ +&quot; +SRC_URI_append_=
class-target<br>
&gt; =3D &quot; file://0001-efivar-fix-for-<wbr>cross-compile.patch \ +<br>
&gt; file://0003-efivar-fix-for-<wbr>cross-compile.patch \ +<br>
&gt; ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;ld-is-gold&#=
39;,<br>
&gt; &#39;file://0004-fix-unknow-<wbr>option-for-gold-linker.patch&#39;, &#=
39;&#39;, d)} \ +<br>
&gt; &quot; +SRC_URI_append_class-native =3D &quot;<br>
&gt; file://fix-compile-failure-<wbr>with-host-gcc-4.6.patch \ +<br>
&gt; file://allow-multi-<wbr>definitions-for-native.patch \ +<br>
&gt; &quot; + +S =3D &quot;${WORKDIR}/git&quot; + +# Setting CROSS_COMPILE =
breaks pkgconfig, so<br>
&gt; just set AR +EXTRA_OEMAKE =3D &quot;AR=3D${TARGET_PREFIX}gcc-ar&quot; =
+<br>
&gt; +do_compile_prepend() { +=C2=A0 =C2=A0 sed -i -e s:-Werror::g ${S}/gcc=
.specs +} +<br>
&gt; +do_install() { +=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D} +} +<=
br>
&gt; +do_install_append_class-<wbr>native() { +=C2=A0 =C2=A0 install -D -m =
0755<br>
&gt; ${B}/src/makeguids ${D}${bindir}/makeguids +} + +BBCLASSEXTEND =3D<br>
&gt; &quot;native&quot; +<br>
&gt;<br>
<br>
<br>
--<br>
</div></div><div class=3D"HOEnZb"><div class=3D"h5">_______________________=
_______<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--f403045f53f20db0c605499365c9--
