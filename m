Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id BA0C37504C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 13:25:02 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id t133-v6so5613883oif.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 06:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZX8ngZ9JpAPC2FHPNn9Dhx6h48nJ+7JXF2Lv46aRkAs=;
	b=ieBlLMximxDF+IOmF2GwaysvBsbqshVoAXflKVmw5jV+5PnvwQmrk4vqL0tgmPLqgR
	bndkf1ZYthCslCykzc53x2ixC63HwOoBsr16iAga80HM+fZkOtJyZgkvq8pRNXyniwZM
	QUGOtgNe0Paa8x4FdNDmmJxjoLn6iyyFURt5Qa44VvI61IyL0e4i0TLMWKRqOdetYsLZ
	aF/ARUlwBPaRQeU20N4bDpL85ldi18Bvdxf+TvKaQehFxiZ9luVT3CtXnm/+HgcMRoz+
	tM9cAGRh3i+Y+cS7zN9Wk726wJNuAcE8Lt1MyIwOWcSu4P4Kt06wqt4SZjJfcOE764Y9
	ckDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZX8ngZ9JpAPC2FHPNn9Dhx6h48nJ+7JXF2Lv46aRkAs=;
	b=F9gKk85JSfKL+otUrjziZgK3WzuPAqrxdAzYjDCuKupz3otHFkbhMNnY+uhxCqwOlJ
	vBNSsIVxStvM+aYvPW6ip54Vpte33DEjd/f5LRX9OboX0PFbQ9nn6yE8W5rpxNEu85cp
	Yz4kPprtP0Yw9c007wHd0cCVjFRCDWhk3MYgKeXNiwQWAnf4E7wsGRnD/I79o/fLNS0D
	4KEHUg3Dl1t9Rq69TnichacpaqyAuJKO5zgjH0NG7GQ3OjNvHry7SReJZVs3ymzg52tf
	AEMTDceEVMJmPdPTwS9rgCMEiC8KkKUuCyvSQ20yGdKirzDjJnBEYoFXVqp0os9Wo+K9
	tCIg==
X-Gm-Message-State: APt69E1Ml5bXniSrxodlWxPFXHBg6SmHSiBoG6ONo4J4E0AuBbsHrN6O
	EtHy7sSgCfB5UrO/xwGGlbX2GCag1i7kU6tepBqGIQ==
X-Google-Smtp-Source: ADUXVKLgFOVey5pQ0u8tib93GijBWLcwx35rTSLiUQT4oAWjOjnyIXN9IboNnV2hrGsEi6c3sd7ap4dkPUsMoaitzXU=
X-Received: by 2002:aca:5406:: with SMTP id
	i6-v6mr1298686oib.115.1528982703718; 
	Thu, 14 Jun 2018 06:25:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 06:24:43
	-0700 (PDT)
In-Reply-To: <19b0e46e-9aab-ac07-1a64-70087e01d64a@intel.com>
References: <20180525062014.22022-1-anuj.mittal@intel.com>
	<19b0e46e-9aab-ac07-1a64-70087e01d64a@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Jun 2018 14:24:43 +0100
Message-ID: <CAJTo0Lad223JWVbJQG_TciHCm3YHtfjD+dPrTAT1N+cPiuFtgA@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 01/12] gstreamer: enable ptest support
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
X-List-Received-Date: Thu, 14 Jun 2018 13:25:02 -0000
Content-Type: text/plain; charset="UTF-8"

Picked, thanks.  Tested it and it passed too! :)

Ross

