Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D10C636D7
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 01:11:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4520.1676250711456297327
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 17:11:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=ZlNqYpfV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14080584dc=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31D1AP4V006283
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 01:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=nvBEpVv5o/Rtfxb5cXkapbhc2Uyg9VsU/AiR5VCUZe0=;
 b=ZlNqYpfVY/BhUyXU0Jt4TKIyynWXvcSplUSGmrUQmkZUtn6RsUi6PY+OCvXr3wAfTtxk
 zURvyQmvKiXW5uccehNVqOqUa+wWKfOyKj8IjvpqqiydnqDT3hnaVizqZ0miYBYTLLxB
 /vbcQq1VnCBymxCAjubsBaBbUkzxhd/nZA7cLprhBvBw6Exbw/V+cmerc2P5EyCE7Y+y
 jPbNnI4EFjARVBkR2EcC8tqkud3LWXIiIxcfYpnB2CZ0yo0Jf21uvLZNgUX/bAxv9RDn
 XL7AVNeDwKVfNxj2I6u2R6UUOYtcWMIosfssAk4XX3s3S7yqVgLeAi0eFoaAWa9Cl4gx gQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np0839af0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 01:11:50 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Sun, 12 Feb 2023 17:11:48 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sun, 12 Feb 2023 17:11:48 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] webkitgtk: 2.38.3 -> 2.38.4
Date: Mon, 13 Feb 2023 09:11:44 +0800
Message-ID: <20230213011144.10813-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Xtff2V1OgihamFCagL_1sqMQEd9GcRUZ
X-Proofpoint-ORIG-GUID: Xtff2V1OgihamFCagL_1sqMQEd9GcRUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-12_12,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130010
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31D1AP4V006283
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 01:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177072

From: Kai Kang <kai.kang@windriver.com>

Update webkitgtk from 2.38.3 to 2.38.4.
* remove 0001-When-building-introspection-files-do-not-quote-CFLAG.patch
  which has been merged in upstream

What=E2=80=99s new in the WebKitGTK 2.38.4 release?[1]
* Improve GStreamer multimedia playback across the board with improved
  codec selection logic, better handling of latency, and improving frame
  discard to avoid audio/video desynchronization, among other fixes.
* Disable HLS media playback by default, which makes web sites use MSE
  instead. If needed WEBKIT_GST_ENABLE_HLS_SUPPORT=3D1 can be set in the
  environment to enable it back.
* Disable threaded rendering in GTK4 builds by default, as it was
  causing crashes.
* Fix MediaSession API not showing artwork images.
* Fix MediaSession MPRIS usage when running inside a Flatpak sandbox.
* Fix input element controls to correctly scale when applying a zoom
  factor different than the default.
* Fix leakage of Web processes in certain situations.
* Fix the injected bundle not being found when running inside a sandbox.
* Fix the build with ENABLE_INTROSPECTION when cross-compiling.
* FIx the build with ENABLE_WEBGL disabled.
* Fix the build with GStreamer-based WebRTC enabled.
* Fix the build with USE_GTK4 enabled.
* Fix several crashes and rendering issues.

[1]: https://webkitgtk.org/2023/02/02/webkitgtk2.38.4-released.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...trospection-files-do-not-quote-CFLAG.patch | 55 -------------------
 ...ebkitgtk_2.38.3.bb =3D> webkitgtk_2.38.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 57 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-When-building=
