Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62774C001DD
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.8638.1698848702587346123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fOneJjgu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PljNpEo6;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b8b45fca4-c275a2ee-b16a-426d-be0e-2ab6bbfcddda-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848701;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=kw+1p0edjILulF+0FFWoSf6KGwzj/q42hDGT0CwhqWw=;
	b=fOneJjguiejMqE3W1TX5M568+mDsOrqJlhvqxQ04yMooMj7coHIxpGjnQkWgH4hg
	IsRJbL5VvUaW38lSKGDb8qeWnXfGMVNNJ4IngeGrfOVRIkDJXyNotCXpGAyIRfD8UpB
	PnalFoG6wiPuffulJztSSl/6NzE3kehnUh4ao+N8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848701;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=kw+1p0edjILulF+0FFWoSf6KGwzj/q42hDGT0CwhqWw=;
	b=PljNpEo6NHx3Y6ayrB1QLQxQTE6k5/UJy3P3MruSAMEc0ThFQVpXTZuHaGxpkZ6H
	xD+wZtRF3dDho3x4XdVQq/JNtKv5LEL6i4ccE1W6rQZv1WkHAn7Gn94FSeon5UVCM3K
	DeJcmnoMECUsKoQK5E24KkBNCDWrBIMRaZWLFJ8c=
Content-Type: multipart/mixed; boundary="===============0939207989813535374=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dhcpcd: upgrading to 10.0.4 SUCCEEDED
Message-ID: <0101018b8b45fca4-c275a2ee-b16a-426d-be0e-2ab6bbfcddda-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189918

--===============0939207989813535374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dhcpcd* to *10.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.0.3-10.0.4.patch
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
From 322585aed68976ce89240bd3167e5abb5897f21f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 05:45:07 +0000
Subject: [PATCH] dhcpcd: upgrade 10.0.3 -> 10.0.4

---
 .../dhcpcd/{dhcpcd_10.0.3.bb => dhcpcd_10.0.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.3.bb => dhcpcd_10.0.4.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.3.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.4.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.3.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.4.bb
index cc0fb382df..fbc3e03d2d 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.3.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "45fb8fd8dd281d2228c7abaddff7877d27e67146"
+SRCREV = "3cb242656546acfe88f6201f8b3dbe261ffd1a3e"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
-- 
2.39.2


--===============0939207989813535374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.0.3 [default] to 10.0.4 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1208048 to 1210480 (+0%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.0.3" to "10.0.4"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.0.3 [default] to 10.0.4 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.0.3" to "10.0.4"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.0.3 [default] to 10.0.4 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.0.3" to "10.0.4"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.0.3 [default] to 10.0.4 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.0.3" to "10.0.4"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.0.3 [default] to 10.0.4 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1094606 to 1096434 (+0%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.0.3" to "10.0.4"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.0.3 [default] to 10.0.4 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.0.3" to "10.0.4"
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.0.3 [default] to 10.0.4 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGSIZE changed from 424220 to 424236 (+0%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PV changed from "10.0.3" to "10.0.4"
packages/core2-64-poky-linux/dhcpcd: PKGV changed from 10.0.3 [default] to 10.0.4 [default]
packages/core2-64-poky-linux/dhcpcd: PV changed from "10.0.3" to "10.0.4"

--===============0939207989813535374==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.0.3-10.0.4.patch"

RnJvbSAzMjI1ODVhZWQ2ODk3NmNlODkyNDBiZDMxNjdlNWFiYjU4OTdmMjFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNTo0NTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRo
Y3BjZDogdXBncmFkZSAxMC4wLjMgLT4gMTAuMC40CgotLS0KIC4uLi9kaGNwY2Qve2RoY3BjZF8x
MC4wLjMuYmIgPT4gZGhjcGNkXzEwLjAuNC5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL3tkaGNwY2RfMTAuMC4zLmJiID0+IGRoY3BjZF8xMC4w
LjQuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNw
Y2QvZGhjcGNkXzEwLjAuMy5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2Ro
Y3BjZF8xMC4wLjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjAuMy5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjAuNC5iYgppbmRleCBjYzBmYjM4
MmRmLi5mYmMzZTAzZDJkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Ro
Y3BjZC9kaGNwY2RfMTAuMC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhj
cGNkL2RoY3BjZF8xMC4wLjQuYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRodWIuY29tL05ldHdvcmtDb25maWd1cmF0aW9uL2RoY3BjZDtwcm90b2NvbD1odHRwczticmFu
Y2g9bWEKICAgICAgICAgICAgZmlsZTovLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9y
LXdoZW4tZW5hYmxlLW11bHRpbGliLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAi
NDVmYjhmZDhkZDI4MWQyMjI4YzdhYmFkZGZmNzg3N2QyN2U2NzE0NiIKK1NSQ1JFViA9ICIzY2Iy
NDI2NTY1NDZhY2ZlODhmNjIwMWY4YjNkYmUyNjFmZmQxYTNlIgogUyA9ICIke1dPUktESVJ9L2dp
dCIKIAogaW5oZXJpdCBwa2djb25maWcgYXV0b3Rvb2xzLWJyb2tlbnNlcCBzeXN0ZW1kIHVzZXJh
ZGQKLS0gCjIuMzkuMgoK

--===============0939207989813535374==--

