Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F78ACEBF96
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12123.1763224724863746263
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=sIl1BrVx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=M18lVpRd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a8862238e-1b6cbfc7-c3a4-4626-9f83-d49b49f82b02-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224724;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sNHmpdQASKpY1QtVLcy3Bp10re/5zZ1oLLgNni1ll/c=;
	b=sIl1BrVxKmkFY4ommSz0CfXCsp9arFgUI7AqNwyMLtrP5/dy4WQNB3kG/2UcJUup
	xcrYe2BxIa4+qU2PqUgbyzKiN53GXA0y5v1yz3Y+Z+g31u0C8ldheZh5WyWm28rBeNq
	JxgwH3FcgCWjFJ0tiQOu9jwBGKwRub/BHA2FKKxw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224724;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sNHmpdQASKpY1QtVLcy3Bp10re/5zZ1oLLgNni1ll/c=;
	b=M18lVpRd4jkjPXVntxxUeT1cU6XX/DPGETD/sT9nX/R+AA+OMX2RT2MkamOSjX4m
	yvRTySt55kxuqpEvEdg9bXf7Y53wSfr9PTeNvzTfFfq2Wn2B8Zhtp7YHHXsKqEjx7n1
	irYfSH6WC7AOaTTwICuS6ihCnXQEAxXZPOR4+094=
Content-Type: multipart/mixed; boundary="===============8634013427162455437=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.2.1 SUCCEEDED
Message-ID: <0101019a8862238e-1b6cbfc7-c3a4-4626-9f83-d49b49f82b02-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226354

--===============8634013427162455437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.1.3-3.2.1.patch
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
From fc42a8c9df2b6ea71c396e7a43c9736ef0c09e4a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 10:10:02 +0000
Subject: [PATCH] python3-cython: upgrade 3.1.3 -> 3.2.1

---
 ...ce-not-predictable-build-path-prefix-with-hardc.patch | 9 +++------
 .../{python3-cython_3.1.3.bb => python3-cython_3.2.1.bb} | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.1.3.bb => python3-cython_3.2.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index 1fbbd8fd48..5028513029 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From 1690c505f1387e1884565021991a162e2f88f2b9 Mon Sep 17 00:00:00 2001
+From eb1c13d6a657969501560d81a978c2cfd236d96b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Sep 2025 01:42:08 -0700
 Subject: [PATCH] Replace not predictable build path prefix with hardcode
@@ -53,10 +53,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
-index 6672cb986..b1123515e 100644
+index 29d6ff7..a3b909b 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
-@@ -779,7 +779,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
+@@ -877,7 +877,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
          code.put_generated_by()
          if metadata:
              code.putln("/* BEGIN: Cython Metadata")
@@ -67,6 +67,3 @@ index 6672cb986..b1123515e 100644
              code.putln("END: Cython Metadata */")
              code.putln("")
  
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/python/python3-cython_3.1.3.bb b/meta/recipes-devtools/python/python3-cython_3.2.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.1.3.bb
rename to meta/recipes-devtools/python/python3-cython_3.2.1.bb
index 3b2835d9c5..dbecadd2a4 100644
--- a/meta/recipes-devtools/python/python3-cython_3.1.3.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.1.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089"
+SRC_URI[sha256sum] = "2be1e4d0cbdf7f4cd4d9b8284a034e1989b59fd060f6bd4d24bf3729394d2ed8"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.1


--===============8634013427162455437==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.1.3-3.2.1.patch"

