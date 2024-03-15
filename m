Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23472C54ED4
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1278.1710522013030419215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ONsB0Aa3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=s02uD1Md;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e430e92c8-3f7ba2c7-4e29-42b0-af93-dc622a0d2640-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522012;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CWeGnrRYSJV+Rq+mL2KCdyaJScfbcxnSkQ4QT2c6mrE=;
	b=ONsB0Aa3ecM2kQ6aYmSx/0irQPhq9xr1CO1Oh6GpRFFHfwuokRm0HowlPjfGqTG/
	fJqYE9M/jej/7hDIcBcXiDoXpxFiPcJiR3VThEIg/hgBILrlXs+MhyYtZoZEL/PTHNk
	q/MVK7nqNRirmC7NIqkSSRXLvV4efPVFsn8cIcaM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522012;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CWeGnrRYSJV+Rq+mL2KCdyaJScfbcxnSkQ4QT2c6mrE=;
	b=s02uD1Md6cw1VycLS4O/IF1unX8naFNEyNoba5RFPcg41JLS4Wo2waHTpkDWqul5
	sFJ+E++y6Z2Qk1/WIic2NkJPLZYLUa8Ury2L6/XDJJucoq5wEVChI2TxyCkIlnrz4FR
	+QOMqmuIk1pdlzT3Fc1QAJYRUlLips1psmYpC4hg=
Content-Type: multipart/mixed; boundary="===============0161387486996642076=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lzip: upgrading to 1.24.1 SUCCEEDED
Message-ID: <0101018e430e92c8-3f7ba2c7-4e29-42b0-af93-dc622a0d2640-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197195

--===============0161387486996642076==
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
From fd33e4ac5099acf2040fdc9a4095369593a0633b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 10:39:43 +0000
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


--===============0161387486996642076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/lzip: PKGV changed from 1.24 [default] to 1.24.1 [default]
packages/core2-64-poky-linux/lzip: PV changed from "1.24" to "1.24.1"
packages/core2-64-poky-linux/lzip: SRC_URI changed from "https://download.savannah.gnu.org/releases/lzip/lzip-1.24.tar.gz" to "https://download.savannah.gnu.org/releases/lzip/lzip-1.24.1.tar.gz"
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

--===============0161387486996642076==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lzip-upgrade-1.24-1.24.1.patch"

RnJvbSBmZDMzZTRhYzUwOTlhY2YyMDQwZmRjOWE0MDk1MzY5NTkzYTA2MzNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTA6Mzk6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
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

--===============0161387486996642076==--

