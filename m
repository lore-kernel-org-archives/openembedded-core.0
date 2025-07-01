Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA39EC87FD5
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:36 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1414.1751386804312510972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0msYpOoy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NMxMhXxQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010197c6ca23e6-1b4f317a-9424-4ef6-a381-35cc5a8e9585-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386825;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mBiBiBCk3Y36dVBf5Kt4Xs7fB8SUgoBSq6qEKudOLeQ=;
	b=0msYpOoy3U+r+wxJ/PK7MBLGPezrUcNKWjgKcrsLTZIP9fSAU1vP0yg4rh49aaC/
	OJ5SUlmY1RgKk/yD2CM7dx72OXGNumLtBrGDCVGWbyVV536vlNTpTdYRTXALJF202rp
	t+tJm1DyTq7cNFW6ZkfsOkFTijtyGkVfdwQK8mTI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386825;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mBiBiBCk3Y36dVBf5Kt4Xs7fB8SUgoBSq6qEKudOLeQ=;
	b=NMxMhXxQ5qAYsx4giWNine8oRXATMR56eD7Wp3k7yf+SCg1zJZ7a+T1SkBAKV7V3
	QagzH8gOe25QcsmdtX23DzrqwOHCGfivC6BgCIMIuYgc5IYV2IV5dNkLhqMUsjxNVhz
	aPdLB3Rp42ETgg9XmtHq0K/e9kxiCXgWwzZl/LPc=
Content-Type: multipart/mixed; boundary="===============3390847356888278975=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to e05830984e15ae77bd3dbcf41d4cd0a60010dda2
 SUCCEEDED
Message-ID: <01010197c6ca23e6-1b4f317a-9424-4ef6-a381-35cc5a8e9585-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219676

--===============3390847356888278975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kmscube* to *e05830984e15ae77bd3dbcf41d4cd0a60010dda2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmscube-upgrade-to-latest-revision.patch
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
From e4d71f4f85526b802b353748b3291d78468ad072 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 13:15:35 +0000
Subject: [PATCH] kmscube: upgrade to latest revision

---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 013fdfb6bf..66bd7b08ef 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2a12bf7a66f5f663d75186bf01eb607b"
 
-SRCREV = "311eaaaa473d593c30d118799aa19ac4ad53cd65"
+SRCREV = "e05830984e15ae77bd3dbcf41d4cd0a60010dda2"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            "
 
-- 
2.47.1


--===============3390847356888278975==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSBlNGQ3MWY0Zjg1NTI2YjgwMmIzNTM3NDhiMzI5MWQ3ODQ2OGFkMDcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMzoxNTozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtt
c2N1YmU6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3Vi
ZS9rbXNjdWJlX2dpdC5iYgppbmRleCAwMTNmZGZiNmJmLi42NmJkN2IwOGVmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgpAQCAtMTAsNyArMTAsNyBA
QCBERVBFTkRTID0gInZpcnR1YWwvbGliZ2xlczMgdmlydHVhbC9saWJnbGVzMiB2aXJ0dWFsL2Vn
bCBsaWJkcm0gdmlydHVhbC9saWJnYm0iCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PTJhMTJiZjdhNjZmNWY2NjNkNzUxODZiZjAxZWI2MDdiIgogCi1TUkNSRVYgPSAi
MzExZWFhYWE0NzNkNTkzYzMwZDExODc5OWFhMTlhYzRhZDUzY2Q2NSIKK1NSQ1JFViA9ICJlMDU4
MzA5ODRlMTVhZTc3YmQzZGJjZjQxZDRjZDBhNjAwMTBkZGEyIgogU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2Eva21zY3ViZTticmFuY2g9bWFzdGVyO3Byb3RvY29s
PWh0dHBzIFwKICAgICAgICAgICAgIgogCi0tIAoyLjQ3LjEKCg==

--===============3390847356888278975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-dev: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-doc: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-locale: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e

--===============3390847356888278975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGSIZE changed from 1838080 to 1837656 (-0%)
packages/core2-64-poky-linux/kmscube/kmscube-dev: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-doc: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-locale: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube: PKGSIZE changed from 1585736 to 1585712 (-0%)

--===============3390847356888278975==--

