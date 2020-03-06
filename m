Return-Path: <oleksandr.s.popovych@globallogic.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 36BDE6028C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 13:24:43 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id d206so2100050ywa.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 05:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RPiTTq4fY+hYIdCPouEFO45t/lrHCmuJMH00h1RW/JQ=;
	b=QcVFuyhspPYah1Swyp9J4kjw9xbR+pK40bBbP6uUeUFTzqlpWmC7+W5OmsFGbnnsLk
	b6GQhXcEN1lepOD2GVCOQ0UGAjjgSU9DdgYKCyA8e92Cux73aN9oQHCuPUMcGMsIvxty
	YF75J+GJ6Zdx+9uhmRqNBZXz6oNeEwWpy4gF9Nz/a3IULp348hK5+pqrST1qP/G9FrGA
	ut8EtszTzEgPlgc0ffo0VEZd/033jrFGBF1k79SjNUxIndHGsm/CVF3hH8rfqfSRhVLN
	P0bHcpBqBE1rYIZA+3U5POHKmMnCcBz5vMKDj26bDlmQRIzwcZ2eqzyFhmY9BoDzalCP
	5kZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RPiTTq4fY+hYIdCPouEFO45t/lrHCmuJMH00h1RW/JQ=;
	b=mG2mOkUpYCqUFN3LScWZ1w28obfFrkTYeIuZv3H6NQ9OqWakxCv11FjA6JmMmj95P0
	c4lkV+fK6gbNNs/BenrOWVzFT3esJmszsjo3KMQJgVRWTMK/XCcLkH0JEYSK5MvXKwXG
	D7xOTPqVrFC7THXCYc52wQ+gYnf2qOrL6Ow4CPFPG+PThuX2lhI2kvpmrEPClJjBNO+5
	l/NfBWgNSH7Cgt6lgAx92gwIqC4RRZzuB9efTafxKG/0936ARE4ocUX94b+UNK+coIv8
	Sm2nuWe2wzX1CYYARBn5XUd5N6TU7MK2DoRdRLMkNw2Nbjk+xkUT+bHPTe8l+Yq3nGNa
	ZREA==
X-Gm-Message-State: ANhLgQ1jhaGjBQ8m7JWaEZpKt2qJsuRDixVafgl4arAE+OS1eoU6iSAA
	tulyeEw1v2kd3n991iaz96ek32BCziHt1GUrn5uQ6g==
X-Google-Smtp-Source: ADFU+vs+ZxPveIfxc4bF6Rs82Ubex2FZvmge6+mT2I49/9F0xXC0GaZlvNo3LA10eoMvO1OYm+89VsGbr1Y+OpIyZTc=
X-Received: by 2002:a25:d405:: with SMTP id m5mr3666844ybf.411.1583501084609; 
	Fri, 06 Mar 2020 05:24:44 -0800 (PST)
MIME-Version: 1.0
References: <20200212121911.4752-1-oleksandr.s.popovych@globallogic.com>
	<c00c721b-67f5-27d0-99eb-b3a116aff1c8@windriver.com>
In-Reply-To: <c00c721b-67f5-27d0-99eb-b3a116aff1c8@windriver.com>
From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
Date: Fri, 6 Mar 2020 15:24:33 +0200
Message-ID: <CAKqUGW_CgikPYmESaJbJJ1PWWmy1NqvOCGJE0ENNPs9UDdvENQ@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v6] expat: Added ptest
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
X-List-Received-Date: Fri, 06 Mar 2020 13:24:44 -0000
Content-Type: text/plain; charset="UTF-8"

Hello, Randy

