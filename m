Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A9AC04E69
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.102705.1697399114544262698
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CqZWxcvd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=de5EpUF8;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b34df08b2-518ca706-9704-4419-85de-b38d4f8fb6a9-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=X4ISbxlxttoUyi1HxkPkOso/Q0Sa3Uaqe9YOp8JmkRw=;
	b=CqZWxcvdPcT4nJaPbV4ayI73mfemc8eBSQ6pW+dcedIRrbX41woxFvMKA8YapqBi
	KOsZf427J0aJP6byyUxBLUHLxOLSpDJ6iJI1LnZt7q2OAa9gf2gaplyMHYJkK0svWr4
	EAbhUaDwJMc/NDb7BIMtTDXKYfI2O9mYO9onzBQ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=X4ISbxlxttoUyi1HxkPkOso/Q0Sa3Uaqe9YOp8JmkRw=;
	b=de5EpUF8nY5mIBNqqd16E26cYs51QKLTVbTGN/xtv+qmgwFo0RIEoKYGRFPrEEhe
	+zyOp6dXZTe/wJX4Y+KjgV5ZSynB7Pz0dwIIGBgVuZaKbO+gjQTyBF7Q12WE5jHpJhw
	KuYBGJ4FcTy4HJjGxqvd7CF9zQCbfWEAYZG3nYqU=
Content-Type: multipart/mixed; boundary="===============7644750821215284502=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-packaging: upgrading to 23.2 SUCCEEDED
Message-ID: <0101018b34df08b2-518ca706-9704-4419-85de-b38d4f8fb6a9-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189184

--===============7644750821215284502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-packaging* to *23.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-packaging-upgrade-23.1-23.2.patch
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
From eec73da4c5dfb4dbc6c21b06b6df3d9da0b12775 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 11:54:39 +0000
Subject: [PATCH] python3-packaging: upgrade 23.1 -> 23.2

---
 .../{python3-packaging_23.1.bb => python3-packaging_23.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_23.1.bb => python3-packaging_23.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-packaging_23.1.bb b/meta/recipes-devtools/python/python3-packaging_23.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-packaging_23.1.bb
rename to meta/recipes-devtools/python/python3-packaging_23.2.bb
index 53d3522dd7..2d35936615 100644
--- a/meta/recipes-devtools/python/python3-packaging_23.1.bb
+++ b/meta/recipes-devtools/python/python3-packaging_23.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "a392980d2b6cffa644431898be54b0045151319d1e7ec34f0cfed48767dd334f"
+SRC_URI[sha256sum] = "048fb0e9405036518eaaf48a55953c750c11e1a1b68e0dd1a9d62ed0c092cfc5"
 
 inherit pypi python_flit_core
 
-- 
2.39.2


--===============7644750821215284502==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-packaging-upgrade-23.1-23.2.patch"

RnJvbSBlZWM3M2RhNGM1ZGZiNGRiYzZjMjFiMDZiNmRmM2Q5ZGEwYjEyNzc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTE6NTQ6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBhY2thZ2luZzogdXBncmFkZSAyMy4xIC0+IDIzLjIKCi0tLQogLi4uL3tweXRob24z
LXBhY2thZ2luZ18yMy4xLmJiID0+IHB5dGhvbjMtcGFja2FnaW5nXzIzLjIuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYWNrYWdpbmdfMjMuMS5iYiA9
PiBweXRob24zLXBhY2thZ2luZ18yMy4yLmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjMuMS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjMuMi5iYgpzaW1pbGFyaXR5
IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGFja2FnaW5nXzIzLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wYWNrYWdpbmdfMjMuMi5iYgppbmRleCA1M2QzNTIyZGQ3Li4yZDM1OTM2NjE1
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFja2Fn
aW5nXzIzLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBh
Y2thZ2luZ18yMy4yLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vcHlwYS9wYWNrYWdpbmciCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAgfCBCU0QtMi1DbGF1
c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mYWFkYWVkY2E5MjUx
YTkwYjIwNWM5MTY3NTc4Y2U5MSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImEzOTI5ODBkMmI2
Y2ZmYTY0NDQzMTg5OGJlNTRiMDA0NTE1MTMxOWQxZTdlYzM0ZjBjZmVkNDg3NjdkZDMzNGYiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMDQ4ZmIwZTk0MDUwMzY1MThlYWFmNDhhNTU5NTNjNzUwYzEx
ZTFhMWI2OGUwZGQxYTlkNjJlZDBjMDkyY2ZjNSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0
X2NvcmUKIAotLSAKMi4zOS4yCgo=

--===============7644750821215284502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 324933 to 365677 (+13%)
Changes to packages/core2-32-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.11/site-packages/packaging-23.1.dist-info moved to /usr/lib/python3.11/site-packages/packaging-23.2.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.11/site-packages/packaging-23.1.dist-info moved to /usr/lib/python3.11/site-packages/packaging-23.2.dist-info

--===============7644750821215284502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-packaging: PKGV changed from 23.1 [default] to 23.2 [default]
packages/core2-32-poky-linux/python3-packaging: PV changed from "23.1" to "23.2"
packages/core2-32-poky-linux/python3-packaging: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/packaging/packaging-23.1.tar.gz;downloadfilename=packaging-23.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/packaging/packaging-23.2.tar.gz;downloadfilename=packaging-23.2.tar.gz"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dbg: PKGV changed from 23.1 [default] to 23.2 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dbg: PV changed from "23.1" to "23.2"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dev: PKGV changed from 23.1 [default] to 23.2 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dev: PV changed from "23.1" to "23.2"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-doc: PKGV changed from 23.1 [default] to 23.2 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-doc: PV changed from "23.1" to "23.2"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-locale: PKGV changed from 23.1 [default] to 23.2 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-locale: PV changed from "23.1" to "23.2"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-src: PKGV changed from 23.1 [default] to 23.2 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-src: PV changed from "23.1" to "23.2"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-staticdev: PKGV changed from 23.1 [default] to 23.2 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-staticdev: PV changed from "23.1" to "23.2"
packages/core2-32-poky-linux/python3-packaging/python3-packaging: PKGV changed from 23.1 [default] to 23.2 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging: PV changed from "23.1" to "23.2"
packages/core2-32-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 324933 to 365677 (+13%)
Changes to packages/core2-32-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.11/site-packages/packaging-23.1.dist-info moved to /usr/lib/python3.11/site-packages/packaging-23.2.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.11/site-packages/packaging-23.1.dist-info moved to /usr/lib/python3.11/site-packages/packaging-23.2.dist-info

--===============7644750821215284502==--

