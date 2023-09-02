Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6E7CCF964
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:15 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.5684.1693650553785804383
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J8tU68QJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HBVeqWNU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a557088f9-50ac9fde-4e4c-482e-b949-1064a6353490-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650553;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=v7LhgRPCEUnvfiuPldYSBtCZcDtrtnWenj/VCXazGo8=;
	b=J8tU68QJYua0dS9/Lw+2v2nWEtj9NwFk1C/RiOFMZOnSKBpKdImT8ubK4Izgtp/U
	dRTwwrRQkzoPQO4G9ewyYQyu1rsVn3WIeG9Pjkn/aSI2VpUDzVEvD0G5KrrXCNwx7Tc
	biyJo4CbTAoYTJJxk8kEQawe2YHZfDACdZvBz2B8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650553;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=v7LhgRPCEUnvfiuPldYSBtCZcDtrtnWenj/VCXazGo8=;
	b=HBVeqWNUUFGiGO+GxNPemCgtBIujM30UGTbcK4nQ3VzSRXRPYb2pHlwzJ0Xun/ks
	RZ3qSDZA+Bric5rxuh1awLBWug6kMQsvDN8nFlWelvmzpYGZnscu7GuLKxdf+1b3DIK
	OKVWiy7gzqiLMABFl17VqEMYQFowV3XiOIH6GiNM=
Content-Type: multipart/mixed; boundary="===============8083896444395662933=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 68.1.2 SUCCEEDED
Message-ID: <0101018a557088f9-50ac9fde-4e4c-482e-b949-1064a6353490-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187073

--===============8083896444395662933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *68.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-68.1.0-68.1.2.patch
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
From bcc32253a9bf4996238d503922d42ffa5f89e4f2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 16:12:03 +0000
Subject: [PATCH] python3-setuptools: upgrade 68.1.0 -> 68.1.2

---
 ...nditionally-do-not-fetch-code-by-easy_install.patch | 10 ++++------
 ...tuptools_68.1.0.bb => python3-setuptools_68.1.2.bb} |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_68.1.0.bb => python3-setuptools_68.1.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 1e5ab498a4..d59364066b 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 5e603da9c01ccb828a03ea3e82d15599971f794f Mon Sep 17 00:00:00 2001
+From 7470015a4c3ead0ef37ba6d618972041ecebece8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -9,15 +9,16 @@ internet by easy_install.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  setuptools/command/easy_install.py | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 0b8d1159..93308060 100644
+index 8ba4f09..8ea40c5 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -644,6 +644,11 @@ class easy_install(Command):
+@@ -676,6 +676,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and _rmtree(tmpdir)
  
      def easy_install(self, spec, deps=False):
@@ -29,6 +30,3 @@ index 0b8d1159..93308060 100644
          with self._tmpdir() as tmpdir:
              if not isinstance(spec, Requirement):
                  if URL_SCHEME(spec):
--- 
-2.41.0
-
diff --git a/meta/recipes-devtools/python/python3-setuptools_68.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_68.1.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_68.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_68.1.2.bb
index e04cd1dcd0..a1e84b635c 100644
--- a/meta/recipes-devtools/python/python3-setuptools_68.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_68.1.2.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "d59c97e7b774979a5ccb96388efc9eb65518004537e85d52e81eaee89ab6dd91"
+SRC_URI[sha256sum] = "3d4dfa6d95f1b101d695a6160a7626e15583af71a5f52176efa5d39a054d475d"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.39.2


--===============8083896444395662933==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-68.1.0-68.1.2.patch"

