Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F01EC531DC
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.75749.1722536827318457581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BrVuG3h/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=savdP+w9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101910f32156c-ac394b47-db04-46aa-b5a7-a8d67a23b4cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536826;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MY/JNNwxuRUbURRVKHmEb7M2lSTBC/8aUFmVfcphwwk=;
	b=BrVuG3h/ZgxfUGjWZD3HSaIVs5ObxQB2Ml3wiflq5EIrzWDP8w2ZNAuQ3CVxOdrD
	YPKU3gWj1zQTCqLzgUVQQSRsUNvuid4ybzmT2+Ya+IkvEpYCYvPKlTlEeSH9GUX+9Sk
	K9DqaGZeGq4dNph/eA/u7powd2tiKH9+4zuIZUBI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536826;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MY/JNNwxuRUbURRVKHmEb7M2lSTBC/8aUFmVfcphwwk=;
	b=savdP+w9gwLf2RWrGNXW1ky7XeC0ATLa44FqepFWjshF6kLQQbJnDnuKp+Dnpc3Z
	b2/MYJA1aNU1uMIhl0kr1l95WBH0xQa+XmfOM/JBC2BjhYQ37j7R8pbSR/AuwHH14ur
	Kq1endfhqXEyeGxPdEkZ32cS+qaJ/nd5iE+YNfJ8=
Content-Type: multipart/mixed; boundary="===============3140919376795068883=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.32.1 SUCCEEDED
Message-ID: <010101910f32156c-ac394b47-db04-46aa-b5a7-a8d67a23b4cd-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202803

--===============3140919376795068883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dbusmock* to *0.32.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dbusmock-upgrade-0.31.1-0.32.1.patch
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
From 3b7f2dc8ae58b5d1d8dde9ac7358818c1e1f265e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 10:29:13 +0000
Subject: [PATCH] python3-dbusmock: upgrade 0.31.1 -> 0.32.1

---
 .../{python3-dbusmock_0.31.1.bb => python3-dbusmock_0.32.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.31.1.bb => python3-dbusmock_0.32.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb
index fc32c6bbb6..db7011831b 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.32.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "b23b8e1b51fe2a9b13e617fff6b60b3ed8e536c080cf3498019d223678d5ea49"
+SRC_URI[sha256sum] = "f02c34493d420b3cf2d8d341b79a60841593b7b7615adc3ece17ff86f8275924"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.44.0


--===============3140919376795068883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock: FILELIST: directory renamed /usr/lib/python3.12/site-packages/python_dbusmock-0.31.1.dist-info -> /usr/lib/python3.12/site-packages/python_dbusmock-0.32.1.dist-info, added "/usr/lib/python3.12/site-packages/dbusmock/templates/modemmanager.py /usr/lib/python3.12/site-packages/dbusmock/templates/__pycache__/modemmanager.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.12/site-packages/python_dbusmock-0.31.1.dist-info moved to /usr/lib/python3.12/site-packages/python_dbusmock-0.32.1.dist-info
  /usr/lib/python3.12/site-packages/dbusmock/templates/modemmanager.py was added
  /usr/lib/python3.12/site-packages/dbusmock/templates/__pycache__/modemmanager.cpython-312.pyc was added

--===============3140919376795068883==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.31.1-0.32.1.patch"

RnJvbSAzYjdmMmRjOGFlNThiNWQxZDhkZGU5YWM3MzU4ODE4YzFlMWYyNjVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMDoyOToxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZGJ1c21vY2s6IHVwZ3JhZGUgMC4zMS4xIC0+IDAuMzIuMQoKLS0tCiAuLi4ve3B5dGhv
bjMtZGJ1c21vY2tfMC4zMS4xLmJiID0+IHB5dGhvbjMtZGJ1c21vY2tfMC4zMi4xLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWRidXNtb2NrXzAuMzEuMS5i
YiA9PiBweXRob24zLWRidXNtb2NrXzAuMzIuMS5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZGJ1c21vY2tfMC4zMS4xLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMzIuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZGJ1c21vY2tfMC4zMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZGJ1c21vY2tfMC4zMi4xLmJiCmluZGV4IGZjMzJjNmJiYjYuLmRi
NzAxMTgzMWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1kYnVzbW9ja18wLjMxLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWRidXNtb2NrXzAuMzIuMS5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3B5dGhvbi1kYnVzbW9jay8iCiBMSUNFTlNFID0gIkdQTC0z
LjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWU2YTYwMGZk
NWUxZDljYmRlMmQ5ODM2ODAyMzNhZDAyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjIzYjhl
MWI1MWZlMmE5YjEzZTYxN2ZmZjZiNjBiM2VkOGU1MzZjMDgwY2YzNDk4MDE5ZDIyMzY3OGQ1ZWE0
OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmMDJjMzQ0OTNkNDIwYjNjZjJkOGQzNDFiNzlhNjA4
NDE1OTNiN2I3NjE1YWRjM2VjZTE3ZmY4NmY4Mjc1OTI0IgogCiBQWVBJX1BBQ0tBR0UgPSAicHl0
aG9uLWRidXNtb2NrIgogCi0tIAoyLjQ0LjAKCg==

--===============3140919376795068883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-dbusmock: PKGV changed from 0.31.1 [default] to 0.32.1 [default]
packages/core2-64-poky-linux/python3-dbusmock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.31.1.tar.gz;downloadfilename=python-dbusmock-0.31.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-dbusmock/python-dbusmock-0.32.1.tar.gz;downloadfilename=python-dbusmock-0.32.1.tar.gz"
packages/core2-64-poky-linux/python3-dbusmock: PV changed from "0.31.1" to "0.32.1"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PKGV changed from 0.31.1 [default] to 0.32.1 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PV changed from "0.31.1" to "0.32.1"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-dev: PKGV changed from 0.31.1 [default] to 0.32.1 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-dev: PV changed from "0.31.1" to "0.32.1"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-doc: PKGV changed from 0.31.1 [default] to 0.32.1 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-doc: PV changed from "0.31.1" to "0.32.1"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-locale: PKGV changed from 0.31.1 [default] to 0.32.1 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-locale: PV changed from "0.31.1" to "0.32.1"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-src: PKGV changed from 0.31.1 [default] to 0.32.1 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-src: PV changed from "0.31.1" to "0.32.1"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PKGV changed from 0.31.1 [default] to 0.32.1 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PV changed from "0.31.1" to "0.32.1"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 476510 to 505999 (+6%)
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock: FILELIST: directory renamed /usr/lib/python3.12/site-packages/python_dbusmock-0.31.1.dist-info -> /usr/lib/python3.12/site-packages/python_dbusmock-0.32.1.dist-info, added "/usr/lib/python3.12/site-packages/dbusmock/templates/modemmanager.py /usr/lib/python3.12/site-packages/dbusmock/templates/__pycache__/modemmanager.cpython-312.pyc"
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock: PKGV changed from 0.31.1 [default] to 0.32.1 [default]
packages/core2-64-poky-linux/python3-dbusmock/python3-dbusmock: PV changed from "0.31.1" to "0.32.1"
Changes to packages/core2-64-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.12/site-packages/python_dbusmock-0.31.1.dist-info moved to /usr/lib/python3.12/site-packages/python_dbusmock-0.32.1.dist-info
  /usr/lib/python3.12/site-packages/dbusmock/templates/modemmanager.py was added
  /usr/lib/python3.12/site-packages/dbusmock/templates/__pycache__/modemmanager.cpython-312.pyc was added

--===============3140919376795068883==--