-introspection-files-do-not-quote-CFLAG.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.38.3.bb =3D> webkitgtk_2.38=
.4.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-intros=
pection-files-do-not-quote-CFLAG.patch b/meta/recipes-sato/webkit/webkitg=
tk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
deleted file mode 100644
index 2dab00a075..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection=
-files-do-not-quote-CFLAG.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 89ac299e0d9436f1effaa07711458d616574cc8f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 4 Apr 2022 21:20:05 +0200
-Subject: [PATCH] Propagate CFLAGS to introspection targets
-
-Otherwise, important things do not get passed to the compiler in cross c=
ompiling with a sysroot scenario:
-
-In file included from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64=
-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/x86_64-poky=
-linux/gcc/x86_64-poky-linux/11.2.0/include-fixed/syslimits.h:7,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64=
-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/x86_64-poky=
-linux/gcc/x86_64-poky-linux/11.2.0/include-fixed/limits.h:34,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64=
-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/lib/glib-2.0/include/g=
libconfig.h:11,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64=
-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/=
gtypes.h:32,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64=
-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/=
galloca.h:32,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64=
-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib.=
h:30,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64=
-poky-linux/webkitgtk/2.36.0-r0/build/Source/JavaScriptCore/tmp-introspec=
tb51ks33n/JavaScriptCore-4.0.c:2:
-/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/=
2.36.0-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky=
-linux/11.2.0/include-fixed/limits.h:203:75: error: no include path in wh=
ich to search for limits.h
-  203 | #include_next <limits.h>                /* recurse down to the r=
eal one */
-      |                                                                 =
          ^
-In file included from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64=
-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/=
galloca.h:32,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64=
-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib.=
h:30,
-                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64=
-poky-linux/webkitgtk/2.36.0-r0/build/Source/JavaScriptCore/tmp-introspec=
tb51ks33n/JavaScriptCore-4.0.c:2:
-/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/=
2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/gtypes.h:35:10: fatal =
error: time.h: No such file or directory
-   35 | #include <time.h>
-      |          ^~~~~~~~
-compilation terminated.
-Traceback (most recent call last):
-  File "/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/we=
bkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/unix=
ccompiler.py", line 117, in _compile
-    self.spawn(compiler_so + cc_args + [src, '-o', obj] +
-  File "/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/we=
bkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/ccom=
piler.py", line 910, in spawn
-    spawn(cmd, dry_run=3Dself.dry_run)
-  File "/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/we=
bkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/spaw=
n.py", line 91, in spawn
-    raise DistutilsExecError(
-distutils.errors.DistutilsExecError: command '/srv/work/alex/poky/build-=
64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-na=
tive/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc' failed with exit co=
de 1
-
-Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/8290]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
-
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Source/cmake/FindGI.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
-index b3e810cd..e22a75f7 100644
---- a/Source/cmake/FindGI.cmake
-+++ b/Source/cmake/FindGI.cmake
-@@ -340,7 +340,7 @@ function(GI_INTROSPECT namespace nsversion header)
-         DEPENDS ${gir_deps} ${gir_srcs}
-         VERBATIM
-         COMMAND_EXPAND_LISTS
--        COMMAND ${CMAKE_COMMAND} -E env "CC=3D${CMAKE_C_COMPILER}"
-+        COMMAND ${CMAKE_COMMAND} -E env "CC=3D${CMAKE_C_COMPILER}" "CFL=
AGS=3D${CMAKE_C_FLAGS}"
-             "${GI_SCANNER_EXE}" --quiet --warn-all --warn-error --no-li=
btool
-             "--output=3D${gir_path}"
-             "--library=3D$<TARGET_FILE_BASE_NAME:${opt_TARGET}>"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.38.4.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.38.4.bb
index 5d8d212871..cab91eec93 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.4.bb
@@ -12,11 +12,10 @@ LIC_FILES_CHKSUM =3D "file://Source/JavaScriptCore/CO=
PYING.LIB;md5=3Dd0c6d6397a5d842
 SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-o=
bta.patch \
            file://reproducibility.patch \
-           file://0001-When-building-introspection-files-do-not-quote-CF=
LAG.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
            "
-SRC_URI[sha256sum] =3D "41f001d1ed448c6936b394a9f20e4640eebf83a7f08262df=
28504f7410604a5a"
+SRC_URI[sha256sum] =3D "4f47ea29a2d4d5f15eef3dc9e2d6c6f067e8de863a3f6445=
5e1ccf9693cc1d36"
=20
 inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
=20
--=20
2.17.1


