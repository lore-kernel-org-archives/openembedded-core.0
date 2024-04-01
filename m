Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A62CD12B6
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.44639.1711994601339404771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=azkzWZGQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=MyYt1k6L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018e9ad4825f-519ae437-d1b1-4f93-abf7-eb73d25476b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EYduTlROMD0tHoWUJelx19Kds1MHILeD/XLDML57F8w=;
	b=azkzWZGQXGj48Ycb7TJZjD6UqnY03O1l19NzO5gprJzaMg36uFdhQ28WaftQIdTd
	dpQ2StFGT3A4JftYQOzOmBy56nQcVZoL9IUDAutfVCtt08tCMY4x/qoBURifrpwLuqs
	wijmFtkSJoJdT/GqniICTJG+VL/SnQScoUu10ZwE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EYduTlROMD0tHoWUJelx19Kds1MHILeD/XLDML57F8w=;
	b=MyYt1k6L3pq/xSjWQYF5svaKiOuESH50q4pkqDh1uCqNNEd+cKCK8lZngwzyQsWK
	MVnnrTpHWOiSXHNCobN2A4V94Rco/d00T9VsvgmDo6KD6CsmOzQmlWcd8tBTrQXGrQT
	vZX/OZKfA3lkf4V0S43YdXrTcI5h2sq/4ABwuIU0=
Content-Type: multipart/mixed; boundary="===============4232825131409653670=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lzip: upgrading to 1.24.1 SUCCEEDED
Message-ID: <0101018e9ad4825f-519ae437-d1b1-4f93-abf7-eb73d25476b3-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197783

--===============4232825131409653670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lzip* to *1.24.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lzip-upgrade-1.24-1.24.1.patch
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
From fc523ee6690db25076ac1846b3503435d6429939 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 11:11:59 +0000
Subject: [PATCH] lzip: upgrade 1.24 -> 1.24.1

---
 meta/recipes-extended/lzip/{lzip_1.24.bb => lzip_1.24.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lzip/{lzip_1.24.bb => lzip_1.24.1.bb} (93%)

diff --git a/meta/recipes-extended/lzip/lzip_1.24.bb b/meta/recipes-extended/lzip/lzip_1.24.1.bb
similarity index 93%
rename from meta/recipes-extended/lzip/lzip_1.24.bb
rename to meta/recipes-extended/lzip/lzip_1.24.1.bb
index 73040a6f00..6eda012734 100644
--- a/meta/recipes-extended/lzip/lzip_1.24.bb
+++ b/meta/recipes-extended/lzip/lzip_1.24.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d42659229b10e066eeb6e81eb673cdd893b672e512d26719c2d95975556ca56c"
+SRC_URI[sha256sum] = "30c9cb6a0605f479c496c376eb629a48b0a1696d167e3c1e090c5defa481b162"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.42.0


--===============4232825131409653670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lzip: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip: SRC_URI changed from "https://download.savannah.gnu.org/releases/lzip/lzip-1.24.tar.gz" to "https://download.savannah.gnu.org/releases/lzip/lzip-1.24.1.tar.gz"
packages/core2-64-poky-linux/lzip: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip-dbg: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip-dbg: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip-dbg: PKGSIZE changed from 1043536 to 1043560 (+0%)
packages/core2-64-poky-linux/lzip/lzip-dev: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip-dev: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip-doc: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip-doc: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip-doc: PKGSIZE changed from 72739 to 72738 (-0%)
packages/core2-64-poky-linux/lzip/lzip-locale: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip-locale: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip-src: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip-src: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip-src: PKGSIZE changed from 153876 to 153934 (+0%)
packages/core2-64-poky-linux/lzip/lzip-staticdev: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip-staticdev: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip: PV changed from "1.24" to "1.24.1"

--===============4232825131409653670==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lzip-upgrade-1.24-1.24.1.patch"

RnJvbSBmYzUyM2VlNjY5MGRiMjUwNzZhYzE4NDZiMzUwMzQzNWQ2NDI5OTM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxMToxMTo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx6
aXA6IHVwZ3JhZGUgMS4yNCAtPiAxLjI0LjEKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x6
aXAve2x6aXBfMS4yNC5iYiA9PiBsemlwXzEuMjQuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbHppcC97bHppcF8xLjI0LmJiID0+IGx6aXBfMS4yNC4xLmJifSAoOTMlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9semlwL2x6aXBfMS4yNC5iYiBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9semlwL2x6aXBfMS4yNC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9semlwL2x6aXBfMS4yNC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x6aXAvbHppcF8xLjI0LjEuYmIKaW5kZXggNzMwNDBh
NmYwMC4uNmVkYTAxMjczNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x6aXAv
bHppcF8xLjI0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9semlwL2x6aXBfMS4yNC4x
LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT03NmQ2ZTMwMGZmZDhmYjlkMThiZDliMTM2YTliYmExMyBcCiAgICAgICAgICAgICAgICAgICAg
ICIKIAogU1JDX1VSSSA9ICIke1NBVkFOTkFIX0dOVV9NSVJST1J9L2x6aXAvbHppcC0ke1BWfS50
YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDQyNjU5MjI5YjEwZTA2NmVlYjZlODFlYjY3
M2NkZDg5M2I2NzJlNTEyZDI2NzE5YzJkOTU5NzU1NTZjYTU2YyIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIzMGM5Y2I2YTA2MDVmNDc5YzQ5NmMzNzZlYjYyOWE0OGIwYTE2OTZkMTY3ZTNjMWUwOTBj
NWRlZmE0ODFiMTYyIgogCiBCID0gIiR7V09SS0RJUn0vYnVpbGQiCiBkb19jb25maWd1cmVbY2xl
YW5kaXJzXSA9ICIke0J9IgotLSAKMi40Mi4wCgo=

--===============4232825131409653670==--

