Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74520C54F38
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:10 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.14619.1700059029637280557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ki0iXxrt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=h2KaWpUq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018bd36a2090-b19efec7-11e9-43f4-aa51-bf68498b16df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3KY+5STZO6OBCdD+HUU0f3LxdeMOZ7KFZ0eeUEEDchA=;
	b=Ki0iXxrtSsmb6sALEgfsDlpuQUghdXNKZwmiBO/A9XkIEYB8ik7QC44qKW2Dj+xI
	QGQHrLgLIMoLdqhOr/IfX09EGlUUq4XlbsZ03T9UX2D2upnOjAkYXmiiK0WhvpMWJkY
	+Jb7v3/b8Eov1V3moR1ga83cz/eAy2Nl1U/dBN4M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3KY+5STZO6OBCdD+HUU0f3LxdeMOZ7KFZ0eeUEEDchA=;
	b=h2KaWpUq+eBwRmKYAa1qbDGN3sSrrWefNs1JRV95a0FWUoz/JiZjnic0m0YEDJvk
	tcLHrwKwHD3zltorTKBmMjdxgm9+/XjTyXYMxmg0Qsag5M6aTTSiq5Gh3bPBEiwqGpv
	LHWgGaPxaKqWCPL/EUG7BKLr5OWCRQ6rs10VBbhk=
Content-Type: multipart/mixed; boundary="===============0331817992804349892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatch-vcs: upgrading to 0.4.0 SUCCEEDED
Message-ID: <0101018bd36a2090-b19efec7-11e9-43f4-aa51-bf68498b16df-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190620

--===============0331817992804349892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatch-vcs* to *0.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatch-vcs-upgrade-0.3.0-0.4.0.patch
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
From 47a0ba0ed5942a397bfc81a0a7e2ff5fc66bc2fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 07:06:59 +0000
Subject: [PATCH] python3-hatch-vcs: upgrade 0.3.0 -> 0.4.0

---
 .../{python3-hatch-vcs_0.3.0.bb => python3-hatch-vcs_0.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatch-vcs_0.3.0.bb => python3-hatch-vcs_0.4.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-hatch-vcs_0.3.0.bb b/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-hatch-vcs_0.3.0.bb
rename to meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
index b4db10e767..2e49aba469 100644
--- a/meta/recipes-devtools/python/python3-hatch-vcs_0.3.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_hatchling
 
 PYPI_PACKAGE = "hatch_vcs"
 
-SRC_URI[sha256sum] = "cec5107cfce482c67f8bc96f18bbc320c9aa0d068180e14ad317bbee5a153fee"
+SRC_URI[sha256sum] = "093810748fe01db0d451fabcf2c1ac2688caefd232d4ede967090b1c1b07d9f7"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.2


--===============0331817992804349892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hatch-vcs: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatch_vcs/hatch_vcs-0.3.0.tar.gz;downloadfilename=hatch_vcs-0.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatch_vcs/hatch_vcs-0.4.0.tar.gz;downloadfilename=hatch_vcs-0.4.0.tar.gz"
packages/core2-64-poky-linux/python3-hatch-vcs: PV changed from "0.3.0" to "0.4.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dbg: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dbg: PV changed from "0.3.0" to "0.4.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dev: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dev: PV changed from "0.3.0" to "0.4.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-doc: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-doc: PV changed from "0.3.0" to "0.4.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-locale: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-locale: PV changed from "0.3.0" to "0.4.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-src: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-src: PV changed from "0.3.0" to "0.4.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-staticdev: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-staticdev: PV changed from "0.3.0" to "0.4.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PKGV changed from 0.3.0 [default] to 0.4.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PKGSIZE changed from 27472 to 27803 (+1%)
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PV changed from "0.3.0" to "0.4.0"
Changes to packages/core2-64-poky-linux/python3-hatch-vcs (sysroot):
  /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info moved to /usr/lib/python3.11/site-packages/hatch_vcs-0.4.0.dist-info

--===============0331817992804349892==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatch-vcs-upgrade-0.3.0-0.4.0.patch"

RnJvbSA0N2EwYmEwZWQ1OTQyYTM5N2JmYzgxYTBhN2UyZmY1ZmM2NmJjMmZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDc6MDY6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNoLXZjczogdXBncmFkZSAwLjMuMCAtPiAwLjQuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtaGF0Y2gtdmNzXzAuMy4wLmJiID0+IHB5dGhvbjMtaGF0Y2gtdmNzXzAuNC4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWhhdGNoLXZjc18wLjMuMC5i
YiA9PiBweXRob24zLWhhdGNoLXZjc18wLjQuMC5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtdmNzXzAuMy4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNoLXZjc18wLjQuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2gtdmNzXzAuMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtdmNzXzAuNC4wLmJiCmluZGV4IGI0ZGIxMGU3NjcuLjJl
NDlhYmE0NjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1oYXRjaC12Y3NfMC4zLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWhhdGNoLXZjc18wLjQuMC5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBweXBpIHB5
dGhvbl9oYXRjaGxpbmcKIAogUFlQSV9QQUNLQUdFID0gImhhdGNoX3ZjcyIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImNlYzUxMDdjZmNlNDgyYzY3ZjhiYzk2ZjE4YmJjMzIwYzlhYTBkMDY4MTgw
ZTE0YWQzMTdiYmVlNWExNTNmZWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDkzODEwNzQ4ZmUw
MWRiMGQ0NTFmYWJjZjJjMWFjMjY4OGNhZWZkMjMyZDRlZGU5NjcwOTBiMWMxYjA3ZDlmNyIKIAog
QkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi0tIAoyLjM5LjIKCg==

--===============0331817992804349892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hatch-vcs (sysroot):
  /usr/lib/python3.11/site-packages/hatch_vcs-0.3.0.dist-info moved to /usr/lib/python3.11/site-packages/hatch_vcs-0.4.0.dist-info

--===============0331817992804349892==--

