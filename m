Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28931C4450E
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 06:31:42 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9638.1783837893727498594
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 23:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GMJMaOK8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=t+Ahm2dd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f5506211f-f4d98fe6-9c14-43e3-8c14-95faa671c339-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783837893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bp1m3UazItiFa6/Xf3Vq/zoBLD6Ib3aU/Tkqnn689dM=;
	b=GMJMaOK8y/EvV8KX4NDI4U3ojANeBI7J2ZRq0askmRQYzy6OfhyYedWp1vsQr7FF
	ME0wwsD9U44IPRYNhymzx1HzQ3B6/Xz1VZD/e7sxvweQ+zhTTKXI8UBHlwVxgwhmfYj
	2cILQV87rJ3nLZOZKwf1yVvdvAQkKsKJ0DZgyPcA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783837893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bp1m3UazItiFa6/Xf3Vq/zoBLD6Ib3aU/Tkqnn689dM=;
	b=t+Ahm2ddB0scGZCz8w8ZTxuBjeykf4KP/JEhETwsK8kPEYhYTheHBIfXpLCtrbsy
	Ng1nQx9OGZ/dqiLAxcBy6B5OpTwBv+V/sQWuBEfJp6eyzrZAPDdGSw0Ugkhoq0EUt3q
	laPb1/3aiKNi1vHCzifbk1NrDAq3/FOKbJz3dITc=
Content-Type: multipart/mixed; boundary="===============7792124922575522169=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.11.2 SUCCEEDED
Message-ID: <0101019f5506211f-f4d98fe6-9c14-43e3-8c14-95faa671c339-000000@us-west-2.amazonses.com>
Date: Sun, 12 Jul 2026 06:31:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.12-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 06:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240756

--===============7792124922575522169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *meson* to *1.11.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.11.1-1.11.2.patch
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
From 2fdb6762698785b83d011c978f153212b5f81836 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 12 Jul 2026 05:52:47 +0000
Subject: [PATCH] meson: upgrade 1.11.1 -> 1.11.2

---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch     | 4 ++--
 .../meson/0002-Support-building-allarch-recipes-again.patch   | 4 ++--
 .../meson/{meson_1.11.1.bb => meson_1.11.2.bb}                | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.11.1.bb => meson_1.11.2.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index ae8bd4c954..0ca0277ea0 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From ba79cee701b80984c660ffc1c89ce1226b75ed5b Mon Sep 17 00:00:00 2001
+From 5b3c19cc6cc84e0ba3afdade96b6609e09f8c33c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -10,7 +10,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 3 insertions(+), 5 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index b0072a4..762818c 100644
+index 8eeb30f..ee3c2ef 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -294,8 +294,8 @@ class MachineInfo(HoldableObject):
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 30f79be369..38ac24f6cd 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 21abed6786056ae31e4028b98068ff78740872e6 Mon Sep 17 00:00:00 2001
+From d6ef8e916013c4a1790b159a806ebe51a7f08dd8 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -12,7 +12,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 762818c..0efa628 100644
+index ee3c2ef..a335076 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -37,6 +37,7 @@ if T.TYPE_CHECKING:
diff --git a/meta/recipes-devtools/meson/meson_1.11.1.bb b/meta/recipes-devtools/meson/meson_1.11.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.11.1.bb
rename to meta/recipes-devtools/meson/meson_1.11.2.bb
index 26d9af6c19..5ac4d789b8 100644
--- a/meta/recipes-devtools/meson/meson_1.11.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.11.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "6788ae299979643f8d841bcaf64352558436cae45a0355148a3aeeccf7913866"
+SRC_URI[sha256sum] = "698feae069cef3ecd4d7aaf281d7df359bdfcf555a9a1564383d3b913fa8a736"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.47.1


