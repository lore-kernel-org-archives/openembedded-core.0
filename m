Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE38D5C0DC
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17403.1765872146646309370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jm8a5xSp;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UVg75h4L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b262eeff9-8c2083e7-035b-443f-b5b1-1c966bcf2b39-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1HlHt4vcK9KVyTH/Gj5jx5jkJTp9SRXai+g9C5A+EDY=;
	b=jm8a5xSpxNbg/pHSaoyb3rVeQ0rYra89cLGHNFCXzLc4eWoI5TxorQ/hnIpArr0w
	c67L8DpM7XOhq1o+bObA+ZWYBx9sFRzBg/IT9gMyFjxJTIDQxv2DTBSKSJ1773IFo2L
	R20IPUUdqm9o8x/2E2INZA88NaC6dwjNDJgm+9z0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1HlHt4vcK9KVyTH/Gj5jx5jkJTp9SRXai+g9C5A+EDY=;
	b=UVg75h4Ly/Y3/zse4LBrdKxT40mAmyAnaNWLMMEYtxmzqwVD3qBkUxUmW4P2zIzP
	IWEfWTh5mIw/FN7r0VRS6PBB8OGvo6saRIWdzC8rs5XMljmqYKsHPWfSHNdL2rPauaC
	0hBW0O2NSjYQ9d5OlI+321Ek85ggDQPXUIgk1HYk=
Content-Type: multipart/mixed; boundary="===============8365730986669550340=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libatomic-ops: upgrading to 7.10.0 SUCCEEDED
Message-ID: <0101019b262eeff9-8c2083e7-035b-443f-b5b1-1c966bcf2b39-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227914

--===============8365730986669550340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libatomic-ops* to *7.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libatomic-ops-upgrade-7.8.4-7.10.0.patch
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
From 3566d93afb1fe6857e8398e918406a71d9fac137 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 07:08:19 +0000
Subject: [PATCH] libatomic-ops: upgrade 7.8.4 -> 7.10.0

