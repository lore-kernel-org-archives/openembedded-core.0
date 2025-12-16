Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7E3D5C0CD
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:24 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17396.1765872135892522841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=pTsTfbY/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=spxVBgGJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262e6c03-94633bf8-817c-4534-a2ed-e398f4700c50-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NVB0MnLpBzLi15pJvAAoyXuoXJAlWrhczbOvSxvz8l4=;
	b=pTsTfbY/EbfNwS03DkuiaFHSVP7C23BES9N5Eyzs6/K6wh606T1SJVdTlmlkuJpJ
	eXprFwofAyI44gFy6BG9Ch2s9FSKwv6eFT4S37U8sr0rEk8GdTtSs1wUqavWtKPYHz3
	dKWrCjFA9IaNamP5LCZ4mHhGP3FHLpPFoIP9p1WQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NVB0MnLpBzLi15pJvAAoyXuoXJAlWrhczbOvSxvz8l4=;
	b=spxVBgGJ/7QxdtpBaP7BWK4UXbQbpDjh3Tbhc4SLE9x8llzDzYvdKh62WonLSTF0
	1Lp0Aw5PE9QvPiyqD7W3G1cw472SpINuG0JjyJjmuvWQd5FtNp27ry4dlINYJGomI3m
	sA/eGE5sBqb8qGQ5nSphLM2fW+b1ad7p7lXw1W2s=
Content-Type: multipart/mixed; boundary="===============5010355257699067953=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ell: upgrading to 0.81 SUCCEEDED
Message-ID: <0101019b262e6c03-94633bf8-817c-4534-a2ed-e398f4700c50-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227782

--===============5010355257699067953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ell* to *0.81* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.80-0.81.patch
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
From 2aa530d9d209a3cd5db6335275693d276af6c9a0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 22:36:48 +0000
Subject: [PATCH] ell: upgrade 0.80 -> 0.81

---
 meta/recipes-core/ell/{ell_0.80.bb => ell_0.81.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.80.bb => ell_0.81.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.80.bb b/meta/recipes-core/ell/ell_0.81.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.80.bb
rename to meta/recipes-core/ell/ell_0.81.bb
index 90474dadae..f9b702531a 100644
--- a/meta/recipes-core/ell/ell_0.80.bb
+++ b/meta/recipes-core/ell/ell_0.81.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6efc70ae6d3e2ca1ec255ecd855a3d5fadefe59897f4307816e3ba7a771f3d00"
+SRC_URI[sha256sum] = "672ca1e44dc0ddce1665941754b4e2b3b9203481d7d7a60e0b5f39829d73fa14"
-- 
2.47.1


--===============5010355257699067953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ell/ell-dbg: PV changed from "0.80" to "0.81"
packages/x86-64-v3-poky-linux/ell/ell-dbg: PKGSIZE changed from 1789720 to 1789904 (+0%)
packages/x86-64-v3-poky-linux/ell/ell-dbg: PKGV changed from 0.80 [default] to 0.81 [default]
packages/x86-64-v3-poky-linux/ell/ell-dev: PV changed from "0.80" to "0.81"
packages/x86-64-v3-poky-linux/ell/ell-dev: PKGV changed from 0.80 [default] to 0.81 [default]
packages/x86-64-v3-poky-linux/ell/ell-doc: PV changed from "0.80" to "0.81"
packages/x86-64-v3-poky-linux/ell/ell-doc: PKGV changed from 0.80 [default] to 0.81 [default]
packages/x86-64-v3-poky-linux/ell/ell-locale: PV changed from "0.80" to "0.81"
packages/x86-64-v3-poky-linux/ell/ell-locale: PKGV changed from 0.80 [default] to 0.81 [default]
packages/x86-64-v3-poky-linux/ell/ell-src: PV changed from "0.80" to "0.81"
packages/x86-64-v3-poky-linux/ell/ell-src: PKGSIZE changed from 1447237 to 1447332 (+0%)
packages/x86-64-v3-poky-linux/ell/ell-src: FILELIST: directory renamed /usr/src/debug/ell/0.80/linux -> /usr/src/debug/ell/0.81/linux, directory renamed /usr/src/debug/ell/0.80/ell -> /usr/src/debug/ell/0.81/ell
packages/x86-64-v3-poky-linux/ell/ell-src: PKGV changed from 0.80 [default] to 0.81 [default]
packages/x86-64-v3-poky-linux/ell/ell-staticdev: PV changed from "0.80" to "0.81"
packages/x86-64-v3-poky-linux/ell/ell-staticdev: PKGV changed from 0.80 [default] to 0.81 [default]
packages/x86-64-v3-poky-linux/ell/ell: PV changed from "0.80" to "0.81"
packages/x86-64-v3-poky-linux/ell/ell: PKGV changed from 0.80 [default] to 0.81 [default]
packages/x86-64-v3-poky-linux/ell: PV changed from "0.80" to "0.81"
packages/x86-64-v3-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.80.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.81.tar.xz"
packages/x86-64-v3-poky-linux/ell: PKGV changed from 0.80 [default] to 0.81 [default]

--===============5010355257699067953==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.80-0.81.patch"

RnJvbSAyYWE1MzBkOWQyMDlhM2NkNWRiNjMzNTI3NTY5M2QyNzZhZjZjOWEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjI6MzY6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bGw6IHVwZ3JhZGUgMC44MCAtPiAwLjgxCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC97ZWxs
XzAuODAuYmIgPT4gZWxsXzAuODEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC44MC5iYiA9PiBlbGxfMC44MS5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9lbGwvZWxsXzAuODAuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuODEuYmIK
c2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2Vs
bF8wLjgwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuODEuYmIKaW5k
ZXggOTA0NzRkYWRhZS4uZjliNzAyNTMxYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
ZWxsL2VsbF8wLjgwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC44MS5iYgpA
QCAtMTUsNCArMTUsNCBAQCBERVBFTkRTID0gImRidXMiCiBpbmhlcml0IGF1dG90b29scyBwa2dj
b25maWcKIAogU1JDX1VSSSA9ICJodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9s
aW51eC9saWJzLyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjZlZmM3MGFlNmQzZTJjYTFlYzI1NWVjZDg1NWEzZDVmYWRlZmU1OTg5N2Y0MzA3ODE2ZTNi
YTdhNzcxZjNkMDAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjcyY2ExZTQ0ZGMwZGRjZTE2NjU5
NDE3NTRiNGUyYjNiOTIwMzQ4MWQ3ZDdhNjBlMGI1ZjM5ODI5ZDczZmExNCIKLS0gCjIuNDcuMQoK

--===============5010355257699067953==--

