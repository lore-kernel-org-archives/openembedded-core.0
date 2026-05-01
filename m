Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518A1CD3427
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15611.1777645533609425998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PgDAzKKr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=G58hG2MQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee45a9-6129266b-3583-45b8-9252-e0df8f71675f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G5pgc3hTK9ANSbZVOevoyJIYDB6QgDu5eLW7unBsVH8=;
	b=PgDAzKKrGdpE32SWFAm0beY1gzNnZJ6qTwNfAqj+HVTGyMlwD/Qu71g73ouVLWyL
	TqrNffI3VV8oS9LDXawn2HkmiwPooWRrDpSheKiw0KrSPjeG8+o0Rvf5vB6DVGsNmH3
	a5XVOif8nIhJyPrqkHvPGpwAd441y9JvOq7HUOE8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G5pgc3hTK9ANSbZVOevoyJIYDB6QgDu5eLW7unBsVH8=;
	b=G58hG2MQx+921sfXwbmUMyz3uH4MA9yj3uDYvuuRUYNSLAZ21aOS63j84y9LXx56
	vafD+ocfozRRQEI3EQ4VpCaMY0b3JK2szML7FwptyvoJ5QI8l6c0D8T9vu+Sz1Il3mO
	K+XEwusdwYVsXmGEpVee0pAy/ceHY6LTe97usLMQ=
Content-Type: multipart/mixed; boundary="===============4204771773797217445=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.11.1 SUCCEEDED
Message-ID: <0101019de3ee45a9-6129266b-3583-45b8-9252-e0df8f71675f-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236225

--===============4204771773797217445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *meson* to *1.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.11.0-1.11.1.patch
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
From 592f5bdd17347dc7036f2bec3c90cfdc8690a348 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 07:43:07 +0000
Subject: [PATCH] meson: upgrade 1.11.0 -> 1.11.1

---
 .../0001-Make-CPU-family-warnings-fatal.patch   | 17 ++++++-----------
 ...Support-building-allarch-recipes-again.patch |  6 +++---
 .../meson/{meson_1.11.0.bb => meson_1.11.1.bb}  |  2 +-
 3 files changed, 10 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.11.0.bb => meson_1.11.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index c2dc3fffcf..ae8bd4c954 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 9854e557b77612afb095e9868bb7cba12bc1b1cb Mon Sep 17 00:00:00 2001