---
 .../{libatomic-ops_7.8.4.bb => libatomic-ops_7.10.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.8.4.bb => libatomic-ops_7.10.0.bb} (90%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
similarity index 90%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
index 1007219294..c31ccac7b0 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.10.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/bdwgc/libatomic_ops/releases"
 
-SRC_URI[sha256sum] = "2356e002e80ef695875e971d6a4fd8c61ca5c6fa4fd1bf31cce54a269c8bfcd5"
+SRC_URI[sha256sum] = "0db3ebff755db170f65e74a64ec4511812e9ee3185c232eeffeacd274190dfb0"
 
 CVE_PRODUCT = "libatomic_ops"
 
-- 
2.47.1


--===============8365730986669550340==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libatomic-ops-upgrade-7.8.4-7.10.0.patch"

RnJvbSAzNTY2ZDkzYWZiMWZlNjg1N2U4Mzk4ZTkxODQwNmE3MWQ5ZmFjMTM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDc6MDg6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhdG9taWMtb3BzOiB1cGdyYWRlIDcuOC40IC0+IDcuMTAuMAoKLS0tCiAuLi4ve2xpYmF0b21p
Yy1vcHNfNy44LjQuYmIgPT4gbGliYXRvbWljLW9wc183LjEwLjAuYmJ9ICAgICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJhdG9taWMtb3BzL3tsaWJhdG9taWMtb3BzXzcuOC40LmJi
ID0+IGxpYmF0b21pYy1vcHNfNy4xMC4wLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmF0b21pYy1vcHMvbGliYXRvbWljLW9wc183LjguNC5iYiBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmF0b21pYy1vcHMvbGliYXRvbWljLW9wc183LjEwLjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYXRv
bWljLW9wcy9saWJhdG9taWMtb3BzXzcuOC40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJhdG9taWMtb3BzL2xpYmF0b21pYy1vcHNfNy4xMC4wLmJiCmluZGV4IDEwMDcyMTky
OTQuLmMzMWNjYWM3YjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmF0b21p
Yy1vcHMvbGliYXRvbWljLW9wc183LjguNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJhdG9taWMtb3BzL2xpYmF0b21pYy1vcHNfNy4xMC4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZh
ODBmZGFmNGE0MjYzIFwKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yk
e1BWfS9saWJhdG9taWNfb3BzLSR7UFZ9LnRhci5neiIKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRw
czovL2dpdGh1Yi5jb20vYmR3Z2MvbGliYXRvbWljX29wcy9yZWxlYXNlcyIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjIzNTZlMDAyZTgwZWY2OTU4NzVlOTcxZDZhNGZkOGM2MWNhNWM2ZmE0ZmQx
YmYzMWNjZTU0YTI2OWM4YmZjZDUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGRiM2ViZmY3NTVk
YjE3MGY2NWU3NGE2NGVjNDUxMTgxMmU5ZWUzMTg1YzIzMmVlZmZlYWNkMjc0MTkwZGZiMCIKIAog
Q1ZFX1BST0RVQ1QgPSAibGliYXRvbWljX29wcyIKIAotLSAKMi40Ny4xCgo=

--===============8365730986669550340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libatomic-ops: PKGV changed from 7.8.4 [default] to 7.10.0 [default]
packages/x86-64-v3-poky-linux/libatomic-ops: PV changed from "7.8.4" to "7.10.0"
packages/x86-64-v3-poky-linux/libatomic-ops: SRC_URI changed from "https://github.com/bdwgc/libatomic_ops/releases/download/v7.8.4/libatomic_ops-7.8.4.tar.gz" to "https://github.com/bdwgc/libatomic_ops/releases/download/v7.10.0/libatomic_ops-7.10.0.tar.gz"
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-dbg: PKGV changed from 7.8.4 [default] to 7.10.0 [default]
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-dbg: PV changed from "7.8.4" to "7.10.0"
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-dev: PKGV changed from 7.8.4 [default] to 7.10.0 [default]
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-dev: PV changed from "7.8.4" to "7.10.0"
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-dev: PKGSIZE changed from 667817 to 687878 (+3%)
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-doc: PKGV changed from 7.8.4 [default] to 7.10.0 [default]
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-doc: PV changed from "7.8.4" to "7.10.0"
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-doc: PKGSIZE changed from 88342 to 91121 (+3%)
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-locale: PKGV changed from 7.8.4 [default] to 7.10.0 [default]
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-locale: PV changed from "7.8.4" to "7.10.0"
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-src: PKGV changed from 7.8.4 [default] to 7.10.0 [default]
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-src: FILELIST: directory renamed /usr/src/debug/libatomic-ops/7.8.4/src/atomic_ops/sysdeps/gcc -> /usr/src/debug/libatomic-ops/7.10.0/src/atomic_ops/sysdeps/gcc, directory renamed /usr/src/debug/libatomic-ops/7.8.4/src -> /usr/src/debug/libatomic-ops/7.10.0/src, directory renamed /usr/src/debug/libatomic-ops/7.8.4/src/atomic_ops/sysdeps -> /usr/src/debug/libatomic-ops/7.10.0/src/atomic_ops/sysdeps
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-src: PV changed from "7.8.4" to "7.10.0"
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-src: PKGSIZE changed from 105514 to 110878 (+5%)
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-staticdev: PKGV changed from 7.8.4 [default] to 7.10.0 [default]
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-staticdev: PV changed from "7.8.4" to "7.10.0"
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops-staticdev: PKGSIZE changed from 41766 to 41778 (+0%)
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops: PKGV changed from 7.8.4 [default] to 7.10.0 [default]
packages/x86-64-v3-poky-linux/libatomic-ops/libatomic-ops: PV changed from "7.8.4" to "7.10.0"

--===============8365730986669550340==--