RnJvbSBmYzQyYThjOWRmMmI2ZWE3MWMzOTZlN2E0M2M5NzM2ZWYwYzA5ZTRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTA6MTA6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAzLjEuMyAtPiAzLjIuMQoKLS0tCiAuLi5jZS1ub3QtcHJl
ZGljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaCB8IDkgKysrLS0tLS0t
CiAuLi4ve3B5dGhvbjMtY3l0aG9uXzMuMS4zLmJiID0+IHB5dGhvbjMtY3l0aG9uXzMuMi4xLmJi
fSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3l0aG9uXzMu
MS4zLmJiID0+IHB5dGhvbjMtY3l0aG9uXzMuMi4xLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5v
dC1wcmVkaWN0YWJsZS1idWlsZC1wYXRoLXByZWZpeC13aXRoLWhhcmRjLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbi8wMDAxLVJlcGxhY2Utbm90LXBy
ZWRpY3RhYmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFyZGMucGF0Y2gKaW5kZXggMWZiYmQ4
ZmQ0OC4uNTAyODUxMzAyOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWN5dGhvbi8wMDAxLVJlcGxhY2Utbm90LXByZWRpY3RhYmxlLWJ1aWxkLXBhdGgt
cHJlZml4LXdpdGgtaGFyZGMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWN5dGhvbi8wMDAxLVJlcGxhY2Utbm90LXByZWRpY3RhYmxlLWJ1aWxkLXBhdGgt
cHJlZml4LXdpdGgtaGFyZGMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDE2OTBjNTA1ZjEz
ODdlMTg4NDU2NTAyMTk5MWExNjJlMmY4OGYyYjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGViMWMxM2Q2YTY1Nzk2OTUwMTU2MGQ4MWE5NzhjMmNmZDIzNmQ5NmIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBXZWQsIDE3IFNlcCAyMDI1IDAxOjQyOjA4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hd
IFJlcGxhY2Ugbm90IHByZWRpY3RhYmxlIGJ1aWxkIHBhdGggcHJlZml4IHdpdGggaGFyZGNvZGUK
QEAgLTUzLDEwICs1MywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlh
QHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvQ3l0aG9uL0NvbXBpbGVyL01vZHVsZU5vZGUucHkgYi9D
eXRob24vQ29tcGlsZXIvTW9kdWxlTm9kZS5weQotaW5kZXggNjY3MmNiOTg2Li5iMTEyMzUxNWUg
MTAwNjQ0CitpbmRleCAyOWQ2ZmY3Li5hM2I5MDliIDEwMDY0NAogLS0tIGEvQ3l0aG9uL0NvbXBp
bGVyL01vZHVsZU5vZGUucHkKICsrKyBiL0N5dGhvbi9Db21waWxlci9Nb2R1bGVOb2RlLnB5Ci1A
QCAtNzc5LDcgKzc3OSw5IEBAIGNsYXNzIE1vZHVsZU5vZGUoTm9kZXMuTm9kZSwgTm9kZXMuQmxv
Y2tOb2RlKToKK0BAIC04NzcsNyArODc3LDkgQEAgY2xhc3MgTW9kdWxlTm9kZShOb2Rlcy5Ob2Rl
LCBOb2Rlcy5CbG9ja05vZGUpOgogICAgICAgICAgY29kZS5wdXRfZ2VuZXJhdGVkX2J5KCkKICAg
ICAgICAgIGlmIG1ldGFkYXRhOgogICAgICAgICAgICAgIGNvZGUucHV0bG4oIi8qIEJFR0lOOiBD
eXRob24gTWV0YWRhdGEiKQpAQCAtNjcsNiArNjcsMyBAQCBpbmRleCA2NjcyY2I5ODYuLmIxMTIz
NTE1ZSAxMDA2NDQKICAgICAgICAgICAgICBjb2RlLnB1dGxuKCJFTkQ6IEN5dGhvbiBNZXRhZGF0
YSAqLyIpCiAgICAgICAgICAgICAgY29kZS5wdXRsbigiIikKICAKLS0tIAotMi40OS4wCi0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25fMy4x
LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMi4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jeXRob25fMy4xLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25fMy4yLjEuYmIKaW5kZXggM2IyODM1ZDljNS4u
ZGJlY2FkZDJhNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWN5dGhvbl8zLjEuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY3l0aG9uXzMuMi4xLmJiCkBAIC03LDcgKzcsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5
dGhvbiIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0UudHh0O21kNT02MWMzZWU4OTYxNTc1ODYxZmE4NmM3ZTYyYmM5ZjY5YyIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjEwZWU3ODVlNDIzMjg5MjRiNzhmNzVhNzRmNjZhODEzY2I5NTZi
NGE5YmM5MWM0NDgxNmQwODlkNTkzNGMwODkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmJlMWU0
ZDBjYmRmN2Y0Y2Q0ZDliODI4NGEwMzRlMTk4OWI1OWZkMDYwZjZiZDRkMjRiZjM3MjkzOTRkMmVk
OCIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzIGN5dGhvbgogCi0tIAoyLjQ3LjEKCg==

