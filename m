Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A419BCD11C2
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2351.1762384575994735130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GUTl/2t1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LI2TCgOM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019a564e88ba-255baa75-aab8-4720-ae1a-ef89b61f17a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AoSTm+g+yYvthc3u5LPSpm2qqulaphCbV37PziAtuY4=;
	b=GUTl/2t12aacpuwYp8fj5ZTa/A6AcvOntUly1bR63R83/fjN16740HayUoAuS2kf
	y3VxemHfA7Uofl4lS+u7RYYC2Lqce0Qq9KjuwdceuFHqems+9TMoE2JgRTygWdK+fAs
	veFCJ+JYsKVFt0NOQ5H7kbesVXVXulV3LkQt0xII=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AoSTm+g+yYvthc3u5LPSpm2qqulaphCbV37PziAtuY4=;
	b=LI2TCgOMFuWx8Xhrskvr10TyNDBRoRmST6eCONjrqFTZppXdQg09NIt+MAPDLyvP
	hTuZxGW9o/eMVbavar7odETmV6YsSqm8eeWt23zwG9/PjbT1Egrc7NIMlilZsDlJzOq
	ocLjC28ZAF2X6PLymiJvj8j0Ith8laVbivrmFM/o=
Content-Type: multipart/mixed; boundary="===============2121619670187055788=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to 092f4f0d612e5982728c8b872c2e69cf3d04b21f
 SUCCEEDED
Message-ID: <0101019a564e88ba-255baa75-aab8-4720-ae1a-ef89b61f17a9-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225811

--===============2121619670187055788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *092f4f0d612e5982728c8b872c2e69cf3d04b21f* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gn-upgrade-to-latest-revision.patch
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
From d6fc193717ef63d0965561005ade77de67bbfcc2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 16:10:30 +0000
Subject: [PATCH] gn: upgrade to latest revision

---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index d8896609b1..8637216988 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "81b24e01531ecf0eff12ec9359a555ec3944ec4e"
+SRCREV = "092f4f0d612e5982728c8b872c2e69cf3d04b21f"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============2121619670187055788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61

--===============2121619670187055788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 99969600 to 99978832 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+81b24e0153 to 0+git0+092f4f0d61
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 3653816 to 3657912 (+0%)

--===============2121619670187055788==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSBkNmZjMTkzNzE3ZWY2M2QwOTY1NTYxMDA1YWRlNzdkZTY3YmJmY2MyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNjoxMDozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
OiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z24vZ25fZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQuYmIKaW5kZXggZDg4OTY2MDliMS4u
ODYzNzIxNjk4OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCkBAIC03LDcgKzcsNyBA
QCBERVBFTkRTICs9ICJuaW5qYS1uYXRpdmUiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEi
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ24uZ29vZ2xlc291cmNlLmNvbS9nbjtwcm90b2NvbD1odHRw
czticmFuY2g9bWFpbiIKLVNSQ1JFViA9ICI4MWIyNGUwMTUzMWVjZjBlZmYxMmVjOTM1OWE1NTVl
YzM5NDRlYzRlIgorU1JDUkVWID0gIjA5MmY0ZjBkNjEyZTU5ODI3MjhjOGI4NzJjMmU2OWNmM2Qw
NGIyMWYiCiBQViA9ICIwK2dpdCIKIAogQkJfR0lUX1NIQUxMT1cgPSAiIgotLSAKMi40Ny4xCgo=

--===============2121619670187055788==--

