Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2027CA0EFB
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.11332.1755263225403276004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GXOdQIs9;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ZWyUqr/a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010198add74c17-456a9bc8-f87d-430f-8af5-314b31c44e37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263224;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qa0ohSRs+36qKKUkvZIAWpUVu2CNM4jzgbT1+e6GlDM=;
	b=GXOdQIs9cLHfdmBTfQO3N5/0WaKR5fIyYoLybdkrSmLFnRUFHYq2Dt3T7mCaqd9n
	onBBWC0UoklEpSAg0CC0aHInV3VYDv86VmthPQIrYyTACJDR2lo1ZbMdvfm4MtKGgWb
	PNI7IYtM8PlgSg7dwYC4VR9Zsk4IlNOpEXGkDE6o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263224;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qa0ohSRs+36qKKUkvZIAWpUVu2CNM4jzgbT1+e6GlDM=;
	b=ZWyUqr/aPE+QNq/q0Tn/MFnzj+1UI7c4oUqmeQaf38E5/D+V1PwUJM2bbCuCk7K6
	Egf0UrBcoBvpRT7KvBgvTxO+gPONzCokl5AfdMXfVZlMToKnGf3CIGCRsUnMdD1eCCg
	nNWNXe2LmrtP6SKZsYG9booyTSLnoCdhUiodYvaE=
Content-Type: multipart/mixed; boundary="===============3333928244167606041=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatch-vcs: upgrading to 0.5.0 SUCCEEDED
Message-ID: <01010198add74c17-456a9bc8-f87d-430f-8af5-314b31c44e37-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221909

--===============3333928244167606041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hatch-vcs* to *0.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatch-vcs-upgrade-0.4.0-0.5.0.patch
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
From 2737bf6b5cbd1229f5b51866e58135a47fae25eb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 09:04:26 +0000
Subject: [PATCH] python3-hatch-vcs: upgrade 0.4.0 -> 0.5.0

---
 .../{python3-hatch-vcs_0.4.0.bb => python3-hatch-vcs_0.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatch-vcs_0.4.0.bb => python3-hatch-vcs_0.5.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb b/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
rename to meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
index ac70295f45..011e28eb81 100644
--- a/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
@@ -8,6 +8,6 @@ inherit pypi python_hatchling
 PYPI_PACKAGE = "hatch_vcs"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "093810748fe01db0d451fabcf2c1ac2688caefd232d4ede967090b1c1b07d9f7"
+SRC_URI[sha256sum] = "0395fa126940340215090c344a2bf4e2a77bcbe7daab16f41b37b98c95809ff9"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============3333928244167606041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hatch-vcs (sysroot):
  /usr/lib/python3.13/site-packages/hatch_vcs-0.4.0.dist-info moved to /usr/lib/python3.13/site-packages/hatch_vcs-0.5.0.dist-info

--===============3333928244167606041==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatch-vcs-upgrade-0.4.0-0.5.0.patch"

RnJvbSAyNzM3YmY2YjVjYmQxMjI5ZjViNTE4NjZlNTgxMzVhNDdmYWUyNWViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDk6MDQ6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNoLXZjczogdXBncmFkZSAwLjQuMCAtPiAwLjUuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtaGF0Y2gtdmNzXzAuNC4wLmJiID0+IHB5dGhvbjMtaGF0Y2gtdmNzXzAuNS4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWhhdGNoLXZjc18wLjQuMC5i
YiA9PiBweXRob24zLWhhdGNoLXZjc18wLjUuMC5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtdmNzXzAuNC4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNoLXZjc18wLjUuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDc5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2gtdmNzXzAuNC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2gtdmNzXzAuNS4wLmJiCmluZGV4IGFjNzAyOTVmNDUuLjAx
MWUyOGViODEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1oYXRjaC12Y3NfMC40LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWhhdGNoLXZjc18wLjUuMC5iYgpAQCAtOCw2ICs4LDYgQEAgaW5oZXJpdCBweXBpIHB5
dGhvbl9oYXRjaGxpbmcKIFBZUElfUEFDS0FHRSA9ICJoYXRjaF92Y3MiCiBVUFNUUkVBTV9DSEVD
S19QWVBJX1BBQ0tBR0UgPSAiJHtQWVBJX1BBQ0tBR0V9IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMDkzODEwNzQ4ZmUwMWRiMGQ0NTFmYWJjZjJjMWFjMjY4OGNhZWZkMjMyZDRlZGU5NjcwOTBi
MWMxYjA3ZDlmNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwMzk1ZmExMjY5NDAzNDAyMTUwOTBj
MzQ0YTJiZjRlMmE3N2JjYmU3ZGFhYjE2ZjQxYjM3Yjk4Yzk1ODA5ZmY5IgogCiBCQkNMQVNTRVhU
RU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0tIAoyLjQ3LjEKCg==

--===============3333928244167606041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hatch-vcs: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatch_vcs/hatch_vcs-0.4.0.tar.gz;downloadfilename=hatch_vcs-0.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatch_vcs/hatch_vcs-0.5.0.tar.gz;downloadfilename=hatch_vcs-0.5.0.tar.gz"
packages/core2-64-poky-linux/python3-hatch-vcs: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dbg: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dbg: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dev: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-dev: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-doc: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-doc: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-locale: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-locale: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-src: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-src: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-staticdev: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs-staticdev: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PV changed from "0.4.0" to "0.5.0"
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PKGSIZE changed from 26221 to 26637 (+2%)
packages/core2-64-poky-linux/python3-hatch-vcs/python3-hatch-vcs: PKGV changed from 0.4.0 [default] to 0.5.0 [default]
Changes to packages/core2-64-poky-linux/python3-hatch-vcs (sysroot):
  /usr/lib/python3.13/site-packages/hatch_vcs-0.4.0.dist-info moved to /usr/lib/python3.13/site-packages/hatch_vcs-0.5.0.dist-info

--===============3333928244167606041==--