On Wed, Feb 12, 2020 at 7:17 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2/12/20 7:19 AM, Oleksandr Popovych via Openembedded-core wrote:
> > For ptest support for this package several additional patches and
> > run-ptest script were added and recipe was changed.
> >
> > Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> > ---
> >   ...d-Makefile-targets-for-ptest-support.patch | 40 ++++++++++++++
> >   ...ort-for-ptests-in-form-of-new-target.patch | 33 ++++++++++++
> >   ...ed-suitable-format-of-tests-in-ptest.patch | 52 +++++++++++++++++++
> >   meta/recipes-core/expat/expat/run-ptest       |  3 ++
> >   meta/recipes-core/expat/expat_2.2.9.bb        | 12 ++++-
> >   5 files changed, 139 insertions(+), 1 deletion(-)
> >   create mode 100644 meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
> >   create mode 100644 meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
> >   create mode 100644 meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
> >   create mode 100644 meta/recipes-core/expat/expat/run-ptest
> >
> > diff --git a/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch b/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
> > new file mode 100644
> > index 0000000000..de213b4bc5
> > --- /dev/null
> > +++ b/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
> > @@ -0,0 +1,40 @@
> > +From e306bd4849f61f50dad1f5d29fb650c347d78ad6 Mon Sep 17 00:00:00 2001
> > +From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> > +Date: Thu, 6 Feb 2020 13:41:45 +0200
> > +Subject: [PATCH 1/3] expat: Added Makefile targets for ptest support
> > +
> > +install-ptest, runtests and check tagrets are added.
> > +
> > +Upstream-Status: Inappropriate [oe-core specific]
> > +
> > +Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> > +---
> > + Makefile.am | 15 +++++++++++++++
> > + 1 file changed, 15 insertions(+)
> > +
> > +diff --git a/Makefile.am b/Makefile.am
> > +index 5e1d37d..c63b44a 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -152,3 +152,18 @@ qa:
> > +     QA_COMPILER=clang QA_SANITIZER=memory    ./qa.sh
> > +     QA_COMPILER=clang QA_SANITIZER=undefined ./qa.sh
> > +     QA_COMPILER=gcc   QA_PROCESSOR=gcov      ./qa.sh
> > ++
> > ++.PHONY: install-ptest
> > ++install-ptest:
>
> if you call this, install-test and don't change the behaviour used when
> testing self-hosted development, then perhaps
> the upstream will accept the changes.
>
> > ++    echo $(S)
> > ++    (if [ -d tests/.libs ] ; then cd tests/.libs; fi; \
> > ++            install runtests runtestspp $(DESTDIR))
> > ++    cp Makefile $(DESTDIR)
> > ++    sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
> > ++
> > ++.PHONY: runtests
> > ++runtests:
> > ++    @echo "C variant of tests:"
> > ++    @$(CHECKER) ./runtests$(EXEEXT) -q
> > ++    @echo "C++ variant of tests:"
> > ++    @$(CHECKER) ./runtestspp$(EXEEXT) -q
> > +--
> > +2.17.1
> > +
> > diff --git a/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch b/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
> > new file mode 100644
> > index 0000000000..26ae144a37
> > --- /dev/null
> > +++ b/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
> > @@ -0,0 +1,33 @@
> > +From 9a5085243b632a777f55269f7f6d2e40dd73a7bc Mon Sep 17 00:00:00 2001
> > +From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> > +Date: Thu, 6 Feb 2020 13:43:57 +0200
> > +Subject: [PATCH 2/3] expat: Added support for ptests in form of new target
> > +
> > +configure.am file changed, according to this advice:
> > +https://wiki.yoctoproject.org/wiki/Ptest#Building_the_test_suite
> > +
> > +Upstream-Status: Inappropriate [oe-core specific]
> > +
> > +Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> > +---
> > + configure.ac | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index d58ac03..8e6b41e 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -34,8 +34,8 @@ AC_CONFIG_SRCDIR([Makefile.in])
> > + AC_CONFIG_AUX_DIR([conftools])
> > + AC_CONFIG_MACRO_DIR([m4])
> > + AC_CANONICAL_HOST
> > +-AM_INIT_AUTOMAKE
> > +-
> > ++AM_INIT_AUTOMAKE([serial-tests])
> > ++AM_EXTRA_RECURSIVE_TARGETS([buildtest-TESTS])
>
>
> Cross-compiling is increasingly common.
> Upstream might accept you changes to split up
> building, installing and running tests.
>

According to this information:
https://github.com/libexpat/libexpat/issues/330
Autotools that are used for building this library are going to become
deprecated, and library maintainers are planning to switch on CMake
instead.
Latest release already has CMake build system support. This system is
still experimental, but it already has split up building and running
tests (installation can be implemented in recipe).
With migration on CMake there will no be reason for upstreaming
changes for potentially deprecated feature. But...
cmake-native package has expat-native as RDEPENDS. That creates a
dependency loop between this packages. I was able to fix it by
splitting recipes for expat and expat-native, and build expat with
CMake and expat-native with autotools...

So does expat recipe need to be rewritten on cmake-based building? And
how can such dependency loop be solved propertly, if recipe need to be
changed?

>
> Same goes for the PASS/ FAIL printfs below.
>

According to conversation about my changes offer:
https://github.com/libexpat/libexpat/issues/382
maintainers would rather be interested in changing testing framework
on more functional and adapting their tests for it than making changes
in the current one. So my patches are not suitable for upstreaming.
And I see several ways for solving this situation:
 - discard patches and rewrite run-tests script and recipe without
making any changes in the code (So patches are not required, but tests
output will be reduced to 2 lines: "PASS/FAIL/SKIP: runtests" and
"PASS/FAIL/SKIP: runtestspp" because there are 2 testing executables)
 - leave patches marked as "Inappropriate" (maybe with reason updating)
 - accept expat maintainers offer and change their current testing
framework "... to something C-based, existing, capable,
self-contained, and integrate it into both the CMake and Autotools
build systems while we have both...". (This requires a lot of time,
efforts and experience, but will be acceptable for upstreaming)

So should I try to implement and upstream changes of expat testing
framework, or I can leave this for somebody else?

