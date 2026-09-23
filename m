Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C255C98309
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 06:27:48 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1222.1790144863509375643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RuRvq/oc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rxU9Tb3o;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0ccf2e947-40dc0149-cd7a-4c5b-ab02-7afd501b6567-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790144866;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IiYwjEY2c9tiPxtJ1syuhhfn0IBGa1A0NkOIShUEZT4=;
	b=RuRvq/ocdEaOQ5ETxLj4h7XCkSFTD6SVsax/xNuKMuRIOfdmgBjzdYOLxfI5wOIl
	lpiKNMC4aBbXByNlYWYuIJWyZJuJGGJtUyfChPAltVAdb+wDmppoFWl4VKNcxphL0it
	09IFnfbEUXwQuU8pvJ2oNX3a3Bwrw5HiuIOwEx/c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790144866;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IiYwjEY2c9tiPxtJ1syuhhfn0IBGa1A0NkOIShUEZT4=;
	b=rxU9Tb3oVu8QOwDIyMEnKx030BURbt2wC9xWYlxF9gMGFbdM2lt+PF+UQQ/hh7oY
	lQ64aFZYfN8H83QjdXUZe8gMu9m2cScZcvvu3zhIVWyzco1iE115ufnhxo2+fwIvzM5
	SAMLKEjNdrws5tq+4Mekm1Q4kg4fwNDkzzv+eYz4=
Content-Type: multipart/mixed; boundary="===============7626713334594440507=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.12.1 SUCCEEDED
Message-ID: <010101a0ccf2e947-40dc0149-cd7a-4c5b-ab02-7afd501b6567-000000@us-west-2.amazonses.com>
Date: Wed, 23 Sep 2026 06:27:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.23-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246443

--===============7626713334594440507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *meson* to *1.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.12.0-1.12.1.patch
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
From 0d0b32bdd6a25b1d49eecbf7124f7c46e51f0eae Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 23 Sep 2026 05:56:17 +0000
Subject: [PATCH] meson: upgrade 1.12.0 -> 1.12.1

---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch | 8 ++++----
 .../0002-Support-building-allarch-recipes-again.patch     | 4 ++--
 .../meson/{meson_1.12.0.bb => meson_1.12.1.bb}            | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.12.0.bb => meson_1.12.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index ae8bd4c954..dfee24e003 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From ba79cee701b80984c660ffc1c89ce1226b75ed5b Mon Sep 17 00:00:00 2001
+From 2aa6ab3379281038eae915b0e6e1855ed0707b31 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -10,10 +10,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 3 insertions(+), 5 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index b0072a4..762818c 100644
+index 65d0823..07433f0 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -294,8 +294,8 @@ class MachineInfo(HoldableObject):
+@@ -293,8 +293,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
@@ -24,7 +24,7 @@ index b0072a4..762818c 100644
  
          endian = literal['endian']
          if endian not in ('little', 'big'):
-@@ -642,9 +642,7 @@ def detect_cpu_family(compilers: CompilerDict) -> str:
+@@ -656,9 +656,7 @@ def detect_cpu_family(compilers: CompilerDict) -> str:
              trial = 'mips'
  
      if trial not in known_cpu_families:
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 30f79be369..6bb0c91fd5 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 21abed6786056ae31e4028b98068ff78740872e6 Mon Sep 17 00:00:00 2001
+From 88cef14eb829f7ad5c869695d3ea079ffeccc839 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -12,7 +12,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 762818c..0efa628 100644
+index 07433f0..d818427 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -37,6 +37,7 @@ if T.TYPE_CHECKING:
diff --git a/meta/recipes-devtools/meson/meson_1.12.0.bb b/meta/recipes-devtools/meson/meson_1.12.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.12.0.bb
rename to meta/recipes-devtools/meson/meson_1.12.1.bb
index ac69b63bde..e8c1b3d7e0 100644
--- a/meta/recipes-devtools/meson/meson_1.12.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.12.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "88afe0c20e52030218924ac37d0c81c59b4b5f3ae3752c8c6d7470c7d365886c"
+SRC_URI[sha256sum] = "ab0a6ca09f8ef70c564c8241fb5a23957886a0b53fb58412b5e07eaf07dba743"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.47.1


