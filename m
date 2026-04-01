Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9FA10FCACA
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14654.1775054161432332780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1ogmI8KC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=teyFL07t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d497903e2-030c51eb-74a2-4430-a9fa-768b28e7fbca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054161;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HJ3PH3tZzyM5mLFpcYvKmfOHzhiX0pVd8SREQzmWvNQ=;
	b=1ogmI8KCyKptu8BT25OIsv6Ld4l8FtWd6CaXVC+xdkbP9nYpIKCNcSZD9Lh24lNt
	CmfoREHYd4vBq9c1Or9uUrJjO+FwkhCPh/B2mScOViWxHcpd8U6xtyoluHsOpWYzbop
	wBTY8hW5H3StM6zC3s4L9ISF6Y4CA+fZHZZ9UXhE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054161;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HJ3PH3tZzyM5mLFpcYvKmfOHzhiX0pVd8SREQzmWvNQ=;
	b=teyFL07tUrmR9vprOmsEBcVwK3IWEl3AjQgWjtmmCBdKdPwznt45QfSCNs+GZXfK
	1w+odzRLaOR2UCnsWQVraILbtQh15uj11nBOnVrY4aDFCX4Fb0ahnKwogLdkqpEPVcl
	nMi95NmJboGLslH8ppLo3mWBlwp/GtgEpw+20OmY=
Content-Type: multipart/mixed; boundary="===============8790312881950592736=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-build: upgrading to 1.4.2 SUCCEEDED
Message-ID: <0101019d497903e2-030c51eb-74a2-4430-a9fa-768b28e7fbca-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234376

--===============8790312881950592736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-build* to *1.4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-build-upgrade-1.4.0-1.4.2.patch
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
From 53b06fb5df4fb09640dd227c7366e5e4c07d6312 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 09:12:59 +0000
Subject: [PATCH] python3-build: upgrade 1.4.0 -> 1.4.2

---
 .../python/{python3-build_1.4.0.bb => python3-build_1.4.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.4.0.bb => python3-build_1.4.2.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-build_1.4.0.bb b/meta/recipes-devtools/python/python3-build_1.4.2.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-build_1.4.0.bb
rename to meta/recipes-devtools/python/python3-build_1.4.2.bb
index 910f08374b..77ff5fd732 100644
--- a/meta/recipes-devtools/python/python3-build_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-build_1.4.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "f1b91b925aa322be454f8330c6fb48b465da993d1e7e7e6fa35027ec49f3c936"
+SRC_URI[sha256sum] = "35b14e1ee329c186d3f08466003521ed7685ec15ecffc07e68d706090bf161d1"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============8790312881950592736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/build-1.4.0.dist-info -> /usr/lib/python3.14/site-packages/build-1.4.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/build-1.4.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/build-1.4.2.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.14/site-packages/build-1.4.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.4.2.dist-info
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
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.4.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.4.2.dist-info

--===============8790312881950592736==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-build-upgrade-1.4.0-1.4.2.patch"

RnJvbSA1M2IwNmZiNWRmNGZiMDk2NDBkZDIyN2M3MzY2ZTVlNGMwN2Q2MzEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAwOToxMjo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYnVpbGQ6IHVwZ3JhZGUgMS40LjAgLT4gMS40LjIKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1idWlsZF8xLjQuMC5iYiA9PiBweXRob24zLWJ1aWxkXzEuNC4yLmJifSAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1idWlsZF8xLjQuMC5iYiA9PiBweXRo
b24zLWJ1aWxkXzEuNC4yLmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1idWlsZF8xLjQuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1idWlsZF8xLjQuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS40LjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1idWlsZF8x
LjQuMi5iYgppbmRleCA5MTBmMDgzNzRiLi43N2ZmNWZkNzMyIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS40LjAuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuNC4yLmJiCkBAIC0zLDcgKzMs
NyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS9idWlsZCIKIExJQ0VOU0Ug
PSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzEwNDM5YWYy
ODdiMGZiNDc4MGIyYWQ2OTA3YzI1NmMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmMWI5MWI5
MjVhYTMyMmJlNDU0ZjgzMzBjNmZiNDhiNDY1ZGE5OTNkMWU3ZTdlNmZhMzUwMjdlYzQ5ZjNjOTM2
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM1YjE0ZTFlZTMyOWMxODZkM2YwODQ2NjAwMzUyMWVk
NzY4NWVjMTVlY2ZmYzA3ZTY4ZDcwNjA5MGJmMTYxZDEiCiAKIGluaGVyaXQgcHlwaSBweXRob25f
ZmxpdF9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============8790312881950592736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-build: PV changed from "1.4.0" to "1.4.2"
packages/x86-64-v3-poky-linux/python3-build: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/python3-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/build/build-1.4.0.tar.gz;downloadfilename=build-1.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/build/build-1.4.2.tar.gz;downloadfilename=build-1.4.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PV changed from "1.4.0" to "1.4.2"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PV changed from "1.4.0" to "1.4.2"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PV changed from "1.4.0" to "1.4.2"
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PV changed from "1.4.0" to "1.4.2"
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PV changed from "1.4.0" to "1.4.2"
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PV changed from "1.4.0" to "1.4.2"
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build: PV changed from "1.4.0" to "1.4.2"
packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/build-1.4.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/build-1.4.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/build-1.4.0.dist-info -> /usr/lib/python3.14/site-packages/build-1.4.2.dist-info
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGV changed from 1.4.0 [default] to 1.4.2 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGSIZE changed from 157521 to 164292 (+4%)
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.14/site-packages/build-1.4.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.4.2.dist-info
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
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.4.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.4.2.dist-info

--===============8790312881950592736==--

