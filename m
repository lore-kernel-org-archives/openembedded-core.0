Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B138C47061
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:10 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.14614.1700059028661486741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TN3+Ow/w;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XxvrvP3i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018bd36a186a-f5247160-0ead-4527-824b-79342bcadbca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059027;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ZOsbgzB/uZCucEGpYfXf2aMER8F3fw78hCPWY3e52vU=;
	b=TN3+Ow/wilRuF+heNXM05Tq8H61+3Qudeozs23FWtUyqCn+BBUxsqlCmNh0dZfcs
	IBKWZt5QlB2/x0Q2XkZIJzPq3W0CyRNU87z3wERsDs1iDkQcSJI9CcLJz8ONDwetc7w
	sjIctwn4v5k2DdVbN1ziRNaIN02G2DKnAFjGan/Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059027;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ZOsbgzB/uZCucEGpYfXf2aMER8F3fw78hCPWY3e52vU=;
	b=XxvrvP3iBM+XVsU3LPwk62Nt1UklVWcBI7mYt7FiFmTsOSWEvpemTy5fhur/f30u
	vNdl9WrEr4WV44enhLl1aejvW4Bob7QfRxUaN4/tfXhKsAvDuZdgzcBkSmsfdIvdCcF
	qFd7+VS3MjaI079KaJnf3cn3YagPUCk9sufLpQuY=
Content-Type: multipart/mixed; boundary="===============5805453358259242338=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dhcpcd: upgrading to 10.0.5 SUCCEEDED
Message-ID: <0101018bd36a186a-f5247160-0ead-4527-824b-79342bcadbca-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190605

--===============5805453358259242338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dhcpcd* to *10.0.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.0.4-10.0.5.patch
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
From 20e0342b1ba9679ee9e22d984c60cd18ef72d1d3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 05:07:59 +0000
Subject: [PATCH] dhcpcd: upgrade 10.0.4 -> 10.0.5

---
 .../dhcpcd/{dhcpcd_10.0.4.bb => dhcpcd_10.0.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.4.bb => dhcpcd_10.0.5.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.4.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.5.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.4.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.5.bb
index fbc3e03d2d..c2dee267ba 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.4.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.5.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "3cb242656546acfe88f6201f8b3dbe261ffd1a3e"
+SRCREV = "6baf4df467aaae89b026a089122d155c6eec3f19"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
-- 
2.39.2


--===============5805453358259242338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.0.4" to "10.0.5"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1210480 to 1210944 (+0%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.0.4 [default] to 10.0.5 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.0.4" to "10.0.5"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.0.4 [default] to 10.0.5 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.0.4" to "10.0.5"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.0.4 [default] to 10.0.5 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.0.4" to "10.0.5"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.0.4 [default] to 10.0.5 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.0.4" to "10.0.5"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1096434 to 1097220 (+0%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.0.4 [default] to 10.0.5 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.0.4" to "10.0.5"
packages/core2-64-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.0.4 [default] to 10.0.5 [default]
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PV changed from "10.0.4" to "10.0.5"
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGSIZE changed from 424236 to 424252 (+0%)
packages/core2-64-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.0.4 [default] to 10.0.5 [default]
packages/core2-64-poky-linux/dhcpcd: PV changed from "10.0.4" to "10.0.5"
packages/core2-64-poky-linux/dhcpcd: PKGV changed from 10.0.4 [default] to 10.0.5 [default]

--===============5805453358259242338==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.0.4-10.0.5.patch"

RnJvbSAyMGUwMzQyYjFiYTk2NzllZTllMjJkOTg0YzYwY2QxOGVmNzJkMWQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDU6MDc6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aGNwY2Q6IHVwZ3JhZGUgMTAuMC40IC0+IDEwLjAuNQoKLS0tCiAuLi4vZGhjcGNkL3tkaGNwY2Rf
MTAuMC40LmJiID0+IGRoY3BjZF8xMC4wLjUuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC97ZGhjcGNkXzEwLjAuNC5iYiA9PiBkaGNwY2RfMTAu
MC41LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhj
cGNkL2RoY3BjZF8xMC4wLjQuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9k
aGNwY2RfMTAuMC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8xMC4wLjQuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8xMC4wLjUuYmIKaW5kZXggZmJjM2Uw
M2QyZC4uYzJkZWUyNjdiYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9k
aGNwY2QvZGhjcGNkXzEwLjAuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Ro
Y3BjZC9kaGNwY2RfMTAuMC41LmJiCkBAIC0xNyw3ICsxNyw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9OZXR3b3JrQ29uZmlndXJhdGlvbi9kaGNwY2Q7cHJvdG9jb2w9aHR0cHM7YnJh
bmNoPW1hCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJv
ci13aGVuLWVuYWJsZS1tdWx0aWxpYi5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0g
IjNjYjI0MjY1NjU0NmFjZmU4OGY2MjAxZjhiM2RiZTI2MWZmZDFhM2UiCitTUkNSRVYgPSAiNmJh
ZjRkZjQ2N2FhYWU4OWIwMjZhMDg5MTIyZDE1NWM2ZWVjM2YxOSIKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKIGluaGVyaXQgcGtnY29uZmlnIGF1dG90b29scy1icm9rZW5zZXAgc3lzdGVtZCB1c2Vy
YWRkCi0tIAoyLjM5LjIKCg==

--===============5805453358259242338==--

