Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B26C41513
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:11 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.174019.1692224342104083955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AfuX9N1G;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mPH2BWse;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018a006e4516-72e723fb-77b9-4cba-9469-010caa6d9542-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224341;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=klusjKjpLFs2lkqvZmcsP3+h3V4A6apm6suF4VAJVaU=;
	b=AfuX9N1G51bHdW2wwar6rPylQQUbT/Nh0JMKRPkL5/CVV6bxwJhIWSmEyZj5TZb7
	zBBEcK9n9c8eVGvbhPPLnV9FYML3iR1b1AWCNKkiHkKRfFT/3WE1p7WiVg9L5By9J+/
	CShYA9WDXhK0mUnMJUKnC7A/q9WQx4wnSsSLzGdE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224341;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=klusjKjpLFs2lkqvZmcsP3+h3V4A6apm6suF4VAJVaU=;
	b=mPH2BWse4VRB01D7KieTr/2ExHBzaAxhkRVpHS9nsbaAkZcal23aZmrbNF2xIMjE
	jF8sqjfHqdkgaWnUqaTYaVSxHO10wlhpi683b+ZY7Z/a3wj4+PzOGwkvzvjHiQZ4YMQ
	pG1xlJWcVjHb/uW802rPocqH+IDGjzwMA4sOF6FA=
Content-Type: multipart/mixed; boundary="===============6663438096699655423=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dhcpcd: upgrading to 10.0.2 SUCCEEDED
Message-ID: <0101018a006e4516-72e723fb-77b9-4cba-9469-010caa6d9542-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186153

--===============6663438096699655423==
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
From c5fddb134881b880f38861c80b9a679df9389944 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Aug 2023 22:11:28 +0000
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


--===============6663438096699655423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1051516 to 1053928 (+0%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1111943 to 1113380 (+0%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/dhcpcd: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/dhcpcd: PKGV changed from 10.0.1 [default] to 10.0.2 [default]

--===============6663438096699655423==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.0.1-10.0.2.patch"

RnJvbSBjNWZkZGIxMzQ4ODFiODgwZjM4ODYxYzgwYjlhNjc5ZGY5Mzg5OTQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXVnIDIwMjMgMjI6MTE6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aGNwY2Q6IHVwZ3JhZGUgMTAuMC4xIC0+IDEwLjAuMgoKLS0tCiAuLi4vZGhjcGNkL3tkaGNwY2Rf
MTAuMC4xLmJiID0+IGRoY3BjZF8xMC4wLjIuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC97ZGhjcGNkXzEwLjAuMS5iYiA9PiBkaGNwY2RfMTAu
MC4yLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhj
cGNkL2RoY3BjZF8xMC4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9k
aGNwY2RfMTAuMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8xMC4wLjEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8xMC4wLjIuYmIKaW5kZXggZGUwMDdh
NmU2Yy4uOWRjY2M5MzcxMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9k
aGNwY2QvZGhjcGNkXzEwLjAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Ro
Y3BjZC9kaGNwY2RfMTAuMC4yLmJiCkBAIC0xNyw3ICsxNyw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9OZXR3b3JrQ29uZmlndXJhdGlvbi9kaGNwY2Q7cHJvdG9jb2w9aHR0cHM7YnJh
bmNoPW1hCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJv
ci13aGVuLWVuYWJsZS1tdWx0aWxpYi5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0g
IjVkOWJmODBjMjZiNGI3ZGM5ZDhhYTE3NWQ5NmQ1YTI0ZTc1YjRkNDgiCitTUkNSRVYgPSAiZDJm
YmRlOTljZjJkMDA3MjAxNmFmOWRmZTZhNzcwMzJhNWE5ZmMzMCIKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKIGluaGVyaXQgcGtnY29uZmlnIGF1dG90b29scy1icm9rZW5zZXAgc3lzdGVtZCB1c2Vy
YWRkCi0tIAoyLjM5LjIKCg==

--===============6663438096699655423==--

