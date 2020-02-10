Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 43ABB60926
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 17:13:28 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id v141so4599472vsv.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 09:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o+3+XvmlqZj+OgV5FGkWVQqzlEwjJsP4ucflpX+afBI=;
	b=h2XbMSniBQIHyKHGWZb/X/gVOZ66ncWuhjN2Kd5vd/kWRA0dJVeby7IWTk3MAoY25D
	pb+F6iXXwkAUSHunOnSbj0DQ5ZFn91vx7Tr+/o6kqjFzJvmZmBWT132q/bct2tsWIqGY
	USnmF/M1VW2GIMRhAUutQu7tEYDiEAF+6Z/2dgFrShzeMxekAl0c8+F5f6COqAhn5AK2
	I03yVcD72VZvvVfxnrs3GtFn+UIyx4xZNe4o9SCSUpQ0IXUZfLaYKwG5aQ66SlVcCkFz
	Xx5mfSsuh1CA4v0lJ4vdTgl/IGtz/PRGQsMSeUIUrjpsB4akoO9kN24Sz/AYD2gZfN3v
	+/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o+3+XvmlqZj+OgV5FGkWVQqzlEwjJsP4ucflpX+afBI=;
	b=CE0dpJ6EIfsu7qQSIwdhYlkCQwQiRkpb7O8ylKP1DIb5L7MSe/UtowxvCknN8OQ4lC
	O028PYvyOfZYUxnKgpt1UoFLFxiuU0BRAMLkPcLUxFfuVF93JMcmdTAhDlsApYIB9hmN
	v6O1kmgxSqEnudYabcNck5Ft6vTNRlyaNAYHQbD/vI0OazHqVc4BXiHX3tIiJHvI5InZ
	fmZLIIREEa8sdTsVQwrzLdiWCve0oyN0OTpES8KSQNZT3R5N/ghWXenOYNouMQgnEBR8
	Zst7lqwJa/yF5TZXuriYcwG3dCjUI3qq45+dN5e7wBKZhdCOL33KR/Ojkk8bTuAexGXV
	9ZYA==
X-Gm-Message-State: APjAAAUEA+O/P83wIznl4TZllYzExEnUokfOR37Azjv5Pakk49fDBV4E
	DI0keF/0hWUdR4kiPS6JE77GkiEoS9A1lTlNOfc=
X-Google-Smtp-Source: APXvYqxfMs5sn63ZhNn4r6TMyNb3m95Y5pIFHACwqKzppjoQnsG1V4wYAAz227+k3ovpvr2gdbSE99luOIJQGSHSOkQ=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr6896823vsq.94.1581354808974; 
	Mon, 10 Feb 2020 09:13:28 -0800 (PST)
MIME-Version: 1.0
References: <CAKqUGW9ZMSWSdf_zPnH6RA7BihMcAK-0SOEW8T9EsTq8JGuN_g@mail.gmail.com>
In-Reply-To: <CAKqUGW9ZMSWSdf_zPnH6RA7BihMcAK-0SOEW8T9EsTq8JGuN_g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Feb 2020 18:14:00 +0100
Message-ID: <CANNYZj-ijJ-NgbbVuSjHEjK+N3aKpGr2zBhb0GgVy=Gt_zgvJg@mail.gmail.com>
To: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] expat: add ptest
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
X-List-Received-Date: Mon, 10 Feb 2020 17:13:28 -0000
Content-Type: multipart/alternative; boundary="000000000000a7223e059e3bdb9d"

--000000000000a7223e059e3bdb9d
Content-Type: text/plain; charset="UTF-8"

You need to send your patch using 'git send-email', that will guarantee the
correct format.

Alex

