Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE10F42131
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19811.1776261873316093719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xQZLVjB2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cqlr87qS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d91754908-ca795ad2-0074-4d8f-aa39-4816614bab52-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qfbuZJzdIyibIlUitqIQV4l8H0ePvFxA7mOTECXOlEI=;
	b=xQZLVjB2d3NI4xbt2yAONRhA/l4OffjNb3PVzhcjyG0i0mtoATj/P54Fowlgp8DL
	odIy0c7GhN7j2zYT82FJZhXPlgYnFjNJtUQQelKmeG81Yq1YZLcwYOS99SiX5locXF1
	u0JPoSfUDzSbzcEl4MbV2Hu9uC17YtlgfkmCzD+w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qfbuZJzdIyibIlUitqIQV4l8H0ePvFxA7mOTECXOlEI=;
	b=cqlr87qSHwwnemPNXqLY63F+3Y5Mnk3ZvxmE4Ar99NEvEJfuvjd+xdK4dPrK16uZ
	DNz13uOX/7VQJcQ/9q0rLyjnXdV+AEwtSuO1VjI1fFCaB5NGDbv6mX8vk6OStNV9w6H
	QrG1l6kIO8/mtlxDgXXbHEZ02uhXYcnn0Qm+Tpyk=
Content-Type: multipart/mixed; boundary="===============1541338503181401594=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.11.0 SUCCEEDED
Message-ID: <0101019d91754908-ca795ad2-0074-4d8f-aa39-4816614bab52-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235224

--===============1541338503181401594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *meson* to *1.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.10.2-1.11.0.patch
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
From d0b51835ac15aec29af8aa89c921e4547aa32d69 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 07:07:30 +0000
Subject: [PATCH] meson: upgrade 1.10.2 -> 1.11.0

---
 .../0001-Make-CPU-family-warnings-fatal.patch   | 17 ++++++-----------
 ...Support-building-allarch-recipes-again.patch |  6 +++---
 .../meson/{meson_1.10.2.bb => meson_1.11.0.bb}  |  2 +-
 3 files changed, 10 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.10.2.bb => meson_1.11.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index c2dc3fffcf..e8c4dc31bb 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 9854e557b77612afb095e9868bb7cba12bc1b1cb Mon Sep 17 00:00:00 2001
+From 593f5362a4464ec4266f13c1c57fc8324da5606b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -6,15 +6,14 @@ Subject: [PATCH] Make CPU family warnings fatal
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 ---
- mesonbuild/envconfig.py   | 4 ++--
- mesonbuild/environment.py | 6 ++----
- 2 files changed, 4 insertions(+), 6 deletions(-)
+ mesonbuild/envconfig.py | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 43fad0c..27be871 100644
+index 7e19505..3dc9766 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -287,8 +287,8 @@ class MachineInfo(HoldableObject):
+@@ -294,8 +294,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
@@ -25,11 +24,7 @@ index 43fad0c..27be871 100644
  
          endian = literal['endian']
          if endian not in ('little', 'big'):
