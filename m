Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC9DC3DA6C
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.2112.1719853076172001320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dHRqr6l6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mriQrd9e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101906f3b4b72-cab1f86e-8876-486e-a614-c663d04afa74-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pa4gIXTCWM6YBNs5JIXUPDREnvPLcm5ihzr3anEOETE=;
	b=dHRqr6l6ct3SixsPCK0UFXzBy09xiOTOuxYnZr/1aeE4uY4HUXCirHrNo3Qp+XAr
	d4hYZLCEPMJBeemuHouJdOS5KGtcyhHq7OJsER053naNeLWX4c3Ytah/JE9aryl9DUa
	QvH8pGZIfVjT6IHR0xQQ+IZWQOTluqFlh+sQAhPU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pa4gIXTCWM6YBNs5JIXUPDREnvPLcm5ihzr3anEOETE=;
	b=mriQrd9egiVyKe2FMbASb079J4BFOixgAcQz2RGbDc2vKJA56KXNN0ToHI0fq/ay
	7jVlqQrsewjNQnz8DefigpSqIU0SpR++qUM5Z9t8U7wUVhFXFdfSEn3bBmpyQT7xOye
	geKmmfJcOAi38eQYJGTwOyeaGbs73iiwtJh0bahQ=
Content-Type: multipart/mixed; boundary="===============5355181971592500840=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.4.1 SUCCEEDED
Message-ID: <010101906f3b4b72-cab1f86e-8876-486e-a614-c663d04afa74-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201338

--===============5355181971592500840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *1.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.4.0-1.4.1.patch
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
From 317c96be4ccb02a02fb3939426cf96f9e0af427a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 08:15:58 +0000
Subject: [PATCH] meson: upgrade 1.4.0 -> 1.4.1

---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch   | 6 +++---
 ...thon-module-do-not-manipulate-the-environment-when.patch | 4 ++--
 .../meson/0002-Support-building-allarch-recipes-again.patch | 2 +-
 .../meson/{meson_1.4.0.bb => meson_1.4.1.bb}                | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.4.0.bb => meson_1.4.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 94129b2f25..d78f783ce8 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From c61c93f43b70ba0670d41e841bff9f2a7186cc2f Mon Sep 17 00:00:00 2001
+From ee52b8c26b470fdbe4a5dc0e373ddda2ed28fe46 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -26,10 +26,10 @@ index 0e9cd23..b44e60c 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index af69f64..248d6dd 100644
+index 156d329..e443dd2 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -379,10 +379,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -380,10 +380,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 9f3f516a5c..930b777668 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From b4c0602a56d3517ab66b98a7dbb69defe77d29a3 Mon Sep 17 00:00:00 2001
+From e490e123f766a7f3eb0111a5975255964ecf0dc3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
-index b9b17f8..a305afb 100644
+index a0a22c1..6fc0453 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
 @@ -381,9 +381,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index fa5ea57d5b..32befa2fd3 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 7f69bfabb87d311d7409ea6699f7dee8e9b3a95b Mon Sep 17 00:00:00 2001
+From d10a8fd5c4281593177bb740bb9f5628b5e283b9 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_1.4.0.bb b/meta/recipes-devtools/meson/meson_1.4.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.4.0.bb
rename to meta/recipes-devtools/meson/meson_1.4.1.bb
index 5db100ff1c..6686b99d31 100644
--- a/meta/recipes-devtools/meson/meson_1.4.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.4.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "8fd6630c25c27f1489a8a0392b311a60481a3c161aa699b330e25935b750138d"
+SRC_URI[sha256sum] = "1b8aad738a5f6ae64294cc8eaba9a82988c1c420204484ac02ef782e5bba5f49"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.44.0