--===============7792124922575522169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/meson-1.11.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info -> /usr/lib/python3.14/site-packages/meson-1.11.2.dist-info
Changes to packages/x86-64-v3-poky-linux/meson (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.11.2.dist-info

--===============7792124922575522169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.11.1/meson-1.11.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.11.2/meson-1.11.2.tar.gz file://meson-setup.py file://meson-wrapper file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/x86-64-v3-poky-linux/meson: PV changed from "1.11.1" to "1.11.2"
packages/x86-64-v3-poky-linux/meson: PKGV changed from 1.11.1 [default] to 1.11.2 [default]
packages/x86-64-v3-poky-linux/meson/meson-dbg: PV changed from "1.11.1" to "1.11.2"
packages/x86-64-v3-poky-linux/meson/meson-dbg: PKGV changed from 1.11.1 [default] to 1.11.2 [default]
packages/x86-64-v3-poky-linux/meson/meson-dev: PV changed from "1.11.1" to "1.11.2"
packages/x86-64-v3-poky-linux/meson/meson-dev: PKGV changed from 1.11.1 [default] to 1.11.2 [default]
packages/x86-64-v3-poky-linux/meson/meson-doc: PKGSIZE changed from 13212 to 13211 (-0%)
packages/x86-64-v3-poky-linux/meson/meson-doc: PV changed from "1.11.1" to "1.11.2"
packages/x86-64-v3-poky-linux/meson/meson-doc: PKGV changed from 1.11.1 [default] to 1.11.2 [default]
packages/x86-64-v3-poky-linux/meson/meson-locale: PV changed from "1.11.1" to "1.11.2"
packages/x86-64-v3-poky-linux/meson/meson-locale: PKGV changed from 1.11.1 [default] to 1.11.2 [default]
packages/x86-64-v3-poky-linux/meson/meson-src: PV changed from "1.11.1" to "1.11.2"
packages/x86-64-v3-poky-linux/meson/meson-src: PKGV changed from 1.11.1 [default] to 1.11.2 [default]
packages/x86-64-v3-poky-linux/meson/meson-staticdev: PV changed from "1.11.1" to "1.11.2"
packages/x86-64-v3-poky-linux/meson/meson-staticdev: PKGV changed from 1.11.1 [default] to 1.11.2 [default]
packages/x86-64-v3-poky-linux/meson/meson: PKGSIZE changed from 10316281 to 10319241 (+0%)
packages/x86-64-v3-poky-linux/meson/meson: PV changed from "1.11.1" to "1.11.2"
packages/x86-64-v3-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/meson-1.11.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info -> /usr/lib/python3.14/site-packages/meson-1.11.2.dist-info
packages/x86-64-v3-poky-linux/meson/meson: PKGV changed from 1.11.1 [default] to 1.11.2 [default]
Changes to packages/x86-64-v3-poky-linux/meson (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.11.1.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.11.2.dist-info

--===============7792124922575522169==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.11.1-1.11.2.patch"

RnJvbSAyZmRiNjc2MjY5ODc4NWI4M2QwMTFjOTc4ZjE1MzIxMmI1ZjgxODM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTIgSnVsIDIwMjYgMDU6NTI6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAxLjExLjEgLT4gMS4xMS4yCgotLS0KIC4uLi9tZXNvbi9tZXNvbi8wMDAx
LU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCAgICAgfCA0ICsrLS0KIC4uLi9t
ZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoICAg
fCA0ICsrLS0KIC4uLi9tZXNvbi97bWVzb25fMS4xMS4xLmJiID0+IG1lc29uXzEuMTEuMi5iYn0g
ICAgICAgICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24ve21lc29u
XzEuMTEuMS5iYiA9PiBtZXNvbl8xLjExLjIuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdz
LWZhdGFsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFr
ZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoCmluZGV4IGFlOGJkNGM5NTQuLjBjYTAy
NzdlYTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAx
LU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJhNzljZWU3MDFiODA5ODRjNjYwZmZjMWM4OWNl
MTIyNmI3NWVkNWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDViM2MxOWNjNmNjODRl
MGJhM2FmZGFkZTk2YjY2MDllMDlmOGMzM2MgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogRGF0ZTogVHVlLCAzIEp1bCAy
MDE4IDEzOjU5OjA5ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgQ1BVIGZhbWlseSB3YXJu
aW5ncyBmYXRhbApAQCAtMTAsNyArMTAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8
cm9zcy5idXJ0b25AaW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weSBi
L21lc29uYnVpbGQvZW52Y29uZmlnLnB5Ci1pbmRleCBiMDA3MmE0Li43NjI4MThjIDEwMDY0NAor
aW5kZXggOGVlYjMwZi4uZWUzYzJlZiAxMDA2NDQKIC0tLSBhL21lc29uYnVpbGQvZW52Y29uZmln
LnB5CiArKysgYi9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQogQEAgLTI5NCw4ICsyOTQsOCBAQCBj
bGFzcyBNYWNoaW5lSW5mbyhIb2xkYWJsZU9iamVjdCk6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVj
aXBlcy1hZ2Fpbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAy
LVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoCmluZGV4IDMwZjc5
YmUzNjkuLjM4YWMyNGY2Y2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNv
bi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVp
bGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAy
MWFiZWQ2Nzg2MDU2YWUzMWU0MDI4Yjk4MDY4ZmY3ODc0MDg3MmU2IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBkNmVmOGU5MTYwMTNjNGExNzkwYjE1OWE4MDZlYmU1MWE3ZjA4ZGQ4IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwa2pAYXhp
cy5jb20+CiBEYXRlOiBUaHUsIDI2IEp1bCAyMDE4IDE2OjMyOjQ5ICswMjAwCiBTdWJqZWN0OiBb
UEFUQ0hdIFN1cHBvcnQgYnVpbGRpbmcgYWxsYXJjaCByZWNpcGVzIGFnYWluCkBAIC0xMiw3ICsx
Miw3IEBAIFNpZ25lZC1vZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0
ZWR0QGF4aXMuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0t
Z2l0IGEvbWVzb25idWlsZC9lbnZjb25maWcucHkgYi9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQot
aW5kZXggNzYyODE4Yy4uMGVmYTYyOCAxMDA2NDQKK2luZGV4IGVlM2MyZWYuLmEzMzUwNzYgMTAw
NjQ0CiAtLS0gYS9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQogKysrIGIvbWVzb25idWlsZC9lbnZj
b25maWcucHkKIEBAIC0zNyw2ICszNyw3IEBAIGlmIFQuVFlQRV9DSEVDS0lORzoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjExLjEuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4xMS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjExLjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjExLjIuYmIKaW5k
ZXggMjZkOWFmNmMxOS4uNWFjNGQ3ODliOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21lc29uL21lc29uXzEuMTEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVz
b24vbWVzb25fMS4xMS4yLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJf
QkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9L21lc29uLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWlu
LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY3ODhhZTI5OTk3
OTY0M2Y4ZDg0MWJjYWY2NDM1MjU1ODQzNmNhZTQ1YTAzNTUxNDhhM2FlZWNjZjc5MTM4NjYiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNjk4ZmVhZTA2OWNlZjNlY2Q0ZDdhYWYyODFkN2RmMzU5YmRm
Y2Y1NTVhOWExNTY0MzgzZDNiOTEzZmE4YTczNiIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIig/
UDxwdmVyPlxkKyhcLlxkKykrKSQiCiAKIGluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRf
bWV0YSBnaXRodWItcmVsZWFzZXMKLS0gCjIuNDcuMQoK

--===============7792124922575522169==--