RnJvbSBiY2MzMjI1M2E5YmY0OTk2MjM4ZDUwMzkyMmQ0MmZmYTVmODllNGYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxNjoxMjowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA2OC4xLjAgLT4gNjguMS4yCgotLS0KIC4uLm5kaXRp
b25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaCB8IDEwICsrKyst
LS0tLS0KIC4uLnR1cHRvb2xzXzY4LjEuMC5iYiA9PiBweXRob24zLXNldHVwdG9vbHNfNjguMS4y
LmJifSB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNldHVw
dG9vbHNfNjguMS4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc182OC4xLjIuYmJ9ICg5NSUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9v
bHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAw
MDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gK
aW5kZXggMWU1YWI0OThhNC4uZDU5MzY0MDY2YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5v
dC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90
LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1
ZTYwM2RhOWMwMWNjYjgyOGEwM2VhM2U4MmQxNTU5OTk3MWY3OTRmIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA3NDcwMDE1YTRjM2VhZDBlZjM3YmE2ZDYxODk3MjA0MWVjZWJlY2U4IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5k
cml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBKdWwgMjAxOCAxMDoxMzozOCArMDgwMAogU3ViamVj
dDogW1BBVENIXSBjb25kaXRpb25hbGx5IGRvIG5vdCBmZXRjaCBjb2RlIGJ5IGVhc3lfaW5zdGFs
bApAQCAtOSwxNSArOSwxNiBAQCBpbnRlcm5ldCBieSBlYXN5X2luc3RhbGwuCiBVcHN0cmVhbS1T
dGF0dXM6IEluYXBwcm9wcmlhdGUgW29lIHNwZWNpZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBIb25n
eHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CisKIC0tLQogIHNldHVwdG9vbHMvY29t
bWFuZC9lYXN5X2luc3RhbGwucHkgfCA1ICsrKysrCiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvc2V0dXB0b29scy9jb21tYW5kL2Vhc3lfaW5zdGFsbC5w
eSBiL3NldHVwdG9vbHMvY29tbWFuZC9lYXN5X2luc3RhbGwucHkKLWluZGV4IDBiOGQxMTU5Li45
MzMwODA2MCAxMDA2NDQKK2luZGV4IDhiYTRmMDkuLjhlYTQwYzUgMTAwNjQ0CiAtLS0gYS9zZXR1
cHRvb2xzL2NvbW1hbmQvZWFzeV9pbnN0YWxsLnB5CiArKysgYi9zZXR1cHRvb2xzL2NvbW1hbmQv
ZWFzeV9pbnN0YWxsLnB5Ci1AQCAtNjQ0LDYgKzY0NCwxMSBAQCBjbGFzcyBlYXN5X2luc3RhbGwo
Q29tbWFuZCk6CitAQCAtNjc2LDYgKzY3NiwxMSBAQCBjbGFzcyBlYXN5X2luc3RhbGwoQ29tbWFu
ZCk6CiAgICAgICAgICAgICAgb3MucGF0aC5leGlzdHModG1wZGlyKSBhbmQgX3JtdHJlZSh0bXBk
aXIpCiAgCiAgICAgIGRlZiBlYXN5X2luc3RhbGwoc2VsZiwgc3BlYywgZGVwcz1GYWxzZSk6CkBA
IC0yOSw2ICszMCwzIEBAIGluZGV4IDBiOGQxMTU5Li45MzMwODA2MCAxMDA2NDQKICAgICAgICAg
IHdpdGggc2VsZi5fdG1wZGlyKCkgYXMgdG1wZGlyOgogICAgICAgICAgICAgIGlmIG5vdCBpc2lu
c3RhbmNlKHNwZWMsIFJlcXVpcmVtZW50KToKICAgICAgICAgICAgICAgICAgaWYgVVJMX1NDSEVN
RShzcGVjKToKLS0tIAotMi40MS4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY4LjEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY4LjEuMi5iYgpzaW1pbGFyaXR5IGluZGV4
IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29sc182OC4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zZXR1cHRvb2xzXzY4LjEuMi5iYgppbmRleCBlMDRjZDFkY2QwLi5hMWU4NGI2MzVj
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29sc182OC4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHNfNjguMS4yLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkk6YXBwZW5kOmNs
YXNzLW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29k
ZS1ieS1lCiBTUkNfVVJJICs9ICIgXAogICAgICAgICAgICAgZmlsZTovLzAwMDEtX2Rpc3R1dGls
cy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaCIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImQ1OWM5N2U3Yjc3NDk3OWE1Y2NiOTYzODhlZmM5ZWI2NTUxODAw
NDUzN2U4NWQ1MmU4MWVhZWU4OWFiNmRkOTEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2Q0ZGZh
NmQ5NWYxYjEwMWQ2OTVhNjE2MGE3NjI2ZTE1NTgzYWY3MWE1ZjUyMTc2ZWZhNWQzOWEwNTRkNDc1
ZCIKIAogREVQRU5EUyArPSAiJHtQWVRIT05fUE59IgogCi0tIAoyLjM5LjIKCg==

--===============8083896444395662933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-68.1.0.tar.gz;downloadfilename=setuptools-68.1.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-68.1.2.tar.gz;downloadfilename=setuptools-68.1.2.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 68.1.0 [default] to 68.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools: PV changed from "68.1.0" to "68.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "68.1.0" to "68.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 68.1.0 [default] to 68.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "68.1.0" to "68.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 68.1.0 [default] to 68.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "68.1.0" to "68.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 68.1.0 [default] to 68.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "68.1.0" to "68.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 68.1.0 [default] to 68.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "68.1.0" to "68.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 68.1.0 [default] to 68.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "68.1.0" to "68.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 68.1.0 [default] to 68.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "68.1.0" to "68.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 68.1.0 [default] to 68.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 4747512 to 4746920 (-0%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "68.1.0" to "68.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 68.1.0 [default] to 68.1.2 [default]
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-68.1.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-68.1.2.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-68.1.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-68.1.2.dist-info

--===============8083896444395662933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-68.1.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-68.1.2.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-68.1.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-68.1.2.dist-info

--===============8083896444395662933==--

