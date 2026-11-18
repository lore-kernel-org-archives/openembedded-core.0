Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6632.1794980485856319775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 21:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EThE9STg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eGbY9jrl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1ed2c9762-a189b0ae-2dd9-4637-8924-af70005bdda0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794980485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K/a8CcUmdG2p0tme98h60EADfBuVyiaby/RziFiMVpc=;
	b=EThE9STgnrFaERPv+gVHkixCyLtLQVpRsKYVEL23o+Q1crWfMVHwDj8LzjCIDzPw
	OUMfk/DSDh1W4plXlsq3MsxpWeP0ps8k/4PM1hm863DDwKGTzjIAarvNT8KiSwUnb+F
	c0z3mrj4eHpYDxcM+rziuFIO0K4Xn8q4ffifEiew=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794980485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K/a8CcUmdG2p0tme98h60EADfBuVyiaby/RziFiMVpc=;
	b=eGbY9jrlCuXN2OPsqCg1vUlX8aGoCZRESFlKlyDYOvvlicQlsMmxV8sZs11F00M1
	XTlsJNzFdyAp25GpvodMX2DwM2YXvTMgajvMx4LYvCFUi8AivGCzaBpAY0rItiDmMcX
	QkO0UV+t9wLtcQDfSyqy8vi2DdIXJWp80mQsGT/g=
Content-Type: multipart/mixed; boundary="===============3265697525744446658=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-testtools: upgrading to 2.9.2 SUCCEEDED
Message-ID: <010101a1ed2c9762-a189b0ae-2dd9-4637-8924-af70005bdda0-000000@us-west-2.amazonses.com>
Date: Wed, 18 Nov 2026 05:41:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 05:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250509

--===============3265697525744446658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-testtools* to *2.9.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-testtools-upgrade-2.9.1-2.9.2.patch
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
From 5c352c4e1c1c40cf7bf9b3337b2e92f9e2ef9d7b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Nov 2026 05:26:16 +0000
Subject: [PATCH] python3-testtools: upgrade 2.9.1 -> 2.9.2

NEXT
~~~~

2.9.2
~~~~~

Improvements
------------
---
 .../{python3-testtools_2.9.1.bb => python3-testtools_2.9.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.9.1.bb => python3-testtools_2.9.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.9.1.bb b/meta/recipes-devtools/python/python3-testtools_2.9.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-testtools_2.9.1.bb
rename to meta/recipes-devtools/python/python3-testtools_2.9.2.bb
index d5dc148756..68b14c26ed 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.9.1.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.9.2.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "39ad9eb9e1b935d6838f4b3aee4d6e72db65df5602f6feda998dbb4fe8de0b19"
+SRC_URI[sha256sum] = "64f35fc503ac0e51310e0be9f4336533d26e375f343fda39da72c62d4b9ddb6e"
 
 RDEPENDS:${PN} += "\
     python3-compression \
-- 
2.47.1


--===============3265697525744446658==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-testtools-upgrade-2.9.1-2.9.2.patch"

RnJvbSA1YzM1MmM0ZTFjMWM0MGNmN2JmOWIzMzM3YjJlOTJmOWUyZWY5ZDdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggTm92IDIwMjYgMDU6MjY6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRlc3R0b29sczogdXBncmFkZSAyLjkuMSAtPiAyLjkuMgoKTkVYVAp+fn5+CgoyLjku
Mgp+fn5+fgoKSW1wcm92ZW1lbnRzCi0tLS0tLS0tLS0tLQotLS0KIC4uLi97cHl0aG9uMy10ZXN0
dG9vbHNfMi45LjEuYmIgPT4gcHl0aG9uMy10ZXN0dG9vbHNfMi45LjIuYmJ9ICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdGVzdHRvb2xzXzIuOS4xLmJiID0+IHB5
dGhvbjMtdGVzdHRvb2xzXzIuOS4yLmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10ZXN0dG9vbHNfMi45LjEuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuOS4yLmJiCnNpbWlsYXJpdHkg
aW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My10ZXN0dG9vbHNfMi45LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy10ZXN0dG9vbHNfMi45LjIuYmIKaW5kZXggZDVkYzE0ODc1Ni4uNjhiMTRjMjZl
ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRlc3R0
b29sc18yLjkuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dGVzdHRvb2xzXzIuOS4yLmJiCkBAIC04LDcgKzgsNyBAQCBERVBFTkRTICs9ICJweXRob24zLWhh
dGNoLXZjcy1uYXRpdmUiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICIzOWFkOWViOWUxYjkzNWQ2ODM4ZjRiM2FlZTRkNmU3MmRiNjVkZjU2
MDJmNmZlZGE5OThkYmI0ZmU4ZGUwYjE5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY0ZjM1ZmM1
MDNhYzBlNTEzMTBlMGJlOWY0MzM2NTMzZDI2ZTM3NWYzNDNmZGEzOWRhNzJjNjJkNGI5ZGRiNmUi
CiAKIFJERVBFTkRTOiR7UE59ICs9ICJcCiAgICAgcHl0aG9uMy1jb21wcmVzc2lvbiBcCi0tIAoy
LjQ3LjEKCg==

--===============3265697525744446658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-testtools: PKGV changed from 2.9.1 [default] to 2.9.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools: PV changed from "2.9.1" to "2.9.2"
packages/x86-64-v3-poky-linux/python3-testtools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.9.1.tar.gz" to "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.9.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PKGV changed from 2.9.1 [default] to 2.9.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PV changed from "2.9.1" to "2.9.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PKGV changed from 2.9.1 [default] to 2.9.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PV changed from "2.9.1" to "2.9.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PKGV changed from 2.9.1 [default] to 2.9.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PV changed from "2.9.1" to "2.9.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PKGV changed from 2.9.1 [default] to 2.9.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PV changed from "2.9.1" to "2.9.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PKGV changed from 2.9.1 [default] to 2.9.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PV changed from "2.9.1" to "2.9.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PKGV changed from 2.9.1 [default] to 2.9.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PV changed from "2.9.1" to "2.9.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGV changed from 2.9.1 [default] to 2.9.2 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PV changed from "2.9.1" to "2.9.2"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGSIZE changed from 980575 to 1002331 (+2%)
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/testtools-2.9.1.dist-info -> /usr/lib/python3.14/site-packages/testtools-2.9.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/testtools-2.9.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/testtools-2.9.2.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.14/site-packages/testtools-2.9.1.dist-info moved to /usr/lib/python3.14/site-packages/testtools-2.9.2.dist-info

--===============3265697525744446658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/testtools-2.9.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/testtools-2.9.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/testtools-2.9.1.dist-info -> /usr/lib/python3.14/site-packages/testtools-2.9.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.14/site-packages/testtools-2.9.1.dist-info moved to /usr/lib/python3.14/site-packages/testtools-2.9.2.dist-info

--===============3265697525744446658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-testtools-changelog.txt"

NEXT
~~~~

2.9.2
~~~~~

Improvements
------------

--===============3265697525744446658==--
