Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B97C44507
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:49:33 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8001.1783669770196296158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SSnodtgW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Vl5O25PD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f4b00c43c-d2216bab-91d7-407c-b0a3-7823adbe397e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783669769;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=+YRpx4YFcWyi+mD4IsYMa+C6WketSrnb6SrPgj2RRPg=;
	b=SSnodtgWAzd3hX0qz/MgoD2HooWcG45Brc9t6LAtTDlauCXzAMtdcQwxEkI452H7
	QX25VSOacD3I/l2cMJlWJxBEtZl3wghduyf50B65XTDfPJ5srWsxj83JDZasXZK8eyi
	xGeeO/uh40/O1Z5HMujKM1vZWzlo9ycFM3uFAcVg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783669769;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=+YRpx4YFcWyi+mD4IsYMa+C6WketSrnb6SrPgj2RRPg=;
	b=Vl5O25PDU7bU63aDXEiiQPRDG4qVq2zxDzbTdkbCgaA+LuL23/dl+GJdk/cXltcI
	EW9wmp6F1uynpioRKYDCeLOMBvTJj9n8hBUyrSz7V5RdP+Qip6aIb7BiZZr6yHNX5n/
	GbEIGIwOvjoYYb6PrYh0rPDKQTV2WQWj8FUYwyq8=
Content-Type: multipart/mixed; boundary="===============8861499607237410182=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa-demos: upgrading to
 c508611faf6f2fc30248940cdcb795b564cd6699 SUCCEEDED
Message-ID: <0101019f4b00c43c-d2216bab-91d7-407c-b0a3-7823adbe397e-000000@us-west-2.amazonses.com>
Date: Fri, 10 Jul 2026 07:49:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.10-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240609

--===============8861499607237410182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa-demos* to *c508611faf6f2fc30248940cdcb795b564cd6699* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-demos-upgrade-to-latest-revision.patch
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
From 4395d387524d35e5e5f3f444ae8a91db79b84276 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 10 Jul 2026 06:27:48 +0000
Subject: [PATCH] mesa-demos: upgrade to latest revision

---
 meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
index 6c0c3d1b56..e7fb297448 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=5;md5=2c456
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
 
-SRCREV = "188fc2354de5a9cbfd73852183a35f4982ca43d5"
+SRCREV = "c508611faf6f2fc30248940cdcb795b564cd6699"
 
 # This recipe doesn't plan to make more releases, so track upstream git commits
 PV .= "+git"
-- 
2.47.1


--===============8861499607237410182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dbg: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dev: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-doc: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-info: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-locale: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-src: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-staticdev: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf

--===============8861499607237410182==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-demos-upgrade-to-latest-revision.patch"

RnJvbSA0Mzk1ZDM4NzUyNGQzNWU1ZTVmM2Y0NDRhZThhOTFkYjc5Yjg0Mjc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTAgSnVsIDIwMjYgMDY6Mjc6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhLWRlbW9zOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvbWVzYS9tZXNhLWRlbW9zXzkuMC4wLmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL21lc2EvbWVzYS1kZW1vc185LjAuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL21lc2EtZGVtb3NfOS4wLjAuYmIKaW5kZXggNmMwYzNkMWI1Ni4uZTdmYjI5NzQ0OCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS1kZW1vc185LjAuMC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLWRlbW9zXzkuMC4wLmJiCkBA
IC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3NyYy94ZGVtb3MvZ2x4
Z2VhcnMuYztiZWdpbmxpbmU9MTtlbmRsaW5lPTU7bWQ1PTJjNDU2CiAKIFNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2RlbW9zLmdpdDtwcm90b2NvbD1odHRwczti
cmFuY2g9bWFpbiIKIAotU1JDUkVWID0gIjE4OGZjMjM1NGRlNWE5Y2JmZDczODUyMTgzYTM1ZjQ5
ODJjYTQzZDUiCitTUkNSRVYgPSAiYzUwODYxMWZhZjZmMmZjMzAyNDg5NDBjZGNiNzk1YjU2NGNk
NjY5OSIKIAogIyBUaGlzIHJlY2lwZSBkb2Vzbid0IHBsYW4gdG8gbWFrZSBtb3JlIHJlbGVhc2Vz
LCBzbyB0cmFjayB1cHN0cmVhbSBnaXQgY29tbWl0cwogUFYgLj0gIitnaXQiCi0tIAoyLjQ3LjEK
Cg==

--===============8861499607237410182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dbg: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dev: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-doc: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-info: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-locale: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-src: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-staticdev: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos: PKGV changed from 9.0.0+git0+188fc2354d to 9.0.0+git0+c508611faf

--===============8861499607237410182==--