>
> Working with upstream takes a bit more time but if we
> don't have to carry patches for years, it's worth it.
>
> Finally, how about adding the test results in the long log
> with info about the image and machine used? The time
> needed to run the tests will be useful to determine if these
> ptests can be added to:
>
>    meta/conf/distro/include/ptest-packagelists.inc
>
> and you could do that if the tests run in < 30 seconds in qemux86-64
> with kvm support.
>

CMake based building system of this library uses such tool like CTest.
This tool can run built tests, show their output and write it to log
file simultaneously with time tracking of tests` execution.
This can be additional "pros" for migration on CMake-based build
system, of course with adding one additional RDEPENS-ptest value for
package.

>
> Thanks,
>
> ../Randy
>
> > +
> > + dnl
> > + dnl Increment LIBREVISION if source code has changed at all
> > +--
> > +2.17.1
> > +
> > diff --git a/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch b/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
> > new file mode 100644
> > index 0000000000..9a85a26117
> > --- /dev/null
> > +++ b/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
> > @@ -0,0 +1,52 @@
> > +From 825f344543676fc3314f4e074163fd638db8e8f9 Mon Sep 17 00:00:00 2001
> > +From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> > +Date: Thu, 6 Feb 2020 13:44:56 +0200
> > +Subject: [PATCH 3/3] expat: Added suitable format of tests in ptest
> > +
> > +Some changes in testcases code were applied for testcase engine.
> > +This was just adding of message outputs in "RESULT: TESTNAME" form...
> > +
> > +Upstream-Status: Inappropriate [oe-core specific]
> > +
> > +Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> > +---
> > + tests/minicheck.c | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/tests/minicheck.c b/tests/minicheck.c
> > +index a5a1efb..b39cda9 100644
> > +--- a/tests/minicheck.c
> > ++++ b/tests/minicheck.c
> > +@@ -164,6 +164,7 @@ srunner_run_all(SRunner *runner, int verbosity) {
> > +       if (tc->setup != NULL) {
> > +         /* setup */
> > +         if (setjmp(env)) {
> > ++          printf("SKIP: %s\n", _check_current_function);
> > +           add_failure(runner, verbosity);
> > +           continue;
> > +         }
> > +@@ -171,6 +172,7 @@ srunner_run_all(SRunner *runner, int verbosity) {
> > +       }
> > +       /* test */
> > +       if (setjmp(env)) {
> > ++        printf("FAIL: %s\n", _check_current_function);
> > +         add_failure(runner, verbosity);
> > +         continue;
> > +       }
> > +@@ -179,11 +181,13 @@ srunner_run_all(SRunner *runner, int verbosity) {
> > +       /* teardown */
> > +       if (tc->teardown != NULL) {
> > +         if (setjmp(env)) {
> > ++          printf("PASS: %s\n", _check_current_function);
> > +           add_failure(runner, verbosity);
> > +           continue;
> > +         }
> > +         tc->teardown();
> > +       }
> > ++      printf("PASS: %s\n", _check_current_function);
> > +     }
> > +     tc = tc->next_tcase;
> > +   }
> > +--
> > +2.17.1
> > +
> > diff --git a/meta/recipes-core/expat/expat/run-ptest b/meta/recipes-core/expat/expat/run-ptest
> > new file mode 100644
> > index 0000000000..df994c0838
> > --- /dev/null
> > +++ b/meta/recipes-core/expat/expat/run-ptest
> > @@ -0,0 +1,3 @@
> > +#!/bin/bash
> > +
> > +make -k runtests
> > diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
> > index 8f3db41352..420ffddc80 100644
> > --- a/meta/recipes-core/expat/expat_2.2.9.bb
> > +++ b/meta/recipes-core/expat/expat_2.2.9.bb
> > @@ -8,15 +8,25 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
> >
> >   SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
> >              file://libtool-tag.patch \
> > +        file://0001-expat-Added-Makefile-targets-for-ptest-support.patch \
> > +        file://0002-expat-Added-support-for-ptests-in-form-of-new-target.patch \
> > +        file://0003-expat-Added-suitable-format-of-tests-in-ptest.patch \
> > +        file://run-ptest \
> >         "
> >
> >   SRC_URI[md5sum] = "875a2c2ff3e8eb9e5a5cd62db2033ab5"
> >   SRC_URI[sha256sum] = "f1063084dc4302a427dabcca499c8312b3a32a29b7d2506653ecc8f950a9a237"
> >
> > -inherit autotools lib_package
> > +inherit autotools ptest lib_package
> > +
> > +RDEPENDS_${PN}-ptest += "make bash"
> >
> >   do_configure_prepend () {
> >       rm -f ${S}/conftools/libtool.m4
> >   }
> >
> > +do_compile_ptest() {
> > +     oe_runmake buildtest-TESTS
> > +}
> > +
> >   BBCLASSEXTEND = "native nativesdk"
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

Thank you for your attention

-- 
Popovych Oleksandr
GlobalLogic Inc.

