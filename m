Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8274DC27C5E
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:21 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1124.1714579215999617592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ekYwK8D0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=u8ps1Yot;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018f34e29385-baf2e3c4-eaae-4a3a-86c1-1c3ccba01d48-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LvT+POgrql8/NEA5lC3aFtfRKOyA/c2yEYjA8JWpVnU=;
	b=ekYwK8D0w8T2o2GV2K001mRPMSJ7M36EpN5ne+Hli/P1GRZExnZXNR9n/CAz2nfb
	XYXeseMrEkxV/5/94NCS1/XACGBOhdTW86Z+j9MIA5KqGDhmi3awmn7gDaHRyYuLH6c
	CxggNdM2zQvlaM7R3IwxvNwYzy/PFSDNCPduiWME=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LvT+POgrql8/NEA5lC3aFtfRKOyA/c2yEYjA8JWpVnU=;
	b=u8ps1Yot6K9kFniV/+CrMhQAqiHWEG4w0rxrb3z8sWjYm4gbczAVmvSlGS1kfJ79
	SVzdHo3c9FExQ4ST21XDpqzU20Za3JhzWpdOqiEBj4T7Y2McQIZg3zqOQmSCwMXhTb+
	libndp9ZgxeWwAE2aZ3vvsBnIGRZwCdkUaBInKa0=
Content-Type: multipart/mixed; boundary="===============5318989281393677650=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 8.2.0 SUCCEEDED
Message-ID: <0101018f34e29385-baf2e3c4-eaae-4a3a-86c1-1c3ccba01d48-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198818

--===============5318989281393677650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest* to *8.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-8.1.1-8.2.0.patch
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
From 8cb3843495acd58e6f9d4cd7fe16266aee792554 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 07:11:04 +0000
Subject: [PATCH] python3-pytest: upgrade 8.1.1 -> 8.2.0

---
 .../python/{python3-pytest_8.1.1.bb => python3-pytest_8.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.1.1.bb => python3-pytest_8.2.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.1.1.bb b/meta/recipes-devtools/python/python3-pytest_8.2.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pytest_8.1.1.bb
rename to meta/recipes-devtools/python/python3-pytest_8.2.0.bb
index b1cf23fbc4..1e6674079f 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.2.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "ac978141a75948948817d360297b7aae0fcb9d6ff6bc9ec6d514b85d5a65c044"
+SRC_URI[sha256sum] = "d507d4482197eac0ba2bae2e9babf0672eb333017bcedaa5fb1a3d42c1174b3f"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.44.0


--===============5318989281393677650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info moved to /usr/lib/python3.12/site-packages/pytest-8.2.0.dist-info

--===============5318989281393677650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-8.1.1.tar.gz;downloadfilename=pytest-8.1.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-8.2.0.tar.gz;downloadfilename=pytest-8.2.0.tar.gz"
packages/core2-64-poky-linux/python3-pytest: PKGV changed from 8.1.1 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-pytest: PV changed from "8.1.1" to "8.2.0"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 8.1.1 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "8.1.1" to "8.2.0"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 8.1.1 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "8.1.1" to "8.2.0"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 8.1.1 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "8.1.1" to "8.2.0"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 8.1.1 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "8.1.1" to "8.2.0"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 8.1.1 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-src: PV changed from "8.1.1" to "8.2.0"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 8.1.1 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "8.1.1" to "8.2.0"
packages/core2-64-poky-linux/python3-pytest/python3-pytest: PKGV changed from 8.1.1 [default] to 8.2.0 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 2634171 to 2646074 (+0%)
packages/core2-64-poky-linux/python3-pytest/python3-pytest: PV changed from "8.1.1" to "8.2.0"
Changes to packages/core2-64-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info moved to /usr/lib/python3.12/site-packages/pytest-8.2.0.dist-info

--===============5318989281393677650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-8.1.1-8.2.0.patch"

RnJvbSA4Y2IzODQzNDk1YWNkNThlNmY5ZDRjZDdmZTE2MjY2YWVlNzkyNTU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwNzoxMTowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ZXN0OiB1cGdyYWRlIDguMS4xIC0+IDguMi4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHl0ZXN0XzguMS4xLmJiID0+IHB5dGhvbjMtcHl0ZXN0XzguMi4wLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0ZXN0XzguMS4xLmJiID0+IHB5
dGhvbjMtcHl0ZXN0XzguMi4wLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3RfOC4xLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzguMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3Rf
OC4xLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eXRlc3RfOC4yLjAuYmIKaW5kZXggYjFjZjIzZmJjNC4uMWU2Njc0MDc5ZiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF84LjEuMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzguMi4wLmJiCkBA
IC01LDcgKzUsNyBAQCBERVNDUklQVElPTiA9ICJUaGUgcHl0ZXN0IGZyYW1ld29yayBtYWtlcyBp
dCBlYXN5IHRvIHdyaXRlIHNtYWxsIHRlc3RzLCB5ZXQgc2NhbAogTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1iZDI3ZTQxYjY1NTBmZTBmYzQ1
MzU2ZDFkODFlZTM3YyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFjOTc4MTQxYTc1OTQ4OTQ4
ODE3ZDM2MDI5N2I3YWFlMGZjYjlkNmZmNmJjOWVjNmQ1MTRiODVkNWE2NWMwNDQiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZDUwN2Q0NDgyMTk3ZWFjMGJhMmJhZTJlOWJhYmYwNjcyZWIzMzMwMTdi
Y2VkYWE1ZmIxYTNkNDJjMTE3NGIzZiIKIAogREVQRU5EUyArPSAicHl0aG9uMy1zZXR1cHRvb2xz
LXNjbS1uYXRpdmUiCiAKLS0gCjIuNDQuMAoK

--===============5318989281393677650==--

