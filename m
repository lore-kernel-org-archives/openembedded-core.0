Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 12D8D6612D;
	Wed,  1 Mar 2017 08:01:43 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m70so5872888wma.1;
	Wed, 01 Mar 2017 00:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9dIAah/BFoTnJI+aNK79Bs8dS9UZ21L9Fr3fGP4x/M8=;
	b=PSMg3wV/pWJFYhgmSo5R3Z5qJTQqaGAh3BQNTcgHso+en+h3GE/yoM3X9rXEt5sR0G
	7II+Sc26a9bpZzUF2x04UXT9+EOtQwDXdMNZC6Ykup6jkNzpv2XBnTHWuwImRf3OV41c
	ilOF18kPxCYDligM3iOopcjI++kDhOaDou9I0V/9a2Fij6cnn+6oORLlbQqbpROAIx/h
	1DsVJftX77oKXs+q9n7101cM2kqe/z/gEh2YneDb1vBIxg7VLkwxi+Nz0gSpTzVsAnsC
	rK3DxUGrEgNOqPr/R5HpWor6i8NHjL2Y0H5eHfzNs0P6ezQOSFd8ogGzwg1kW2ZC7WOe
	sNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9dIAah/BFoTnJI+aNK79Bs8dS9UZ21L9Fr3fGP4x/M8=;
	b=C1S+pWv4Oh9AOuLLz+Pn0MYfm0EBggp7l+LbV5cIAk4xfu8+w5+qBVtSODpFgv1j+O
	76HRLw6WN3R3C4Dzn6jq92wTKi/a4dHDCRqjmGcbjO4Rg8AcQcjiBuNEB9uTq3jrNxj5
	4AvNdum9C6XGF30YkHjyW16w6z8ChH6XADTWd/N3Dryc5DliQsaLVxSnvyFEH4eE+igj
	6RdPB5cJ1JS/iImuRV/I/U28GsySSpDG4iaa+CtQVfbSVUEEtAywxeuBhzmB/gsFHGoT
	5g47xK05d/y0jJ40suU+DGt0fsqzwBAv4Y41vIu1yiSsBiugQB+B3K/DfVIdJ5Lg39if
	gmjA==
X-Gm-Message-State: AMke39knnA5c5JQU3LmqQ1CAw9DRAIalaXIaP8Ly6396WECoJX2+vk9x6Q7bhF3Ian5WXmWVBW0RgzhySz8USQ==
X-Received: by 10.28.184.133 with SMTP id i127mr1897376wmf.49.1488355304586;
	Wed, 01 Mar 2017 00:01:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Wed, 1 Mar 2017 00:01:43 -0800 (PST)
In-Reply-To: <o95sl3$3vu$1@blaine.gmane.org>
References: <1488244198-1976-1-git-send-email-california.l.sullivan@intel.com>
	<o93cl0$sqp$1@blaine.gmane.org>
	<CA+chaQcMnaTRrfVy-1xz_zHZCH-hQ5NS9pYqsHN_pUPDkHTbLg@mail.gmail.com>
	<o95sl3$3vu$1@blaine.gmane.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 1 Mar 2017 09:01:43 +0100
Message-ID: <CA+chaQc6Wr027HD+qocOxQs5-TSjGW31pr8Dw5P+BCr3dwLryw@mail.gmail.com>
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
X-List-Received-Date: Wed, 01 Mar 2017 08:01:44 -0000
Content-Type: multipart/alternative; boundary=001a114eef543ac5240549a6b908

--001a114eef543ac5240549a6b908
Content-Type: text/plain; charset=UTF-8

I think it's missing pkgconfig
http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111603.html
and fix is already on ML:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111628.html

If I don't forget I might re-try your earlier upgrade:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111329.html
to see if it works as well with this pkgconfig fix.

But who knows which version they will import into oe-core..

On Wed, Mar 1, 2017 at 8:19 AM, Koen Kooi <koen@dominion.thruhere.net>
wrote:

