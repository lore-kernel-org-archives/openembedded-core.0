Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168B6C48296
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.88864.1705340030562602865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DlvkZHqk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YqU9lxKO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018d0e2fcadc-60db32f0-c6e8-4e2c-a035-aa2a6d201efd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MT3VfUvNJ22fDqDsHvNWKXI10Fu+hg6zltxR5cDJlVc=;
	b=DlvkZHqk0y6Np/GjDBqLyIQL4zHhXZP4Mn4pR/3b6sDIVJQNb9tvcyQz+7/3M1y7
	tzc2tphQazFVKDDS4G0WzqYJ6bTPYfVrjgoPzmpwEezxja1Y87jqiqtvioQftWVs+U2
	DjoIi8rdy1WoDG3j6JiXtA3KJwuof8SWclaw4UHU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MT3VfUvNJ22fDqDsHvNWKXI10Fu+hg6zltxR5cDJlVc=;
	b=YqU9lxKOpXMdL/EDy1Lvhsk4+aTBBygt63f4Ip7fJauBWe1UHmWTzoEwzs+eLg0I
	HFLxPdHcz7rqQBb4gNgyARKHVPHyd7GhL96lqoWPnLvDLLGEL4VopLIceN5hBrX18jR
	LlFC9NB5tQkNmQ4xhyG+nVxeTMBfSzPoZ0Isiiw8=
Content-Type: multipart/mixed; boundary="===============6054122308371527936=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-devhelp: upgrading to 1.0.6 SUCCEEDED
Message-ID: <0101018d0e2fcadc-60db32f0-c6e8-4e2c-a035-aa2a6d201efd-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193747

--===============6054122308371527936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-devhelp* to *1.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinxcontrib-devhelp-upgrade-1.0.5-1.0.6.patch
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
From fe58aa04a339a6e7e95ef6633e7f60bbf6f0713b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 08:06:06 +0000
Subject: [PATCH] python3-sphinxcontrib-devhelp: upgrade 1.0.5 -> 1.0.6

---
 ...-devhelp_1.0.5.bb => python3-sphinxcontrib-devhelp_1.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-devhelp_1.0.5.bb => python3-sphinxcontrib-devhelp_1.0.6.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.5.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.5.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb
index 47934bd6f5..dd7ba3dc95 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.5.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd30d9972a142c857a80c9f312e92b93"
 
-SRC_URI[sha256sum] = "63b41e0d38207ca40ebbeabcf4d8e51f76c03e78cd61abe118cf4435c73d4212"
+SRC_URI[sha256sum] = "9893fd3f90506bc4b97bdb977ceb8fbd823989f4316b28c3841ec128544372d3"
 
 PYPI_PACKAGE = "sphinxcontrib-devhelp"
 
-- 
2.42.0


--===============6054122308371527936==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinxcontrib-devhelp-upgrade-1.0.5-1.0.6.patch"

RnJvbSBmZTU4YWEwNGEzMzlhNmU3ZTk1ZWY2NjMzZTdmNjBiYmY2ZjA3MTNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDg6MDY6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueGNvbnRyaWItZGV2aGVscDogdXBncmFkZSAxLjAuNSAtPiAxLjAuNgoKLS0t
CiAuLi4tZGV2aGVscF8xLjAuNS5iYiA9PiBweXRob24zLXNwaGlueGNvbnRyaWItZGV2aGVscF8x
LjAuNi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwaGlu
eGNvbnRyaWItZGV2aGVscF8xLjAuNS5iYiA9PiBweXRob24zLXNwaGlueGNvbnRyaWItZGV2aGVs
cF8xLjAuNi5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1kZXZoZWxwXzEuMC41LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRyaWItZGV2aGVscF8xLjAuNi5iYgpz
aW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1kZXZoZWxwXzEuMC41LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1kZXZoZWxwXzEu
MC42LmJiCmluZGV4IDQ3OTM0YmQ2ZjUuLmRkN2JhM2RjOTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLWRldmhlbHBfMS4wLjUu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRy
aWItZGV2aGVscF8xLjAuNi5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly93
d3cuc3BoaW54LWRvYy5vcmciCiBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWZkMzBkOTk3MmExNDJjODU3YTgwYzlmMzEyZTky
YjkzIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjNiNDFlMGQzODIwN2NhNDBlYmJlYWJjZjRk
OGU1MWY3NmMwM2U3OGNkNjFhYmUxMThjZjQ0MzVjNzNkNDIxMiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI5ODkzZmQzZjkwNTA2YmM0Yjk3YmRiOTc3Y2ViOGZiZDgyMzk4OWY0MzE2YjI4YzM4NDFl
YzEyODU0NDM3MmQzIgogCiBQWVBJX1BBQ0tBR0UgPSAic3BoaW54Y29udHJpYi1kZXZoZWxwIgog
Ci0tIAoyLjQyLjAKCg==

--===============6054122308371527936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp (sysroot):
  /usr/lib/python3.11/site-packages/sphinxcontrib_devhelp-1.0.5.dist-info moved to /usr/lib/python3.11/site-packages/sphinxcontrib_devhelp-1.0.6.dist-info

--===============6054122308371527936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib_devhelp-1.0.5.tar.gz;downloadfilename=sphinxcontrib_devhelp-1.0.5.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib_devhelp-1.0.6.tar.gz;downloadfilename=sphinxcontrib_devhelp-1.0.6.tar.gz"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-dbg: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-dbg: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-dev: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-dev: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-doc: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-doc: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-locale: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-locale: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-src: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-src: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-staticdev: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp-staticdev: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp: PV changed from "1.0.5" to "1.0.6"
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp: PKGV changed from 1.0.5 [default] to 1.0.6 [default]
packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp/python3-sphinxcontrib-devhelp: PKGSIZE changed from 126561 to 126723 (+0%)
Changes to packages/core2-64-poky-linux/python3-sphinxcontrib-devhelp (sysroot):
  /usr/lib/python3.11/site-packages/sphinxcontrib_devhelp-1.0.5.dist-info moved to /usr/lib/python3.11/site-packages/sphinxcontrib_devhelp-1.0.6.dist-info

--===============6054122308371527936==--

