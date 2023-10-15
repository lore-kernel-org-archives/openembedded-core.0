Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A8DC04FEB
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.102658.1697399113485135372
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QT8NyVdc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Bt0iE6sv;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b34df03af-954963cc-386a-411b-8bca-892d15877e27-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9cFSEGpBjFOIHBMHC7aNuePUQmFERSur6j5wUgAkgvE=;
	b=QT8NyVdc8QPOJBCH3wjYnvX/BNafAnQp2FB8S2j1htygn2vPC0SmrD56XSquWeIr
	x2WQyZrkB9Vu77cijbN6Ng+vZQpFFG81rg+7+B9Scc5g262xtQSXNDhqFgra3HYyRHQ
	KVFZjSVE8aa73ZL2onooNbyUOPoPExeH8IeivGH4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9cFSEGpBjFOIHBMHC7aNuePUQmFERSur6j5wUgAkgvE=;
	b=Bt0iE6sv+JcjJbrSrppWgHkvhCcLt+33vFd/Mh6iz9rE54GKU4r+SFxxQIIt8xqz
	jlinKB4EEZrs/E4wRC3Hgdo8IpnZVvMwP6oSFa6C1oguTkthHscudTSD/XegbcTz8Jc
	+3Az6fQttdboxvWglDS8kqfgjY086KmHudC8OJq8=
Content-Type: multipart/mixed; boundary="===============5055055200711210918=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.59 SUCCEEDED
Message-ID: <0101018b34df03af-954963cc-386a-411b-8bca-892d15877e27-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189163

--===============5055055200711210918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ell* to *0.59* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.58-0.59.patch
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
From f4307523f3c87861ee218fd069859d27d82a149a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 07:47:06 +0000
Subject: [PATCH] ell: upgrade 0.58 -> 0.59

---
 meta/recipes-core/ell/{ell_0.58.bb => ell_0.59.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.58.bb => ell_0.59.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.58.bb b/meta/recipes-core/ell/ell_0.59.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.58.bb
rename to meta/recipes-core/ell/ell_0.59.bb
index 04e8566305..0483dbe582 100644
--- a/meta/recipes-core/ell/ell_0.58.bb
+++ b/meta/recipes-core/ell/ell_0.59.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "531a980589c8954ff12a3110b4d958fa75a74c88ddcc3e2ace4317e76a7c1e9b"
+SRC_URI[sha256sum] = "370dc2b7c73cd57856017180a2a70a15ca1b0183bfd453b3cffe2d707c37da3d"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.39.2


--===============5055055200711210918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ell/ell-dev: PKGSIZE changed from 150678 to 114676 (-24%)

--===============5055055200711210918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ell/ell-dbg: PKGSIZE changed from 1448424 to 1447984 (-0%)
packages/core2-32-poky-linux/ell/ell-dbg: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell/ell-dbg: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell/ell-dev: PKGSIZE changed from 150678 to 114676 (-24%)
packages/core2-32-poky-linux/ell/ell-dev: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell/ell-dev: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell/ell-doc: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell/ell-doc: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell/ell-locale: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell/ell-locale: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell/ell-src: PKGSIZE changed from 1477495 to 1387849 (-6%)
packages/core2-32-poky-linux/ell/ell-src: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell/ell-src: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell/ell-staticdev: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell/ell-staticdev: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell/ell: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell/ell: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.58.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.59.tar.xz"
packages/core2-32-poky-linux/ell: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell: PV changed from "0.58" to "0.59"

--===============5055055200711210918==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.58-0.59.patch"

RnJvbSBmNDMwNzUyM2YzYzg3ODYxZWUyMThmZDA2OTg1OWQyN2Q4MmExNDlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMDc6NDc6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bGw6IHVwZ3JhZGUgMC41OCAtPiAwLjU5CgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC97ZWxs
XzAuNTguYmIgPT4gZWxsXzAuNTkuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC41OC5iYiA9PiBlbGxfMC41OS5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9lbGwvZWxsXzAuNTguYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNTkuYmIK
c2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2Vs
bF8wLjU4LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNTkuYmIKaW5k
ZXggMDRlODU2NjMwNS4uMDQ4M2RiZTU4MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
ZWxsL2VsbF8wLjU4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC41OS5iYgpA
QCAtMTUsNyArMTUsNyBAQCBERVBFTkRTID0gImRidXMiCiBpbmhlcml0IGF1dG90b29scyBwa2dj
b25maWcKIAogU1JDX1VSSSA9ICJodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9s
aW51eC9saWJzLyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjUzMWE5ODA1ODljODk1NGZmMTJhMzExMGI0ZDk1OGZhNzVhNzRjODhkZGNjM2UyYWNlNDMx
N2U3NmE3YzFlOWIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzcwZGMyYjdjNzNjZDU3ODU2MDE3
MTgwYTJhNzBhMTVjYTFiMDE4M2JmZDQ1M2IzY2ZmZTJkNzA3YzM3ZGEzZCIKIAogZG9fY29uZmln
dXJlOnByZXBlbmQgKCkgewogICAgIG1rZGlyIC1wICR7U30vYnVpbGQtYXV4Ci0tIAoyLjM5LjIK
Cg==

--===============5055055200711210918==--