On Mon, 10 Feb 2020 at 17:50, Oleksandr Popovych via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> From dcf5a9b6199c3b1f4a6aad00334e69281bde3c34 Mon Sep 17 00:00:00 2001
> From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> Date: Thu, 6 Feb 2020 18:14:28 +0200
> Subject: [OE-core][PATCH] expat: Added ptest
>
> For ptest support for this package several additional patches and
> run-ptest script were added and recipe was changed.
>
> Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> ---
>  ...d-Makefile-targets-for-ptest-support.patch | 38 ++++++++++++++
>  ...ort-for-ptests-in-form-of-new-target.patch | 31 ++++++++++++
>  ...ed-suitable-format-of-tests-in-ptest.patch | 50 +++++++++++++++++++
>  meta/recipes-core/expat/expat/run-ptest       |  3 ++
>  meta/recipes-core/expat/expat_2.2.9.bb        | 12 ++++-
>  5 files changed, 133 insertions(+), 1 deletion(-)
>  create mode 100644
>
> meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
>  create mode 100644
>
> meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
>  create mode 100644
>
> meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
>  create mode 100644 meta/recipes-core/expat/expat/run-ptest
>
> diff --git
> a/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
>
> b/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
> new file mode 100644
> index 0000000000..32488060ee
> --- /dev/null
> +++
> b/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-support.patch
> @@ -0,0 +1,38 @@
> +From ce803ec3d7b095cb55686f9cd5d3f01d34a31a5e Mon Sep 17 00:00:00 2001
> +From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> +Date: Thu, 6 Feb 2020 13:41:45 +0200
> +Subject: [PATCH 1/3] expat: Added Makefile targets for ptest support
> +
> +install-ptest, runtests and check tagrets are added.
> +
> +Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> +---
> + Makefile.am | 15 +++++++++++++++
> + 1 file changed, 15 insertions(+)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 5e1d37d..c63b44a 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -152,3 +152,18 @@ qa:
> +     QA_COMPILER=clang QA_SANITIZER=memory    ./qa.sh
> +     QA_COMPILER=clang QA_SANITIZER=undefined ./qa.sh
> +     QA_COMPILER=gcc   QA_PROCESSOR=gcov      ./qa.sh
> ++
> ++.PHONY: install-ptest
> ++install-ptest:
> ++    echo $(S)
> ++    (if [ -d tests/.libs ] ; then cd tests/.libs; fi; \
> ++        install runtests runtestspp $(DESTDIR))
> ++    cp Makefile $(DESTDIR)
> ++    sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
> ++
> ++.PHONY: runtests
> ++runtests:
> ++    @echo "C variant of tests:"
> ++    @$(CHECKER) ./runtests$(EXEEXT) -q
> ++    @echo "C++ variant of tests:"
> ++    @$(CHECKER) ./runtestspp$(EXEEXT) -q
> +--
> +2.17.1
> +
> diff --git
> a/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
>
> b/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
> new file mode 100644
> index 0000000000..cf8a2495e9
> --- /dev/null
> +++
> b/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-of-new-target.patch
> @@ -0,0 +1,31 @@
> +From 2b209a025f62fb1be7b32599aa80703ce8ecd76a Mon Sep 17 00:00:00 2001
> +From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> +Date: Thu, 6 Feb 2020 13:43:57 +0200
> +Subject: [PATCH 2/3] expat: Added support for ptests in form of new target
> +
> +configure.am file changed, according to this advice:
> +https://wiki.yoctoproject.org/wiki/Ptest#Building_the_test_suite
> +
> +Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> +---
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index d58ac03..8e6b41e 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -34,8 +34,8 @@ AC_CONFIG_SRCDIR([Makefile.in])
> + AC_CONFIG_AUX_DIR([conftools])
> + AC_CONFIG_MACRO_DIR([m4])
> + AC_CANONICAL_HOST
> +-AM_INIT_AUTOMAKE
> +-
> ++AM_INIT_AUTOMAKE([serial-tests])
> ++AM_EXTRA_RECURSIVE_TARGETS([buildtest-TESTS])
> +
> + dnl
> + dnl Increment LIBREVISION if source code has changed at all
> +--
> +2.17.1
> +
> diff --git
> a/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
>
> b/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
> new file mode 100644
> index 0000000000..5d1daefc92
> --- /dev/null
> +++
> b/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-ptest.patch
> @@ -0,0 +1,50 @@
> +From b2e236e238f8bab42651313ea198b27355945d97 Mon Sep 17 00:00:00 2001
> +From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> +Date: Thu, 6 Feb 2020 13:44:56 +0200
> +Subject: [PATCH 3/3] expat: Added suitable format of tests in ptest
> +
> +Some changes in testcases code were applied for testcase engine.
> +This was just adding of message outputs in "RESULT: TESTNAME" form...
> +
> +Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> +---
> + tests/minicheck.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/tests/minicheck.c b/tests/minicheck.c
> +index a5a1efb..b39cda9 100644
> +--- a/tests/minicheck.c
> ++++ b/tests/minicheck.c
> +@@ -164,6 +164,7 @@ srunner_run_all(SRunner *runner, int verbosity) {
> +       if (tc->setup != NULL) {
> +         /* setup */
> +         if (setjmp(env)) {
> ++          printf("SKIP: %s\n", _check_current_function);
> +           add_failure(runner, verbosity);
> +           continue;
> +         }
> +@@ -171,6 +172,7 @@ srunner_run_all(SRunner *runner, int verbosity) {
> +       }
> +       /* test */
> +       if (setjmp(env)) {
> ++        printf("FAIL: %s\n", _check_current_function);
> +         add_failure(runner, verbosity);
> +         continue;
> +       }
> +@@ -179,11 +181,13 @@ srunner_run_all(SRunner *runner, int verbosity) {
> +       /* teardown */
> +       if (tc->teardown != NULL) {
> +         if (setjmp(env)) {
> ++          printf("PASS: %s\n", _check_current_function);
> +           add_failure(runner, verbosity);
> +           continue;
> +         }
> +         tc->teardown();
> +       }
> ++      printf("PASS: %s\n", _check_current_function);
> +     }
> +     tc = tc->next_tcase;
> +   }
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-core/expat/expat/run-ptest
> b/meta/recipes-core/expat/expat/run-ptest
> new file mode 100644
> index 0000000000..df994c0838
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/bash
> +
> +make -k runtests
> diff --git a/meta/recipes-core/expat/expat_2.2.9.bb
> b/meta/recipes-core/expat/expat_2.2.9.bb
> index 8f3db41352..420ffddc80 100644
> --- a/meta/recipes-core/expat/expat_2.2.9.bb
> +++ b/meta/recipes-core/expat/expat_2.2.9.bb
> @@ -8,15 +8,25 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
>             file://libtool-tag.patch \
> +       file://0001-expat-Added-Makefile-targets-for-ptest-support.patch \
> +
>  file://0002-expat-Added-support-for-ptests-in-form-of-new-target.patch \
> +       file://0003-expat-Added-suitable-format-of-tests-in-ptest.patch \
> +       file://run-ptest \
>        "
>
>  SRC_URI[md5sum] = "875a2c2ff3e8eb9e5a5cd62db2033ab5"
>  SRC_URI[sha256sum] =
> "f1063084dc4302a427dabcca499c8312b3a32a29b7d2506653ecc8f950a9a237"
>
> -inherit autotools lib_package
> +inherit autotools ptest lib_package
> +
> +RDEPENDS_${PN}-ptest += "make bash"
>
>
>  do_configure_prepend () {
>      rm -f ${S}/conftools/libtool.m4
>  }
>
> +do_compile_ptest() {
> +    oe_runmake buildtest-TESTS
> +}
> +
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a7223e059e3bdb9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You need to send your patch using &#39;git send-email&#39;=
, that will guarantee the correct format.<div><br></div><div>Alex</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, 10 Feb 2020 at 17:50, Oleksandr Popovych via Openembedded-core &lt;<a h=
ref=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-core@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;border-left-color:rgb(204,204,204);padding-left:1ex">From dcf5a9b=
6199c3b1f4a6aad00334e69281bde3c34 Mon Sep 17 00:00:00 2001<br>
From: Oleksandr Popovych &lt;<a href=3D"mailto:oleksandr.s.popovych@globall=
ogic.com" target=3D"_blank">oleksandr.s.popovych@globallogic.com</a>&gt;<br=
>
Date: Thu, 6 Feb 2020 18:14:28 +0200<br>
Subject: [OE-core][PATCH] expat: Added ptest<br>
<br>
For ptest support for this package several additional patches and<br>
run-ptest script were added and recipe was changed.<br>
<br>
Signed-off-by: Oleksandr Popovych &lt;<a href=3D"mailto:oleksandr.s.popovyc=
h@globallogic.com" target=3D"_blank">oleksandr.s.popovych@globallogic.com</=
a>&gt;<br>
---<br>
=C2=A0...d-Makefile-targets-for-ptest-support.patch | 38 ++++++++++++++<br>
=C2=A0...ort-for-ptests-in-form-of-new-target.patch | 31 ++++++++++++<br>
=C2=A0...ed-suitable-format-of-tests-in-ptest.patch | 50 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/expat/expat/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 3 ++<br>
=C2=A0meta/recipes-core/expat/<a href=3D"http://expat_2.2.9.bb" rel=3D"nore=
ferrer" target=3D"_blank">expat_2.2.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
2 ++++-<br>
=C2=A05 files changed, 133 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644<br>
meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest-s=
upport.patch<br>
=C2=A0create mode 100644<br>
meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form-o=
f-new-target.patch<br>
=C2=A0create mode 100644<br>
meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-in-=
ptest.patch<br>
=C2=A0create mode 100644 meta/recipes-core/expat/expat/run-ptest<br>
<br>
diff --git a/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-target=
s-for-ptest-support.patch<br>
b/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-ptest=
-support.patch<br>
new file mode 100644<br>
index 0000000000..32488060ee<br>
--- /dev/null<br>
+++ b/meta/recipes-core/expat/expat/0001-expat-Added-Makefile-targets-for-p=
test-support.patch<br>
@@ -0,0 +1,38 @@<br>
+From ce803ec3d7b095cb55686f9cd5d3f01d34a31a5e Mon Sep 17 00:00:00 2001<br>
+From: Oleksandr Popovych &lt;<a href=3D"mailto:oleksandr.s.popovych@global=
logic.com" target=3D"_blank">oleksandr.s.popovych@globallogic.com</a>&gt;<b=
r>
+Date: Thu, 6 Feb 2020 13:41:45 +0200<br>
+Subject: [PATCH 1/3] expat: Added Makefile targets for ptest support<br>
+<br>
+install-ptest, runtests and check tagrets are added.<br>
+<br>
+Signed-off-by: Oleksandr Popovych &lt;<a href=3D"mailto:oleksandr.s.popovy=
ch@globallogic.com" target=3D"_blank">oleksandr.s.popovych@globallogic.com<=
/a>&gt;<br>
+---<br>
+ Makefile.am | 15 +++++++++++++++<br>
+ 1 file changed, 15 insertions(+)<br>
+<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index 5e1d37d..c63b44a 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -152,3 +152,18 @@ qa:<br>
+=C2=A0 =C2=A0 =C2=A0QA_COMPILER=3Dclang QA_SANITIZER=3Dmemory=C2=A0 =C2=A0=
 ./qa.sh<br>
+=C2=A0 =C2=A0 =C2=A0QA_COMPILER=3Dclang QA_SANITIZER=3Dundefined ./qa.sh<b=
r>
+=C2=A0 =C2=A0 =C2=A0QA_COMPILER=3Dgcc=C2=A0 =C2=A0QA_PROCESSOR=3Dgcov=C2=
=A0 =C2=A0 =C2=A0 ./qa.sh<br>
++<br>
++.PHONY: install-ptest<br>
++install-ptest:<br>
++=C2=A0 =C2=A0 echo $(S)<br>
++=C2=A0 =C2=A0 (if [ -d tests/.libs ] ; then cd tests/.libs; fi; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 install runtests runtestspp $(DESTDIR))<br>
++=C2=A0 =C2=A0 cp Makefile $(DESTDIR)<br>
++=C2=A0 =C2=A0 sed -i -e &#39;s|^Makefile:|_Makefile:|&#39; $(DESTDIR)/Mak=
efile<br>
++<br>
++.PHONY: runtests<br>
++runtests:<br>
++=C2=A0 =C2=A0 @echo &quot;C variant of tests:&quot;<br>
++=C2=A0 =C2=A0 @$(CHECKER) ./runtests$(EXEEXT) -q<br>
++=C2=A0 =C2=A0 @echo &quot;C++ variant of tests:&quot;<br>
++=C2=A0 =C2=A0 @$(CHECKER) ./runtestspp$(EXEEXT) -q<br>
+--<br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-core/expat/expat/0002-expat-Added-support-for-pte=
sts-in-form-of-new-target.patch<br>
b/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-form=
-of-new-target.patch<br>
new file mode 100644<br>
index 0000000000..cf8a2495e9<br>
--- /dev/null<br>
+++ b/meta/recipes-core/expat/expat/0002-expat-Added-support-for-ptests-in-=
form-of-new-target.patch<br>
@@ -0,0 +1,31 @@<br>
+From 2b209a025f62fb1be7b32599aa80703ce8ecd76a Mon Sep 17 00:00:00 2001<br>
+From: Oleksandr Popovych &lt;<a href=3D"mailto:oleksandr.s.popovych@global=
logic.com" target=3D"_blank">oleksandr.s.popovych@globallogic.com</a>&gt;<b=
r>
+Date: Thu, 6 Feb 2020 13:43:57 +0200<br>
+Subject: [PATCH 2/3] expat: Added support for ptests in form of new target=
<br>
+<br>
+<a href=3D"http://configure.am" rel=3D"noreferrer" target=3D"_blank">confi=
gure.am</a> file changed, according to this advice:<br>
+<a href=3D"https://wiki.yoctoproject.org/wiki/Ptest#Building_the_test_suit=
e" rel=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/=
Ptest#Building_the_test_suite</a><br>
+<br>
+Signed-off-by: Oleksandr Popovych &lt;<a href=3D"mailto:oleksandr.s.popovy=
ch@globallogic.com" target=3D"_blank">oleksandr.s.popovych@globallogic.com<=
/a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index d58ac03..8e6b41e 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -34,8 +34,8 @@ AC_CONFIG_SRCDIR([Makefile.in])<br>
+ AC_CONFIG_AUX_DIR([conftools])<br>
+ AC_CONFIG_MACRO_DIR([m4])<br>
+ AC_CANONICAL_HOST<br>
+-AM_INIT_AUTOMAKE<br>
+-<br>
++AM_INIT_AUTOMAKE([serial-tests])<br>
++AM_EXTRA_RECURSIVE_TARGETS([buildtest-TESTS])<br>
+<br>
+ dnl<br>
+ dnl Increment LIBREVISION if source code has changed at all<br>
+--<br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format=
-of-tests-in-ptest.patch<br>
b/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tests-i=
n-ptest.patch<br>
new file mode 100644<br>
index 0000000000..5d1daefc92<br>
--- /dev/null<br>
+++ b/meta/recipes-core/expat/expat/0003-expat-Added-suitable-format-of-tes=
ts-in-ptest.patch<br>
@@ -0,0 +1,50 @@<br>
+From b2e236e238f8bab42651313ea198b27355945d97 Mon Sep 17 00:00:00 2001<br>
+From: Oleksandr Popovych &lt;<a href=3D"mailto:oleksandr.s.popovych@global=
logic.com" target=3D"_blank">oleksandr.s.popovych@globallogic.com</a>&gt;<b=
r>
+Date: Thu, 6 Feb 2020 13:44:56 +0200<br>
+Subject: [PATCH 3/3] expat: Added suitable format of tests in ptest<br>
+<br>
+Some changes in testcases code were applied for testcase engine.<br>
+This was just adding of message outputs in &quot;RESULT: TESTNAME&quot; fo=
rm...<br>
+<br>
+Signed-off-by: Oleksandr Popovych &lt;<a href=3D"mailto:oleksandr.s.popovy=
ch@globallogic.com" target=3D"_blank">oleksandr.s.popovych@globallogic.com<=
/a>&gt;<br>
+---<br>
+ tests/minicheck.c | 4 ++++<br>
+ 1 file changed, 4 insertions(+)<br>
+<br>
+diff --git a/tests/minicheck.c b/tests/minicheck.c<br>
+index a5a1efb..b39cda9 100644<br>
+--- a/tests/minicheck.c<br>
++++ b/tests/minicheck.c<br>
+@@ -164,6 +164,7 @@ srunner_run_all(SRunner *runner, int verbosity) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;setup !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* setup */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (setjmp(env)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;SKIP: %s\n&quot;, _check_=
current_function);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_failure(runner, verbosity);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -171,6 +172,7 @@ srunner_run_all(SRunner *runner, int verbosity) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* test */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (setjmp(env)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;FAIL: %s\n&quot;, _check_current=
_function);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_failure(runner, verbosity);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -179,11 +181,13 @@ srunner_run_all(SRunner *runner, int verbosity) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* teardown */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;teardown !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (setjmp(env)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;PASS: %s\n&quot;, _check_=
current_function);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_failure(runner, verbosity);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;teardown();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 printf(&quot;PASS: %s\n&quot;, _check_current_functi=
on);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0tc =3D tc-&gt;next_tcase;<br>
+=C2=A0 =C2=A0}<br>
+--<br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-core/expat/expat/run-ptest<br>
b/meta/recipes-core/expat/expat/run-ptest<br>
new file mode 100644<br>
index 0000000000..df994c0838<br>
--- /dev/null<br>
+++ b/meta/recipes-core/expat/expat/run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/bash<br>
+<br>
+make -k runtests<br>
diff --git a/meta/recipes-core/expat/<a href=3D"http://expat_2.2.9.bb" rel=
=3D"noreferrer" target=3D"_blank">expat_2.2.9.bb</a><br>
b/meta/recipes-core/expat/<a href=3D"http://expat_2.2.9.bb" rel=3D"noreferr=
er" target=3D"_blank">expat_2.2.9.bb</a><br>
index 8f3db41352..420ffddc80 100644<br>
--- a/meta/recipes-core/expat/<a href=3D"http://expat_2.2.9.bb" rel=3D"nore=
ferrer" target=3D"_blank">expat_2.2.9.bb</a><br>
+++ b/meta/recipes-core/expat/<a href=3D"http://expat_2.2.9.bb" rel=3D"nore=
ferrer" target=3D"_blank">expat_2.2.9.bb</a><br>
@@ -8,15 +8,25 @@ LIC_FILES_CHKSUM =3D<br>
&quot;file://COPYING;md5=3D5b8620d98e49772d95fc1d291c26aa79&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libtool-tag.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-expat-Added-Makefile-targets-for-pt=
est-support.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-expat-Added-support-for-ptests-in-f=
orm-of-new-target.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-expat-Added-suitable-format-of-test=
s-in-ptest.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;875a2c2ff3e8eb9e5a5cd62db2033ab5&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D<br>
&quot;f1063084dc4302a427dabcca499c8312b3a32a29b7d2506653ecc8f950a9a237&quot=
;<br>
<br>
-inherit autotools lib_package<br>
+inherit autotools ptest lib_package<br>
+<br>
+RDEPENDS_${PN}-ptest +=3D &quot;make bash&quot;<br>
<br>
<br>
=C2=A0do_configure_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0rm -f ${S}/conftools/libtool.m4<br>
=C2=A0}<br>
<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 oe_runmake buildtest-TESTS<br>
+}<br>
+<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
--<br>
2.17.1<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000a7223e059e3bdb9d--
