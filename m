Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA3EC54792
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.2163.1706810407109392163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Vn9PWC9Y;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ghgjFe17;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018d65d3f628-66e6763d-dab6-4c0d-add2-c1b510f6f305-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VyVI5DEGKoB0E+KBB+cU1PNrHqtirOTdLLyEaIIGsqA=;
	b=Vn9PWC9YC0+6PDLyFMizWRFFef8JnBUrSUsFUm4wUVS7zrUnzqO1DMbQ/QU/nszi
	G75BVhbvyr99s5qXbIsyKDDP5BdezNEXQk1fGNBnpcR0QRklCXMk1HYR3naBd+CPozR
	BKfMIEaLKgoNhefwrrAcqfEOjz2sR5QFvxFR92Ec=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VyVI5DEGKoB0E+KBB+cU1PNrHqtirOTdLLyEaIIGsqA=;
	b=ghgjFe17i/mfNyo9mV+oQ0t/ERxnYxE1/quDCSH3O1Xm/TrKhFVncnDqVsZOsILq
	pbkJHrfQthQOmGgICpvhv+dbRm6pl2D95Eh/mws6Z5XIwrGl/rqDEEkuoAPPO4flUN4
	QTi7an2mm1DgcC4qJpQ9UtgnaIzFqlEcTDowu6yU=
Content-Type: multipart/mixed; boundary="===============2654611999356192391=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lzip: upgrading to 1.24 SUCCEEDED
Message-ID: <0101018d65d3f628-66e6763d-dab6-4c0d-add2-c1b510f6f305-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194668

--===============2654611999356192391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lzip* to *1.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lzip-upgrade-1.23-1.24.patch
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
From 63c73484f7b0fdab2b2666d74b2ce7bf74268bda Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 11:29:18 +0000
Subject: [PATCH] lzip: upgrade 1.23 -> 1.24

---
 meta/recipes-extended/lzip/{lzip_1.23.bb => lzip_1.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lzip/{lzip_1.23.bb => lzip_1.24.bb} (93%)

diff --git a/meta/recipes-extended/lzip/lzip_1.23.bb b/meta/recipes-extended/lzip/lzip_1.24.bb
similarity index 93%
rename from meta/recipes-extended/lzip/lzip_1.23.bb
rename to meta/recipes-extended/lzip/lzip_1.24.bb
index 12e8fa6c58..73040a6f00 100644
--- a/meta/recipes-extended/lzip/lzip_1.23.bb
+++ b/meta/recipes-extended/lzip/lzip_1.24.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4792c047ddf15ef29d55ba8e68a1a21e0cb7692d87ecdf7204419864582f280d"
+SRC_URI[sha256sum] = "d42659229b10e066eeb6e81eb673cdd893b672e512d26719c2d95975556ca56c"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.42.0


--===============2654611999356192391==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-lzip-upgrade-1.23-1.24.patch"

RnJvbSA2M2M3MzQ4NGY3YjBmZGFiMmIyNjY2ZDc0YjJjZTdiZjc0MjY4YmRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxMToyOToxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx6
aXA6IHVwZ3JhZGUgMS4yMyAtPiAxLjI0CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9semlw
L3tsemlwXzEuMjMuYmIgPT4gbHppcF8xLjI0LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9semlwL3tsemlwXzEuMjMuYmIgPT4gbHppcF8xLjI0LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9semlwL2x6aXBfMS4yMy5iYiBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9semlwL2x6aXBfMS4yNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHppcC9semlwXzEuMjMuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9semlwL2x6aXBfMS4yNC5iYgppbmRleCAxMmU4ZmE2YzU4Li43MzA0
MGE2ZjAwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHppcC9semlwXzEuMjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x6aXAvbHppcF8xLjI0LmJiCkBAIC04LDcg
KzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT03NmQ2ZTMwMGZm
ZDhmYjlkMThiZDliMTM2YTliYmExMyBcCiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VS
SSA9ICIke1NBVkFOTkFIX0dOVV9NSVJST1J9L2x6aXAvbHppcC0ke1BWfS50YXIuZ3oiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNDc5MmMwNDdkZGYxNWVmMjlkNTViYThlNjhhMWEyMWUwY2I3Njky
ZDg3ZWNkZjcyMDQ0MTk4NjQ1ODJmMjgwZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkNDI2NTky
MjliMTBlMDY2ZWViNmU4MWViNjczY2RkODkzYjY3MmU1MTJkMjY3MTljMmQ5NTk3NTU1NmNhNTZj
IgogCiBCID0gIiR7V09SS0RJUn0vYnVpbGQiCiBkb19jb25maWd1cmVbY2xlYW5kaXJzXSA9ICIk
e0J9IgotLSAKMi40Mi4wCgo=

--===============2654611999356192391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lzip: SRC_URI changed from "https://download.savannah.gnu.org/releases/lzip/lzip-1.23.tar.gz" to "https://download.savannah.gnu.org/releases/lzip/lzip-1.24.tar.gz"
packages/core2-64-poky-linux/lzip: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/lzip: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/lzip/lzip-dbg: PKGSIZE changed from 1028312 to 1043536 (+1%)
packages/core2-64-poky-linux/lzip/lzip-dbg: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/lzip/lzip-dbg: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/lzip/lzip-dev: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/lzip/lzip-dev: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/lzip/lzip-doc: PKGSIZE changed from 71489 to 72739 (+2%)
packages/core2-64-poky-linux/lzip/lzip-doc: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/lzip/lzip-doc: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/lzip/lzip-locale: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/lzip/lzip-locale: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/lzip/lzip-src: PKGSIZE changed from 150735 to 153876 (+2%)
packages/core2-64-poky-linux/lzip/lzip-src: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/lzip/lzip-src: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/lzip/lzip-staticdev: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/lzip/lzip-staticdev: PV changed from "1.23" to "1.24"
packages/core2-64-poky-linux/lzip/lzip: PKGSIZE changed from 121800 to 121848 (+0%)
packages/core2-64-poky-linux/lzip/lzip: PKGV changed from 1.23 [default] to 1.24 [default]
packages/core2-64-poky-linux/lzip/lzip: PV changed from "1.23" to "1.24"

--===============2654611999356192391==--