> Op 28-02-17 om 09:58 schreef Martin Jansa:
> > Agreed with Koen.
> >
> > Everything outside oe-core is meant to be nice little colorful boxes
> which
> > don't depend on each other (as discussed on OEDAM), but whatever intel
> needs
> > has to go to oe-core.
> >
> >> We are aware that this was recently blacklisted in meta-oe, but we
> > were unable to reproduce the issue under any circumstances.
> >
> > And it still fails to build and it will continue to fail even from
> oe-core.
>
> I suspect it's host-gcc related, it's on my plate to fix, but it will take
> a
> few weeks before I can really look at it :/
>
>
> >
> > On Tue, Feb 28, 2017 at 9:33 AM, Koen Kooi <koen@dominion.thruhere.net
> > <mailto:koen@dominion.thruhere.net>> wrote:
> >
> >     Op 28-02-17 om 02:09 schreef California Sullivan:
> >     > BSPs for platforms using UEFI, such as meta-intel, would like to
> have
> >     > this more widely available
> >
> >     I guess you're saying "one less git repo to clone"? I don't think
> that's a
> >     good enough reason to move it to OE-core.
> >
> >     > for future support enhancements.
> >
> >     I'm having trouble parsing this, it seems like you're saying that
> having it
> >     in meta-oe precludes you from contributing to it?
> >
> >     >
> >     > This is a direct copy of the recipe from meta-openembedded/meta-oe.
> >     >
> >     > Signed-off-by: California Sullivan
> >     > <california.l.sullivan@intel.com
> >     <mailto:california.l.sullivan@intel.com>> --- We
> >     > are aware that this was recently blacklisted in meta-oe, but we
> were
> >     > unable to reproduce the issue under any circumstances.
> >     >
> >     > .../efivar/0001-efivar-fix-for-cross-compile.patch | 35
> >     > +++++++++++++++++ .../efivar/efivar/0002-disable-static-build.patch
> | 33
> >     > ++++++++++++++++ .../efivar/0003-efivar-fix-for-cross-compile.patch
> | 44
> >     > +++++++++++++++++++++ .../0004-fix-unknow-option-
> for-gold-linker.patch
> >     > | 38 ++++++++++++++++++ .../allow-multi-definitions-
> for-native.patch
> >     > | 23 +++++++++++ .../fix-compile-failure-with-host-gcc-4.6.patch
>   | 45
> >     > ++++++++++++++++++++++ meta/recipes-extended/efivar/efivar_0.24.bb
> >     <http://efivar_0.24.bb>
> >     > | 43 +++++++++++++++++++++ 7 files changed, 261 insertions(+)
> create mode
> >     > 100644
> >     > meta/recipes-extended/efivar/efivar/0001-efivar-fix-for-
> cross-compile.patch
> >     >
> >     >
> >     create mode 100644
> >     meta/recipes-extended/efivar/efivar/0002-disable-static-build.patch
> >     > create mode 100644
> >     > meta/recipes-extended/efivar/efivar/0003-efivar-fix-for-
> cross-compile.patch
> >     >
> >     >
> >     create mode 100644
> >     meta/recipes-extended/efivar/efivar/0004-fix-unknow-option-
> for-gold-linker.patch
> >     > create mode 100644
> >     > meta/recipes-extended/efivar/efivar/allow-multi-
> definitions-for-native.patch
> >     >
> >     >
> >     create mode 100644
> >     meta/recipes-extended/efivar/efivar/fix-compile-failure-
> with-host-gcc-4.6.patch
> >     > create mode 100644 meta/recipes-extended/efivar/efivar_0.24.bb
> >     <http://efivar_0.24.bb>
> >     >
> >     > diff --git
> >     >
> >     a/meta/recipes-extended/efivar/efivar/0001-efivar-fix-
> for-cross-compile.patch
> >     >
> >     b/meta/recipes-extended/efivar/efivar/0001-efivar-fix-
> for-cross-compile.patch
> >     >
> >     >
> >     new file mode 100644
> >     > index 0000000..6f6ca64 --- /dev/null +++
> >     >
> >     b/meta/recipes-extended/efivar/efivar/0001-efivar-fix-
> for-cross-compile.patch
> >     >
> >     >
> >     @@ -0,0 +1,35 @@
> >     > +From 9a3c480af653b37e62d1be04d49fe7a60a80168f Mon Sep 17
> 00:00:00 2001
> >     > +From: Kai Kang <kai.kang@windriver.com
> >     <mailto:kai.kang@windriver.com>> +Date:
> >     > Fri, 25 Sep 2015 18:14:31 +0800 +Subject: [PATCH 1/2] efivar: fix
> for
> >     > cross compile + +It builds and calls elf file makeguids to
> generate a
> >     > header file which +doesn't work for cross compile. Fix it. +
> >     > +Signed-off-by: Kai Kang
> >     > <kai.kang@windriver.com
> >     <mailto:kai.kang@windriver.com>> + +Upstream-Status:
> >     > Pending +Signed-off-by: Hongxu Jia
> >     > <hongxu.jia@windriver.com
> >     <mailto:hongxu.jia@windriver.com>> + +--- +
> >     > src/Makefile | 4 ++-- + 1 file changed, 2 insertions(+), 2
> deletions(-)
> >     > + +diff --git a/src/Makefile b/src/Makefile +index 5fc7887..1829d22
> >     > 100644 +--- a/src/Makefile ++++ b/src/Makefile +@@ -29,8 +29,8 @@
> all :
> >     > deps $(TARGETS) + ./guid-symbols.c : include/efivar/efivar-guids.h
> +
> >     > ./guids.bin : include/efivar/efivar-guids.h + ./names.bin :
> >     > include/efivar/efivar-guids.h +-include/efivar/efivar-guids.h :
> makeguids
> >     > guids.txt +-  ./makeguids guids.txt guids.bin names.bin \
> >     > ++include/efivar/efivar-guids.h : guids.txt ++        makeguids
> guids.txt
> >     > guids.bin names.bin \ +               guid-symbols.c
> >     include/efivar/efivar-guids.h +
> >     >  + makeguids : CPPFLAGS+=-DEFIVAR_BUILD_ENVIRONMENT +-- +2.4.3 +
> diff
> >     > --git
> >     > a/meta/recipes-extended/efivar/efivar/0002-disable-
> static-build.patch
> >     > b/meta/recipes-extended/efivar/efivar/0002-disable-static-build.patch
> new
> >     > file mode 100644 index 0000000..951b159 --- /dev/null +++
> >     > b/meta/recipes-extended/efivar/efivar/0002-disable-static-build.patch
> @@
> >     > -0,0 +1,33 @@ +From 126e0d3c1ad74cf5b0abe9e98ec444bcc3c83159 Mon
> Sep 17
> >     > 00:00:00 2001 +From: Koen Kooi
> >     > <koen.kooi@linaro.org
> >     <mailto:koen.kooi@linaro.org>> +Date: Fri, 4 Mar
> >     > 2016 14:53:55 +0100 +Subject: [PATCH 2/2] disable static build +
> >     > +Signed-off-by: Koen Kooi
> >     > <koen.kooi@linaro.org
> >     <mailto:koen.kooi@linaro.org>> +
> >     +Upstream-Status:
> >     > Inappropriate [meta-oe specific] +Signed-off-by: Hongxu Jia
> >     > <hongxu.jia@windriver.com
> >     <mailto:hongxu.jia@windriver.com>> + +--- +
> >     > src/Makefile | 4 ++-- + 1 file changed, 2 insertions(+), 2
> deletions(-)
> >     > + +diff --git a/src/Makefile b/src/Makefile +index 1829d22..c7a0ca3
> >     > 100644 +--- a/src/Makefile ++++ b/src/Makefile +@@ -8,9 +8,9 @@
> include
> >     > $(TOPDIR)/Make.defaults + + LIBTARGETS=libefivar.so libefiboot.so +
> >     > STATICLIBTARGETS=libefivar.a libefiboot.a +-BINTARGETS=efivar
> >     > efivar-static ++BINTARGETS=efivar + PCTARGETS=efivar.pc efiboot.pc
> >     > +-TARGETS=$(LIBTARGETS) $(STATICLIBTARGETS) $(BINTARGETS)
> $(PCTARGETS)
> >     > ++TARGETS=$(LIBTARGETS) $(BINTARGETS) $(PCTARGETS) + +
> LIBEFIBOOT_SOURCES
> >     > = crc32.c creator.c disk.c gpt.c linux.c loadopt.c +
> LIBEFIBOOT_OBJECTS =
> >     > $(patsubst %.c,%.o,$(LIBEFIBOOT_SOURCES)) +-- +2.4.3 + diff --git
> >     >
> >     a/meta/recipes-extended/efivar/efivar/0003-efivar-fix-
> for-cross-compile.patch
> >     >
> >     b/meta/recipes-extended/efivar/efivar/0003-efivar-fix-
> for-cross-compile.patch
> >     >
> >     >
> >     new file mode 100644
> >     > index 0000000..3f43f2a --- /dev/null +++
> >     >
> >     b/meta/recipes-extended/efivar/efivar/0003-efivar-fix-
> for-cross-compile.patch
> >     >
> >     >
> >     @@ -0,0 +1,44 @@
> >     > +From 7ead29ca6bb5e280ae07551cc3521281ecf73682 Mon Sep 17
> 00:00:00 2001
> >     > +From: Hongxu Jia <hongxu.jia@windriver.com
> >     <mailto:hongxu.jia@windriver.com>>
> >     > +Date: Sat, 7 May 2016 02:06:47 -0400 +Subject: [PATCH] Makefile:
> fix
> >     > efivar.pc not found + +It fixes efivar.pc not found: +... +|
> install -d
> >     > -m 755 efivar/0.23-r0/image/usr/lib/pkgconfig/ +| install -m 644
> >     > efivar.pc efivar/0.23-r0/image/usr/lib/pkgconfig/ +;  install -m
> 644
> >     > efiboot.pc efivar/0.23-r0/image/usr/lib/pkgconfig/ +; +| install:
> cannot
> >     > stat 'efivar.pc': No such file or directory +| install: cannot stat
> >     > 'efiboot.pc': No such file or directory +| make[1]: *** [install]
> Error
> >     > 1 +| make[1]: Leaving directory `efivar/0.23-r0/git/src' +| make:
> ***
> >     > [install] Error 2 +| ERROR: oe_runmake failed +... +
> +Upstream-Status:
> >     > Pending + +Signed-off-by: Hongxu Jia
> >     > <hongxu.jia@windriver.com
> >     <mailto:hongxu.jia@windriver.com>> +--- +
> >     src/Makefile
> >     > | 4 +++- + 1 file changed, 3 insertions(+), 1 deletion(-) + +diff
> --git
> >     > a/src/Makefile b/src/Makefile +index c7a0ca3..ad9c427 100644 +---
> >     > a/src/Makefile ++++ b/src/Makefile +@@ -78,7 +78,9 @@ install :
> all +
> >     > ln -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x).$(MAJOR_VERSION);\
> +
> >           ln
> >     > -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x); ) +     $(INSTALL)
> -d -m 755
> >     > $(DESTDIR)$(PCDIR) +- $(foreach x, $(PCTARGETS), $(INSTALL) -m 644
> $(x)
> >     > $(DESTDIR)$(PCDIR) ;) ++      $(foreach x, $(PCTARGETS),
> $(INSTALL) -m 644
> >     > $(TOPDIR)/src/$(x).in $(DESTDIR)$(PCDIR)/$(x) ;\ ++           sed
> -i -e
> >     > "s:@@LIBDIR@@:$(libdir):g" -e "s:@@VERSION@@:$(VERSION):g" \ ++
> >     > $(DESTDIR)$(PCDIR)/$(x); ) +  $(INSTALL) -d -m 755
> >     > $(DESTDIR)$(includedir)/efivar +      $(foreach x, $(wildcard
> >     > $(TOPDIR)/src/include/efivar/*.h), $(INSTALL) -m 644 $(x)
> >     > $(DESTDIR)$(includedir)/efivar/$(notdir $(x));) +     $(INSTALL)
> -d -m 755
> >     > $(DESTDIR)$(bindir) +-- +2.8.1 + diff --git
> >     >
> >     a/meta/recipes-extended/efivar/efivar/0004-fix-unknow-
> option-for-gold-linker.patch
> >     >
> >     b/meta/recipes-extended/efivar/efivar/0004-fix-unknow-
> option-for-gold-linker.patch
> >     >
> >     >
> >     new file mode 100644
> >     > index 0000000..5d50c19 --- /dev/null +++
> >     >
> >     b/meta/recipes-extended/efivar/efivar/0004-fix-unknow-
> option-for-gold-linker.patch
> >     >
> >     >
> >     @@ -0,0 +1,38 @@
> >     > +From b3d35e7dd27a755df5acbe050837885914dbb28b Mon Sep 17
> 00:00:00 2001
> >     > +From: Hongxu Jia <hongxu.jia@windriver.com
> >     <mailto:hongxu.jia@windriver.com>>
> >     > +Date: Tue, 10 May 2016 11:34:50 -0400 +Subject: [PATCH]  fix
> unknow
> >     > option for gold linker + +- Revert the following patch, since
> oe-core
> >     > work with gcc 5 +... +commit 3055a3797f16693dfdd855fa68bc57
> fd900dc408
> >     > +Author: Peter Jones <pjones@redhat.com
> >     <mailto:pjones@redhat.com>>
> >     > +Date:   Mon Feb 15 14:15:40 2016 -0500 + +    Make gcc.specs work
> with
> >     > gcc 6 / binutils 2.26 + +    Apparently binutils 2.26 gets real
> picky
> >     > about "ld -PIC" vs "ld -fPIC". + +    Signed-off-by: Peter Jones
> >     > <pjones@redhat.com
> >     <mailto:pjones@redhat.com>> +... + +- Remove
> >     unknown
> >     > option '--add-needed' + +Signed-off-by: Hongxu Jia
> >     > <hongxu.jia@windriver.com
> >     <mailto:hongxu.jia@windriver.com>> +--- +
> >     gcc.specs | 2
> >     > +- + 1 file changed, 1 insertion(+), 1 deletion(-) + +diff --git
> >     > a/gcc.specs b/gcc.specs +index 24fabc2..5b0fdef 100644 +---
> a/gcc.specs
> >     > ++++ b/gcc.specs +@@ -14,4 +14,4 @@ + +
> %{!shared:%{!static:%{!r:-pie}}}
> >     > %{static:-Wl,-no-fatal-warnings -Wl,-static -static
> -Wl,-z,relro,-z,now}
> >     > + + *link: +-+ %{!static:--fatal-warnings} --no-undefined-version
> >     > --no-allow-shlib-undefined --add-needed -z now --build-id
> >     > %{!static:%{!shared:-PIE}} %{shared:-z relro -PIC} %{static:%<pie}
> +++
> >     > %{!static:--fatal-warnings} --no-undefined-version
> >     > --no-allow-shlib-undefined -z now --build-id
> %{!static:%{!shared:-pie}}
> >     > %{shared:-z relro -fPIC} %{static:%<pie} +-- +2.8.1 + diff --git
> >     >
> >     a/meta/recipes-extended/efivar/efivar/allow-multi-
> definitions-for-native.patch
> >     >
> >     b/meta/recipes-extended/efivar/efivar/allow-multi-
> definitions-for-native.patch
> >     >
> >     >
> >     new file mode 100644
> >     > index 0000000..87f5555 --- /dev/null +++
> >     >
> >     b/meta/recipes-extended/efivar/efivar/allow-multi-
> definitions-for-native.patch
> >     >
> >     >
> >     @@ -0,0 +1,23 @@
> >     > +Upstream-Status: Pending + +It fails to create .so file when build
> >     > efivar-native: + +| lib.o:(*IND*+0x0): multiple definition of
> >     > `efi_set_variable' +| lib.o:lib.c:(.text+0xa0): first defined here
> + +Add
> >     > link option '-z muldefs' to fix it. + +Signed-off-by: Kai Kang
> >     > <kai.kang@windriver.com
> >     <mailto:kai.kang@windriver.com>> +--- +diff --git
> >     > a/Make.rules b/Make.rules +index d9c0609..874bce0 100644 +---
> >     > a/Make.rules ++++ b/Make.rules +@@ -20,6 +20,7 @@ include
> >     > $(TOPDIR)/Make.version +      $(CCLD) $(ccldflags) $(CPPFLAGS)
> >     $(SOFLAGS) \ +
> >     > -Wl,-soname,$@.$(MAJOR_VERSION) \ +
>  -Wl,--version-script=$(MAP) \ ++
> >     > -Wl,-z,muldefs \ +      -o $@ $^ $(LDLIBS) + + %.o : %.c diff --git
> >     >
> >     a/meta/recipes-extended/efivar/efivar/fix-compile-
> failure-with-host-gcc-4.6.patch
> >     >
> >     b/meta/recipes-extended/efivar/efivar/fix-compile-
> failure-with-host-gcc-4.6.patch
> >     >
> >     >
> >     new file mode 100644
> >     > index 0000000..1c68a29 --- /dev/null +++
> >     >
> >     b/meta/recipes-extended/efivar/efivar/fix-compile-
> failure-with-host-gcc-4.6.patch
> >     >
> >     >
> >     @@ -0,0 +1,45 @@
> >     > +From 1361225abbaba878960f970df39a4570bbc39553 Mon Sep 17
> 00:00:00 2001
> >     > +From: Hongxu Jia <hongxu.jia@windriver.com
> >     <mailto:hongxu.jia@windriver.com>>
> >     > +Date: Thu, 26 May 2016 21:50:01 -0400 +Subject: [PATCH] fix
> compile
> >     > failure with older host gcc (<=4.6) + +While host gcc version is
> 4.6.3 in
> >     > ubuntu 1204, it +did not recognize -std=gnu11 and
> -Wmaybe-uninitialized.
> >     > + +While host gcc version is 4.4.7 in centos6, it +did not
> recognize
> >     > -std=gnu11, -Wmaybe-uninitialized, +and -flto. + +For native
> build, use
> >     > -std=gnu99 to replace -std=gnu11, +and directly remove
> >     > -Wmaybe-uninitialized and -flto. + +Upstream-Status: Pending +
> >     > +Signed-off-by: Hongxu Jia
> >     > <hongxu.jia@windriver.com
> >     <mailto:hongxu.jia@windriver.com>> +--- +
> >     gcc.specs | 4
> >     > ++-- + 1 file changed, 2 insertions(+), 2 deletions(-) + +diff
> --git
> >     > a/gcc.specs b/gcc.specs +index 0d4bbda..3802ca6 100644 +---
> a/gcc.specs
> >     > ++++ b/gcc.specs +@@ -2,13 +2,13 @@ + + -D_GNU_SOURCE + +
> >     > *efivar_cpp_options: +- -Werror -Wall -std=gnu11 -Wextra ++
> -Werror -Wall
> >     > -std=gnu99 -Wextra + + *cpp_options: + + %(efivar_cpp_options) + +
> >     > *cc1_options: +-+ %(efivar_cpp_options) -Wmaybe-uninitialized
> >     > -fno-merge-constants -flto -fvisibility=hidden
> >     > %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}} +++
> >     > %(efivar_cpp_options) -fno-merge-constants -fvisibility=hidden
> >     > %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}} + +
> >     > *self_spec: + + %{!shared:%{!static:%{!r:-pie}}}
> >     > %{static:-Wl,-no-fatal-warnings -Wl,-static -static
> -Wl,-z,relro,-z,now}
> >     > +-- +2.8.1 + diff --git a/meta/recipes-extended/efivar/
> efivar_0.24.bb
> >     <http://efivar_0.24.bb>
> >     > b/meta/recipes-extended/efivar/efivar_0.24.bb <
> http://efivar_0.24.bb>
> >     new file mode 100644 index
> >     > 0000000..efffde5 --- /dev/null +++
> >     > b/meta/recipes-extended/efivar/efivar_0.24.bb <
> http://efivar_0.24.bb> @@
> >     -0,0 +1,43 @@ +SUMMARY =
> >     > "Tools to manipulate UEFI variables" +DESCRIPTION = "efivar
> provides a
> >     > simple command line interface to the UEFI variable facility"
> +HOMEPAGE =
> >     > "https://github.com/rhinstaller/efivar
> >     <https://github.com/rhinstaller/efivar>" + +LICENSE = "LGPLv2.1"
> >     > +LIC_FILES_CHKSUM =
> >     > "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393" + +DEPENDS =
> >     > "popt" +DEPENDS_append_class-target = " efivar-native" +
> +COMPATIBLE_HOST
> >     > = "(i.86|x86_64|arm|aarch64).*-linux" + +SRCREV =
> >     > "963cb2e5adc145fe00717f94e382f2973f80e753" +SRC_URI =
> >     > "git://github.com/rhinstaller/efivar.git
> >     <http://github.com/rhinstaller/efivar.git> \ +
> >     > file://0002-disable-static-build.patch \ +"
> +SRC_URI_append_class-target
> >     > = " file://0001-efivar-fix-for-cross-compile.patch \ +
> >     > file://0003-efivar-fix-for-cross-compile.patch \ +
> >     > ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> >     > 'file://0004-fix-unknow-option-for-gold-linker.patch', '', d)} \ +
> >     > " +SRC_URI_append_class-native = "
> >     > file://fix-compile-failure-with-host-gcc-4.6.patch \ +
> >     > file://allow-multi-definitions-for-native.patch \ +
> >     > " + +S = "${WORKDIR}/git" + +# Setting CROSS_COMPILE breaks
> pkgconfig, so
> >     > just set AR +EXTRA_OEMAKE = "AR=${TARGET_PREFIX}gcc-ar" +
> >     > +do_compile_prepend() { +    sed -i -e s:-Werror::g ${S}/gcc.specs
> +} +
> >     > +do_install() { +    oe_runmake install DESTDIR=${D} +} +
> >     > +do_install_append_class-native() { +    install -D -m 0755
> >     > ${B}/src/makeguids ${D}${bindir}/makeguids +} + +BBCLASSEXTEND =
> >     > "native" +
> >     >
> >
> >
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> >
> >
> >
> >
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114eef543ac5240549a6b908
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think it&#39;s missing pkgconfig<br></div><div><a h=
ref=3D"http://lists.openembedded.org/pipermail/openembedded-devel/2017-Febr=
uary/111603.html">http://lists.openembedded.org/pipermail/openembedded-deve=
l/2017-February/111603.html</a><br></div><div>and fix is already on ML:</di=
v><div><a href=3D"http://lists.openembedded.org/pipermail/openembedded-deve=
l/2017-February/111628.html">http://lists.openembedded.org/pipermail/openem=
bedded-devel/2017-February/111628.html</a><br></div><div><br></div><div>If =
I don&#39;t forget I might re-try your earlier upgrade:</div><div><a href=
=3D"http://lists.openembedded.org/pipermail/openembedded-devel/2017-Februar=
y/111329.html">http://lists.openembedded.org/pipermail/openembedded-devel/2=
017-February/111329.html</a><br></div><div>to see if it works as well with =
this pkgconfig fix.</div><div><br></div><div>But who knows which version th=
ey will import into oe-core..</div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Wed, Mar 1, 2017 at 8:19 AM, Koen Kooi <span dir=3D"lt=
r">&lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=3D"_blank">koen=
@dominion.thruhere.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Op 28-02-17 om 09:58 schreef Martin Jansa:<br>
<span class=3D"gmail-">&gt; Agreed with Koen.<br>
&gt;<br>
&gt; Everything outside oe-core is meant to be nice little colorful boxes w=
hich<br>
&gt; don&#39;t depend on each other (as discussed on OEDAM), but whatever i=
ntel needs<br>
&gt; has to go to oe-core.<br>
&gt;<br>
&gt;&gt; We are aware that this was recently blacklisted in meta-oe, but we=
<br>
&gt; were unable to reproduce the issue under any circumstances.<br>
&gt;<br>
&gt; And it still fails to build and it will continue to fail even from oe-=
core.<br>
<br>
</span>I suspect it&#39;s host-gcc related, it&#39;s on my plate to fix, bu=
t it will take a<br>
few weeks before I can really look at it :/<br>
<span class=3D"gmail-"><br>
<br>
&gt;<br>
&gt; On Tue, Feb 28, 2017 at 9:33 AM, Koen Kooi &lt;<a href=3D"mailto:koen@=
dominion.thruhere.net">koen@dominion.thruhere.net</a><br>
</span><span class=3D"gmail-">&gt; &lt;mailto:<a href=3D"mailto:koen@domini=
on.thruhere.net">koen@dominion.<wbr>thruhere.net</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Op 28-02-17 om 02:09 schreef California Sullivan:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; BSPs for platforms using UEFI, such as meta-in=
tel, would like to have<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; this more widely available<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I guess you&#39;re saying &quot;one less git repo t=
o clone&quot;? I don&#39;t think that&#39;s a<br>
&gt;=C2=A0 =C2=A0 =C2=A0good enough reason to move it to OE-core.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; for future support enhancements.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m having trouble parsing this, it seems like =
you&#39;re saying that having it<br>
&gt;=C2=A0 =C2=A0 =C2=A0in meta-oe precludes you from contributing to it?<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This is a direct copy of the recipe from meta-=
openembedded/meta-oe.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: California Sullivan<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:california.l.sullivan@in=
tel.com">california.l.sullivan@intel.<wbr>com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:california.l.su=
llivan@intel.com">california.l.sullivan@<wbr>intel.com</a>&gt;&gt; --- We<b=
r>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt; are aware that this was=
 recently blacklisted in meta-oe, but we were<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; unable to reproduce the issue under any circum=
