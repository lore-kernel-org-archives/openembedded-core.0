Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 62F17788A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 17:34:54 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id l3so5138984iog.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 10:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=deStYnGkpSmBQgFBoR1RqKNcsAG81mKU3jEZuFoLdao=;
	b=FB02wGQiohH3Jz9nyDT0kMjYfWZyyQThVnf2Z4dAEK6TXHsXlZOA/hHz7+jKjSgpv4
	IHLqU2OQzsxLP14m3CJpaSGnSHs3DGbGrXHWUFCJsD70PxH9Hjr3ITu3RTSKQYVZ+Wgs
	0J3l89NGPv9W+0p7cbSS+0VmUHutjYive/9vBagV8VKJS/5ZGMOGEBwhq0hK3R4UjNhW
	9M2VJ1igDInxd8y5IafvvjuEIDmSxTeoaEqoKTnHfRtqiSsedEBsyWeiP09dEKe3oMB4
	h40Lz0ZmCwXuxwl66S5EB4/TlJ6XHLYZXE9PZ/GtaVYiNRNlRtQLPj+BlFA0hcYr6Hna
	VWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=deStYnGkpSmBQgFBoR1RqKNcsAG81mKU3jEZuFoLdao=;
	b=a0bB1ak4ot+vgyqIGJlja7zMU/Soeq0bIhclm3EFtWgBVqHi487lBx9glIuaVxgMFi
	YEcVwmK3x1McLYXWyk5iRzFL7an32+cpVtCcQUqhKRwkuuMVFrixNnLVAjng+LL+Oow6
	mrQyHHnDn0rYQYp8FbslH0ZIXyEH/vH5CgN/tZvmfx3hsAsPjJ9aAmVzye/hLgr9XSG4
	5lQQjoyE1zfaq/IPv/KqaKjE3tgCKQnoa+pJO7nz/6u4E9s2k0BI/APMd3o97S/uw4De
	DJp+c0e+Ym9IZPLUdd2zAulanShOq1aFBg4j9Cu6uIqY9VB5fK+8b3gOtQLg5C6A6dJG
	79Zw==
X-Gm-Message-State: AElRT7FRUzeIoy8gAIZHcpQ/WfxGXAW+M6BeCfil/g0Ew8jz9Fw8POv1
	vWIg5cqEgIArHGP8ANWQddXfTKsRKYtFDMPnUdQfpg==
X-Google-Smtp-Source: AG47ELt7r/vCCKrHiHhroKdQlo8wevc2MxTVdWclMbFhXYa8c33qWzmnJTyu7joQ6fdlCbwEmCaVBqoD60OBcbdgw3M=
X-Received: by 10.107.37.212 with SMTP id l203mr12464772iol.20.1521480896306; 
	Mon, 19 Mar 2018 10:34:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 19 Mar 2018 10:34:35 -0700 (PDT)
In-Reply-To: <CAJTo0Lb3aVFUXAbG+f4OWse5TpFYC=6Lpgjf8xeF2C8=34YKWw@mail.gmail.com>
References: <1519786272-21483-1-git-send-email-anuj.mittal@intel.com>
	<1521442149-27776-1-git-send-email-anuj.mittal@intel.com>
	<CAJTo0Lb3aVFUXAbG+f4OWse5TpFYC=6Lpgjf8xeF2C8=34YKWw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Mar 2018 17:34:35 +0000
Message-ID: <CAJTo0LYpRGx53b2Pjsdjoe61O-GXriiSoTTNu+M7E5-0uvXRrQ@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] gstreamer: enable ptest support
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
X-List-Received-Date: Mon, 19 Mar 2018 17:34:55 -0000
Content-Type: multipart/alternative; boundary="001a11405f165b71e30567c76025"

--001a11405f165b71e30567c76025
Content-Type: text/plain; charset="UTF-8"

