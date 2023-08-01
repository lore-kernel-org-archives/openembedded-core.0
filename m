Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22739C25B76
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.17587.1690907328561283700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=D5KP2gKN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SbqheM5g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010189b1ee3c34-4399457a-91e2-44e1-ab2a-6a9b71241c26-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907327;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=cGRC3n9l0hNQH+ya58eK2e/l1bZoWOmcjO/3OjRQeZU=;
	b=D5KP2gKNNfAysi6yjt6xVZhZI9Et4nS7+4hEskLchECPSGo4zpc16GEF0pKL5ML4
	2ru9e5fuFIKxdfljW+Oak0zWd+Ufed7K0WiJPpsUccMQ4ThpbxnO8PlA30RxE7K6Xs5
	oFPb8zzyOU+4LegfT9iS7VWJVtQwYf1wrKQDnlfI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907327;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=cGRC3n9l0hNQH+ya58eK2e/l1bZoWOmcjO/3OjRQeZU=;
	b=SbqheM5gIRiK15hyaSOhm+TpbLaj/C2mY/Ls9zZn6rVBZ5/N554KOFJhfBT63oYP
	YW4i+q3MUDjQ26RHvG+KG3Qrpr3/nGoWrxXNMzhfnDpawo4x7rjIHMXNJPX/0U2P8NA
	an+s3fi9/XcQHM5rnnwnFLNkcU14GEd9EOK+J8nI=
Content-Type: multipart/mixed; boundary="===============3980466129572895755=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dhcpcd: upgrading to 10.0.2 SUCCEEDED
Message-ID: <01010189b1ee3c34-4399457a-91e2-44e1-ab2a-6a9b71241c26-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185259

--===============3980466129572895755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dhcpcd* to *10.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.0.1-10.0.2.patch
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
From 55bdecb320072004bf82e9891c56c6c2d94a0603 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 06:52:46 +0000
Subject: [PATCH] dhcpcd: upgrade 10.0.1 -> 10.0.2

---
 .../dhcpcd/{dhcpcd_10.0.1.bb => dhcpcd_10.0.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.1.bb => dhcpcd_10.0.2.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.1.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb
index de007a6e6c..9dccc93713 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "5d9bf80c26b4b7dc9d8aa175d96d5a24e75b4d48"
+SRCREV = "d2fbde99cf2d0072016af9dfe6a77032a5a9fc30"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
-- 
2.39.2


--===============3980466129572895755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1051508 to 1053920 (+0%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1111943 to 1113380 (+0%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd: PKGV changed from 10.0.1 [default] to 10.0.2 [default]

--===============3980466129572895755==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.0.1-10.0.2.patch"

RnJvbSA1NWJkZWNiMzIwMDcyMDA0YmY4MmU5ODkxYzU2YzZjMmQ5NGEwNjAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAwNjo1Mjo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRo
Y3BjZDogdXBncmFkZSAxMC4wLjEgLT4gMTAuMC4yCgotLS0KIC4uLi9kaGNwY2Qve2RoY3BjZF8x
MC4wLjEuYmIgPT4gZGhjcGNkXzEwLjAuMi5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL3tkaGNwY2RfMTAuMC4xLmJiID0+IGRoY3BjZF8xMC4w
LjIuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNw
Y2QvZGhjcGNkXzEwLjAuMS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2Ro
Y3BjZF8xMC4wLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjAuMS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjAuMi5iYgppbmRleCBkZTAwN2E2
ZTZjLi45ZGNjYzkzNzEzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Ro
Y3BjZC9kaGNwY2RfMTAuMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhj
cGNkL2RoY3BjZF8xMC4wLjIuYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRodWIuY29tL05ldHdvcmtDb25maWd1cmF0aW9uL2RoY3BjZDtwcm90b2NvbD1odHRwczticmFu
Y2g9bWEKICAgICAgICAgICAgZmlsZTovLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9y
LXdoZW4tZW5hYmxlLW11bHRpbGliLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAi
NWQ5YmY4MGMyNmI0YjdkYzlkOGFhMTc1ZDk2ZDVhMjRlNzViNGQ0OCIKK1NSQ1JFViA9ICJkMmZi
ZGU5OWNmMmQwMDcyMDE2YWY5ZGZlNmE3NzAzMmE1YTlmYzMwIgogUyA9ICIke1dPUktESVJ9L2dp
dCIKIAogaW5oZXJpdCBwa2djb25maWcgYXV0b3Rvb2xzLWJyb2tlbnNlcCBzeXN0ZW1kIHVzZXJh
ZGQKLS0gCjIuMzkuMgoK

--===============3980466129572895755==--

