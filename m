Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31783CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50426.1781195507849530454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aQ5agS6Q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CGlD3ZYw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019eb786861f-32a32ee2-fe86-48c6-a5d4-d1a309fb9a7b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195507;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RmTeVaeDFTGPXe2CCB7oc5LFE6HMoh9W050Be4c/64g=;
	b=aQ5agS6Q0r5Vm6pFVTFKFaFhz6PSueyqCX0mpVAeP17F7KxcIWm1SElqZ+/Vo5v+
	oAWsl13FI9FsE/+4LwfKcDV8sUN2e4XEsine+wt5Yq/9wdOMBS+vCtUz0hkU5EfVkVK
	Hg5QZiMluviuyCx2yCjVYjkH5B1vQPlQg/HlPhIA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195507;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RmTeVaeDFTGPXe2CCB7oc5LFE6HMoh9W050Be4c/64g=;
	b=CGlD3ZYwcqAia2McapSiz0WIWpSUmLGgl77jpgaS4v+1eWVHFo4k6TWiPLOlOVPx
	SeY+VeeA3S57XSjJevvZGZTIQdOShERZK7wsIhMIOtvy9ymtzDwsYO90cDf+7jw8RWL
	QHtTkASj5HbVL8AfWJg7WEhNNDh+PbSp6P43koZc=
Content-Type: multipart/mixed; boundary="===============7758502978015820288=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 26.1.2 SUCCEEDED
Message-ID: <0101019eb786861f-32a32ee2-fe86-48c6-a5d4-d1a309fb9a7b-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238504

--===============7758502978015820288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pip* to *26.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-26.1.1-26.1.2.patch
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
From 9d6f95390464e0179a653052c2e19c7971c7e43b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 10:02:39 +0000
Subject: [PATCH] python3-pip: upgrade 26.1.1 -> 26.1.2

---
 .../python/python3-pip/no_shebang_mangling.patch                | 2 +-
 .../python/{python3-pip_26.1.1.bb => python3-pip_26.1.2.bb}     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.1.1.bb => python3-pip_26.1.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index 5823d6307c..e8b2982b2a 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From adccf194155f40fb1d387c2cac432341a1dc8a0e Mon Sep 17 00:00:00 2001
+From e4e1fed9f8e3ff3e04467699f36599f76caa9487 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_26.1.1.bb b/meta/recipes-devtools/python/python3-pip_26.1.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_26.1.1.bb
rename to meta/recipes-devtools/python/python3-pip_26.1.2.bb
index 2e09075de2..dd1895ed55 100644
--- a/meta/recipes-devtools/python/python3-pip_26.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.1.2.bb
@@ -26,7 +26,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "d36762751d156a4ee895de8af39aa0abeeeb577f93a2eca6ab62467bbf0f8a78"
+SRC_URI[sha256sum] = "f49cd134c61cf2fd75e0ce2676db03e4054504a5a4986d00f8299ae632dc4605"
 
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).
-- 
2.47.1


--===============7758502978015820288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-26.1.1.tar.gz;downloadfilename=pip-26.1.1.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-26.1.2.tar.gz;downloadfilename=pip-26.1.2.tar.gz file://no_shebang_mangling.patch"
packages/x86-64-v3-poky-linux/python3-pip: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/r
 equests, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor
 /pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_ven
 dor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/platformdirs
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 10674940 to 10676842 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info moved to /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info

--===============7758502978015820288==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-26.1.1-26.1.2.patch"

RnJvbSA5ZDZmOTUzOTA0NjRlMDE3OWE2NTMwNTJjMmUxOWM3OTcxYzdlNDNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTA6MDI6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBpcDogdXBncmFkZSAyNi4xLjEgLT4gMjYuMS4yCgotLS0KIC4uLi9weXRob24vcHl0
aG9uMy1waXAvbm9fc2hlYmFuZ19tYW5nbGluZy5wYXRjaCAgICAgICAgICAgICAgICB8IDIgKy0K
IC4uLi9weXRob24ve3B5dGhvbjMtcGlwXzI2LjEuMS5iYiA9PiBweXRob24zLXBpcF8yNi4xLjIu
YmJ9ICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGlw
XzI2LjEuMS5iYiA9PiBweXRob24zLXBpcF8yNi4xLjIuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcC9ub19zaGViYW5nX21hbmds
aW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcC9ub19z
aGViYW5nX21hbmdsaW5nLnBhdGNoCmluZGV4IDU4MjNkNjMwN2MuLmU4YjI5ODJiMmEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXAvbm9fc2hlYmFu
Z19tYW5nbGluZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGFk
Y2NmMTk0MTU1ZjQwZmIxZDM4N2MyY2FjNDMyMzQxYTFkYzhhMGUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGU0ZTFmZWQ5ZjhlM2ZmM2UwNDQ2NzY5OWYzNjU5OWY3NmNhYTk0ODcgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgMjMgRmViIDIwMjIgMTI6Mjc6MDYg
KzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gcHl0aG9uMy1waXA6IERvbid0IGNoYW5nZSBzaGViYW5n
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI2
LjEuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMS4y
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1waXBfMjYuMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI2LjEuMi5iYgppbmRleCAyZTA5MDc1ZGUyLi5kZDE4
OTVlZDU1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cGlwXzI2LjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cGlwXzI2LjEuMi5iYgpAQCAtMjYsNyArMjYsNyBAQCBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVw
dG9vbHNfYnVpbGRfbWV0YQogCiBTUkNfVVJJICs9ICJmaWxlOi8vbm9fc2hlYmFuZ19tYW5nbGlu
Zy5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQzNjc2Mjc1MWQxNTZhNGVlODk1ZGU4
YWYzOWFhMGFiZWVlYjU3N2Y5M2EyZWNhNmFiNjI0NjdiYmYwZjhhNzgiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZjQ5Y2QxMzRjNjFjZjJmZDc1ZTBjZTI2NzZkYjAzZTQwNTQ1MDRhNWE0OTg2ZDAw
ZjgyOTlhZTYzMmRjNDYwNSIKIAogZG9faW5zdGFsbDphcHBlbmQoKXsKIAkjIHBpcCB2ZW5kb3Jz
IGRpc3RsaWIgd2hpY2ggc2hpcHMgV2luZG93cyBsYXVuY2hlciB0ZW1wbGF0ZXMgKCouZXhlKS4K
LS0gCjIuNDcuMQoK

--===============7758502978015820288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages
 /pip-26.1.2.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/li
 censes/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/s
 ite-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/truststore
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info moved to /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info

--===============7758502978015820288==--

