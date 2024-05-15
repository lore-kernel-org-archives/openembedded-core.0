Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9289C27C51
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1232.1715794337235437525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Ajx8g5VW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=G4ZrtTdZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f7d4fda3b-b12a68a6-3218-4873-a9a9-f9e34235bae2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dS8FtTL5ggRiTVHRehATy6VdrPjNgKkJUjx1JRRiYL8=;
	b=Ajx8g5VWYsW2OyI23i70+G9IUiOaoq8cqviVp/zzMnUHbapKL5KJmLrxC79undli
	Rf6DCegYA0QLsIwBbWpHyTeer7//JEd2u2fO5rWK4M1Tc8LwAU1KNTjR/YP1gNYha/O
	5tOMdrB+wzWC3A7BYhNo0ReDzcqzyopey3oJO0Xg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dS8FtTL5ggRiTVHRehATy6VdrPjNgKkJUjx1JRRiYL8=;
	b=G4ZrtTdZkDL0bo50jLxtKYwa6xPh06sJ4h5DIW/FNmPIqNMdMWcn93RyyyVVDN/q
	Qj4Egn4upDzdn5kRC/G+KibonKC6B5AeDcdq4oqKmZWVAaFigoqaw/VCWVbOXPC1lF7
	Q7Vw8tUQ02nVg8vlb7RKWtHcYQQP6H8NwXuAbIic=
Content-Type: multipart/mixed; boundary="===============3466494980552741900=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.9.0 SUCCEEDED
Message-ID: <0101018f7d4fda3b-b12a68a6-3218-4873-a9a9-f9e34235bae2-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199301

--===============3466494980552741900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iproute2* to *6.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-6.8.0-6.9.0.patch
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
From a8ae1a7ccfa9aa0cf64881e26954fb9c9eedd6ae Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 06:49:00 +0000
Subject: [PATCH] iproute2: upgrade 6.8.0 -> 6.9.0

---
 .../iproute2/{iproute2_6.8.0.bb => iproute2_6.9.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.8.0.bb => iproute2_6.9.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb
index 24539e3d99..d21885cd73 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb
@@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native iptables libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "03a6cca3d71a908d1f15f7b495be2b8fe851f941458dc4664900d7f45fcf68ce"
+SRC_URI[sha256sum] = "2f643d09ea11a4a2a043c92e2b469b5f73228cbf241ae806760296ed0ec413d0"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.44.0


--===============3466494980552741900==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.8.0-6.9.0.patch"

RnJvbSBhOGFlMWE3Y2NmYTlhYTBjZjY0ODgxZTI2OTU0ZmI5YzllZWRkNmFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDY6NDk6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
cHJvdXRlMjogdXBncmFkZSA2LjguMCAtPiA2LjkuMAoKLS0tCiAuLi4vaXByb3V0ZTIve2lwcm91
dGUyXzYuOC4wLmJiID0+IGlwcm91dGUyXzYuOS4wLmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL3tpcHJvdXRlMl82LjguMC5iYiA9PiBpcHJvdXRl
Ml82LjkuMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2lwcm91dGUyL2lwcm91dGUyXzYuOC4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9p
cHJvdXRlMi9pcHJvdXRlMl82LjkuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuOC4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuOS4w
LmJiCmluZGV4IDI0NTM5ZTNkOTkuLmQyMTg4NWNkNzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi44LjAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjkuMC5iYgpAQCAtMTMsNyArMTMs
NyBAQCBERVBFTkRTID0gImZsZXgtbmF0aXZlIGJpc29uLW5hdGl2ZSBpcHRhYmxlcyBsaWJjYXAi
CiAKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy9uZXQvJHtCUE59
LyR7QlB9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAzYTZjY2EzZDcxYTkwOGQx
ZjE1ZjdiNDk1YmUyYjhmZTg1MWY5NDE0NThkYzQ2NjQ5MDBkN2Y0NWZjZjY4Y2UiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMmY2NDNkMDllYTExYTRhMmEwNDNjOTJlMmI0NjliNWY3MzIyOGNiZjI0
MWFlODA2NzYwMjk2ZWQwZWM0MTNkMCIKIAogaW5oZXJpdCB1cGRhdGUtYWx0ZXJuYXRpdmVzIGJh
c2gtY29tcGxldGlvbiBwa2djb25maWcKIAotLSAKMi40NC4wCgo=

--===============3466494980552741900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-bash-completion: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-bridge: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-bridge: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 8323592 to 8341416 (+0%)
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-dev: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-dev: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-devlink: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-devlink: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-doc: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-doc: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-genl: PKGSIZE changed from 121160 to 125256 (+3%)
packages/core2-64-poky-linux/iproute2/iproute2-genl: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-genl: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ifstat: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-ip: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ip: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-lnstat: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-locale: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-locale: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-nstat: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-nstat: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-rdma: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-rdma: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-routel: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-routel: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-rtacct: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3646722 to 3667871 (+1%)
packages/core2-64-poky-linux/iproute2/iproute2-src: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-src: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-ss: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ss: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-staticdev: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-tc: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-tc: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2-tipc: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-tipc: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2/iproute2: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2: PV changed from "6.8.0" to "6.9.0"
packages/core2-64-poky-linux/iproute2: PKGV changed from 6.8.0 [default] to 6.9.0 [default]
packages/core2-64-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.8.0.tar.xz" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.9.0.tar.xz"
packages/core2-64-poky-linux/iproute2: PV changed from "6.8.0" to "6.9.0"

--===============3466494980552741900==--

