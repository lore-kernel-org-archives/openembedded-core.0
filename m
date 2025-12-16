Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66069D5CCA4
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17186.1765872138758352233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jaQkz4qO;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BEi4V3vq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b262eb4eb-353ef6da-ec0a-44c0-b4c0-cdebe7bc5448-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XewmWa3huvbV0if9/F8I8HlZQOnYZIkO973dV5WP+7g=;
	b=jaQkz4qOkRlFsf1vbU4u0VoTB1Ri+JTwUHxonbKFmAl8pZUsdJCut/dFgtZUrlkU
	dL/LnHxHIUKRiK1DVMgNiC6J959QNZC0j/vuH/4cxzz7yPGnAnIrMSqewzOaF1kER34
	ABBteLlnDpoQW1HfenGPbBwPmWe5vi3go7UHVU8Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XewmWa3huvbV0if9/F8I8HlZQOnYZIkO973dV5WP+7g=;
	b=BEi4V3vqJLAAML6AXDnOaqfpLJtfNM8BJyaPmRP2JsyWrLgUq1c6ivdq3DlQmpq6
	MDLCY2+1RaQwHcq/msZsBtz1jxYXmtTuvYL6rIB3uMPKgLMRZO2ci+9IzmD+FnVRo21
	8Z2k0qZlWxLR4WEA3oV0rTmzYmYMMAdZDtbYMWC8=
Content-Type: multipart/mixed; boundary="===============0919669698894968857=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ed: upgrading to 1.22.3 SUCCEEDED
Message-ID: <0101019b262eb4eb-353ef6da-ec0a-44c0-b4c0-cdebe7bc5448-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227846

--===============0919669698894968857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ed* to *1.22.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ed-upgrade-1.22.2-1.22.3.patch
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
From d151f871f6b9fac5bb6391c14ba6703b57b6977d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 02:38:41 +0000
Subject: [PATCH] ed: upgrade 1.22.2 -> 1.22.3

---
 meta/recipes-extended/ed/{ed_1.22.2.bb => ed_1.22.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.22.2.bb => ed_1.22.3.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.22.2.bb b/meta/recipes-extended/ed/ed_1.22.3.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.22.2.bb
rename to meta/recipes-extended/ed/ed_1.22.3.bb
index 80d4e116ac..1a5a28a039 100644
--- a/meta/recipes-extended/ed/ed_1.22.2.bb
+++ b/meta/recipes-extended/ed/ed_1.22.3.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "f58d15242056e15af76f13f34c60d890fa2a2d5cb0abef91c115e4d83794ffe3"
+SRC_URI[sha256sum] = "47a55ddfc52d4a1ff6f7559fbd00cf948a16b6cf151ec520392761aeae4e97be"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.47.1


--===============0919669698894968857==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ed-upgrade-1.22.2-1.22.3.patch"

RnJvbSBkMTUxZjg3MWY2YjlmYWM1YmI2MzkxYzE0YmE2NzAzYjU3YjY5NzdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDI6Mzg6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
ZDogdXBncmFkZSAxLjIyLjIgLT4gMS4yMi4zCgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9l
ZC97ZWRfMS4yMi4yLmJiID0+IGVkXzEuMjIuMy5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZWQve2VkXzEuMjIuMi5iYiA9PiBlZF8xLjIyLjMuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2VkL2VkXzEuMjIuMi5iYiBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9lZC9lZF8xLjIyLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2VkL2VkXzEuMjIuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2VkL2VkXzEuMjIuMy5iYgppbmRleCA4MGQ0ZTExNmFjLi4xYTVhMjhhMDM5IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4yMi4yLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9lZC9lZF8xLjIyLjMuYmIKQEAgLTE5LDcgKzE5LDcgQEAgYmlu
ZGlyID0gIiR7YmFzZV9iaW5kaXJ9IgogU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2VkLyR7QlB9
LnRhci5seiIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICIke0dOVV9NSVJST1J9L2VkLyIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImY1OGQxNTI0MjA1NmUxNWFmNzZmMTNmMzRjNjBkODkwZmEyYTJk
NWNiMGFiZWY5MWMxMTVlNGQ4Mzc5NGZmZTMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDdhNTVk
ZGZjNTJkNGExZmY2Zjc1NTlmYmQwMGNmOTQ4YTE2YjZjZjE1MWVjNTIwMzkyNzYxYWVhZTRlOTdi
ZSIKIAogRVhUUkFfT0VNQUtFID0gIi1lIE1BS0VGTEFHUz0iCiAKLS0gCjIuNDcuMQoK

--===============0919669698894968857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ed/ed-dbg: PV changed from "1.22.2" to "1.22.3"
packages/x86-64-v3-poky-linux/ed/ed-dbg: PKGSIZE changed from 179416 to 179392 (-0%)
packages/x86-64-v3-poky-linux/ed/ed-dbg: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/x86-64-v3-poky-linux/ed/ed-dev: PV changed from "1.22.2" to "1.22.3"
packages/x86-64-v3-poky-linux/ed/ed-dev: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/x86-64-v3-poky-linux/ed/ed-doc: PV changed from "1.22.2" to "1.22.3"
packages/x86-64-v3-poky-linux/ed/ed-doc: PKGSIZE changed from 76012 to 76081 (+0%)
packages/x86-64-v3-poky-linux/ed/ed-doc: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/x86-64-v3-poky-linux/ed/ed-locale: PV changed from "1.22.2" to "1.22.3"
packages/x86-64-v3-poky-linux/ed/ed-locale: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/x86-64-v3-poky-linux/ed/ed-src: FILELIST: directory renamed /usr/src/debug/ed/1.22.2 -> /usr/src/debug/ed/1.22.3
packages/x86-64-v3-poky-linux/ed/ed-src: PV changed from "1.22.2" to "1.22.3"
packages/x86-64-v3-poky-linux/ed/ed-src: PKGSIZE changed from 116351 to 116345 (-0%)
packages/x86-64-v3-poky-linux/ed/ed-src: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/x86-64-v3-poky-linux/ed/ed-staticdev: PV changed from "1.22.2" to "1.22.3"
packages/x86-64-v3-poky-linux/ed/ed-staticdev: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/x86-64-v3-poky-linux/ed/ed: PV changed from "1.22.2" to "1.22.3"
packages/x86-64-v3-poky-linux/ed/ed: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/x86-64-v3-poky-linux/ed: PV changed from "1.22.2" to "1.22.3"
packages/x86-64-v3-poky-linux/ed: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/x86-64-v3-poky-linux/ed: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/ed/ed-1.22.2.tar.lz" to "https://ftpmirror.gnu.org/gnu/ed/ed-1.22.3.tar.lz"

--===============0919669698894968857==--