On 14 June 2018 at 02:06, Anuj Mittal <anuj.mittal@intel.com> wrote:
> Ping.
>
> On 05/25/2018 02:20 PM, Anuj Mittal wrote:
>> Make sure that the tests are packaged and can be executed
>> when ptest is enabled. Also, remove build host specific references
>> from Makefile.
>>
>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> ---
>>
>> v4:
>> Tweak AM_TESTS_ENVIRONMENT to remove hardcoded paths.
>>
>> ---
>>  .../files/add-a-target-to-compile-tests.patch | 69 +++++++++++++++++++
>>  .../gstreamer/files/run-ptest                 |  3 +
>>  .../gstreamer/gstreamer1.0_1.14.0.bb          | 26 ++++++-
>>  3 files changed, 96 insertions(+), 2 deletions(-)
>>  create mode 100644 meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
>>  create mode 100644 meta/recipes-multimedia/gstreamer/files/run-ptest
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch b/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
>> new file mode 100644
>> index 0000000000..d02d869410
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
>> @@ -0,0 +1,69 @@
>> +From d61414bc17cf2df019510c2908048c4cabf5cf09 Mon Sep 17 00:00:00 2001
>> +From: Anuj Mittal <anuj.mittal@intel.com>
>> +Date: Tue, 27 Feb 2018 09:27:01 +0800
>> +Subject: [PATCH] add targets for test installation
>> +
>> +Targets to make sure tests can be installed and then run on
>> +the target.
>> +
>> +Upstream-Status: Inappropriate [specific to oe setup]
>> +
>> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> +
>> +---
>> + tests/check/Makefile.am | 27 ++++++++++++++++++++-------
>> + 1 file changed, 20 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/tests/check/Makefile.am b/tests/check/Makefile.am
>> +index 13b916d..a66786d 100644
>> +--- a/tests/check/Makefile.am
>> ++++ b/tests/check/Makefile.am
>> +@@ -8,11 +8,7 @@ REGISTRY_ENVIRONMENT = \
>> +     GST_REGISTRY=$(CHECK_REGISTRY)
>> +
>> + AM_TESTS_ENVIRONMENT += \
>> +-        GST_STATE_IGNORE_ELEMENTS="$(STATE_IGNORE_ELEMENTS)"        \
>> +-        $(REGISTRY_ENVIRONMENT)                                     \
>> +-        GST_PLUGIN_SCANNER_1_0=$(top_builddir)/libs/gst/helpers/gst-plugin-scanner \
>> +-        GST_PLUGIN_SYSTEM_PATH_1_0=                                 \
>> +-        GST_PLUGIN_PATH_1_0=$(top_builddir)/plugins
>> ++        GST_STATE_IGNORE_ELEMENTS="$(STATE_IGNORE_ELEMENTS)"
>> +
>> + plugindir = $(libdir)/gstreamer-@GST_API_VERSION@
>> +
>> +@@ -178,6 +174,23 @@ noinst_PROGRAMS =
>> +
>> + TESTS = $(check_PROGRAMS)
>> +
>> ++install-ptest: $(TESTS)
>> ++    @$(INSTALL) -d $(DESTDIR)
>> ++    @for dir in `find -maxdepth 1 -type d`; do \
>> ++            if [ -x $$dir/.libs ]; then \
>> ++                    $(INSTALL) -d $(DESTDIR)/$$dir; \
>> ++                    $(INSTALL_PROGRAM) $$dir/.libs/* $(DESTDIR)/$$dir/; \
>> ++            fi \
>> ++    done
>> ++
>> ++runtests:
>> ++    @for b in $(TESTS); do \
>> ++            if [ -x $$b ]; then \
>> ++                    $(AM_TESTS_ENVIRONMENT) $(SHELL) test-driver --test-name "$$b" \
>> ++                    --log-file $$b.log --trs-file $$b.trs $$b; \
>> ++            fi \
>> ++    done
>> ++
>> + noinst_HEADERS = \
>> +     gst/capslist.h \
>> +     gst/struct_arm.h \
>> +@@ -221,9 +234,9 @@ gst_gstprintf_LDADD = \
>> +     $(LDADD)
>> +
>> + elements_fdsrc_CFLAGS=$(GST_OBJ_CFLAGS) $(AM_CFLAGS) \
>> +-    -DTESTFILE=\"$(top_srcdir)/configure.ac\"
>> ++    -DTESTFILE=\"Makefile\"
>> + elements_filesrc_CFLAGS=$(GST_OBJ_CFLAGS) $(AM_CFLAGS) \
>> +-    -DTESTFILE=\"$(top_srcdir)/configure.ac\"
>> ++    -DTESTFILE=\"Makefile\"
>> +
>> + libs_controller_LDADD = \
>> +     $(top_builddir)/libs/gst/controller/libgstcontroller-@GST_API_VERSION@.la \
>> diff --git a/meta/recipes-multimedia/gstreamer/files/run-ptest b/meta/recipes-multimedia/gstreamer/files/run-ptest
>> new file mode 100644
>> index 0000000000..473d0b67a7
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/gstreamer/files/run-ptest
>> @@ -0,0 +1,3 @@
>> +#!/bin/sh
>> +
>> +make -k runtests
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
>> index b4398c8111..e842f30c5a 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
>> @@ -8,7 +8,7 @@ LICENSE = "LGPLv2+"
>>
>>  DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
>>
>> -inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspection gtk-doc
>> +inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspection gtk-doc ptest
>>
>>  # This way common/m4/introspection.m4 will come first
>>  # (it has a custom INTROSPECTION_INIT macro, and so must be used instead of our common introspection.m4 file)
>> @@ -24,11 +24,14 @@ SRC_URI = " \
>>      file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
>>      file://gtk-doc-tweaks.patch \
>>      file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
>> +    file://add-a-target-to-compile-tests.patch \
>> +    file://run-ptest \
>>  "
>>  SRC_URI[md5sum] = "63c7cbfb86aa28c4522e374dc5555b96"
>>  SRC_URI[sha256sum] = "fc361367f0d4b780a868a8833f9f30b9c9f4ac9faea4e6b251db8b4b0398466e"
>>
>> -PACKAGECONFIG ??= ""
>> +PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
>> +                   "
>>
>>  PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
>>  PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
>> @@ -55,6 +58,7 @@ FILES_${PN}-bash-completion += "${datadir}/bash-completion/completions/ ${datadi
>>
>>  RRECOMMENDS_${PN}_qemux86 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
>>  RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
>> +RDEPENDS_${PN}-ptest += "make"
>>
>>  delete_pkg_m4_file() {
>>          # This m4 file is out of date and is missing PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
>> @@ -68,4 +72,22 @@ do_compile_prepend() {
>>          export GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.libs"
>>  }
>>
>> +do_compile_ptest() {
>> +        oe_runmake build-checks
>> +}
>> +
>> +do_install_ptest() {
>> +        oe_runmake -C tests/check DESTDIR=${D}${PTEST_PATH} install-ptest
>> +        install -m 644 ${B}/tests/check/Makefile ${D}${PTEST_PATH}
>> +        install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
>> +        sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
>> +            -e 's|${DEBUG_PREFIX_MAP}||g' \
>> +            -e 's:${HOSTTOOLS_DIR}/::g' \
>> +            -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
>> +            -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \-e 's/^Makefile:/_Makefile:/' \
>> +            -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/^top_srcdir = \(.*\)/top_srcdir = ./' \
>> +            -e 's/^builddir = \(.*\)/builddir = ./' -e 's/^top_builddir = \(.*\)/top_builddir = ./' \
>> +            -i ${D}${PTEST_PATH}/Makefile
>> +}
>> +
>>  CVE_PRODUCT = "gstreamer"
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

