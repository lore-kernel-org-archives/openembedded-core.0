Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9D3CD37AC
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:41 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15714.1777645538624655489
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EfJVQpt3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1b9DHZjo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019de3ee49f9-72a92020-cdcd-4446-a44f-0fee65bd9692-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z5pb0971wKvIZM/MRAOrcn2rtim+MxS0053frFeDAU8=;
	b=EfJVQpt3ubXJx0jROZBvZXOeprQoRQkI9jxQKB6jHjGiNgBW4o+8FsRkmC3k6qfR
	19LrvgIgIeOLBM+7f/mg352xWFTTQHRaK1K+x3Yh259Rl1hAqXYn8l5qK+7oxVqj2sI
	ubAV0kbOFsX7+A6YnYzfYuT/XIZ0DyCuE77aMW7k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z5pb0971wKvIZM/MRAOrcn2rtim+MxS0053frFeDAU8=;
	b=1b9DHZjoK4gSQuuL1StghaqwbKIZ7gdXvKb0OS5SURlJWSQ/ZQaMn2m07nBIgsta
	z2O59YPafnDp3wGFywTk9oWCqBZolWjBe3oZEVzONxCtMLT5uQ3VG1Mgwsznt8Si6dn
	lWQuFbB5wV2choUQK0EDs/twDPfPlOxot66Aho3c=
Content-Type: multipart/mixed; boundary="===============6411683029197596849=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-build: upgrading to 1.5.0 SUCCEEDED
Message-ID: <0101019de3ee49f9-72a92020-cdcd-4446-a44f-0fee65bd9692-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236230

--===============6411683029197596849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-build* to *1.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-build-upgrade-1.4.3-1.5.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From dc151d49cba2ec1ec235494a3169d78a9d7b78b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 08:04:14 +0000
Subject: [PATCH] python3-build: upgrade 1.4.3 -> 1.5.0

---
 .../python/{python3-build_1.4.3.bb => python3-build_1.5.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.4.3.bb => python3-build_1.5.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-build_1.4.3.bb b/meta/recipes-devtools/python/python3-build_1.5.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-build_1.4.3.bb
rename to meta/recipes-devtools/python/python3-build_1.5.0.bb
index 1e7794fe3f..e263e29383 100644
--- a/meta/recipes-devtools/python/python3-build_1.4.3.bb
+++ b/meta/recipes-devtools/python/python3-build_1.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "5aa4231ae0e807efdf1fd0623e07366eca2ab215921345a2e38acdd5d0fa0a74"
+SRC_URI[sha256sum] = "302c22c3ba2a0fd5f3911918651341ebb3896176cbdec15bd421f80b1afc7647"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============6411683029197596849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/build-1.4.3.dist-info -> /usr/lib/python3.14/site-packages/build-1.5.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/build-1.4.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/build-1.5.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.14/site-packages/build-1.4.3.dist-info moved to /usr/lib/python3.14/site-packages/build-1.5.0.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.4.3.dist-info moved to /usr/lib/python3.14/site-packages/build-1.5.0.dist-info

--===============6411683029197596849==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-build-upgrade-1.4.3-1.5.0.patch"

RnJvbSBkYzE1MWQ0OWNiYTJlYzFlYzIzNTQ5NGEzMTY5ZDc4YTlkN2I3OGI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwODowNDoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYnVpbGQ6IHVwZ3JhZGUgMS40LjMgLT4gMS41LjAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1idWlsZF8xLjQuMy5iYiA9PiBweXRob24zLWJ1aWxkXzEuNS4wLmJifSAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1idWlsZF8xLjQuMy5iYiA9PiBweXRo
b24zLWJ1aWxkXzEuNS4wLmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1idWlsZF8xLjQuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1idWlsZF8xLjUuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS40LjMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1idWlsZF8x
LjUuMC5iYgppbmRleCAxZTc3OTRmZTNmLi5lMjYzZTI5MzgzIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS40LjMuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuNS4wLmJiCkBAIC0zLDcgKzMs
NyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS9idWlsZCIKIExJQ0VOU0Ug
PSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzEwNDM5YWYy
ODdiMGZiNDc4MGIyYWQ2OTA3YzI1NmMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1YWE0MjMx
YWUwZTgwN2VmZGYxZmQwNjIzZTA3MzY2ZWNhMmFiMjE1OTIxMzQ1YTJlMzhhY2RkNWQwZmEwYTc0
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMwMmMyMmMzYmEyYTBmZDVmMzkxMTkxODY1MTM0MWVi
YjM4OTYxNzZjYmRlYzE1YmQ0MjFmODBiMWFmYzc2NDciCiAKIGluaGVyaXQgcHlwaSBweXRob25f
ZmxpdF9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============6411683029197596849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.o /lib/lib*.so /lib/*.la"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/lib/*.so.* /sbin/* /bin/*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/lib/*.so.* /sbin/* /bin/*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9883625 to 9685472 (-2%)
packages/x86-64-v3-poky-linux/python3-build: PKGV changed from 1.4.3 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/python3-build: PV changed from "1.4.3" to "1.5.0"
packages/x86-64-v3-poky-linux/python3-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/build/build-1.4.3.tar.gz;downloadfilename=build-1.4.3.tar.gz" to "https://files.pythonhosted.org/packages/source/b/build/build-1.5.0.tar.gz;downloadfilename=build-1.5.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PKGV changed from 1.4.3 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PV changed from "1.4.3" to "1.5.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PKGV changed from 1.4.3 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PV changed from "1.4.3" to "1.5.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PKGV changed from 1.4.3 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PV changed from "1.4.3" to "1.5.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PKGV changed from 1.4.3 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PV changed from "1.4.3" to "1.5.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PKGV changed from 1.4.3 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PV changed from "1.4.3" to "1.5.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PKGV changed from 1.4.3 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PV changed from "1.4.3" to "1.5.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGV changed from 1.4.3 [default] to 1.5.0 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build: PV changed from "1.4.3" to "1.5.0"
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGSIZE changed from 173846 to 173481 (-0%)
packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/build-1.4.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/build-1.5.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/build-1.4.3.dist-info -> /usr/lib/python3.14/site-packages/build-1.5.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.14/site-packages/build-1.4.3.dist-info moved to /usr/lib/python3.14/site-packages/build-1.5.0.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.4.3.dist-info moved to /usr/lib/python3.14/site-packages/build-1.5.0.dist-info

--===============6411683029197596849==--