--===============8634013427162455437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cython: PV changed from "3.1.3" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.1.3.tar.gz;downloadfilename=cython-3.1.3.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.2.1.tar.gz;downloadfilename=cython-3.2.1.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
packages/x86-64-v3-poky-linux/python3-cython: PKGV changed from 3.1.3 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.1.3" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.1.3 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 26059048 to 26384408 (+1%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.1.3" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.1.3 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.1.3" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.1.3 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.1.3" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.1.3 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PV changed from "3.1.3" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.1.3 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 23081148 to 23500148 (+2%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.1.3" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.1.3 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PV changed from "3.1.3" to "3.2.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGV changed from 3.1.3 [default] to 3.2.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info -> /usr/lib/python3.13/site-packages/cython-3.2.1.dist-info, removed "/usr/lib/python3.13/site-packages/Cython/Utility/Dataclasses.py /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/COPYING.txt /usr/lib/python3.13/site-packages/Cython/Utility/__pycache__/Dataclasses.cpython-313.pyc /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/LICENSE.txt", added "/usr/lib/python3.13/site-packages/Cython/Utility/FusedFunction.pyx /usr/lib/python3.13/site-packages/Cython/Utility/TString.c /usr/lib/python3.13/site-packages/Cython/Includes/libcpp/condition_variable.pxd"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 14897478 to 14981666 (+1%)
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info moved to /usr/lib/python3.13/site-packages/cython-3.2.1.dist-info
  /usr/lib/python3.13/site-packages/Cython/Includes/libcpp/condition_variable.pxd was added
  /usr/lib/python3.13/site-packages/Cython/Utility/FusedFunction.pyx was added
  /usr/lib/python3.13/site-packages/Cython/Utility/TString.c was added
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/COPYING.txt was removed
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/Cython/Utility/Dataclasses.py was removed
  /usr/lib/python3.13/site-packages/Cython/Utility/__pycache__/Dataclasses.cpython-313.pyc was removed

--===============8634013427162455437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info -> /usr/lib/python3.13/site-packages/cython-3.2.1.dist-info, removed "/usr/lib/python3.13/site-packages/Cython/Utility/__pycache__/Dataclasses.cpython-313.pyc /usr/lib/python3.13/site-packages/Cython/Utility/Dataclasses.py /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/COPYING.txt /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/LICENSE.txt", added "/usr/lib/python3.13/site-packages/Cython/Utility/FusedFunction.pyx /usr/lib/python3.13/site-packages/Cython/Includes/libcpp/condition_variable.pxd /usr/lib/python3.13/site-packages/Cython/Utility/TString.c"
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info moved to /usr/lib/python3.13/site-packages/cython-3.2.1.dist-info
  /usr/lib/python3.13/site-packages/Cython/Includes/libcpp/condition_variable.pxd was added
  /usr/lib/python3.13/site-packages/Cython/Utility/FusedFunction.pyx was added
  /usr/lib/python3.13/site-packages/Cython/Utility/TString.c was added
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/COPYING.txt was removed
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/Cython/Utility/Dataclasses.py was removed
  /usr/lib/python3.13/site-packages/Cython/Utility/__pycache__/Dataclasses.cpython-313.pyc was removed

--===============8634013427162455437==--