--===============5355181971592500840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/meson: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.4.0/meson-1.4.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.4.1/meson-1.4.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-64-poky-linux/meson/meson-dbg: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson-dbg: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson-dev: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson-dev: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson-doc: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson-doc: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson-doc: PKGSIZE changed from 5356 to 5354 (-0%)
packages/core2-64-poky-linux/meson/meson-locale: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson-locale: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson-src: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson-src: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson-staticdev: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson-staticdev: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-64-poky-linux/meson/meson: PV changed from "1.4.0" to "1.4.1"
packages/core2-64-poky-linux/meson/meson: PKGSIZE changed from 7974951 to 7993533 (+0%)
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.4.1.dist-info

--===============5355181971592500840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.4.1.dist-info

--===============5355181971592500840==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.4.0-1.4.1.patch"

RnJvbSAzMTdjOTZiZTRjY2IwMmEwMmZiMzkzOTQyNmNmOTZmOWUwYWY0MjdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwODoxNTo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDEuNC4wIC0+IDEuNC4xCgotLS0KIC4uLi9tZXNvbi9tZXNvbi8wMDAxLU1h
a2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCAgIHwgNiArKystLS0KIC4uLnRob24t
bW9kdWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1lbnZpcm9ubWVudC13aGVuLnBhdGNoIHwgNCAr
Ky0tCiAuLi4vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fp
bi5wYXRjaCB8IDIgKy0KIC4uLi9tZXNvbi97bWVzb25fMS40LjAuYmIgPT4gbWVzb25fMS40LjEu
YmJ9ICAgICAgICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL3tt
ZXNvbl8xLjQuMC5iYiA9PiBtZXNvbl8xLjQuMS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2Fybmlu
Z3MtZmF0YWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1N
YWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2gKaW5kZXggOTQxMjliMmYyNS4uZDc4
Zjc4M2NlOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAw
MDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRh
bC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzYxYzkzZjQzYjcwYmEwNjcwZDQxZTg0MWJm
ZjlmMmE3MTg2Y2MyZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZWU1MmI4YzI2YjQ3
MGZkYmU0YTVkYzBlMzczZGRkYTJlZDI4ZmU0NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBUdWUsIDMgSnVs
IDIwMTggMTM6NTk6MDkgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBDUFUgZmFtaWx5IHdh
cm5pbmdzIGZhdGFsCkBAIC0yNiwxMCArMjYsMTAgQEAgaW5kZXggMGU5Y2QyMy4uYjQ0ZTYwYyAx
MDA2NDQKICAgICAgICAgIGVuZGlhbiA9IGxpdGVyYWxbJ2VuZGlhbiddCiAgICAgICAgICBpZiBl
bmRpYW4gbm90IGluICgnbGl0dGxlJywgJ2JpZycpOgogZGlmZiAtLWdpdCBhL21lc29uYnVpbGQv
ZW52aXJvbm1lbnQucHkgYi9tZXNvbmJ1aWxkL2Vudmlyb25tZW50LnB5Ci1pbmRleCBhZjY5ZjY0
Li4yNDhkNmRkIDEwMDY0NAoraW5kZXggMTU2ZDMyOS4uZTQ0M2RkMiAxMDA2NDQKIC0tLSBhL21l
c29uYnVpbGQvZW52aXJvbm1lbnQucHkKICsrKyBiL21lc29uYnVpbGQvZW52aXJvbm1lbnQucHkK
LUBAIC0zNzksMTAgKzM3OSw4IEBAIGRlZiBkZXRlY3RfY3B1X2ZhbWlseShjb21waWxlcnM6IENv
bXBpbGVyc0RpY3QpIC0+IHN0cjoKK0BAIC0zODAsMTAgKzM4MCw4IEBAIGRlZiBkZXRlY3RfY3B1
X2ZhbWlseShjb21waWxlcnM6IENvbXBpbGVyc0RpY3QpIC0+IHN0cjoKICAgICAgICAgIGlmIGNv
bXBpbGVycyBhbmQgbm90IGFueV9jb21waWxlcl9oYXNfZGVmaW5lKGNvbXBpbGVycywgJ19fbWlw
czY0Jyk6CiAgICAgICAgICAgICAgdHJpYWwgPSAnbWlwcycKICAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90LW1h
bmlwdWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbWVzb24vbWVzb24vMDAwMS1weXRob24tbW9kdWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1l
bnZpcm9ubWVudC13aGVuLnBhdGNoCmluZGV4IDlmM2Y1MTZhNWMuLjkzMGI3Nzc2NjggMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1
bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3Qt
bWFuaXB1bGF0ZS10aGUtZW52aXJvbm1lbnQtd2hlbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gYjRjMDYwMmE1NmQzNTE3YWI2NmI5OGE3ZGJiNjlkZWZlNzdkMjlhMyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZTQ5MGUxMjNmNzY2YTdmM2ViMDExMWE1OTc1MjU1OTY0ZWNmMGRj
MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogTW9uLCAxOSBOb3YgMjAxOCAxNDoyNDoyNiArMDEw
MAogU3ViamVjdDogW1BBVENIXSBweXRob24gbW9kdWxlOiBkbyBub3QgbWFuaXB1bGF0ZSB0aGUg
ZW52aXJvbm1lbnQgd2hlbiBjYWxsaW5nCkBAIC0xMSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL21lc29u
YnVpbGQvZGVwZW5kZW5jaWVzL3B5dGhvbi5weSBiL21lc29uYnVpbGQvZGVwZW5kZW5jaWVzL3B5
dGhvbi5weQotaW5kZXggYjliMTdmOC4uYTMwNWFmYiAxMDA2NDQKK2luZGV4IGEwYTIyYzEuLjZm
YzA0NTMgMTAwNjQ0CiAtLS0gYS9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9weXRob24ucHkKICsr
KyBiL21lc29uYnVpbGQvZGVwZW5kZW5jaWVzL3B5dGhvbi5weQogQEAgLTM4MSw5ICszODEsNiBA
QCBkZWYgcHl0aG9uX2ZhY3RvcnkoZW52OiAnRW52aXJvbm1lbnQnLCBmb3JfbWFjaGluZTogJ01h
Y2hpbmVDaG9pY2UnLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21l
c29uLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdhaW4ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFs
bGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaAppbmRleCBmYTVlYTU3ZDViLi4zMmJlZmEyZmQzIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0
LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBl
cy1hZ2Fpbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2Y2OWJmYWJiODdkMzExZDc0MDll
YTY2OTlmN2RlZThlOWIzYTk1YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDEwYThm
ZDVjNDI4MTU5MzE3N2JiNzQwYmI5ZjU2MjhiNWUyODNiOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFBldGVyIEtqZWxsZXJzdGVkdCA8cGtqQGF4aXMuY29tPgogRGF0ZTogVGh1LCAy
NiBKdWwgMjAxOCAxNjozMjo0OSArMDIwMAogU3ViamVjdDogW1BBVENIXSBTdXBwb3J0IGJ1aWxk
aW5nIGFsbGFyY2ggcmVjaXBlcyBhZ2FpbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21lc29uL21lc29uXzEuNC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21l
c29uXzEuNC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uXzEuNC4xLmJiCmluZGV4IDVkYjEwMGZmMWMuLjY2ODZiOTlkMzEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjQuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS40LjEuYmIKQEAgLTE1LDcg
KzE1LDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vbWVz
b24tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtTWFrZS1DUFUtZmFtaWx5
LXdhcm5pbmdzLWZhdGFsLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDItU3VwcG9ydC1i
dWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdhaW4ucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiOGZkNjYzMGMyNWMyN2YxNDg5YThhMDM5MmIzMTFhNjA0ODFhM2Mx
NjFhYTY5OWIzMzBlMjU5MzViNzUwMTM4ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxYjhhYWQ3
MzhhNWY2YWU2NDI5NGNjOGVhYmE5YTgyOTg4YzFjNDIwMjA0NDg0YWMwMmVmNzgyZTViYmE1ZjQ5
IgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIKIAogaW5o
ZXJpdCBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIGdpdGh1Yi1yZWxlYXNlcwotLSAKMi40
NC4wCgo=

--===============5355181971592500840==--