stances.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; .../efivar/0001-efivar-fix-<wbr>for-cross-comp=
ile.patch | 35<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++++++++++++++++ .../efivar/efivar/0002-<wbr>=
disable-static-build.patch=C2=A0 | 33<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ++++++++++++++++ .../efivar/0003-efivar-fix-<w=
br>for-cross-compile.patch | 44<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++++++++++++++++++++ .../0004-fix-unknow-opti=
on-<wbr>for-gold-linker.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; | 38 ++++++++++++++++++ .../allow-multi-defini=
tions-<wbr>for-native.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; | 23 +++++++++++ .../fix-compile-failure-with-=
<wbr>host-gcc-4.6.patch=C2=A0 =C2=A0 | 45<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ++++++++++++++++++++++ meta/recipes-extended/e=
fivar/<a href=3D"http://efivar_0.24.bb" rel=3D"noreferrer" target=3D"_blank=
">e<wbr>fivar_0.24.bb</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://efivar_0.24.bb" rel=3D=
"noreferrer" target=3D"_blank">http://efivar_0.24.bb</a>&gt;<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt; | 43 ++++++++++++++++++=
+++ 7 files changed, 261 insertions(+) create mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; meta/recipes-extended/efivar/<wbr>efivar/0001-=
efivar-fix-for-<wbr>cross-compile.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-extended/efivar/<wbr>efivar/0002-disab=
le-static-<wbr>build.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; meta/recipes-extended/efivar/<wbr>efivar/0003-=
efivar-fix-for-<wbr>cross-compile.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-extended/efivar/<wbr>efivar/0004-fix-u=
nknow-option-<wbr>for-gold-linker.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; meta/recipes-extended/efivar/<wbr>efivar/allow=
-multi-<wbr>definitions-for-native.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-extended/efivar/<wbr>efivar/fix-compil=
e-failure-<wbr>with-host-gcc-4.6.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; create mode 100644 meta/recipes-extended/efiva=
r/<a href=3D"http://efivar_0.24.bb" rel=3D"noreferrer" target=3D"_blank">e<=
wbr>fivar_0.24.bb</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://efivar_0.24.bb" rel=3D=
"noreferrer" target=3D"_blank">http://efivar_0.24.bb</a>&gt;<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-extended/<wbr>efivar/efivar/0001-efi=
var-fix-<wbr>for-cross-compile.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-extended/<wbr>efivar/efivar/0001-efi=
var-fix-<wbr>for-cross-compile.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 0000000..6f6ca64 --- /dev/null +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-extended/<wbr>efivar/efivar/0001-efi=
var-fix-<wbr>for-cross-compile.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,35 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +From 9a3c480af653b37e62d1be04d49fe7<wbr>a60a8=
0168f Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +From: Kai Kang &lt;<a href=3D"mailto:kai.kang=
@windriver.com">kai.kang@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:kai.kang@windri=
ver.com">kai.kang@windriver.com</a><wbr>&gt;&gt; +Date:<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt; Fri, 25 Sep 2015 18:14:=
31 +0800 +Subject: [PATCH 1/2] efivar: fix for<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; cross compile + +It builds and calls elf file =
makeguids to generate a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; header file which +doesn&#39;t work for cross =
compile. Fix it. +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Signed-off-by: Kai Kang<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:kai.kang@windriver.com">=
kai.kang@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:kai.kang@windri=
ver.com">kai.kang@windriver.com</a><wbr>&gt;&gt; + +Upstream-Status:<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt; Pending +Signed-off-by:=
 Hongxu Jia<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:hongxu.jia@windriver.com=
