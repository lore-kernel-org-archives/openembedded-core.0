Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C89AC10F19
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:08 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.13450.1713248041096109880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hlWTQe+I;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CE6XnJu2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018ee58a765c-5dbba61e-6ca5-4d35-9189-2096fe4c87f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cftRbLpdvPXPNq5Fql7Ey4D7zitTlBaIU/uuvprJf+U=;
	b=hlWTQe+I3NtFsNS4eQ9e4jk3bnegZLBXbTk+MeGfNYfsPN2uhyq9599cYc3Bec+9
	j4q8iTSO7P+NxAUB8VzLlq51NIgdEBGheuDrgZ39ssS/zMctCi4wOUEqNJr8kjcgyGo
	FVXxHeSuXMUsKF3EBPiKbI5e9skNgGzga3n+tHO0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cftRbLpdvPXPNq5Fql7Ey4D7zitTlBaIU/uuvprJf+U=;
	b=CE6XnJu2AO/DG9O0ym3Nn7Xl3n//2aK/enCBpHP8KtwJpo+n8cG2k1ljuuulBygK
	fj3P8vUz3Fe+BwdrAOPtJR7xxmhim/nNVgH/BEH0vbAYdfkXY8FgHJyT/f8Lxrcq23t
	skeXxMf713QbsC3JuvLeeJZyGRNf3cV21ub7L28A=
Content-Type: multipart/mixed; boundary="===============6404155583414020165=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lzip: upgrading to 1.24.1 SUCCEEDED
Message-ID: <0101018ee58a765c-5dbba61e-6ca5-4d35-9189-2096fe4c87f4-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198331

--===============6404155583414020165==
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
From 45e7b9b8934626f71dae927fe29da37b9b85e075 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 21:51:26 +0000
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


--===============6404155583414020165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lzip: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip: SRC_URI changed from "https://download.savannah.gnu.org/releases/lzip/lzip-1.24.tar.gz" to "https://download.savannah.gnu.org/releases/lzip/lzip-1.24.1.tar.gz"
packages/core2-64-poky-linux/lzip: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip-dbg: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip-dbg: PKGSIZE changed from 1043536 to 1043560 (+0%)
packages/core2-64-poky-linux/lzip/lzip-dbg: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip-dev: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip-dev: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip-doc: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip-doc: PKGSIZE changed from 72739 to 72738 (-0%)
packages/core2-64-poky-linux/lzip/lzip-doc: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip-locale: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip-locale: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip-src: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip-src: PKGSIZE changed from 153876 to 153934 (+0%)
packages/core2-64-poky-linux/lzip/lzip-src: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip-staticdev: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip-staticdev: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip/lzip: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip/lzip: PV changed from "1.24" to "1.24.1"

--===============6404155583414020165==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lzip-upgrade-1.24-1.24.1.patch"

RnJvbSA0NWU3YjliODkzNDYyNmY3MWRhZTkyN2ZlMjlkYTM3YjliODVlMDc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjE6NTE6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
emlwOiB1cGdyYWRlIDEuMjQgLT4gMS4yNC4xCgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9s
emlwL3tsemlwXzEuMjQuYmIgPT4gbHppcF8xLjI0LjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2x6aXAve2x6aXBfMS4yNC5iYiA9PiBsemlwXzEuMjQuMS5iYn0gKDkzJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHppcC9semlwXzEuMjQuYmIgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbHppcC9semlwXzEuMjQuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHppcC9semlwXzEuMjQuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9semlwL2x6aXBfMS4yNC4xLmJiCmluZGV4IDczMDQw
YTZmMDAuLjZlZGEwMTI3MzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9semlw
L2x6aXBfMS4yNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHppcC9semlwXzEuMjQu
MS5iYgpAQCAtOCw3ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9NzZkNmUzMDBmZmQ4ZmI5ZDE4YmQ5YjEzNmE5YmJhMTMgXAogICAgICAgICAgICAgICAgICAg
ICAiCiAKIFNSQ19VUkkgPSAiJHtTQVZBTk5BSF9HTlVfTUlSUk9SfS9semlwL2x6aXAtJHtQVn0u
dGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ0MjY1OTIyOWIxMGUwNjZlZWI2ZTgxZWI2
NzNjZGQ4OTNiNjcyZTUxMmQyNjcxOWMyZDk1OTc1NTU2Y2E1NmMiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMzBjOWNiNmEwNjA1ZjQ3OWM0OTZjMzc2ZWI2MjlhNDhiMGExNjk2ZDE2N2UzYzFlMDkw
YzVkZWZhNDgxYjE2MiIKIAogQiA9ICIke1dPUktESVJ9L2J1aWxkIgogZG9fY29uZmlndXJlW2Ns
ZWFuZGlyc10gPSAiJHtCfSIKLS0gCjIuNDIuMAoK

--===============6404155583414020165==--