-diff --git i/mesonbuild/envconfig.py w/mesonbuild/envconfig.py
-index dd050b011..5277693c3 100644
---- i/mesonbuild/envconfig.py
-+++ w/mesonbuild/envconfig.py
-@@ -634,9 +634,7 @@ def detect_cpu_family(compilers: T.Dict[str, Compiler]) -> str:
+@@ -642,9 +642,7 @@ def detect_cpu_family(compilers: CompilerDict) -> str:
              trial = 'mips'
  
      if trial not in known_cpu_families:
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 2e294b5b7f..bebfcd3d29 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From fac479734d7f6e04eba71c8193623465d9eb0228 Mon Sep 17 00:00:00 2001
+From 0d148a962bb5b858384eff4fd492f468b7c0bbee Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -12,10 +12,10 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 27be871..994ac77 100644
+index 3dc9766..212a5e8 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -31,6 +31,7 @@ if T.TYPE_CHECKING:
+@@ -37,6 +37,7 @@ if T.TYPE_CHECKING:
  
  
  known_cpu_families = (
diff --git a/meta/recipes-devtools/meson/meson_1.10.2.bb b/meta/recipes-devtools/meson/meson_1.11.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.10.2.bb
rename to meta/recipes-devtools/meson/meson_1.11.0.bb
index 9832437531..d06ede78a0 100644
--- a/meta/recipes-devtools/meson/meson_1.10.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.11.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "7890287d911dd4ee1ebd0efb61ed0321bfcd87c725df923a837cf90c6508f96b"
+SRC_URI[sha256sum] = "dffdd0915ceb028541fe3bed77d63ba35e78514591c043736b450d62634eeb31"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.47.1


--===============1541338503181401594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson-1.10.2.dist-info -> /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/meson-1.10.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/mesonbuild/scripts/__pycache__/rc.cpython-314.pyc /usr/lib/python3.14/site-packages/mesonbuild/scripts/rc.py"
Changes to packages/x86-64-v3-poky-linux/meson (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.10.2.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info
  /usr/lib/python3.14/site-packages/mesonbuild/scripts/__pycache__/rc.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/mesonbuild/scripts/rc.py was added
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
  /usr/lib/python3.14/site-packages/meson-1.10.2.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info
  /usr/lib/python3.14/site-packages/mesonbuild/scripts/__pycache__/rc.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/mesonbuild/scripts/rc.py was added

--===============1541338503181401594==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.10.2-1.11.0.patch"

RnJvbSBkMGI1MTgzNWFjMTVhZWMyOWFmOGFhODljOTIxZTQ1NDdhYTMyZDY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDc6MDc6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAxLjEwLjIgLT4gMS4xMS4wCgotLS0KIC4uLi8wMDAxLU1ha2UtQ1BVLWZh
bWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCAgIHwgMTcgKysrKysrLS0tLS0tLS0tLS0KIC4uLlN1
cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoIHwgIDYgKysrLS0tCiAu
Li4vbWVzb24ve21lc29uXzEuMTAuMi5iYiA9PiBtZXNvbl8xLjExLjAuYmJ9ICB8ICAyICstCiAz
IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi97bWVzb25fMS4xMC4yLmJiID0+IG1lc29uXzEu
MTEuMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24v
bWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3Mt
ZmF0YWwucGF0Y2gKaW5kZXggYzJkYzNmZmZjZi4uZThjNGRjMzFiYiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5p
bmdzLWZhdGFsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8w
MDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gOTg1NGU1NTdiNzc2MTJhZmIwOTVlOTg2OGJiN2NiYTEyYmMxYjFjYiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTkzZjUzNjJhNDQ2NGVjNDI2NmYxM2MxYzU3ZmM4MzI0ZGE1
NjA2YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1
cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBUdWUsIDMgSnVsIDIwMTggMTM6NTk6MDkgKzAxMDAKIFN1
YmplY3Q6IFtQQVRDSF0gTWFrZSBDUFUgZmFtaWx5IHdhcm5pbmdzIGZhdGFsCkBAIC02LDE1ICs2
LDE0IEBAIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBDUFUgZmFtaWx5IHdhcm5pbmdzIGZhdGFsCiBV
cHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09FIHNwZWNpZmljXQogU2lnbmVkLW9mZi1i
eTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIC0tLQotIG1lc29uYnVpbGQv
ZW52Y29uZmlnLnB5ICAgfCA0ICsrLS0KLSBtZXNvbmJ1aWxkL2Vudmlyb25tZW50LnB5IHwgNiAr
Ky0tLS0KLSAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
KyBtZXNvbmJ1aWxkL2VudmNvbmZpZy5weSB8IDggKysrLS0tLS0KKyAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb25idWls
ZC9lbnZjb25maWcucHkgYi9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQotaW5kZXggNDNmYWQwYy4u
MjdiZTg3MSAxMDA2NDQKK2luZGV4IDdlMTk1MDUuLjNkYzk3NjYgMTAwNjQ0CiAtLS0gYS9tZXNv
bmJ1aWxkL2VudmNvbmZpZy5weQogKysrIGIvbWVzb25idWlsZC9lbnZjb25maWcucHkKLUBAIC0y
ODcsOCArMjg3LDggQEAgY2xhc3MgTWFjaGluZUluZm8oSG9sZGFibGVPYmplY3QpOgorQEAgLTI5
NCw4ICsyOTQsOCBAQCBjbGFzcyBNYWNoaW5lSW5mbyhIb2xkYWJsZU9iamVjdCk6CiAgICAgICAg
ICAgICAgICAgICdidXQgaXMgbWlzc2luZyB7fS4nLmZvcm1hdChtaW5pbXVtX2xpdGVyYWwgLSBz
ZXQobGl0ZXJhbCkpKQogIAogICAgICAgICAgY3B1X2ZhbWlseSA9IGxpdGVyYWxbJ2NwdV9mYW1p
bHknXQpAQCAtMjUsMTEgKzI0LDcgQEAgaW5kZXggNDNmYWQwYy4uMjdiZTg3MSAxMDA2NDQKICAK
ICAgICAgICAgIGVuZGlhbiA9IGxpdGVyYWxbJ2VuZGlhbiddCiAgICAgICAgICBpZiBlbmRpYW4g
bm90IGluICgnbGl0dGxlJywgJ2JpZycpOgotZGlmZiAtLWdpdCBpL21lc29uYnVpbGQvZW52Y29u
ZmlnLnB5IHcvbWVzb25idWlsZC9lbnZjb25maWcucHkKLWluZGV4IGRkMDUwYjAxMS4uNTI3NzY5
M2MzIDEwMDY0NAotLS0tIGkvbWVzb25idWlsZC9lbnZjb25maWcucHkKLSsrKyB3L21lc29uYnVp
bGQvZW52Y29uZmlnLnB5Ci1AQCAtNjM0LDkgKzYzNCw3IEBAIGRlZiBkZXRlY3RfY3B1X2ZhbWls
eShjb21waWxlcnM6IFQuRGljdFtzdHIsIENvbXBpbGVyXSkgLT4gc3RyOgorQEAgLTY0Miw5ICs2
NDIsNyBAQCBkZWYgZGV0ZWN0X2NwdV9mYW1pbHkoY29tcGlsZXJzOiBDb21waWxlckRpY3QpIC0+
IHN0cjoKICAgICAgICAgICAgICB0cmlhbCA9ICdtaXBzJwogIAogICAgICBpZiB0cmlhbCBub3Qg
aW4ga25vd25fY3B1X2ZhbWlsaWVzOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L21lc29uL21lc29uLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdhaW4u
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1
aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaAppbmRleCAyZTI5NGI1YjdmLi5iZWJm
Y2QzZDI5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAw
Mi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFy
Y2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZmFjNDc5NzM0ZDdm
NmUwNGViYTcxYzgxOTM2MjM0NjVkOWViMDIyOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMGQxNDhhOTYyYmI1Yjg1ODM4NGVmZjRmZDQ5MmY0NjhiN2MwYmJlZSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFBldGVyIEtqZWxsZXJzdGVkdCA8cGtqQGF4aXMuY29tPgogRGF0
ZTogVGh1LCAyNiBKdWwgMjAxOCAxNjozMjo0OSArMDIwMAogU3ViamVjdDogW1BBVENIXSBTdXBw
b3J0IGJ1aWxkaW5nIGFsbGFyY2ggcmVjaXBlcyBhZ2FpbgpAQCAtMTIsMTAgKzEyLDEwIEBAIFNp
Z25lZC1vZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvbWVz
b25idWlsZC9lbnZjb25maWcucHkgYi9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQotaW5kZXggMjdi
ZTg3MS4uOTk0YWM3NyAxMDA2NDQKK2luZGV4IDNkYzk3NjYuLjIxMmE1ZTggMTAwNjQ0CiAtLS0g
YS9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQogKysrIGIvbWVzb25idWlsZC9lbnZjb25maWcucHkK
LUBAIC0zMSw2ICszMSw3IEBAIGlmIFQuVFlQRV9DSEVDS0lORzoKK0BAIC0zNyw2ICszNyw3IEBA
IGlmIFQuVFlQRV9DSEVDS0lORzoKICAKICAKICBrbm93bl9jcHVfZmFtaWxpZXMgPSAoCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4xMC4yLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuMTEuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4xMC4y
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4xMS4wLmJi
CmluZGV4IDk4MzI0Mzc1MzEuLmQwNmVkZTc4YTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tZXNvbi9tZXNvbl8xLjEwLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L21lc29uL21lc29uXzEuMTEuMC5iYgpAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJID0gIiR7R0lU
SFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9tZXNvbi0ke1BWfS50YXIuZ3ogXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2ggXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1h
Z2Fpbi5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3ODkwMjg3
ZDkxMWRkNGVlMWViZDBlZmI2MWVkMDMyMWJmY2Q4N2M3MjVkZjkyM2E4MzdjZjkwYzY1MDhmOTZi
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRmZmRkMDkxNWNlYjAyODU0MWZlM2JlZDc3ZDYzYmEz
NWU3ODUxNDU5MWMwNDM3MzZiNDUwZDYyNjM0ZWViMzEiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICIoP1A8cHZlcj5cZCsoXC5cZCspKykkIgogCiBpbmhlcml0IHB5dGhvbl9zZXR1cHRvb2xzX2J1
aWxkX21ldGEgZ2l0aHViLXJlbGVhc2VzCi0tIAoyLjQ3LjEKCg==

--===============1541338503181401594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/meson: PV changed from "1.10.2" to "1.11.0"
packages/x86-64-v3-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.10.2/meson-1.10.2.tar.gz file://meson-setup.py file://meson-wrapper file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.11.0/meson-1.11.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/x86-64-v3-poky-linux/meson: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/x86-64-v3-poky-linux/meson/meson-dbg: PV changed from "1.10.2" to "1.11.0"
packages/x86-64-v3-poky-linux/meson/meson-dbg: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/x86-64-v3-poky-linux/meson/meson-dev: PV changed from "1.10.2" to "1.11.0"
packages/x86-64-v3-poky-linux/meson/meson-dev: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/x86-64-v3-poky-linux/meson/meson-doc: PV changed from "1.10.2" to "1.11.0"
packages/x86-64-v3-poky-linux/meson/meson-doc: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/x86-64-v3-poky-linux/meson/meson-locale: PV changed from "1.10.2" to "1.11.0"
packages/x86-64-v3-poky-linux/meson/meson-locale: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/x86-64-v3-poky-linux/meson/meson-src: PV changed from "1.10.2" to "1.11.0"
packages/x86-64-v3-poky-linux/meson/meson-src: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/x86-64-v3-poky-linux/meson/meson-staticdev: PV changed from "1.10.2" to "1.11.0"
packages/x86-64-v3-poky-linux/meson/meson-staticdev: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/x86-64-v3-poky-linux/meson/meson: PKGSIZE changed from 10118865 to 10315381 (+2%)
packages/x86-64-v3-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson-1.10.2.dist-info -> /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/meson-1.10.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/mesonbuild/scripts/__pycache__/rc.cpython-314.pyc /usr/lib/python3.14/site-packages/mesonbuild/scripts/rc.py"
packages/x86-64-v3-poky-linux/meson/meson: PV changed from "1.10.2" to "1.11.0"
packages/x86-64-v3-poky-linux/meson/meson: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
Changes to packages/x86-64-v3-poky-linux/meson (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.10.2.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info
  /usr/lib/python3.14/site-packages/mesonbuild/scripts/__pycache__/rc.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/mesonbuild/scripts/rc.py was added
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
  /usr/lib/python3.14/site-packages/meson-1.10.2.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info
  /usr/lib/python3.14/site-packages/mesonbuild/scripts/__pycache__/rc.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/mesonbuild/scripts/rc.py was added

--===============1541338503181401594==--