So the problem is that the tests explicitly search the build tree for
plugins (as they're testing the built plugins, not the system ones).

This is easily solved by deleting bits from the makefile:

--- a/tests/check/Makefile.am
+++ b/tests/check/Makefile.am
@@ -8,11 +8,7 @@ REGISTRY_ENVIRONMENT = \
   GST_REGISTRY=$(CHECK_REGISTRY)
AM_TESTS_ENVIRONMENT += \
- GST_STATE_IGNORE_ELEMENTS="$(STATE_IGNORE_ELEMENTS)"   \
- $(REGISTRY_ENVIRONMENT)                    \
-
GST_PLUGIN_SCANNER_1_0=$(top_builddir)/libs/gst/helpers/gst-plugin-scanner \
- GST_PLUGIN_SYSTEM_PATH_1_0=                    \
- GST_PLUGIN_PATH_1_0=$(top_builddir)/plugins
+ GST_STATE_IGNORE_ELEMENTS="$(STATE_IGNORE_ELEMENTS)"
plugindir = $(libdir)/gstreamer-@GST_API_VERSION@

However, now elements/fdsrc and elements/filesrc both fail, because they're
both trying to open configure.ac in the build tree.  Changing that to the
ptest Makefile should be sufficient.

Ross

On 19 March 2018 at 17:03, Burton, Ross <ross.burton@intel.com> wrote:

> You're missing a dependency on make in PN-ptest, but installing that
> results in about 20% of the tests failing.  Should they all work?
>
> Ross
>
> On 19 March 2018 at 06:49, Anuj Mittal <anuj.mittal@intel.com> wrote:
>
>> Make sure that the tests are packaged and can be executed
>> when ptest is enabled. Also, remove build host specific references
>> from Makefile.
>>
>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> ---
>>  .../files/add-a-target-to-compile-tests.patch      | 46
>> ++++++++++++++++++++++
>>  meta/recipes-multimedia/gstreamer/files/run-ptest  |  3 ++
>>  meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 25 +++++++++++-
>>  3 files changed, 72 insertions(+), 2 deletions(-)
>>  create mode 100644 meta/recipes-multimedia/gstrea
>> mer/files/add-a-target-to-compile-tests.patch
>>  create mode 100644 meta/recipes-multimedia/gstreamer/files/run-ptest
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
>> b/meta/recipes-multimedia/gstreamer/files/add-a-target-to-
>> compile-tests.patch
>> new file mode 100644
>> index 0000000..c918bbe
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/gstreamer/files/add-a-target-to-
>> compile-tests.patch
>> @@ -0,0 +1,46 @@
>> +From e69e5408f03a2f65045a418af6605653c06ec28b Mon Sep 17 00:00:00 2001
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
>> +---
>> + tests/check/Makefile.am | 17 +++++++++++++++++
>> + 1 file changed, 17 insertions(+)
>> +
>> +diff --git a/tests/check/Makefile.am b/tests/check/Makefile.am
>> +index afc1591..fb5c1c9 100644
>> +--- a/tests/check/Makefile.am
>> ++++ b/tests/check/Makefile.am
>> +@@ -175,6 +175,23 @@ noinst_PROGRAMS =
>> +
>> + TESTS = $(check_PROGRAMS)
>> +
>> ++install-ptest: $(TESTS)
>> ++      @$(INSTALL) -d $(DESTDIR)
>> ++      @for dir in `find -maxdepth 1 -type d`; do \
>> ++              if [ -x $$dir/.libs ]; then \
>> ++                      $(INSTALL) -d $(DESTDIR)/$$dir; \
>> ++                      $(INSTALL_PROGRAM) $$dir/.libs/*
>> $(DESTDIR)/$$dir/; \
>> ++              fi \
>> ++      done
>> ++
>> ++runtests:
>> ++      @for b in $(TESTS); do \
>> ++              if [ -x $$b ]; then \
>> ++                      $(AM_TESTS_ENVIRONMENT) $(SHELL) test-driver
>> --test-name "$$b" \
>> ++                      --log-file $$b.log --trs-file $$b.trs $$b; \
>> ++              fi \
>> ++      done
>> ++
>> + noinst_HEADERS = \
>> +       gst/capslist.h \
>> +       gst/struct_arm.h \
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-multimedia/gstreamer/files/run-ptest
>> b/meta/recipes-multimedia/gstreamer/files/run-ptest
>> new file mode 100644
>> index 0000000..473d0b6
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/gstreamer/files/run-ptest
>> @@ -0,0 +1,3 @@
>> +#!/bin/sh
>> +
>> +make -k runtests
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>> index c2df1f3..91f5067 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>> @@ -8,7 +8,7 @@ LICENSE = "LGPLv2+"
>>
>>  DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native
>> flex-native"
>>
>> -inherit autotools pkgconfig gettext upstream-version-is-even
>> gobject-introspection gtk-doc
>> +inherit autotools pkgconfig gettext upstream-version-is-even
>> gobject-introspection gtk-doc ptest
>>
>>  # This way common/m4/introspection.m4 will come first
>>  # (it has a custom INTROSPECTION_INIT macro, and so must be used instead
>> of our common introspection.m4 file)
>> @@ -18,9 +18,12 @@ SRC_URI_append = " \
>>      file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
>> \
>>      file://gtk-doc-tweaks.patch \
>>      file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
>> \
>> +    file://add-a-target-to-compile-tests.patch \
>> +    file://run-ptest \
>>  "
>>
>> -PACKAGECONFIG ??= ""
>> +PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',
>> '', d)} \
>> +                   "
>>
>>  PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
>>  PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
>> @@ -59,3 +62,21 @@ do_configure[prefuncs] += "delete_pkg_m4_file"
>>  do_compile_prepend() {
>>          export GIR_EXTRA_LIBS_PATH="${B}/gst/
>> .libs:${B}/libs/gst/base/.libs"
>>  }
>> +
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
>> +            -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \-e
>> 's/^Makefile:/_Makefile:/' \
>> +            -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/^top_srcdir =
>> \(.*\)/top_srcdir = ./' \
>> +            -e 's/^builddir = \(.*\)/builddir = ./' -e 's/^top_builddir
>> = \(.*\)/top_builddir = ./' \
>> +            -i ${D}${PTEST_PATH}/Makefile
>> +}
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--001a11405f165b71e30567c76025
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So the problem is that the tests explicitly search the bui=
ld tree for plugins (as they&#39;re testing the built plugins, not the syst=
em ones).<br><br>This is easily solved by deleting bits from the makefile:<=
br><br>--- a/tests/check/Makefile.am<br>+++ b/tests/check/Makefile.am<br>@@=
 -8,11 +8,7 @@ REGISTRY_ENVIRONMENT =3D \<br>=C2=A0 =C2=A0GST_REGISTRY=3D$(=
CHECK_REGISTRY)<br>AM_TESTS_ENVIRONMENT +=3D \<br>- GST_STATE_IGNORE_ELEMEN=
TS=3D&quot;$(STATE_IGNORE_ELEMENTS)&quot; =C2=A0 \<br>- $(REGISTRY_ENVIRONM=
ENT) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\=
<br>- GST_PLUGIN_SCANNER_1_0=3D$(top_builddir)/libs/gst/helpers/gst-plugin-=
scanner \<br>- GST_PLUGIN_SYSTEM_PATH_1_0=3D =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>- GST_PLUGIN_PATH_1_0=3D$(top=
_builddir)/plugins<br>+ GST_STATE_IGNORE_ELEMENTS=3D&quot;$(STATE_IGNORE_EL=
EMENTS)&quot;<br>plugindir =3D $(libdir)/gstreamer-@GST_API_VERSION@<div><b=
r></div><div>However, now elements/fdsrc and elements/filesrc both fail, be=
cause they&#39;re both trying to open <a href=3D"http://configure.ac">confi=
gure.ac</a> in the build tree.=C2=A0 Changing that to the ptest Makefile sh=
ould be sufficient.</div><div><br></div><div>Ross</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 19 March 2018 at 17:03, Burt=
on, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div dir=3D"ltr">You&#39;re missing a dependency on make =
in PN-ptest, but installing that results in about 20% of the tests failing.=
=C2=A0 Should they all work?<span class=3D"HOEnZb"><font color=3D"#888888">=
<div><br></div><div>Ross</div></font></span></div><div class=3D"HOEnZb"><di=
v class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On=
 19 March 2018 at 06:49, Anuj Mittal <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><span>Make sure that the test=
s are packaged and can be executed<br>
when ptest is enabled. Also, remove build host specific references<br>
from Makefile.<br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" tar=
get=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
---<br>
</span>=C2=A0.../files/add-a-target-to-com<wbr>pile-tests.patch=C2=A0 =C2=
=A0 =C2=A0 | 46 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-multimedia/gstre<wbr>amer/files/run-ptest=C2=A0 |=C2=A0 =
3 ++<br>
=C2=A0meta/recipes-multimedia/gstre<wbr>amer/gstreamer1.0.inc | 25 ++++++++=
+++-<br>
=C2=A03 files changed, 72 insertions(+), 2 deletions(-)<br>
<span>=C2=A0create mode 100644 meta/recipes-multimedia/gstrea<wbr>mer/files=
/add-a-target-to-<wbr>compile-tests.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/gstrea<wbr>mer/files/run-p=
test<br>
<br>
diff --git a/meta/recipes-multimedia/gstr<wbr>eamer/files/add-a-target-to-<=
wbr>compile-tests.patch b/meta/recipes-multimedia/gstr<wbr>eamer/files/add-=
a-target-to-<wbr>compile-tests.patch<br>
new file mode 100644<br>
</span>index 0000000..c918bbe<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/gstr<wbr>eamer/files/add-a-target-to-<wbr>com=
pile-tests.patch<br>
@@ -0,0 +1,46 @@<br>
+From e69e5408f03a2f65045a418af66056<wbr>53c06ec28b Mon Sep 17 00:00:00 200=
1<br>
<span>+From: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" targe=
t=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
+Date: Tue, 27 Feb 2018 09:27:01 +0800<br>
+Subject: [PATCH] add targets for test installation<br>
+<br>
+Targets to make sure tests can be installed and then run on<br>
+the target.<br>
+<br>
+Upstream-Status: Inappropriate [specific to oe setup]<br>
+<br>
+Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" ta=
rget=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
+---<br>
</span>+ tests/check/Makefile.am | 17 +++++++++++++++++<br>
+ 1 file changed, 17 insertions(+)<br>
+<br>
+diff --git a/tests/check/Makefile.am b/tests/check/Makefile.am<br>
+index afc1591..fb5c1c9 100644<br>
+--- a/tests/check/Makefile.am<br>
++++ b/tests/check/Makefile.am<br>
+@@ -175,6 +175,23 @@ noinst_PROGRAMS =3D<br>
<span>+<br>
+ TESTS =3D $(check_PROGRAMS)<br>
+<br>
++install-ptest: $(TESTS)<br>
++=C2=A0 =C2=A0 =C2=A0 @$(INSTALL) -d $(DESTDIR)<br>
</span>++=C2=A0 =C2=A0 =C2=A0 @for dir in `find -maxdepth 1 -type d`; do \<=
br>
<div><div class=3D"m_6708603585553811464h5">++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if [ -x $$dir/.libs ]; then \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 $(INSTALL) -d $(DESTDIR)/$$dir; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 $(INSTALL_PROGRAM) $$dir/.libs/* $(DESTDIR)/$$dir/; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi \<br>
++=C2=A0 =C2=A0 =C2=A0 done<br>
++<br>
++runtests:<br>
++=C2=A0 =C2=A0 =C2=A0 @for b in $(TESTS); do \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -x $$b ]; then \<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 $(AM_TESTS_ENVIRONMENT) $(SHELL) test-driver --test-name &quot;$$b&quot=
; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --log-file $$b.log --trs-file $$b.trs $$b; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi \<br>
++=C2=A0 =C2=A0 =C2=A0 done<br>
++<br>
+ noinst_HEADERS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gst/capslist.h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gst/struct_arm.h \<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-multimedia/gstr<wbr>eamer/files/run-ptest b/meta/=
recipes-multimedia/gstr<wbr>eamer/files/run-ptest<br>
new file mode 100644<br>
index 0000000..473d0b6<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/gstr<wbr>eamer/files/run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/sh<br>
+<br>
+make -k runtests<br>
diff --git a/meta/recipes-multimedia/gstr<wbr>eamer/gstreamer1.0.inc b/meta=
/recipes-multimedia/gstr<wbr>eamer/gstreamer1.0.inc<br>
</div></div>index c2df1f3..91f5067 100644<br>
<span>--- a/meta/recipes-multimedia/gstr<wbr>eamer/gstreamer1.0.inc<br>
+++ b/meta/recipes-multimedia/gstr<wbr>eamer/gstreamer1.0.inc<br>
@@ -8,7 +8,7 @@ LICENSE =3D &quot;LGPLv2+&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;glib-2.0 glib-2.0-native libcap libxml2 bison-nativ=
e flex-native&quot;<br>
<br>
-inherit autotools pkgconfig gettext upstream-version-is-even gobject-intro=
spection gtk-doc<br>
+inherit autotools pkgconfig gettext upstream-version-is-even gobject-intro=
spection gtk-doc ptest<br>
<br>
=C2=A0# This way common/m4/introspection.m4 will come first<br>
=C2=A0# (it has a custom INTROSPECTION_INIT macro, and so must be used inst=
ead of our common introspection.m4 file)<br>
@@ -18,9 +18,12 @@ SRC_URI_append =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-introspection.m4-<wbr>prefix-pkgconfig-path=
s-with-PK<wbr>G_CON.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://gtk-doc-tweaks.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-gst-gstpluginload<wbr>er.c-when-env-var-is-=
set-do-<wbr>not-fal.patch \<br>
+=C2=A0 =C2=A0 file://add-a-target-to-compile<wbr>-tests.patch \<br>
+=C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;PTEST_E<wbr>NABLED&#39=
;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;<br>
<br>
=C2=A0PACKAGECONFIG[debug] =3D &quot;--enable-debug,--disable-debu<wbr>g&qu=
ot;<br>
=C2=A0PACKAGECONFIG[tests] =3D &quot;--enable-tests,--disable-test<wbr>s&qu=
ot;<br>
</span>@@ -59,3 +62,21 @@ do_configure[prefuncs] +=3D &quot;delete_pkg_m4_f=
ile&quot;<br>
<span>=C2=A0do_compile_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/g=
st/<wbr>.libs:${B}/libs/gst/base/.libs<wbr>&quot;<br>
=C2=A0}<br>
+<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake build-checks<br>
+}<br>
+<br>
+do_install_ptest() {<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C tests/check DESTDIR=3D${D=
}${PTEST_PATH} install-ptest<br>
<div class=3D"m_6708603585553811464HOEnZb"><div class=3D"m_6708603585553811=
464h5">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${B}/tests/check/Makefil=
e ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 755 ${S}/test-driver ${D}${PTEST_PA=
TH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &#39;s,--sysroot=3D${STAGING_DIR_TAR<wb=
r>GET},,g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s|${DEBUG_PREFIX_MAP}||g=
&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s:${HOSTTOOLS_DIR}/::g&#=
39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s:${RECIPE_SYSROOT_NATIV=
E}::g<wbr>&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s:${BASE_WORKDIR}/${MULT=
IMACH<wbr>_TARGET_SYS}::g&#39; \-e &#39;s/^Makefile:/_Makefile:/&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^srcdir =3D \(.*\)/src=
dir =3D ./&#39; -e &#39;s/^top_srcdir =3D \(.*\)/top_srcdir =3D ./&#39; \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s/^builddir =3D \(.*\)/b=
uilddir =3D ./&#39; -e &#39;s/^top_builddir =3D \(.*\)/top_builddir =3D ./&=
#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -i ${D}${PTEST_PATH}/Makefile<br=
>
+}<br>
--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a11405f165b71e30567c76025--