">hongxu.jia@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongxu.jia@wind=
river.com">hongxu.jia@windriver.<wbr>com</a>&gt;&gt; + +--- +<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt; src/Makefile | 4 ++-- +=
 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + +diff --git a/src/Makefile b/src/Makefile +i=
ndex 5fc7887..1829d22<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 100644 +--- a/src/Makefile ++++ b/src/Makefile=
 +@@ -29,8 +29,8 @@ all :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; deps $(TARGETS) + ./guid-symbols.c : include/e=
fivar/efivar-guids.h +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ./guids.bin : include/efivar/efivar-guids.h + =
./names.bin :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; include/efivar/efivar-guids.h +-include/efivar=
/efivar-guids.<wbr>h : makeguids<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; guids.txt +-=C2=A0 ./makeguids guids.txt guids=
.bin names.bin \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ++include/efivar/efivar-guids.<wbr>h : guids.t=
xt ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 makeguids guids.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; guids.bin names.bin \ +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guid-symbols.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0include/efivar/efivar-guids.h +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 + makeguids : CPPFLAGS+=3D-DEFIVAR_BUILD=
_<wbr>ENVIRONMENT +-- +2.4.3 + diff<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; a/meta/recipes-extended/<wbr>efivar/efivar/000=
2-disable-<wbr>static-build.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; b/meta/recipes-extended/<wbr>efivar/efivar/000=
2-disable-<wbr>static-build.patch new<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; file mode 100644 index 0000000..951b159 --- /d=
ev/null +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; b/meta/recipes-extended/<wbr>efivar/efivar/000=
2-disable-<wbr>static-build.patch @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -0,0 +1,33 @@ +From 126e0d3c1ad74cf5b0abe9e98e=
c444<wbr>bcc3c83159 Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 00:00:00 2001 +From: Koen Kooi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:koen.kooi@linaro.org">ko=
en.kooi@linaro.org</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:koen.kooi@linar=
o.org">koen.kooi@linaro.org</a>&gt;&gt; +Date: Fri, 4 Mar<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt; 2016 14:53:55 +0100 +Su=
bject: [PATCH 2/2] disable static build +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Signed-off-by: Koen Kooi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:koen.kooi@linaro.org">ko=
en.kooi@linaro.org</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:koen.kooi@linar=
o.org">koen.kooi@linaro.org</a>&gt;&gt; +<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0+Upstream-Status:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Inappropriate [meta-oe specific] +Signed-off-b=
y: Hongxu Jia<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:hongxu.jia@windriver.com=
">hongxu.jia@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongxu.jia@wind=
river.com">hongxu.jia@windriver.<wbr>com</a>&gt;&gt; + +--- +<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt; src/Makefile | 4 ++-- +=
 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + +diff --git a/src/Makefile b/src/Makefile +i=
