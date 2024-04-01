Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453DCCD13BF
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.2012.1711994602691442200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LMB5uHt3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=H/1fybP2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e9ad480aa-4845dbc5-c337-422c-b6b0-93cd7de543a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hUt6R6KMaFz8FiLerApPZuYfc0tZUvVqf7t9GzU9MJk=;
	b=LMB5uHt34/0B49dwOFtmXGhbt5nZhqopnx7a8taRy6RNEiTLv8eLAbb6wpa4sWn7
	4/s4168ZJYeTrsSGrzlkZLMGpkBE0Ovji1aLDPqXlQnDY0YpAOe0gLa6NMF29PK6VaJ
	PBgcx8De8gO2ExosKIRJ4jL/5VPA8M/ZkSfJj+t0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hUt6R6KMaFz8FiLerApPZuYfc0tZUvVqf7t9GzU9MJk=;
	b=H/1fybP2cZoGxHTQH/trqkeoobMhOcwA/mXiY3ry4EHKG6xN2MrL53k8ye02d1ah
	MWt10Lsn4UOzZanOW6bpB+ZVEye+1RZ18Xw5L7SntCE1bxxAZCmF9Wm2YzvCGVsvpGA
	nTyEaD+rDCl2Jint5L7Ijgz4wpQJwLNrF0Y+Pa54=
Content-Type: multipart/mixed; boundary="===============8577596714300281026=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wheel: upgrading to 0.43.0 SUCCEEDED
Message-ID: <0101018e9ad480aa-4845dbc5-c337-422c-b6b0-93cd7de543a0-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197744

--===============8577596714300281026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wheel* to *0.43.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wheel-upgrade-0.42.0-0.43.0.patch
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
From b54d0d23a27fd2d6c6f6d69b926426a7e718a91a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 09:34:14 +0000
Subject: [PATCH] python3-wheel: upgrade 0.42.0 -> 0.43.0

---
 .../python/{python3-wheel_0.42.0.bb => python3-wheel_0.43.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.42.0.bb => python3-wheel_0.43.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb b/meta/recipes-devtools/python/python3-wheel_0.43.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.42.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.43.0.bb
index 807888e6c0..ba309ae5fc 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.43.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "c45be39f7882c9d34243236f2d63cbd58039e360f85d0913425fbd7ceea617a8"
+SRC_URI[sha256sum] = "465ef92c69fa5c5da2d1cf8ac40559a8c940886afcef87dcf14b9470862f1d85"
 
 inherit python_flit_core pypi
 
-- 
2.42.0


--===============8577596714300281026==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wheel-upgrade-0.42.0-0.43.0.patch"

RnJvbSBiNTRkMGQyM2EyN2ZkMmQ2YzZmNmQ2OWI5MjY0MjZhN2U3MThhOTFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwOTozNDoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2hlZWw6IHVwZ3JhZGUgMC40Mi4wIC0+IDAuNDMuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXdoZWVsXzAuNDIuMC5iYiA9PiBweXRob24zLXdoZWVsXzAuNDMuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdoZWVsXzAuNDIuMC5iYiA9PiBw
eXRob24zLXdoZWVsXzAuNDMuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxfMC40Mi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg1
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxf
MC40Mi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
d2hlZWxfMC40My4wLmJiCmluZGV4IDgwNzg4OGU2YzAuLmJhMzA5YWU1ZmMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQyLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDMuMC5iYgpA
QCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIk1JVCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT03ZmZiMGRiMDQ1Mjdj
ZmUzODBlNGYyNzI2YmQwNWViZiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM0NWJlMzlmNzg4
MmM5ZDM0MjQzMjM2ZjJkNjNjYmQ1ODAzOWUzNjBmODVkMDkxMzQyNWZiZDdjZWVhNjE3YTgiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNDY1ZWY5MmM2OWZhNWM1ZGEyZDFjZjhhYzQwNTU5YThjOTQw
ODg2YWZjZWY4N2RjZjE0Yjk0NzA4NjJmMWQ4NSIKIAogaW5oZXJpdCBweXRob25fZmxpdF9jb3Jl
IHB5cGkKIAotLSAKMi40Mi4wCgo=

--===============8577596714300281026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.12/site-packages/wheel-0.42.0.dist-info moved to /usr/lib/python3.12/site-packages/wheel-0.43.0.dist-info

--===============8577596714300281026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-wheel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.42.0.tar.gz;downloadfilename=wheel-0.42.0.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.43.0.tar.gz;downloadfilename=wheel-0.43.0.tar.gz"
packages/core2-64-poky-linux/python3-wheel: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dbg: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dbg: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dev: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dev: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-doc: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-doc: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-locale: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-locale: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-src: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-src: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-staticdev: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-staticdev: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PKGSIZE changed from 444428 to 446976 (+1%)
Changes to packages/core2-64-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.12/site-packages/wheel-0.42.0.dist-info moved to /usr/lib/python3.12/site-packages/wheel-0.43.0.dist-info

--===============8577596714300281026==--

