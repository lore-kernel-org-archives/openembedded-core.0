Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF137C44509
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 05:42:17 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2330.1783489329948852338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 22:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HrF4Rm54;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OsuF3QHF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f403f83d8-cf80998a-0608-4b46-89b0-48af786b5289-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783489332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m2VbMPG1nVyMSWYxy5tyB3VQku94T9FesFK5doZcGm0=;
	b=HrF4Rm54qP0KfkcdiHVFxdsAGg1ekgLrku87l1xKzqv4U6R85butfSjPrRtTHqhT
	TOhkvSScG9kLjGcJ8CmNHSn+L/k4O1x82ENMeE5411u79mAQAsOeS8MaO46ge4yVgDf
	khPdz2MP2BtK65TiWQ14qQIySYAGas0rf/2TKhIU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783489332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m2VbMPG1nVyMSWYxy5tyB3VQku94T9FesFK5doZcGm0=;
	b=OsuF3QHFGV3aZYSgXsuGCsJbc9hd8/R1KmIm3DD2PqL1Mfy15axDXT8Iha1C4GZG
	FWlOgbhCA9phl4YzWbhvNyui2orq2aOSf+8MrtTAI1Xo29TmLu0KxJG+KqNhYJzvgtn
	v7Hf9szT7MxOnFVDXSRMYIpQqAbrUhlFvh7+Vd3c=
Content-Type: multipart/mixed; boundary="===============7770707509132363642=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] scdoc: upgrading to 1.11.5 SUCCEEDED
Message-ID: <0101019f403f83d8-cf80998a-0608-4b46-89b0-48af786b5289-000000@us-west-2.amazonses.com>
Date: Wed, 8 Jul 2026 05:42:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.08-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240428

--===============7770707509132363642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *scdoc* to *1.11.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-scdoc-upgrade-1.11.4-1.11.5.patch
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
From 1f8a704f69aa47c2e1d580df1186cdb7f31c961e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 8 Jul 2026 05:24:23 +0000
Subject: [PATCH] scdoc: upgrade 1.11.4 -> 1.11.5