ndex 1829d22..c7a0ca3<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 100644 +--- a/src/Makefile ++++ b/src/Makefile=
 +@@ -8,9 +8,9 @@ include<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $(TOPDIR)/Make.defaults + + LIBTARGETS=3Dlibef=
ivar.so libefiboot.so +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; STATICLIBTARGETS=3Dlibefivar.a libefiboot.a +-=
BINTARGETS=3Defivar<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; efivar-static ++BINTARGETS=3Defivar + PCTARGET=
S=3Defivar.pc efiboot.pc<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +-TARGETS=3D$(LIBTARGETS) $(STATICLIBTARGETS) =
$(BINTARGETS) $(PCTARGETS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ++TARGETS=3D$(LIBTARGETS) $(BINTARGETS) $(PCTA=
RGETS) + + LIBEFIBOOT_SOURCES<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =3D crc32.c creator.c disk.c gpt.c linux.c loa=
dopt.c + LIBEFIBOOT_OBJECTS =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $(patsubst %.c,%.o,$(LIBEFIBOOT_SOURCES)) +-- =
+2.4.3 + diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-extended/<wbr>efivar/efivar/0003-efi=
var-fix-<wbr>for-cross-compile.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-extended/<wbr>efivar/efivar/0003-efi=
var-fix-<wbr>for-cross-compile.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 0000000..3f43f2a --- /dev/null +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-extended/<wbr>efivar/efivar/0003-efi=
var-fix-<wbr>for-cross-compile.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,44 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +From 7ead29ca6bb5e280ae07551cc35212<wbr>81ecf=
73682 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +From: Hongxu Jia &lt;<a href=3D"mailto:hongxu=
.jia@windriver.com">hongxu.jia@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongxu.jia@wind=
river.com">hongxu.jia@windriver.<wbr>com</a>&gt;&gt;<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Date: Sat, 7 May 2016 =
02:06:47 -0400 +Subject: [PATCH] Makefile: fix<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; efivar.pc not found + +It fixes efivar.pc not =
found: +... +| install -d<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -m 755 efivar/0.23-r0/image/usr/lib/<wbr>pkgco=
nfig/ +| install -m 644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; efivar.pc efivar/0.23-r0/image/usr/lib/<wbr>pk=
gconfig/ +;=C2=A0 install -m 644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; efiboot.pc efivar/0.23-r0/image/usr/lib/<wbr>p=
kgconfig/ +; +| install: cannot<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; stat &#39;efivar.pc&#39;: No such file or dire=
ctory +| install: cannot stat<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &#39;efiboot.pc&#39;: No such file or director=
y +| make[1]: *** [install] Error<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 1 +| make[1]: Leaving directory `efivar/0.23-r=
0/git/src&#39; +| make: ***<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [install] Error 2 +| ERROR: oe_runmake failed =
+... + +Upstream-Status:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Pending + +Signed-off-by: Hongxu Jia<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:hongxu.jia@windriver.com=
">hongxu.jia@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongxu.jia@wind=
river.com">hongxu.jia@windriver.<wbr>com</a>&gt;&gt; +--- +<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0src/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; | 4 +++- + 1 file changed, 3 insertions(+), 1 =
deletion(-) + +diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; a/src/Makefile b/src/Makefile +index c7a0ca3..=
ad9c427 100644 +---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; a/src/Makefile ++++ b/src/Makefile +@@ -78,7 +=
78,9 @@ install : all +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ln -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x=
).$(<wbr>MAJOR_VERSION);\ +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -fs $(x).$(VERSION) $(DESTDIR)$(libdir)/$(x); =
) +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -d -m 755<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $(DESTDIR)$(PCDIR) +- $(foreach x, $(PCTARGETS=
), $(INSTALL) -m 644 $(x)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $(DESTDIR)$(PCDIR) ;) ++=C2=A0 =C2=A0 =C2=A0 $=
(foreach x, $(PCTARGETS), $(INSTALL) -m 644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $(TOPDIR)/src/$(x).in $(DESTDIR)$(PCDIR)/$(x) =
;\ ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;s:@@LIBDIR@@:$(libdir):g&quot; -e &quot;=
s:@@VERSION@@:$(VERSION):g&quot; \ ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $(DESTDIR)$(PCDIR)/$(x); ) +=C2=A0 $(INSTALL) =
-d -m 755<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $(DESTDIR)$(includedir)/efivar +=C2=A0 =C2=A0 =
=C2=A0 $(foreach x, $(wildcard<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $(TOPDIR)/src/include/efivar/*<wbr>.h), $(INST=
ALL) -m 644 $(x)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $(DESTDIR)$(includedir)/<wbr>efivar/$(notdir $=
(x));) +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -d -m 755<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $(DESTDIR)$(bindir) +-- +2.8.1 + diff --git<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-extended/<wbr>efivar/efivar/0004-fix=
-unknow-<wbr>option-for-gold-linker.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-extended/<wbr>efivar/efivar/0004-fix=
-unknow-<wbr>option-for-gold-linker.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 0000000..5d50c19 --- /dev/null +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-extended/<wbr>efivar/efivar/0004-fix=
-unknow-<wbr>option-for-gold-linker.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,38 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +From b3d35e7dd27a755df5acbe05083788<wbr>5914d=
bb28b Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +From: Hongxu Jia &lt;<a href=3D"mailto:hongxu=
.jia@windriver.com">hongxu.jia@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongxu.jia@wind=
river.com">hongxu.jia@windriver.<wbr>com</a>&gt;&gt;<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Date: Tue, 10 May 2016=
 11:34:50 -0400 +Subject: [PATCH]=C2=A0 fix unknow<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; option for gold linker + +- Revert the followi=
ng patch, since oe-core<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; work with gcc 5 +... +commit 3055a3797f16693df=
dd855fa68bc57<wbr>fd900dc408<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Author: Peter Jones &lt;<a href=3D"mailto:pjo=
nes@redhat.com">pjones@redhat.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:pjones@redhat.c=
om">pjones@redhat.com</a>&gt;&gt;<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Date:=C2=A0 =C2=A0Mon =
Feb 15 14:15:40 2016 -0500 + +=C2=A0 =C2=A0 Make gcc.specs work with<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; gcc 6 / binutils 2.26 + +=C2=A0 =C2=A0 Apparen=
tly binutils 2.26 gets real picky<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; about &quot;ld -PIC&quot; vs &quot;ld -fPIC&qu=
ot;. + +=C2=A0 =C2=A0 Signed-off-by: Peter Jones<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:pjones@redhat.com">pjone=
s@redhat.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:pjones@redhat.c=
om">pjones@redhat.com</a>&gt;&gt; +... + +- Remove<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0unknown<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; option &#39;--add-needed&#39; + +Signed-off-by=
: Hongxu Jia<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:hongxu.jia@windriver.com=
">hongxu.jia@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongxu.jia@wind=
river.com">hongxu.jia@windriver.<wbr>com</a>&gt;&gt; +--- +<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0gcc.specs | 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +- + 1 file changed, 1 insertion(+), 1 deletio=
n(-) + +diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; a/gcc.specs b/gcc.specs +index 24fabc2..5b0fde=
f 100644 +--- a/gcc.specs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ++++ b/gcc.specs +@@ -14,4 +14,4 @@ + + %{!sha=
red:%{!static:%{!r:-pie}<wbr>}}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; %{static:-Wl,-no-fatal-<wbr>warnings -Wl,-stat=
ic -static -Wl,-z,relro,-z,now}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + + *link: +-+ %{!static:--fatal-warnings} --n=
o-undefined-version<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --no-allow-shlib-undefined --add-needed -z now=
 --build-id<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; %{!static:%{!shared:-PIE}} %{shared:-z relro -=
PIC} %{static:%&lt;pie} +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; %{!static:--fatal-warnings} --no-undefined-ver=
sion<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --no-allow-shlib-undefined -z now --build-id %=
{!static:%{!shared:-pie}}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; %{shared:-z relro -fPIC} %{static:%&lt;pie} +-=
- +2.8.1 + diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-extended/<wbr>efivar/efivar/allow-mu=
lti-<wbr>definitions-for-native.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-extended/<wbr>efivar/efivar/allow-mu=
lti-<wbr>definitions-for-native.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 0000000..87f5555 --- /dev/null +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-extended/<wbr>efivar/efivar/allow-mu=
lti-<wbr>definitions-for-native.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,23 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Upstream-Status: Pending + +It fails to creat=
e .so file when build<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; efivar-native: + +| lib.o:(*IND*+0x0): multipl=
e definition of<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; `efi_set_variable&#39; +| lib.o:lib.c:(.text+0=
xa0): first defined here + +Add<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; link option &#39;-z muldefs&#39; to fix it. + =
+Signed-off-by: Kai Kang<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:kai.kang@windriver.com">=
kai.kang@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:kai.kang@windri=
ver.com">kai.kang@windriver.com</a><wbr>&gt;&gt; +--- +diff --git<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt; a/Make.rules b/Make.rul=
es +index d9c0609..874bce0 100644 +---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; a/Make.rules ++++ b/Make.rules +@@ -20,6 +20,7=
 @@ include<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $(TOPDIR)/Make.version +=C2=A0 =C2=A0 =C2=A0 $=