+From ba79cee701b80984c660ffc1c89ce1226b75ed5b Mon Sep 17 00:00:00 2001
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
+index b0072a4..762818c 100644
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
index 2e294b5b7f..30f79be369 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From fac479734d7f6e04eba71c8193623465d9eb0228 Mon Sep 17 00:00:00 2001
+From 21abed6786056ae31e4028b98068ff78740872e6 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -12,10 +12,10 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 27be871..994ac77 100644
+index 762818c..0efa628 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -31,6 +31,7 @@ if T.TYPE_CHECKING:
+@@ -37,6 +37,7 @@ if T.TYPE_CHECKING:
  
  
  known_cpu_families = (
diff --git a/meta/recipes-devtools/meson/meson_1.11.0.bb b/meta/recipes-devtools/meson/meson_1.11.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.11.0.bb
rename to meta/recipes-devtools/meson/meson_1.11.1.bb
index d06ede78a0..26d9af6c19 100644
--- a/meta/recipes-devtools/meson/meson_1.11.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.11.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "dffdd0915ceb028541fe3bed77d63ba35e78514591c043736b450d62634eeb31"
+SRC_URI[sha256sum] = "6788ae299979643f8d841bcaf64352558436cae45a0355148a3aeeccf7913866"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.47.1


--===============4204771773797217445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info -> /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/meson (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info
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
  /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info

--===============4204771773797217445==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.11.0-1.11.1.patch"

RnJvbSA1OTJmNWJkZDE3MzQ3ZGM3MDM2ZjJiZWMzYzkwY2ZkYzg2OTBhMzQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNzo0MzowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDEuMTEuMCAtPiAxLjExLjEKCi0tLQogLi4uLzAwMDEtTWFrZS1DUFUtZmFt
aWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoICAgfCAxNyArKysrKystLS0tLS0tLS0tLQogLi4uU3Vw
cG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdhaW4ucGF0Y2ggfCAgNiArKystLS0KIC4u
Li9tZXNvbi97bWVzb25fMS4xMS4wLmJiID0+IG1lc29uXzEuMTEuMS5iYn0gIHwgIDIgKy0KIDMg
ZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL3ttZXNvbl8xLjExLjAuYmIgPT4gbWVzb25fMS4x
MS4xLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9t
ZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1m
YXRhbC5wYXRjaAppbmRleCBjMmRjM2ZmZmNmLi5hZThiZDRjOTU0IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2Fybmlu
Z3MtZmF0YWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAw
MDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSA5ODU0ZTU1N2I3NzYxMmFmYjA5NWU5ODY4YmI3Y2JhMTJiYzFiMWNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBiYTc5Y2VlNzAxYjgwOTg0YzY2MGZmYzFjODljZTEyMjZiNzVl
ZDViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVy
dG9uQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMyBKdWwgMjAxOCAxMzo1OTowOSArMDEwMAogU3Vi
amVjdDogW1BBVENIXSBNYWtlIENQVSBmYW1pbHkgd2FybmluZ3MgZmF0YWwKQEAgLTYsMTUgKzYs
MTQgQEAgU3ViamVjdDogW1BBVENIXSBNYWtlIENQVSBmYW1pbHkgd2FybmluZ3MgZmF0YWwKIFVw
c3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbT0Ugc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogLS0tCi0gbWVzb25idWlsZC9l
bnZjb25maWcucHkgICB8IDQgKystLQotIG1lc29uYnVpbGQvZW52aXJvbm1lbnQucHkgfCA2ICsr
LS0tLQotIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQor
IG1lc29uYnVpbGQvZW52Y29uZmlnLnB5IHwgOCArKystLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbmJ1aWxk
L2VudmNvbmZpZy5weSBiL21lc29uYnVpbGQvZW52Y29uZmlnLnB5Ci1pbmRleCA0M2ZhZDBjLi4y
N2JlODcxIDEwMDY0NAoraW5kZXggYjAwNzJhNC4uNzYyODE4YyAxMDA2NDQKIC0tLSBhL21lc29u
YnVpbGQvZW52Y29uZmlnLnB5CiArKysgYi9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQotQEAgLTI4
Nyw4ICsyODcsOCBAQCBjbGFzcyBNYWNoaW5lSW5mbyhIb2xkYWJsZU9iamVjdCk6CitAQCAtMjk0
LDggKzI5NCw4IEBAIGNsYXNzIE1hY2hpbmVJbmZvKEhvbGRhYmxlT2JqZWN0KToKICAgICAgICAg
ICAgICAgICAgJ2J1dCBpcyBtaXNzaW5nIHt9LicuZm9ybWF0KG1pbmltdW1fbGl0ZXJhbCAtIHNl
dChsaXRlcmFsKSkpCiAgCiAgICAgICAgICBjcHVfZmFtaWx5ID0gbGl0ZXJhbFsnY3B1X2ZhbWls
eSddCkBAIC0yNSwxMSArMjQsNyBAQCBpbmRleCA0M2ZhZDBjLi4yN2JlODcxIDEwMDY0NAogIAog
ICAgICAgICAgZW5kaWFuID0gbGl0ZXJhbFsnZW5kaWFuJ10KICAgICAgICAgIGlmIGVuZGlhbiBu
b3QgaW4gKCdsaXR0bGUnLCAnYmlnJyk6Ci1kaWZmIC0tZ2l0IGkvbWVzb25idWlsZC9lbnZjb25m
aWcucHkgdy9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQotaW5kZXggZGQwNTBiMDExLi41Mjc3Njkz
YzMgMTAwNjQ0Ci0tLS0gaS9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQotKysrIHcvbWVzb25idWls
ZC9lbnZjb25maWcucHkKLUBAIC02MzQsOSArNjM0LDcgQEAgZGVmIGRldGVjdF9jcHVfZmFtaWx5
KGNvbXBpbGVyczogVC5EaWN0W3N0ciwgQ29tcGlsZXJdKSAtPiBzdHI6CitAQCAtNjQyLDkgKzY0
Miw3IEBAIGRlZiBkZXRlY3RfY3B1X2ZhbWlseShjb21waWxlcnM6IENvbXBpbGVyRGljdCkgLT4g
c3RyOgogICAgICAgICAgICAgIHRyaWFsID0gJ21pcHMnCiAgCiAgICAgIGlmIHRyaWFsIG5vdCBp
biBrbm93bl9jcHVfZmFtaWxpZXM6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVp
bGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoCmluZGV4IDJlMjk0YjViN2YuLjMwZjc5
YmUzNjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAy
LVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJj
aC1yZWNpcGVzLWFnYWluLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmYWM0Nzk3MzRkN2Y2
ZTA0ZWJhNzFjODE5MzYyMzQ2NWQ5ZWIwMjI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAyMWFiZWQ2Nzg2MDU2YWUzMWU0MDI4Yjk4MDY4ZmY3ODc0MDg3MmU2IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwa2pAYXhpcy5jb20+CiBEYXRl
OiBUaHUsIDI2IEp1bCAyMDE4IDE2OjMyOjQ5ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFN1cHBv
cnQgYnVpbGRpbmcgYWxsYXJjaCByZWNpcGVzIGFnYWluCkBAIC0xMiwxMCArMTIsMTAgQEAgU2ln
bmVkLW9mZi1ieTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9tZXNv
bmJ1aWxkL2VudmNvbmZpZy5weSBiL21lc29uYnVpbGQvZW52Y29uZmlnLnB5Ci1pbmRleCAyN2Jl
ODcxLi45OTRhYzc3IDEwMDY0NAoraW5kZXggNzYyODE4Yy4uMGVmYTYyOCAxMDA2NDQKIC0tLSBh
L21lc29uYnVpbGQvZW52Y29uZmlnLnB5CiArKysgYi9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQot
QEAgLTMxLDYgKzMxLDcgQEAgaWYgVC5UWVBFX0NIRUNLSU5HOgorQEAgLTM3LDYgKzM3LDcgQEAg
aWYgVC5UWVBFX0NIRUNLSU5HOgogIAogIAogIGtub3duX2NwdV9mYW1pbGllcyA9ICgKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjExLjAuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4xMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjExLjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjExLjEuYmIK
aW5kZXggZDA2ZWRlNzhhMC4uMjZkOWFmNmMxOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uXzEuMTEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bWVzb24vbWVzb25fMS4xMS4xLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiJHtHSVRI
VUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9L21lc29uLSR7UFZ9LnRhci5neiBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFn
YWluLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImRmZmRkMDkx
NWNlYjAyODU0MWZlM2JlZDc3ZDYzYmEzNWU3ODUxNDU5MWMwNDM3MzZiNDUwZDYyNjM0ZWViMzEi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjc4OGFlMjk5OTc5NjQzZjhkODQxYmNhZjY0MzUyNTU4
NDM2Y2FlNDVhMDM1NTE0OGEzYWVlY2NmNzkxMzg2NiIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0g
Iig/UDxwdmVyPlxkKyhcLlxkKykrKSQiCiAKIGluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVp
bGRfbWV0YSBnaXRodWItcmVsZWFzZXMKLS0gCjIuNDcuMQoK

--===============4204771773797217445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/lib*.so /lib/*.o /lib/*.la"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/lib/*.so.* /sbin/* /bin/*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/lib/*.so.* /sbin/* /bin/*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/meson: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/meson: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.11.0/meson-1.11.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.11.1/meson-1.11.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/x86-64-v3-poky-linux/meson/meson-dbg: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/meson/meson-dbg: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/meson/meson-dev: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/meson/meson-dev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/meson/meson-doc: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/meson/meson-doc: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/meson/meson-locale: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/meson/meson-locale: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/meson/meson-src: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/meson/meson-src: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/meson/meson-staticdev: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/meson/meson-staticdev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/meson/meson: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/meson/meson: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/meson/meson: PKGSIZE changed from 10315381 to 10316281 (+0%)
packages/x86-64-v3-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info -> /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/meson (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info
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
  /usr/lib/python3.14/site-packages/meson-1.11.0.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info

--===============4204771773797217445==--