---
 .../recipes-extended/scdoc/{scdoc_1.11.4.bb => scdoc_1.11.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/scdoc/{scdoc_1.11.4.bb => scdoc_1.11.5.bb} (91%)

diff --git a/meta/recipes-extended/scdoc/scdoc_1.11.4.bb b/meta/recipes-extended/scdoc/scdoc_1.11.5.bb
similarity index 91%
rename from meta/recipes-extended/scdoc/scdoc_1.11.4.bb
rename to meta/recipes-extended/scdoc/scdoc_1.11.5.bb
index 059150df46..4e0231dadf 100644
--- a/meta/recipes-extended/scdoc/scdoc_1.11.4.bb
+++ b/meta/recipes-extended/scdoc/scdoc_1.11.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=31752b4a8edd3fb9ddba1cb90fada74d"
 DEPENDS = "scdoc-native"
 
 SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master"
-SRCREV = "70de0e5e5d3bc40134ee65c35f1631656199f4be"
+SRCREV = "24be30ef17d5ca0162f11b35258c8fa2413d556a"
 
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
-- 
2.47.1


--===============7770707509132363642==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-scdoc-upgrade-1.11.4-1.11.5.patch"

RnJvbSAxZjhhNzA0ZjY5YWE0N2MyZTFkNTgwZGYxMTg2Y2RiN2YzMWM5NjFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOCBKdWwgMjAyNiAwNToyNDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNj
ZG9jOiB1cGdyYWRlIDEuMTEuNCAtPiAxLjExLjUKCi0tLQogLi4uL3JlY2lwZXMtZXh0ZW5kZWQv
c2Nkb2Mve3NjZG9jXzEuMTEuNC5iYiA9PiBzY2RvY18xLjExLjUuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3NjZG9jL3tzY2RvY18xLjExLjQuYmIgPT4gc2Nkb2NfMS4xMS41LmJifSAo
OTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zY2RvYy9zY2RvY18xLjEx
LjQuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2Nkb2Mvc2Nkb2NfMS4xMS41LmJiCnNpbWls
YXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zY2RvYy9z
Y2RvY18xLjExLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zY2RvYy9zY2Rv
Y18xLjExLjUuYmIKaW5kZXggMDU5MTUwZGY0Ni4uNGUwMjMxZGFkZiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3NjZG9jL3NjZG9jXzEuMTEuNC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc2Nkb2Mvc2Nkb2NfMS4xMS41LmJiCkBAIC03LDcgKzcsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0zMTc1MmI0YThlZGQzZmI5ZGRiYTFjYjkw
ZmFkYTc0ZCIKIERFUEVORFMgPSAic2Nkb2MtbmF0aXZlIgogCiBTUkNfVVJJID0gImdpdDovL2dp
dC5zci5odC9+c2lyY21wd24vc2Nkb2M7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKLVNS
Q1JFViA9ICI3MGRlMGU1ZTVkM2JjNDAxMzRlZTY1YzM1ZjE2MzE2NTYxOTlmNGJlIgorU1JDUkVW
ID0gIjI0YmUzMGVmMTdkNWNhMDE2MmYxMWIzNTI1OGM4ZmEyNDEzZDU1NmEiCiAKIGRvX2luc3Rh
bGwoKSB7CiAJb2VfcnVubWFrZSAnREVTVERJUj0ke0R9JyBpbnN0YWxsCi0tIAoyLjQ3LjEKCg==

--===============7770707509132363642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/scdoc: PV changed from "1.11.4" to "1.11.5"
packages/x86-64-v3-poky-linux/scdoc: PKGV changed from 1.11.4 [default] to 1.11.5 [default]
packages/x86-64-v3-poky-linux/scdoc/scdoc-dbg: PKGSIZE changed from 68992 to 71112 (+3%)
packages/x86-64-v3-poky-linux/scdoc/scdoc-dbg: PV changed from "1.11.4" to "1.11.5"
packages/x86-64-v3-poky-linux/scdoc/scdoc-dbg: PKGV changed from 1.11.4 [default] to 1.11.5 [default]
packages/x86-64-v3-poky-linux/scdoc/scdoc-dev: PV changed from "1.11.4" to "1.11.5"
packages/x86-64-v3-poky-linux/scdoc/scdoc-dev: PKGV changed from 1.11.4 [default] to 1.11.5 [default]
packages/x86-64-v3-poky-linux/scdoc/scdoc-doc: PKGSIZE changed from 6661 to 6692 (+0%)
packages/x86-64-v3-poky-linux/scdoc/scdoc-doc: PV changed from "1.11.4" to "1.11.5"
packages/x86-64-v3-poky-linux/scdoc/scdoc-doc: PKGV changed from 1.11.4 [default] to 1.11.5 [default]
packages/x86-64-v3-poky-linux/scdoc/scdoc-locale: PV changed from "1.11.4" to "1.11.5"
packages/x86-64-v3-poky-linux/scdoc/scdoc-locale: PKGV changed from 1.11.4 [default] to 1.11.5 [default]
packages/x86-64-v3-poky-linux/scdoc/scdoc-src: PKGSIZE changed from 24618 to 25239 (+3%)
packages/x86-64-v3-poky-linux/scdoc/scdoc-src: FILELIST: directory renamed /usr/src/debug/scdoc/1.11.4/include -> /usr/src/debug/scdoc/1.11.5/include, directory renamed /usr/src/debug/scdoc/1.11.4/src -> /usr/src/debug/scdoc/1.11.5/src
packages/x86-64-v3-poky-linux/scdoc/scdoc-src: PV changed from "1.11.4" to "1.11.5"
packages/x86-64-v3-poky-linux/scdoc/scdoc-src: PKGV changed from 1.11.4 [default] to 1.11.5 [default]
packages/x86-64-v3-poky-linux/scdoc/scdoc-staticdev: PV changed from "1.11.4" to "1.11.5"
packages/x86-64-v3-poky-linux/scdoc/scdoc-staticdev: PKGV changed from 1.11.4 [default] to 1.11.5 [default]
packages/x86-64-v3-poky-linux/scdoc/scdoc: PV changed from "1.11.4" to "1.11.5"
packages/x86-64-v3-poky-linux/scdoc/scdoc: PKGV changed from 1.11.4 [default] to 1.11.5 [default]

--===============7770707509132363642==--