(CCLD) $(ccldflags) $(CPPFLAGS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(SOFLAGS) \ +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -Wl,-soname,$@.$(MAJOR_<wbr>VERSION) \ +=C2=A0=
 =C2=A0 =C2=A0-Wl,--version-script=3D$(MAP) \ ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -Wl,-z,muldefs \ +=C2=A0 =C2=A0 =C2=A0 -o $@ $=
^ $(LDLIBS) + + %.o : %.c diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-extended/<wbr>efivar/efivar/fix-comp=
ile-<wbr>failure-with-host-gcc-4.6.<wbr>patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-extended/<wbr>efivar/efivar/fix-comp=
ile-<wbr>failure-with-host-gcc-4.6.<wbr>patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 0000000..1c68a29 --- /dev/null +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-extended/<wbr>efivar/efivar/fix-comp=
ile-<wbr>failure-with-host-gcc-4.6.<wbr>patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,45 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +From 1361225abbaba878960f970df39a45<wbr>70bbc=
39553 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +From: Hongxu Jia &lt;<a href=3D"mailto:hongxu=
.jia@windriver.com">hongxu.jia@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongxu.jia@wind=
river.com">hongxu.jia@windriver.<wbr>com</a>&gt;&gt;<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Date: Thu, 26 May 2016=
 21:50:01 -0400 +Subject: [PATCH] fix compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; failure with older host gcc (&lt;=3D4.6) + +Wh=
ile host gcc version is 4.6.3 in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ubuntu 1204, it +did not recognize -std=3Dgnu1=
1 and -Wmaybe-uninitialized.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + +While host gcc version is 4.4.7 in centos6,=
 it +did not recognize<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -std=3Dgnu11, -Wmaybe-uninitialized, +and -flt=
o. + +For native build, use<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -std=3Dgnu99 to replace -std=3Dgnu11, +and dir=
ectly remove<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -Wmaybe-uninitialized and -flto. + +Upstream-S=
tatus: Pending +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Signed-off-by: Hongxu Jia<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:hongxu.jia@windriver.com=
">hongxu.jia@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongxu.jia@wind=
river.com">hongxu.jia@windriver.<wbr>com</a>&gt;&gt; +--- +<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0gcc.specs | 4<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ++-- + 1 file changed, 2 insertions(+), 2 dele=
tions(-) + +diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; a/gcc.specs b/gcc.specs +index 0d4bbda..3802ca=
6 100644 +--- a/gcc.specs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ++++ b/gcc.specs +@@ -2,13 +2,13 @@ + + -D_GNU=
_SOURCE + +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; *efivar_cpp_options: +- -Werror -Wall -std=3Dg=
nu11 -Wextra ++ -Werror -Wall<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -std=3Dgnu99 -Wextra + + *cpp_options: + + %(e=
fivar_cpp_options) + +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; *cc1_options: +-+ %(efivar_cpp_options) -Wmayb=
e-uninitialized<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -fno-merge-constants -flto -fvisibility=3Dhidd=
en<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; %{!r:%{!fpie:%{!fPIE:%{!fpic:%<wbr>{!fPIC:%{!f=
no-pic:-fPIE}}}}}} +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; %(efivar_cpp_options) -fno-merge-constants -fv=
isibility=3Dhidden<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; %{!r:%{!fpie:%{!fPIE:%{!fpic:%<wbr>{!fPIC:%{!f=
no-pic:-fPIE}}}}}} + +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; *self_spec: + + %{!shared:%{!static:%{!r:-pie}=
<wbr>}}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; %{static:-Wl,-no-fatal-<wbr>warnings -Wl,-stat=
ic -static -Wl,-z,relro,-z,now}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +-- +2.8.1 + diff --git a/meta/recipes-extende=
d/<wbr>efivar/<a href=3D"http://efivar_0.24.bb" rel=3D"noreferrer" target=
=3D"_blank">efivar_0.24.bb</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://efivar_0.24.bb" rel=3D=
"noreferrer" target=3D"_blank">http://efivar_0.24.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; b/meta/recipes-extended/<wbr>efivar/<a href=3D=
"http://efivar_0.24.bb" rel=3D"noreferrer" target=3D"_blank">efivar_0.24.bb=
</a> &lt;<a href=3D"http://efivar_0.24.bb" rel=3D"noreferrer" target=3D"_bl=
ank">http://efivar_0.24.bb</a>&gt;<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644 index<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 0000000..efffde5 --- /dev/null +++<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&gt; b/meta/recipes-extended/<wbr>efivar/<a =
href=3D"http://efivar_0.24.bb" rel=3D"noreferrer" target=3D"_blank">efivar_=
0.24.bb</a> &lt;<a href=3D"http://efivar_0.24.bb" rel=3D"noreferrer" target=
=3D"_blank">http://efivar_0.24.bb</a>&gt; @@<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0-0,0 +1,43 @@ +SUMMARY =3D<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;Tools to manipulate UEFI variables&quot;=
 +DESCRIPTION =3D &quot;efivar provides a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; simple command line interface to the UEFI vari=
able facility&quot; +HOMEPAGE =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;<a href=3D"https://github.com/rhinstalle=
r/efivar" rel=3D"noreferrer" target=3D"_blank">https://github.com/<wbr>rhin=
staller/efivar</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/rhinstaller/efiva=
r" rel=3D"noreferrer" target=3D"_blank">https://github.com/<wbr>rhinstaller=
/efivar</a>&gt;&quot; + +LICENSE =3D &quot;LGPLv2.1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +LIC_FILES_CHKSUM =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;file://COPYING;md5=3D<wbr>6626bb1e20189c=
fa95f2c508ba2863<wbr>93&quot; + +DEPENDS =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;popt&quot; +DEPENDS_append_class-target =
=3D &quot; efivar-native&quot; + +COMPATIBLE_HOST<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =3D &quot;(i.86|x86_64|arm|aarch64).*-<wbr>lin=
ux&quot; + +SRCREV =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;<wbr>963cb2e5adc145fe00717f94e382f2<wbr>=
973f80e753&quot; +SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;git://<a href=3D"http://github.com/rhins=
taller/efivar.git" rel=3D"noreferrer" target=3D"_blank">github.com/rhinstal=
ler/<wbr>efivar.git</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://github.com/rhinstaller=
/efivar.git" rel=3D"noreferrer" target=3D"_blank">http://github.com/<wbr>rh=
installer/efivar.git</a>&gt; \ +<br>
<span class=3D"gmail-">&gt;=C2=A0 =C2=A0 =C2=A0&gt; file://0002-disable-sta=
tic-<wbr>build.patch \ +&quot; +SRC_URI_append_class-target<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =3D &quot; file://0001-efivar-fix-for-<wbr>cro=
ss-compile.patch \ +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; file://0003-efivar-fix-for-<wbr>cross-compile.=
patch \ +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES=
&#39;, &#39;ld-is-gold&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &#39;file://0004-fix-unknow-<wbr>option-for-go=
ld-linker.patch&#39;, &#39;&#39;, d)} \ +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot; +SRC_URI_append_class-native =3D &quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; file://fix-compile-failure-<wbr>with-host-gcc-=
4.6.patch \ +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; file://allow-multi-<wbr>definitions-for-native=
.patch \ +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot; + +S =3D &quot;${WORKDIR}/git&quot; + +=
# Setting CROSS_COMPILE breaks pkgconfig, so<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; just set AR +EXTRA_OEMAKE =3D &quot;AR=3D${TAR=
GET_PREFIX}gcc-ar&quot; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +do_compile_prepend() { +=C2=A0 =C2=A0 sed -i =
-e s:-Werror::g ${S}/gcc.specs +} +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +do_install() { +=C2=A0 =C2=A0 oe_runmake inst=
all DESTDIR=3D${D} +} +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +do_install_append_class-<wbr>native() { +=C2=
=A0 =C2=A0 install -D -m 0755<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ${B}/src/makeguids ${D}${bindir}/makeguids +} =
+ +BBCLASSEXTEND =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;native&quot; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0______________________________<wbr>________________=
_<br>
&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.openembed=
ded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedded-co=
re@lists.openembedded.org">Openembedded-core@<wbr>lists.openembedded.org</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/mailman/li=
stinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists=
.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://l=
ists.openembedded.<wbr>org/mailman/listinfo/<wbr>openembedded-core</a>&gt;<=
br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div></div>

--001a114eef543ac5240549a6b908--