--===============7626713334594440507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/meson: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.12.0/meson-1.12.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.12.1/meson-1.12.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/x86-64-v3-poky-linux/meson: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/meson/meson-dbg: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/meson/meson-dbg: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/meson/meson-dev: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/meson/meson-dev: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/meson/meson-doc: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/meson/meson-doc: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/meson/meson-doc: PKGSIZE changed from 13258 to 13261 (+0%)
packages/x86-64-v3-poky-linux/meson/meson-locale: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/meson/meson-locale: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/meson/meson-src: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/meson/meson-src: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/meson/meson-staticdev: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/meson/meson-staticdev: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/meson/meson: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson-1.12.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/meson-1.12.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/meson-1.12.0.dist-info -> /usr/lib/python3.14/site-packages/meson-1.12.1.dist-info
packages/x86-64-v3-poky-linux/meson/meson: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/meson/meson: PKGSIZE changed from 10604059 to 10620968 (+0%)
Changes to packages/x86-64-v3-poky-linux/meson (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.12.0.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.12.1.dist-info
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.12.0.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.12.1.dist-info

--===============7626713334594440507==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.12.0-1.12.1.patch"

RnJvbSAwZDBiMzJiZGQ2YTI1YjFkNDllZWNiZjcxMjRmN2M0NmU1MWYwZWFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjMgU2VwIDIwMjYgMDU6NTY6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAxLjEyLjAgLT4gMS4xMi4xCgotLS0KIC4uLi9tZXNvbi9tZXNvbi8wMDAx
LU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCB8IDggKysrKy0tLS0KIC4uLi8w
MDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoICAgICB8IDQg
KystLQogLi4uL21lc29uL3ttZXNvbl8xLjEyLjAuYmIgPT4gbWVzb25fMS4xMi4xLmJifSAgICAg
ICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL3ttZXNvbl8xLjEyLjAu
YmIgPT4gbWVzb25fMS4xMi4xLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZh
bWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaAppbmRleCBhZThiZDRjOTU0Li5kZmVlMjRlMDAzIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQ
VS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L21lc29uL21lc29uLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBiYTc5Y2VlNzAxYjgwOTg0YzY2MGZmYzFjODljZTEyMjZiNzVl
ZDViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyYWE2YWIzMzc5MjgxMDM4ZWFlOTE1
YjBlNmUxODU1ZWQwNzA3YjMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBC
dXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMyBKdWwgMjAxOCAxMzo1
OTowOSArMDEwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIENQVSBmYW1pbHkgd2FybmluZ3MgZmF0
YWwKQEAgLTEwLDEwICsxMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5i
dXJ0b25AaW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weSBiL21lc29u
YnVpbGQvZW52Y29uZmlnLnB5Ci1pbmRleCBiMDA3MmE0Li43NjI4MThjIDEwMDY0NAoraW5kZXgg
NjVkMDgyMy4uMDc0MzNmMCAxMDA2NDQKIC0tLSBhL21lc29uYnVpbGQvZW52Y29uZmlnLnB5CiAr
KysgYi9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQotQEAgLTI5NCw4ICsyOTQsOCBAQCBjbGFzcyBN
YWNoaW5lSW5mbyhIb2xkYWJsZU9iamVjdCk6CitAQCAtMjkzLDggKzI5Myw4IEBAIGNsYXNzIE1h
Y2hpbmVJbmZvKEhvbGRhYmxlT2JqZWN0KToKICAgICAgICAgICAgICAgICAgJ2J1dCBpcyBtaXNz
aW5nIHt9LicuZm9ybWF0KG1pbmltdW1fbGl0ZXJhbCAtIHNldChsaXRlcmFsKSkpCiAgCiAgICAg
ICAgICBjcHVfZmFtaWx5ID0gbGl0ZXJhbFsnY3B1X2ZhbWlseSddCkBAIC0yNCw3ICsyNCw3IEBA
IGluZGV4IGIwMDcyYTQuLjc2MjgxOGMgMTAwNjQ0CiAgCiAgICAgICAgICBlbmRpYW4gPSBsaXRl
cmFsWydlbmRpYW4nXQogICAgICAgICAgaWYgZW5kaWFuIG5vdCBpbiAoJ2xpdHRsZScsICdiaWcn
KToKLUBAIC02NDIsOSArNjQyLDcgQEAgZGVmIGRldGVjdF9jcHVfZmFtaWx5KGNvbXBpbGVyczog
Q29tcGlsZXJEaWN0KSAtPiBzdHI6CitAQCAtNjU2LDkgKzY1Niw3IEBAIGRlZiBkZXRlY3RfY3B1
X2ZhbWlseShjb21waWxlcnM6IENvbXBpbGVyRGljdCkgLT4gc3RyOgogICAgICAgICAgICAgIHRy
aWFsID0gJ21pcHMnCiAgCiAgICAgIGlmIHRyaWFsIG5vdCBpbiBrbm93bl9jcHVfZmFtaWxpZXM6
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBw
b3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVz
LWFnYWluLnBhdGNoCmluZGV4IDMwZjc5YmUzNjkuLjZiYjBjOTFmZDUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxs
YXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNv
bi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyMWFiZWQ2Nzg2MDU2YWUzMWU0MDI4Yjk4MDY4ZmY3ODc0
MDg3MmU2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4OGNlZjE0ZWI4MjlmN2FkNWM4
Njk2OTVkM2VhMDc5ZmZlY2NjODM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGV0
ZXIgS2plbGxlcnN0ZWR0IDxwa2pAYXhpcy5jb20+CiBEYXRlOiBUaHUsIDI2IEp1bCAyMDE4IDE2
OjMyOjQ5ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFN1cHBvcnQgYnVpbGRpbmcgYWxsYXJjaCBy
ZWNpcGVzIGFnYWluCkBAIC0xMiw3ICsxMiw3IEBAIFNpZ25lZC1vZmYtYnk6IFBldGVyIEtqZWxs
ZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvbWVzb25idWlsZC9lbnZjb25maWcucHkgYi9t
ZXNvbmJ1aWxkL2VudmNvbmZpZy5weQotaW5kZXggNzYyODE4Yy4uMGVmYTYyOCAxMDA2NDQKK2lu
ZGV4IDA3NDMzZjAuLmQ4MTg0MjcgMTAwNjQ0CiAtLS0gYS9tZXNvbmJ1aWxkL2VudmNvbmZpZy5w
eQogKysrIGIvbWVzb25idWlsZC9lbnZjb25maWcucHkKIEBAIC0zNyw2ICszNyw3IEBAIGlmIFQu
VFlQRV9DSEVDS0lORzoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9t
ZXNvbl8xLjEyLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4xMi4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tZXNvbi9tZXNvbl8xLjEyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9t
ZXNvbi9tZXNvbl8xLjEyLjEuYmIKaW5kZXggYWM2OWI2M2JkZS4uZThjMWIzZDdlMCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuMTIuMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4xMi4xLmJiCkBAIC0xNCw3ICsxNCw3
IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9L21lc29uLSR7
UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJu
aW5ncy1mYXRhbC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLVN1cHBvcnQtYnVpbGRp
bmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjg4YWZlMGMyMGU1MjAzMDIxODkyNGFjMzdkMGM4MWM1OWI0YjVmM2FlMzc1
MmM4YzZkNzQ3MGM3ZDM2NTg4NmMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWIwYTZjYTA5Zjhl
ZjcwYzU2NGM4MjQxZmI1YTIzOTU3ODg2YTBiNTNmYjU4NDEyYjVlMDdlYWYwN2RiYTc0MyIKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSQiCiAKIGluaGVyaXQg
cHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBnaXRodWItcmVsZWFzZXMKLS0gCjIuNDcuMQoK

--===============7626713334594440507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1993 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-5c6a9288835cc36e1e09c436699e2029e188e1fa"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:5c6a9288835cc36e1e09c436699e2029e188e1fa"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 456 Local 282 Mirrors 0 Missed 174 Current 266 (61% match, 75% complete)
done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 270 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 341 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 362 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 371 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 383 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 392 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 394 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 401 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 403 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 421 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe meson-1.12.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 428 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 429 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe meson-1.12.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 433 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 441 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 448 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 461 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 462 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 722 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/re2c/re2c_4.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 466 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 472 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.196-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 477 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe re2c-native-4.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.196-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 479 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 482 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 484 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 485 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 486 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 488 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 490 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 491 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 492 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 494 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 495 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe re2c-native-4.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 496 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 499 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 502 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ninja-1.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 506 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 508 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-2.8.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 511 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 515 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 516 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 522 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 524 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 526 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 530 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 531 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 532 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ninja-1.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 536 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 538 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 540 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 542 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 544 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 545 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 548 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 549 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 550 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.196-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 553 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 555 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 557 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ninja-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 563 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 565 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 566 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 567 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ninja-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 568 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 571 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 573 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 576 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 577 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 578 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 579 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 581 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 584 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 587 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 588 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 590 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 594 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 602 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 603 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 604 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 605 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 607 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 608 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 609 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 611 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 613 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 614 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 616 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 618 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 619 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 620 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 625 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 627 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 628 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 629 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 632 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 633 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 634 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 636 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 638 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 639 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 640 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 641 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 642 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 643 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 645 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 646 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 647 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 649 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 650 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 651 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 652 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 656 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 658 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 659 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 660 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 661 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 663 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 665 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 678 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 680 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 682 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 683 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 684 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 691 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: Running setscene task 685 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 686 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 688 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 759 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_fetch)
NOTE: Running setscene task 690 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 691 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 774 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: Running task 819 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 821 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_fetch)
NOTE: Running task 823 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 825 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: Running task 828 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: Running task 829 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 830 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe openssl-4.0.2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe openssl-4.0.2-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: Running task 831 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: Running task 833 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 835 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 700 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 701 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 853 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_unpack)
NOTE: Running task 856 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_fetch)
NOTE: Running task 859 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: Running task 867 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: Running task 869 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: Running task 870 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: Running task 871 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: Running task 872 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: recipe xz-5.8.4-r0: task do_unpack: Started
NOTE: recipe expat-2.8.4-r0: task do_fetch: Started
NOTE: Running task 873 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: recipe expat-2.8.4-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 874 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: Running task 875 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 878 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 880 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_fetch)
NOTE: Running task 882 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 883 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 884 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_unpack: Succeeded
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 885 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: Running task 886 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_patch)
NOTE: Running task 887 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: recipe expat-2.8.4-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 888 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 892 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: Running task 893 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: Running task 899 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: recipe xz-5.8.4-r0: task do_patch: Started
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Started
NOTE: recipe expat-2.8.4-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: Running setscene task 703 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: Running setscene task 704 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 900 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_patch)
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 901 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: recipe xz-5.8.4-r0: task do_patch: Succeeded
NOTE: Running task 904 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: Running task 905 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 908 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 917 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 926 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_patch)
NOTE: Running task 928 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_fetch)
NOTE: recipe expat-2.8.4-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: Running task 931 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_fetch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: Running noexec task 933 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 937 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: Running task 938 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_patch: Succeeded
NOTE: Running task 940 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_write_config)
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 942 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_generate_toolchain_file)
NOTE: Running task 944 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_unpack)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 705 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.22.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: Running setscene task 706 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.22.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 707 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_generate_toolchain_file: Started
NOTE: Running task 945 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Started
NOTE: Running task 946 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Started
NOTE: recipe libgcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 947 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe expat-2.8.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 949 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_unpack)
NOTE: Running task 951 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: recipe libgcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: Running task 955 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running noexec task 957 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_fetch)
NOTE: Running task 959 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe curl-8.22.0-r0: task do_unpack: Started
NOTE: recipe json-c-0.19-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 961 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 962 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 964 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: Running setscene task 708 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 709 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running setscene task 712 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 965 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 966 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 968 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Succeeded
NOTE: Running task 976 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_fetch)
NOTE: recipe json-c-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 987 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_fetch)
NOTE: Running task 988 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: Running task 990 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 713 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Started
NOTE: Running task 991 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_fetch)
NOTE: Running task 992 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe json-c-0.19-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 715 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_fetch: Succeeded
NOTE: Running task 993 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe libgcc-initial-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 716 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1003 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_patch)
NOTE: Running task 1004 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_patch)
NOTE: Running task 1005 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: Running task 1009 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_write_config)
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1012 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_unpack)
NOTE: Running setscene task 719 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1015 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Started
NOTE: Running task 1017 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1020 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 720 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_patch: Started
NOTE: recipe curl-8.22.0-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Started
NOTE: Running task 1022 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe libarchive-3.8.9-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_fetch: Started
NOTE: Running setscene task 721 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1025 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1026 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Succeeded
NOTE: Running task 1027 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_unpack)
NOTE: recipe linux-libc-headers-7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: Running task 1028 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: Running task 1032 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_unpack: Started
NOTE: Running task 1034 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_fetch)
NOTE: Running task 1035 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: Running task 1036 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_patch)
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Started
NOTE: Running task 1038 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_generate_toolchain_file)
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_fetch: Succeeded
NOTE: Running task 1039 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1041 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_fetch)
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1043 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_unpack)
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.14.7-r0: task do_unpack: Started
NOTE: Running task 1045 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_fetch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Started
NOTE: recipe libarchive-3.8.9-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_unpack: Started
NOTE: Running task 1046 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1048 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1064 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: Running task 1065 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_unpack)
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: Running task 1066 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_prepare_recipe_sysroot)
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1068 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: Running task 1070 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_fetch: Started
NOTE: Running task 1071 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_patch)
NOTE: recipe linux-libc-headers-7.2-r0: task do_fetch: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe libffi-3.8.0-r0: task do_patch: Started
NOTE: Running task 1072 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.9-r0: task do_patch: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 1073 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1074 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_patch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Succeeded
NOTE: Running task 1082 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: recipe file-5.48-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Succeeded
NOTE: Running task 1084 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: recipe linux-libc-headers-7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1085 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1087 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: Running task 1088 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: Running noexec task 1091 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_configure)
NOTE: Running noexec task 1092 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_compile)
NOTE: Running task 1093 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_install)
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe file-5.48-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_unpack: Succeeded
NOTE: Running task 1094 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_patch)
NOTE: Running task 1095 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: Running task 1096 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: Running task 1097 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_patch)
NOTE: Running task 1102 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_fetch)
NOTE: Running task 1103 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_unpack)
NOTE: Running task 1104 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_unpack)
NOTE: Running task 1108 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: Running task 1109 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: Running task 1110 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: Running task 1111 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: Running task 1112 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: Running task 1121 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_install: Started
NOTE: recipe musl-1.2.6+git-r0: task do_patch: Started
NOTE: recipe lzlib-1.16-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe file-5.48-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Started
NOTE: recipe elfutils-0.196-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_unpack: Succeeded
NOTE: Running task 1122 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: Running task 1123 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_patch)
NOTE: recipe coreutils-9.11-r0: task do_fetch: Started
NOTE: recipe elfutils-0.196-r0: task do_fetch: Succeeded
NOTE: Running task 1124 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_unpack)
NOTE: recipe coreutils-9.11-r0: task do_fetch: Succeeded
NOTE: Running task 1125 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: recipe lzlib-1.16-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_install: Succeeded
NOTE: recipe elfutils-0.196-r0: task do_unpack: Started
NOTE: Running task 1127 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_package)
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1128 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 1129 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_patch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1132 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzlib-1.16-r0: task do_patch: Succeeded
NOTE: Running task 1143 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_unpack)
NOTE: Running task 1145 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_package: Started
NOTE: recipe sed-4.10-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Started
NOTE: recipe sed-4.10-r0: task do_fetch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1146 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe coreutils-9.11-r0: task do_unpack: Started
NOTE: Running noexec task 1147 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: Running noexec task 1148 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 1149 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 1152 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: Running task 1154 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_recipe_qa)
NOTE: recipe sed-4.10-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe meson-1.12.1-r0: task do_recipe_qa: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: Running task 1158 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: Running task 1161 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_unpack: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: Running task 1162 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_patch)
NOTE: Running task 1164 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1165 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: Running task 1166 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: recipe ninja-1.13.2-r0: task do_fetch: Started
NOTE: Running task 1167 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: Running task 1168 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: Running task 1169 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: Running task 1170 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: recipe file-5.48-r0: task do_unpack: Succeeded
NOTE: Running task 1171 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_patch)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe sed-4.10-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe file-5.48-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_patch: Succeeded
NOTE: Running task 1179 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.10-r0: task do_patch: Succeeded
NOTE: Running task 1180 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: Running task 1182 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_fetch)
NOTE: Running task 1183 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 1185 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_fetch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1193 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_fetch)
NOTE: recipe meson-1.12.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1194 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_fetch)
NOTE: recipe ninja-1.13.2-r0: task do_fetch: Succeeded
NOTE: recipe file-5.48-r0: task do_patch: Succeeded
NOTE: Running task 1195 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_unpack)
NOTE: recipe coreutils-9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1212 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_fetch)
NOTE: Running task 1213 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1215 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: Running task 1216 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe shadow-4.20.2-r0: task do_fetch: Started
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Started
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Started
NOTE: recipe shadow-4.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1217 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_unpack)
NOTE: recipe meson-1.12.1-r0: task do_fetch: Started
NOTE: Running task 1218 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_unpack)
NOTE: recipe ninja-1.13.2-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Started
NOTE: recipe meson-1.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 1219 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_unpack)
NOTE: recipe coreutils-9.11-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1221 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_unpack: Started
NOTE: Running task 1234 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe meson-1.12.1-r0: task do_unpack: Started
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1238 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_unpack)
NOTE: Running task 1239 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe elfutils-0.196-r0: task do_unpack: Succeeded
NOTE: Running task 1240 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_patch)
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1241 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1242 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe binutils-2.47-r0: task do_unpack: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.196-r0: task do_patch: Started
NOTE: Running task 1243 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_unpack)
NOTE: Running task 1244 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_unpack)
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: Running noexec task 1286 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_fetch)
NOTE: Running task 1287 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1289 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Started
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_patch: Succeeded
NOTE: Running task 1296 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_configure)
NOTE: Running task 1298 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_configure)
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe ca-certificates-20260816-r0: task do_configure: Started
NOTE: recipe tzdata-2026d-r0: task do_configure: Started
NOTE: recipe meson-1.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 1299 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1300 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1301 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: recipe ca-certificates-20260816-r0: task do_configure: Succeeded
NOTE: Running task 1316 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_create_recipe_spdx)
NOTE: Running task 1317 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_compile)
NOTE: recipe tzdata-2026d-r0: task do_configure: Succeeded
NOTE: recipe meson-1.12.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1318 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_compile)
NOTE: recipe unzip-1_6.0-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_patch: Succeeded
NOTE: Running task 1320 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_unpack: Succeeded
NOTE: recipe meson-1.12.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1321 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_patch)
NOTE: Running task 1322 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe ca-certificates-20260816-r0: task do_compile: Started
NOTE: recipe tzdata-2026d-r0: task do_compile: Started
NOTE: recipe ninja-1.13.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe ninja-1.13.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe meson-1.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1323 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ninja-1.13.2-r0: task do_patch: Succeeded
NOTE: recipe tzdata-2026d-r0: task do_compile: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1326 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_patch)
NOTE: recipe elfutils-0.196-r0: task do_patch: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 1328 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_install)
NOTE: Running task 1329 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_patch)
NOTE: recipe ca-certificates-20260816-r0: task do_compile: Succeeded
NOTE: recipe meson-1.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1330 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_install)
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1331 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_patch)
NOTE: recipe shadow-4.20.2-r0: task do_patch: Started
NOTE: recipe tzdata-2026d-r0: task do_install: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Started
NOTE: recipe meson-1.12.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ca-certificates-20260816-r0: task do_install: Started
NOTE: recipe ninja-1.13.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Started
NOTE: recipe shadow-4.20.2-r0: task do_patch: Succeeded
NOTE: recipe meson-1.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1333 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1334 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Succeeded
NOTE: Running task 1336 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_generate_toolchain_file)
NOTE: recipe bsd-headers-1.0-r0: task do_package: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_package unihash changed to 359e92d27dc7b6f6d817e41a145c113dd00933c39c531340c9d763b21d6a97cd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata became valid
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 716 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f0aa88e3c9fe4568c522cd7c8c986e1f301d8f6a83227a8313f97a5121401199
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20260816-r0: task do_install: Succeeded
NOTE: Running task 1338 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_package)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe tzdata-2026d-r0: task do_install: Succeeded
NOTE: Running task 1341 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_package)
NOTE: recipe ca-certificates-20260816-r0: task do_package: Started
NOTE: recipe tzdata-2026d-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package unihash changed to 17d20b66bc4b3677e29411c8f6514f450dc782c967828a77dc44e9776e98176f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ca-certificates-20260816-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_package unihash changed to 8d13e44cdfd350c99f9c7c5376b6798e00b850eaddf63c52d4898bec06a07429
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20260816-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20260816-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1345 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: recipe binutils-2.47-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1346 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_patch)
NOTE: recipe binutils-2.47-r0: task do_patch: Started
NOTE: recipe binutils-2.47-r0: task do_patch: Succeeded
NOTE: recipe tzdata-2026d-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_package unihash changed to 18d94f2af9f5191f464051798f2200891db9c3bf5023082f9c756891177a6be2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2026d-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2026d-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1349 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_patch)
NOTE: recipe linux-libc-headers-7.2-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_patch: Succeeded
NOTE: Running noexec task 1351 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_configure)
NOTE: Running noexec task 1352 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_compile)
NOTE: Running task 1353 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_install)
NOTE: recipe linux-libc-headers-7.2-r0: task do_install: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_install: Succeeded
NOTE: Running task 1366 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1369 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_package)
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1370 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_configure)
NOTE: Running task 1371 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_compile)
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1372 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Succeeded
NOTE: Running task 1374 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1375 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_package)
NOTE: recipe musl-1.2.6+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.6+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1376 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_configure)
NOTE: recipe musl-1.2.6+git-r0: task do_configure: Started
NOTE: recipe musl-1.2.6+git-r0: task do_configure: Succeeded
NOTE: Running task 1377 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_compile)
NOTE: recipe musl-1.2.6+git-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_package unihash changed to c74f12aae2c316692286293bde7513694fbc3dab213b82e8d756fed59313eeae
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx became valid
NOTE: Running setscene task 711 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe linux-libc-headers-7.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_package unihash changed to 2e7edf84e2f21ee682684dee878f2a2860709eda18324e524cd698f22a611faf
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_spdx became valid
NOTE: Running setscene task 714 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe musl-1.2.6+git-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1384 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_install)
NOTE: recipe musl-1.2.6+git-r0: task do_install: Started
NOTE: recipe musl-1.2.6+git-r0: task do_install: Succeeded
NOTE: Running task 1386 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1387 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package)
NOTE: recipe libgcc-16.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package: Started
NOTE: recipe libgcc-16.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1388 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_configure)
NOTE: recipe libgcc-16.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-16.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1389 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_compile)
NOTE: recipe libgcc-16.2.0-r0: task do_compile: Started
NOTE: recipe musl-1.2.6+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_package unihash changed to e3d41bdd7038eb91ff62747dcf67ef85b3dcc041e1fcde73ba69e430d63bc074
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata became valid
NOTE: Running setscene task 711 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libgcc-16.2.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1392 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_install)
NOTE: recipe libgcc-16.2.0-r0: task do_install: Started
NOTE: recipe libgcc-16.2.0-r0: task do_install: Succeeded
NOTE: Running task 1393 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_multilib_install)
NOTE: recipe libgcc-16.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-16.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1394 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-16.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-16.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1396 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1397 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_package)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-16.2.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1398 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_configure)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-16.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_package unihash changed to a894fd452b2899c3dc4a4a906cc0036429d6cbf34b5ed38308c04c9642cb0d33
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_spdx became valid
NOTE: Running setscene task 703 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gcc-runtime-16.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1401 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_compile)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_compile: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1402 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_install)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_install: Succeeded
NOTE: Running task 1409 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1410 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1411 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1412 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1413 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1414 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1415 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1416 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1417 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1418 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1419 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_package)
NOTE: Running task 1420 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1421 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1422 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1423 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1424 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-4.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_package: Started
NOTE: recipe libffi-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1425 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure)
NOTE: Running task 1426 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1427 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_configure: Started
NOTE: recipe openssl-4.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1428 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1429 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: Running task 1430 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure)
NOTE: Running task 1431 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1432 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_configure)
NOTE: recipe libffi-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_configure: Started
NOTE: Running task 1433 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure)
NOTE: recipe expat-2.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1434 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_configure)
NOTE: Running task 1435 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_configure)
NOTE: Running task 1436 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1437 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: Running task 1438 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure)
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Started
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Started
NOTE: recipe openssl-4.0.2-r0: task do_configure: Started
NOTE: recipe gdbm-1.26-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_configure: Started
NOTE: recipe expat-2.8.4-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure_ptest_base: Started
NOTE: Running task 1439 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe json-c-0.19-r0: task do_configure: Started
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1440 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure)
NOTE: Running task 1441 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: Running task 1442 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1443 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe zlib-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1444 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1445 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1447 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_compile: Started
NOTE: recipe attr-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1448 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_configure)
NOTE: recipe attr-2.6.0-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1449 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1450 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe expat-2.8.4-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: Running task 1451 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_configure: Succeeded
NOTE: Running task 1452 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile_ptest_base)
NOTE: recipe xz-5.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1453 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_configure)
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1454 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install)
NOTE: recipe xz-5.8.4-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_install: Started
NOTE: recipe zlib-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1455 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1457 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_configure_ptest_base)
NOTE: recipe expat-2.8.4-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.8.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1458 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_compile)
NOTE: recipe expat-2.8.4-r0: task do_compile: Started
NOTE: recipe json-c-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1460 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure_ptest_base)
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1461 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile)
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1462 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_configure)
NOTE: recipe libpam-1.7.2-r0: task do_compile: Started
NOTE: recipe ncurses-6.6-r0: task do_configure: Started
NOTE: recipe expat-2.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1463 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_compile_ptest_base)
NOTE: recipe expat-2.8.4-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.8.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1464 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_install)
NOTE: recipe expat-2.8.4-r0: task do_install: Started
NOTE: recipe expat-2.8.4-r0: task do_install: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1465 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile_ptest_base)
NOTE: Running task 1466 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_compile)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_compile: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1467 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install)
NOTE: recipe libpam-1.7.2-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1468 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_install: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: Running task 1469 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_install_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_package unihash changed to fd954b7de26f03431ce6f5762042c0ab495e712951c0bffc10b8f8e8ae289626
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata became valid
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.8.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: Running task 1470 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: Running task 1471 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure_ptest_base)
NOTE: Running task 1473 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install_ptest_base)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1474 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1476 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: recipe libffi-3.8.0-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 1477 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_compile)
NOTE: recipe openssl-4.0.2-r0: task do_configure: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1478 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_configure_ptest_base)
NOTE: Running task 1479 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe libffi-3.8.0-r0: task do_compile: Started
NOTE: recipe openssl-4.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe attr-2.6.0-r0: task do_configure: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1480 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_compile)
NOTE: Setscene tasks completed
NOTE: Running task 1481 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_configure_ptest_base)
NOTE: recipe openssl-4.0.2-r0: task do_compile: Started
NOTE: recipe attr-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1482 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure_ptest_base)
NOTE: Running task 1483 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_compile)
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_compile: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1484 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile)
NOTE: recipe gdbm-1.26-r0: task do_compile: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot unihash changed to 233d875166fd0d04b50999a5481e4054715f8d9eb954fbda43b4f651fa2de094
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_populate_sysroot became valid
NOTE: Running setscene task 713 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1485 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_compile: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1486 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_compile_ptest_base)
NOTE: Running task 1487 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1488 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1489 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe attr-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libffi-3.8.0-r0: task do_install: Started
NOTE: recipe attr-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1490 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_install)
NOTE: recipe libcap-2.78-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe attr-2.6.0-r0: task do_install: Started
NOTE: recipe libcap-2.78-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1491 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_configure)
NOTE: recipe libcap-2.78-r0: task do_configure: Started
NOTE: recipe libcap-2.78-r0: task do_configure: Succeeded
NOTE: Running task 1492 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Started
NOTE: Running task 1495 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_configure_ptest_base)
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1496 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe libcap-2.78-r0: task do_configure_ptest_base: Started
NOTE: recipe libcap-2.78-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe json-c-0.19-r0: task do_compile: Started
NOTE: Running task 1497 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to 444d4167f3ef8eee4ad88786c226d15d50aa90f600a5b90422369d388d55fa04
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: recipe libcap-2.78-r0: task do_compile: Started
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running task 1498 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1500 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1502 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1504 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzlib-1.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.26-r0: task do_compile: Succeeded
NOTE: Running task 1505 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1506 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Started
NOTE: recipe lzlib-1.16-r0: task do_configure: Started
NOTE: recipe json-c-0.19-r0: task do_compile: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1507 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile_ptest_base)
NOTE: Running task 1508 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_configure)
NOTE: recipe lzlib-1.16-r0: task do_configure: Succeeded
NOTE: Running task 1509 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_compile)
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Started
NOTE: recipe acl-2.4.0-r0: task do_configure: Started
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_compile: Started
NOTE: Running task 1510 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install)
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe json-c-0.19-r0: task do_install: Started
NOTE: Running task 1511 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install)
NOTE: recipe gdbm-1.26-r0: task do_install: Started
NOTE: recipe json-c-0.19-r0: task do_install: Succeeded
NOTE: Running task 1512 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1513 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1514 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1515 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.78-r0: task do_compile: Succeeded
NOTE: Running task 1516 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_compile_ptest_base)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1517 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe libcap-2.78-r0: task do_compile_ptest_base: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: Running task 1518 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_install: Succeeded
NOTE: Running task 1519 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Started
NOTE: recipe libcap-2.78-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1520 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_install)
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1521 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install)
NOTE: recipe libcap-2.78-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Started
NOTE: recipe lzlib-1.16-r0: task do_compile: Succeeded
NOTE: Running task 1522 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_install)
NOTE: recipe xz-5.8.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1523 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_configure_ptest_base)
NOTE: recipe lzlib-1.16-r0: task do_install: Started
NOTE: recipe xz-5.8.4-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.8.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Succeeded
NOTE: Running task 1524 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_compile)
NOTE: Running task 1525 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install_ptest_base)
NOTE: recipe xz-5.8.4-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe lzlib-1.16-r0: task do_install: Succeeded
NOTE: Running task 1527 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe libcap-2.78-r0: task do_install: Succeeded
NOTE: Running task 1528 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1530 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package)
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_package: Started
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1532 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1533 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe xz-5.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1534 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_compile_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe xz-5.8.4-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package unihash changed to 7e65045f2e7c670ab7ed01c013d30b0d2d277329bdd94fe51673586203137ab7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1536 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_package)
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1537 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe expat-2.8.4-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1538 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 23a626acd90503a5b706eae175aa100ed63c24083fc8d6fb39f7dd216bf058b6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1539 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1541 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1543 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_package)
NOTE: recipe acl-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1544 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_package: Started
NOTE: recipe libffi-3.8.0-r0: task do_package: Started
NOTE: recipe acl-2.4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe acl-2.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1545 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_compile)
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 1546 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_compile)
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1548 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_install_ptest_base)
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Started
NOTE: recipe libcap-2.78-r0: task do_install_ptest_base: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1549 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe xz-5.8.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1550 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_install)
NOTE: recipe libcap-2.78-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1552 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe xz-5.8.4-r0: task do_install: Started
NOTE: recipe sed-4.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1554 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx)
NOTE: recipe sed-4.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1555 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_configure)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx: Started
NOTE: recipe sed-4.10-r0: task do_configure: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_package: Succeeded
NOTE: Running task 1556 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_package unihash changed to c249c4b92d48c42dd1495ee0a2023758263b32ad8d5c7ae59b561c99107fd026
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_packagedata_setscene)
NOTE: recipe attr-2.6.0-r0: task do_package: Started
NOTE: recipe acl-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1557 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_compile_ptest_base)
NOTE: recipe expat-2.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_compile_ptest_base: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/expat/2.8.4/temp/log.do_packagedata_setscene.3758510
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Setscene tasks completed
NOTE: Running task 1558 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_packagedata)
NOTE: recipe expat-2.8.4-r0: task do_packagedata: Started
NOTE: recipe acl-2.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1559 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_install)
NOTE: recipe acl-2.4.0-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1560 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe expat-2.8.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1561 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe libffi-3.8.0-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_package unihash changed to 352b3fd94805417139e3701619170843cf2e01cee63ee2c47e5cb07eb08842af
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1562 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_configure)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1564 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx)
NOTE: recipe base-passwd-3.6.8-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx: Started
NOTE: recipe acl-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1565 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_install_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1566 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe ninja-1.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1567 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe acl-2.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1569 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: Running noexec task 1570 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_configure)
NOTE: Running task 1571 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_compile)
NOTE: recipe ninja-1.13.2-r0: task do_compile: Started
NOTE: recipe shadow-4.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package)
NOTE: recipe shadow-4.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1574 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_configure: Succeeded
NOTE: Running task 1575 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_compile)
NOTE: recipe libpam-1.7.2-r0: task do_package: Started
NOTE: recipe shadow-4.20.2-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_compile: Started
NOTE: recipe gdbm-1.26-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package unihash changed to 37c1737731cc1a712d264311f07d678f3aae1f6faeb6c6456b29b12289d90477
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1577 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_package)
NOTE: recipe libseccomp-2.6.1-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_compile: Succeeded
NOTE: Running task 1578 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_install)
NOTE: recipe attr-2.6.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_package unihash changed to b0dd373f3815b9e1463d4ff0a313eb64619320532ca73ac1a13ed94229e1bcda
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata became valid
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_install: Started
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1580 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_package)
NOTE: recipe acl-2.4.0-r0: task do_package: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1581 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile_ptest_base)
NOTE: recipe xz-5.8.4-r0: task do_install: Succeeded
NOTE: Running task 1582 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_install_ptest_base)
NOTE: recipe zstd-1.5.7-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_install: Succeeded
NOTE: Running task 1584 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_package)
NOTE: recipe xz-5.8.4-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_configure: Succeeded
NOTE: Running task 1585 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_compile)
NOTE: recipe base-passwd-3.6.8-r0: task do_compile: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Succeeded
NOTE: Running task 1586 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_install)
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Started
NOTE: recipe ninja-1.13.2-r0: task do_compile: Succeeded
NOTE: Running task 1587 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_install)
NOTE: recipe ninja-1.13.2-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_compile: Succeeded
NOTE: Running task 1588 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_install)
NOTE: recipe base-passwd-3.6.8-r0: task do_install: Started
NOTE: recipe ninja-1.13.2-r0: task do_install: Succeeded
NOTE: Running task 1589 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package)
NOTE: recipe ninja-1.13.2-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_install: Succeeded
NOTE: Running task 1592 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_package)
NOTE: recipe xz-5.8.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1594 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_package)
NOTE: recipe lzlib-1.16-r0: task do_package: Started
NOTE: recipe xz-5.8.4-r0: task do_package: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot)
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1596 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot unihash changed to 2e709d9655c327194717d00ea900ed63b3f7b906bbb4828496fffe986f55f4b6
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_package: Succeeded
NOTE: Running task 1597 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_package unihash changed to 1892403f358cb1cd17fde44791a973d7cc88c175cb6561e6c6b196f464268ae3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_packagedata became valid
NOTE: recipe acl-2.4.0-r0: task do_package: Succeeded
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_package unihash changed to 773393bd1b15d11737d72c9b51dcff00fc53bd0d3aa37b50290b91b4382c5c1b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata became valid
NOTE: recipe libtasn1-4.21.0-r0: task do_package: Started
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1603 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_package)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1605 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe json-c-0.19-r0: task do_package: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1607 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1608 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure)
NOTE: recipe lzlib-1.16-r0: task do_package: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_package unihash changed to b4e893525fd36f9553e58a8408fcd6fb0be106b415122de7ee468db7fe6f7950
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata became valid
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package unihash changed to 3cf82892d0b3286bc3d86fb49eedff4db137bd7f33f5e9246d38a02ea3e94a01
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_packagedata became valid
NOTE: recipe nettle-4.0-r0: task do_configure: Started
NOTE: Running setscene task 717 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe ninja-1.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe ninja-1.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1609 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_prepare_recipe_sysroot)
NOTE: Setscene tasks completed
NOTE: Running task 1610 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe libseccomp-2.6.1-r0: task do_package: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: Running task 1611 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1612 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_configure)
NOTE: recipe libtasn1-4.21.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package unihash changed to 03cb23d1155a9a082a1bcd08ce8f9aa7074ed00bd90846bc0dc3d6b4a4db8d48
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata became valid
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_configure: Started
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running task 1613 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_configure)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1616 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata)
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package unihash changed to c82389685a093e3fef926bd04774cff454328610d40d311a52714e566abfec1a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata unihash changed to 140d3ccfb754eebae933fc55b9556cebbda8544c8fef941246f57bd745ca1e1f
NOTE: Running task 1618 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1619 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 1620 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_compile)
NOTE: recipe libunistring-1.4.2-r0: task do_compile: Started
NOTE: recipe json-c-0.19-r0: task do_package: Succeeded
NOTE: Running task 1621 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1622 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1623 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata)
NOTE: recipe libpam-1.7.2-r0: task do_package: Succeeded
NOTE: recipe json-c-0.19-r0: task do_packagedata: Started
NOTE: recipe xz-5.8.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package unihash changed to ab4b8c15e360e400d0a3d27227abc53e9c5ec0a82bd424f583ec112316b3bf6d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata became valid
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_package unihash changed to 3968ffd80c71928c9dc7afe2401eb0cd487acee9ae03bfd776f5c95a8cd179fa
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata became valid
NOTE: Running setscene task 701 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata: Succeeded
NOTE: Running task 1625 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_configure)
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1627 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package unihash changed to 08f5decb52efeb20e5689e9a3fba65d89f42053a3c41b8e4636b1450e5b81838
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata became valid
NOTE: recipe unzip-1_6.0-r0: task do_configure: Started
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_configure: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: recipe nettle-4.0-r0: task do_configure: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1628 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_package)
NOTE: Running task 1629 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package unihash changed to ebecb9df152378dbefeea8930460bed37f83c33718973c0630e723487a7b5ed7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to d0c512f281b3a23cd88249469d279fd1943b95590572c0f719ca0f4238519388
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_package: Started
NOTE: Running setscene task 721 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running task 1632 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_package)
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Succeeded
NOTE: Running task 1633 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_compile)
NOTE: Running task 1634 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: Running task 1635 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1637 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_compile: Started
NOTE: recipe nettle-4.0-r0: task do_compile: Started
NOTE: recipe libcap-2.78-r0: task do_package: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1639 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_spdx)
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_create_spdx: Started
NOTE: Running task 1640 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_install)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Started
NOTE: Running task 1641 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_create_spdx)
NOTE: recipe ncurses-6.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1642 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_compile)
NOTE: recipe expat-2.8.4-r0: task do_create_spdx: Started
NOTE: recipe ncurses-6.6-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Succeeded
NOTE: Running task 1643 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package)
NOTE: recipe expat-2.8.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1644 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_create_spdx)
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Started
NOTE: recipe xz-5.8.4-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_create_spdx: Started
NOTE: Running task 1645 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx)
NOTE: recipe gdbm-1.26-r0: task do_create_spdx: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1646 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx)
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_create_spdx: Succeeded
NOTE: Running task 1647 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx)
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1648 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Started
NOTE: recipe ninja-1.13.2-r0: task do_populate_sysroot: Started
NOTE: recipe ninja-1.13.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot unihash changed to 38c0c89e19509dcad018d5a345df9afc16bc977de7667d7593e1f96e6d4da0bd
NOTE: Running task 1649 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_create_spdx)
NOTE: Running task 1650 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package_write_ipk)
NOTE: recipe base-passwd-3.6.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_package unihash changed to bd72bf8e43680c8934797f4341a222645f10fbcbdc45629a4fb00fa0c362a093
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe ninja-1.13.2-r0: task do_create_spdx: Started
NOTE: recipe ninja-1.13.2-r0: task do_package_write_ipk: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1652 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package_write_deb)
NOTE: recipe ninja-1.13.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1653 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package_write_rpm)
NOTE: recipe ninja-1.13.2-r0: task do_package_write_deb: Started
NOTE: recipe ninja-1.13.2-r0: task do_package_write_rpm: Started
NOTE: recipe ninja-1.13.2-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package_write_ipk unihash changed to 07fad149382c07a2d28b2464b37b000e67434077b00bbab383f29f92b9554a01
NOTE: Running task 1654 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package_qa)
NOTE: recipe shadow-4.20.2-r0: task do_configure: Succeeded
NOTE: Running task 1655 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_compile)
NOTE: recipe ninja-1.13.2-r0: task do_package_qa: Started
NOTE: recipe shadow-4.20.2-r0: task do_compile: Started
NOTE: recipe libcap-2.78-r0: task do_package: Succeeded
NOTE: recipe ninja-1.13.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_package unihash changed to 2a9a7ac653e42a3a315d95a106aa69e0ddd0013de8b925ccd75834612b487b30
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata became valid
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package_qa unihash changed to 9acb9151c4ca9f5a2dbc697f067c1658cf28e00cc57623cd0829a3a8dabada90
NOTE: Running setscene task 719 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe ninja-1.13.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package_write_rpm unihash changed to 1f64d105153e5aa137179895e8e04b1311c3619e60c816336fe07717c74753c3
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package unihash changed to 16ea59dd010ca05aa461f525a6b00c643f784275321d0c1646c6199004447eea
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ninja-1.13.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_package_write_deb unihash changed to 42e204e8e9530fd8e4f80adb137ed5f1336681c8b989d4a74a39a2b474be02cb
NOTE: recipe shadow-4.20.2-r0: task do_compile: Succeeded
NOTE: Running task 1658 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_install)
NOTE: recipe shadow-4.20.2-r0: task do_install: Started
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1659 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_compile)
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Started
NOTE: recipe nettle-4.0-r0: task do_compile: Succeeded
NOTE: Running task 1660 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_compile_ptest_base)
NOTE: recipe nettle-4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe shadow-4.20.2-r0: task do_install: Succeeded
NOTE: Running task 1662 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1663 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_package)
NOTE: recipe ptest-runner-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.20.2-r0: task do_package: Started
NOTE: recipe nettle-4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1664 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_install)
NOTE: recipe nettle-4.0-r0: task do_install: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1665 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_configure)
NOTE: recipe ptest-runner-2.5.1-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r0: task do_compile: Succeeded
NOTE: Running task 1666 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe ptest-runner-2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1667 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_compile)
NOTE: recipe unzip-1_6.0-r0: task do_install: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r0: task do_install: Succeeded
NOTE: Running task 1668 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe ptest-runner-2.5.1-r0: task do_compile: Succeeded
NOTE: recipe nettle-4.0-r0: task do_install: Succeeded
NOTE: Running task 1669 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_install)
NOTE: recipe unzip-1_6.0-r0: task do_package: Started
NOTE: Running task 1670 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_install_ptest_base)
NOTE: recipe ptest-runner-2.5.1-r0: task do_install: Started
NOTE: recipe nettle-4.0-r0: task do_install_ptest_base: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_install: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1671 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_install)
NOTE: recipe mpfr-4.2.2-r0: task do_install: Started
NOTE: recipe mpfr-4.2.2-r0: task do_install: Succeeded
NOTE: Running task 1673 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1674 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package)
NOTE: recipe ncurses-6.6-r0: task do_compile: Succeeded
NOTE: Running task 1675 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_install)
NOTE: recipe libmpc-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.2-r0: task do_package: Started
NOTE: recipe ncurses-6.6-r0: task do_install: Started
NOTE: recipe libmpc-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1676 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_configure)
NOTE: recipe nettle-4.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1678 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_package)
NOTE: recipe libmpc-1.4.1-r0: task do_configure: Started
NOTE: recipe nettle-4.0-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_package unihash changed to 1be49f58b5e93ef350a55f36f609f8b943b211847a18f060206cca91b6a62fcb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1679 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_compile_ptest_base)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-4.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-4.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1681 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_install)
NOTE: recipe openssl-4.0.2-r0: task do_install: Started
NOTE: recipe sed-4.10-r0: task do_configure: Succeeded
NOTE: Running task 1682 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_configure_ptest_base)
NOTE: recipe sed-4.10-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1683 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_compile)
NOTE: recipe sed-4.10-r0: task do_compile: Started
NOTE: recipe mpfr-4.2.2-r0: task do_package: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package unihash changed to 5f96be89646327190869e60624a35e20e9c9142e53837bbe37e4e5560981adad
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata became valid
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_package unihash changed to ec728159ca053f89a12dbbb30ce57c79cedb6fa458550e30ed3f088fb66e5da8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata became valid
NOTE: Running setscene task 719 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1686 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package: Started
NOTE: recipe openssl-4.0.2-r0: task do_install: Succeeded
NOTE: Running task 1687 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_install_ptest_base)
NOTE: recipe openssl-4.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.10-r0: task do_compile: Succeeded
NOTE: Running task 1688 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_compile_ptest_base)
NOTE: recipe sed-4.10-r0: task do_compile_ptest_base: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package unihash changed to 2486b2d2fce37c7f6f2927b2a27850d47dc0ae5f7d742a175817de457bd5d18c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1689 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_install)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_install: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nettle-4.0-r0: task do_package: Succeeded
NOTE: Running task 1691 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata)
NOTE: recipe nettle-4.0-r0: task do_packagedata: Started
NOTE: recipe sed-4.10-r0: task do_install: Succeeded
NOTE: Running task 1692 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_install_ptest_base)
NOTE: recipe nettle-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.10-r0: task do_install_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata unihash changed to 021e67d1d05464f3ab3de31059c2b21cde8ad56d76f29d2b8695cc0783a1f899
NOTE: Setscene tasks completed
NOTE: recipe sed-4.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1693 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_package)
NOTE: recipe sed-4.10-r0: task do_package: Started
NOTE: recipe libmpc-1.4.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1694 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_compile)
NOTE: recipe libmpc-1.4.1-r0: task do_compile: Started
NOTE: recipe libmpc-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1695 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_install)
NOTE: recipe libmpc-1.4.1-r0: task do_install: Started
NOTE: recipe libmpc-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1697 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_package)
NOTE: recipe libmpc-1.4.1-r0: task do_package: Started
NOTE: recipe libmpc-1.4.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_package unihash changed to 17c5deb4f5b9f925e737c2af37c284cc7a08537e35f2e423d520b9cb58999d77
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_package unihash changed to 86e8868f78033830748feedcc8491b9184eb0d493611e4b2914f1b9ecfad271b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe zstd-1.5.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1700 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install)
NOTE: recipe zstd-1.5.7-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1701 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_install)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_install: Succeeded
NOTE: Running task 1703 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_package)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_package: Started
NOTE: recipe ncurses-6.6-r0: task do_install: Succeeded
NOTE: Running task 1705 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1706 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_package)
NOTE: Running task 1707 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libedit-20260512-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_package: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1708 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_configure)
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1709 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure)
NOTE: recipe libedit-20260512-3.1-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_package unihash changed to 44b7729b7473ff80914bffff9c1358b3f05f0b1cb7d0a54c3ea161845296bc82
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1711 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_spdx)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1713 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_package)
NOTE: recipe openssl-4.0.2-r0: task do_package: Started
NOTE: recipe coreutils-9.11-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1714 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.11-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1715 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_compile)
NOTE: recipe coreutils-9.11-r0: task do_compile: Started
NOTE: recipe zstd-1.5.7-r0: task do_install: Succeeded
NOTE: Running task 1716 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install_ptest_base)
NOTE: recipe zstd-1.5.7-r0: task do_install_ptest_base: Started
NOTE: recipe zstd-1.5.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1718 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1719 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1720 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package)
NOTE: Running task 1721 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.8.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Started
NOTE: recipe gcc-16.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1722 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_configure)
NOTE: recipe libedit-20260512-3.1-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1723 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_configure)
NOTE: Running task 1724 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_compile)
NOTE: recipe gcc-16.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1725 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_configure)
NOTE: recipe file-5.48-r0: task do_configure: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.8.9-r0: task do_configure: Started
NOTE: recipe gcc-16.2.0-r0: task do_configure: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_compile: Succeeded
NOTE: Running task 1726 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_install)
NOTE: recipe libedit-20260512-3.1-r0: task do_install: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_install: Succeeded
NOTE: Running task 1728 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_package unihash changed to 4e6c23711bf75e9df1bb64186356eb4ae958ec5a84b57a2c1aac60f387d2634f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1729 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_configure)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1731 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_package)
NOTE: Running task 1732 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx)
NOTE: recipe python3-3.14.7-r0: task do_configure: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_package: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx: Started
NOTE: recipe gcc-16.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1733 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_compile)
NOTE: recipe gcc-16.2.0-r0: task do_compile: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package unihash changed to 06a70dcc1a3fb4611d7970a3211a30aaf9823724ebc566a9009eebb2e73d7e01
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata became valid
NOTE: Running setscene task 718 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1735 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.11-r0: task do_compile: Succeeded
NOTE: Running task 1736 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_compile_ptest_base)
NOTE: recipe ncurses-6.6-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1737 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_install)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_install: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_package unihash changed to 179ecb21968adcf439c8ec20865285a530d4694790661540b05bd340c06135f5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1739 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe bash-5.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1740 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure_ptest_base)
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1741 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile)
NOTE: recipe bash-5.3-r0: task do_compile: Started
NOTE: recipe coreutils-9.11-r0: task do_install: Succeeded
NOTE: Running task 1742 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.11-r0: task do_install_ptest_base: Started
NOTE: recipe libunistring-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 1743 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_install)
NOTE: recipe libunistring-1.4.2-r0: task do_install: Started
NOTE: recipe file-5.48-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1744 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_compile)
NOTE: recipe file-5.48-r0: task do_compile: Started
NOTE: recipe libunistring-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 1746 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1747 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_package)
NOTE: recipe libidn2-2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.4.2-r0: task do_package: Started
NOTE: recipe openssl-4.0.2-r0: task do_package: Succeeded
NOTE: Running task 1748 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_packagedata)
NOTE: recipe openssl-4.0.2-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1749 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_configure)
NOTE: recipe libidn2-2.3.8-r0: task do_configure: Started
NOTE: recipe openssl-4.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1750 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_create_spdx)
NOTE: recipe openssl-4.0.2-r0: task do_create_spdx: Started
NOTE: recipe file-5.48-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_install)
NOTE: recipe file-5.48-r0: task do_install: Started
NOTE: recipe coreutils-9.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1752 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package)
NOTE: recipe coreutils-9.11-r0: task do_package: Started
NOTE: recipe file-5.48-r0: task do_install: Succeeded
NOTE: Running task 1754 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_package)
NOTE: recipe file-5.48-r0: task do_package: Started
NOTE: recipe bash-5.3-r0: task do_compile: Succeeded
NOTE: Running task 1755 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile_ptest_base)
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1756 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install)
NOTE: recipe bash-5.3-r0: task do_install: Started
NOTE: recipe libunistring-1.4.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_package unihash changed to fecd5f29628ee8eec3833a37af34b8e6ebd8034ea6c7bc731967339977df33f4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 721 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_package unihash changed to 1ca7266b39383f133b6a5cae8db6f48a18aec2136115ab8349153acf4ff97ed1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-5.3-r0: task do_install: Succeeded
NOTE: Running task 1759 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install_ptest_base)
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1760 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package)
NOTE: recipe bash-5.3-r0: task do_package: Started
NOTE: recipe libarchive-3.8.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1761 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_configure_ptest_base)
NOTE: recipe libarchive-3.8.9-r0: task do_configure_ptest_base: Started
NOTE: recipe libarchive-3.8.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1762 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_compile)
NOTE: recipe libarchive-3.8.9-r0: task do_compile: Started
NOTE: recipe libarchive-3.8.9-r0: task do_compile: Succeeded
NOTE: Running task 1763 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_compile_ptest_base)
NOTE: recipe bash-5.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package unihash changed to 0337c0ce201de53293166c892dec3f79473362dc2cd3728bdf0414a569485348
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata became valid
NOTE: recipe libarchive-3.8.9-r0: task do_compile_ptest_base: Started
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libidn2-2.3.8-r0: task do_configure: Succeeded
NOTE: Running task 1765 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_compile)
NOTE: recipe libidn2-2.3.8-r0: task do_compile: Started
NOTE: recipe libarchive-3.8.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1766 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_install)
NOTE: recipe libarchive-3.8.9-r0: task do_install: Started
NOTE: recipe coreutils-9.11-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package unihash changed to 6ae2a5cbac2ca330eadbdfa54633e18dac142eefc716ba7710ccb0d96821bc43
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libarchive-3.8.9-r0: task do_install: Succeeded
NOTE: Running task 1768 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_install_ptest_base)
NOTE: recipe libarchive-3.8.9-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1769 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_configure_ptest_base)
NOTE: recipe python3-3.14.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1770 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_compile)
NOTE: recipe python3-3.14.7-r0: task do_compile: Started
NOTE: recipe libarchive-3.8.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1771 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_populate_sysroot)
NOTE: Running task 1772 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_package)
NOTE: recipe libarchive-3.8.9-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.8.9-r0: task do_package: Started
NOTE: recipe libarchive-3.8.9-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_populate_sysroot unihash changed to 58cdddb2f2da816e7db2364534c4c98875867f53d0270c088667b1eb6fddc0ed
NOTE: Setscene tasks completed
NOTE: recipe libidn2-2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 1773 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_install)
NOTE: recipe libidn2-2.3.8-r0: task do_install: Started
NOTE: recipe libidn2-2.3.8-r0: task do_install: Succeeded
NOTE: Running task 1774 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot)
NOTE: Running task 1775 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot unihash changed to ba5545eac05a363872bfe661a61c682eb48696658f662b273ea2d88a7da19905
NOTE: Setscene tasks completed
NOTE: Running task 1776 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1777 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.23.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.23.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1778 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_configure)
NOTE: recipe gnutls-3.8.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1779 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_configure)
NOTE: recipe libpsl-0.23.3-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.13-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package unihash changed to b6c1013d2dd215645d1083f197b7775c30a8b24cd7566aac26510f1c549f3297
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata became valid
NOTE: Running setscene task 721 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_configure: Succeeded
NOTE: Running task 1780 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_compile)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libarchive-3.8.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_package unihash changed to bb8f8b045f3b6cd15b4fd0bbecd2b7ae3b1abfd6f73b4189db6f42f47d08e175
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpsl-0.23.3-r0: task do_compile: Succeeded
NOTE: Running task 1783 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_install)
NOTE: recipe libpsl-0.23.3-r0: task do_install: Started
NOTE: recipe libpsl-0.23.3-r0: task do_install: Succeeded
NOTE: Running task 1784 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot)
NOTE: Running task 1785 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_package)
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.23.3-r0: task do_package: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot unihash changed to 5895d7a54f71a307155b492c05e4f92a9ae9ca617de5c14c85f087b5897c421f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_populate_sysroot became valid
NOTE: Running setscene task 720 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1786 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1787 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_configure)
NOTE: recipe curl-8.22.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.23.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_package unihash changed to f29bb4689927db60804e04fe014d77967b666857a6805b191266adb9813a6878
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata became valid
NOTE: Running setscene task 714 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.14.7-r0: task do_compile: Succeeded
NOTE: Running task 1789 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_compile_ptest_base)
NOTE: recipe python3-3.14.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1790 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_install)
NOTE: recipe python3-3.14.7-r0: task do_install: Started
NOTE: recipe curl-8.22.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1791 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_configure_ptest_base)
NOTE: recipe curl-8.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1792 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_compile)
NOTE: recipe curl-8.22.0-r0: task do_compile: Started
NOTE: recipe curl-8.22.0-r0: task do_compile: Succeeded
NOTE: Running task 1793 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_compile_ptest_base)
NOTE: recipe curl-8.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1794 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_install)
NOTE: recipe curl-8.22.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.13-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1795 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.13-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1796 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_compile)
NOTE: recipe gnutls-3.8.13-r0: task do_compile: Started
NOTE: recipe python3-3.14.7-r0: task do_install: Succeeded
NOTE: Running task 1797 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_install_ptest_base)
NOTE: recipe python3-3.14.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1798 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package)
NOTE: Running task 1800 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe meson-1.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.22.0-r0: task do_install: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_package: Started
NOTE: Running task 1801 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_install_ptest_base)
NOTE: recipe curl-8.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe meson-1.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1802 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_configure)
NOTE: recipe meson-1.12.1-r0: task do_configure: Started
NOTE: recipe meson-1.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1803 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_compile)
NOTE: recipe meson-1.12.1-r0: task do_compile: Started
NOTE: recipe curl-8.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1805 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_package)
NOTE: recipe curl-8.22.0-r0: task do_package: Started
NOTE: recipe meson-1.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1806 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_install)
NOTE: recipe meson-1.12.1-r0: task do_install: Started
NOTE: recipe meson-1.12.1-r0: task do_install: Succeeded
NOTE: Running task 1807 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_populate_sysroot)
NOTE: recipe meson-1.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe meson-1.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_package unihash changed to bdef6deb13d09a6cb222d6ef838e53ae61bab7b1f371cf3d2968ef5e9df4ee0c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.14.7-r0: task do_package: Succeeded
NOTE: Running task 1809 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata)
NOTE: recipe python3-3.14.7-r0: task do_packagedata: Started
NOTE: recipe python3-3.14.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata unihash changed to fd22981f3408ab60b8463522f81a460189d0eccbeed469a250ec5797cf614fdc
NOTE: Setscene tasks completed
NOTE: Running task 1810 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_package)
NOTE: Running task 1811 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx)
NOTE: recipe meson-1.12.1-r0: task do_package: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx: Started
NOTE: recipe meson-1.12.1-r0: task do_package: Succeeded
NOTE: Running task 1812 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_packagedata)
NOTE: recipe meson-1.12.1-r0: task do_packagedata: Started
NOTE: recipe meson-1.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1813 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_package_write_ipk)
NOTE: Running task 1814 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_package_write_deb)
NOTE: Running task 1815 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_package_write_rpm)
NOTE: Running task 1816 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_package_qa)
NOTE: recipe meson-1.12.1-r0: task do_package_write_ipk: Started
NOTE: recipe meson-1.12.1-r0: task do_package_write_deb: Started
NOTE: recipe meson-1.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe meson-1.12.1-r0: task do_package_qa: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 1817 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_create_spdx)
NOTE: recipe meson-1.12.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe meson-1.12.1-r0: task do_create_spdx: Started
NOTE: recipe meson-1.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_compile: Succeeded
NOTE: recipe meson-1.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1818 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_compile_ptest_base)
NOTE: recipe meson-1.12.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1819 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_create_package_spdx)
NOTE: recipe gnutls-3.8.13-r0: task do_compile_ptest_base: Started
NOTE: recipe meson-1.12.1-r0: task do_create_package_spdx: Started
NOTE: recipe gnutls-3.8.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1820 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_install)
NOTE: recipe gnutls-3.8.13-r0: task do_install: Started
NOTE: recipe meson-1.12.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe meson-1.12.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_install: Succeeded
NOTE: Running task 1821 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.13-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1822 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_populate_sysroot)
NOTE: Running task 1823 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_package)
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.13-r0: task do_package: Started
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_populate_sysroot unihash changed to 9dada075b3db199d40bd6625b948a252bb328649ade28c6c94d1cd9689df5f61
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_populate_sysroot became valid
NOTE: Running setscene task 717 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.196-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1824 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1825 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.13-r0: task do_package: Succeeded
NOTE: Running task 1826 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata)
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata unihash changed to 44217419b4b5be97575246df704a23b3b2334894b1a29c36a990d72260d5a578
NOTE: Setscene tasks completed
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1827 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_compile)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 1828 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_install: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 1830 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1831 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_package)
NOTE: recipe elfutils-0.196-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_package: Started
NOTE: recipe elfutils-0.196-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1832 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_configure)
NOTE: recipe elfutils-0.196-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_package unihash changed to e12f822cdf7f6519327bf0f9594ff559b2879ea1d1cb4fecc3b9bf449fc64167
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata became valid
NOTE: Running setscene task 717 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe elfutils-0.196-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1834 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.196-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.196-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1835 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_compile)
NOTE: recipe elfutils-0.196-r0: task do_compile: Started
NOTE: recipe elfutils-0.196-r0: task do_compile: Succeeded
NOTE: Running task 1836 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.196-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.196-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1837 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_install)
NOTE: recipe elfutils-0.196-r0: task do_install: Started
NOTE: recipe elfutils-0.196-r0: task do_install: Succeeded
NOTE: Running task 1838 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.196-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.196-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1840 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1841 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_package)
NOTE: recipe binutils-2.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.196-r0: task do_package: Started
NOTE: recipe binutils-2.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1842 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_configure)
NOTE: recipe binutils-2.47-r0: task do_configure: Started
NOTE: recipe binutils-2.47-r0: task do_configure: Succeeded
NOTE: Running task 1843 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_compile)
NOTE: recipe binutils-2.47-r0: task do_compile: Started
NOTE: recipe elfutils-0.196-r0: task do_package: Succeeded
NOTE: Running task 1844 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_packagedata)
NOTE: recipe elfutils-0.196-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.196-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1845 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_install)
NOTE: recipe gcc-16.2.0-r0: task do_install: Started
NOTE: recipe binutils-2.47-r0: task do_compile: Succeeded
NOTE: Running task 1846 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_install)
NOTE: recipe binutils-2.47-r0: task do_install: Started
NOTE: recipe gcc-16.2.0-r0: task do_install: Succeeded
NOTE: Running task 1847 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_package)
NOTE: recipe gcc-16.2.0-r0: task do_package: Started
NOTE: recipe binutils-2.47-r0: task do_install: Succeeded
NOTE: Running task 1848 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package)
NOTE: recipe binutils-2.47-r0: task do_package: Started
NOTE: recipe binutils-2.47-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package unihash changed to ba1ef28ca3ca32e0de39258bb6b5c1f9460856c4e059cd7aaa8b6a43b80dfed5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gcc-16.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_package unihash changed to c409587fc0037b24328c1aa9cf1f2e4a6f9163544c53dfc7ae8a876ba1aa68b1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata became valid
NOTE: Running setscene task 722 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1851 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_ipk)
NOTE: Running task 1852 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_deb)
NOTE: Running task 1853 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_rpm)
NOTE: Running task 1854 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_qa)
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk: Started
NOTE: recipe python3-3.14.7-r0: task do_package_qa: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_ipk unihash changed to 2c8ea8644bfbb0a07a6d03daf01910b2dcd6e8af04cfaa4cdfaa53a48549ea71
NOTE: recipe python3-3.14.7-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_qa unihash changed to d7d66b7745f42aad44cda0709af988ac1ea680f3481f6d2f5fe8537c25c9eebc
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_rpm unihash changed to be9e26db6f6924f2cf373b240c1feb476f9ef83e3da4f46c7b7029bdf51a02e8
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_deb unihash changed to 9b14a85de40df20ee58fa10a066c74d77f70dd1476a36e78524f275b48569144
NOTE: Running noexec task 1855 of 1855 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1855 tasks of which 1258 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: expat-2.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.8.5-r0 to 0:2.8.4-r0) [version-going-backwards]
ERROR: expat-2.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.8.5-r0 to 0:2.8.4-r0) [version-going-backwards]
ERROR: expat-2.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.8.5-r0 to 0:2.8.4-r0) [version-going-backwards]
ERROR: expat-2.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.8.5-r0 to 0:2.8.4-r0) [version-going-backwards]
ERROR: expat-2.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.8.5-r0 to 0:2.8.4-r0) [version-going-backwards]
ERROR: expat-2.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.8.5-r0 to 0:2.8.4-r0) [version-going-backwards]
ERROR: expat-2.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.8.5-r0 to 0:2.8.4-r0) [version-going-backwards]
ERROR: expat-2.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.8.5-r0 to 0:2.8.4-r0) [version-going-backwards]
ERROR: expat-2.8.4-r0 do_packagedata_setscene: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.8.5-r0 to 0:2.8.4-r0) [version-going-backwards]
ERROR: expat-2.8.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7626713334594440507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson-1.12.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/meson-1.12.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/meson-1.12.0.dist-info -> /usr/lib/python3.14/site-packages/meson-1.12.1.dist-info
Changes to packages/x86-64-v3-poky-linux/meson (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.12.0.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.12.1.dist-info
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.14/site-packages/meson-1.12.0.dist-info moved to /usr/lib/python3.14/site-packages/meson-1.12.1.dist-info

--===============7626713334594440507==--

