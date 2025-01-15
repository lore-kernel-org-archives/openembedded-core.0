Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9721CC02197
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:19 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.17805.1736936774455987883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gsdQnd+F;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wCJK9TTp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194697fd71f-640fb752-7bc6-448e-bb9c-a8072e39197b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936773;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FIKt6O8GMqEvjDCycC0UBnh1KG3mMojR3s+FwvamKkQ=;
	b=gsdQnd+FPni4BI8ZOI/ZxBP/ndR85tWAlRa4vjlJnxlVn5Wn0iZw+So0kMKDkJiq
	AI5XBziRG3rDYNzKdrhTknjBcQI3atfE2Zt4J7qxIqDvU8BvhPpc/lli9cPpYAAtboj
	2kpAoWnT4k92aSmUZiXgWbI/g/Qx8btUjP8+e4mg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936773;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FIKt6O8GMqEvjDCycC0UBnh1KG3mMojR3s+FwvamKkQ=;
	b=wCJK9TTpr1z5Tll9SiPJGCdprxjuzDUW5gP5YiGVdo6M683XGj2AC+EIwGm9YEzB
	HGVvpDTTTB6GHJldHXqS+C2tT9xoIuudE7sQ7Ns7ZgvoW33evKatxpKeNs1/FWtz6Ag
	YbxR2Ev5+Zw38cyzufV+5mQXfGw3oyTFHjpN5naY=
Content-Type: multipart/mixed; boundary="===============6487962594479184093=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.28 SUCCEEDED
Message-ID: <01010194697fd71f-640fb752-7bc6-448e-bb9c-a8072e39197b-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209861

--===============6487962594479184093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *msmtp* to *1.8.28* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.27-1.8.28.patch
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
From dc9af17fec681fa0872f6d9522b857f6112b2099 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 08:29:20 +0000
Subject: [PATCH] msmtp: upgrade 1.8.27 -> 1.8.28

---
 .../recipes-extended/msmtp/{msmtp_1.8.27.bb => msmtp_1.8.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.27.bb => msmtp_1.8.28.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.27.bb b/meta/recipes-extended/msmtp/msmtp_1.8.28.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.27.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.28.bb
index 3f10be9f5e..48c597de24 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.27.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.28.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "94030580a63a747faa0a3b9b1b264ae355aad33a4d94b832bfeb5b21633c965e"
+SRC_URI[sha256sum] = "3a57f155f54e4860f7dd42138d9bea1af615b99dfab5ab4cd728fc8c09a647a4"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.44.1


--===============6487962594479184093==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.27-1.8.28.patch"

RnJvbSBkYzlhZjE3ZmVjNjgxZmEwODcyZjZkOTUyMmI4NTdmNjExMmIyMDk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDg6Mjk6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
c210cDogdXBncmFkZSAxLjguMjcgLT4gMS44LjI4CgotLS0KIC4uLi9yZWNpcGVzLWV4dGVuZGVk
L21zbXRwL3ttc210cF8xLjguMjcuYmIgPT4gbXNtdHBfMS44LjI4LmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9tc210cC97bXNtdHBfMS44LjI3LmJiID0+IG1zbXRwXzEuOC4yOC5iYn0g
KDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44
LjI3LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4yOC5iYgpzaW1p
bGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAv
bXNtdHBfMS44LjI3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNt
dHBfMS44LjI4LmJiCmluZGV4IDNmMTBiZTlmNWUuLjQ4YzU5N2RlMjQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210cF8xLjguMjcuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4yOC5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1kMzIyMzliY2I2NzM0NjNhYjg3NGU4
MGQ0N2ZhZTUwNCIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL21hcmxhbS5kZS9tc210
cC9kb3dubG9hZC8iCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9tYXJsYW0uZGUvJHtCUE59L3JlbGVh
c2VzLyR7QlB9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5NDAzMDU4MGE2M2E3NDdm
YWEwYTNiOWIxYjI2NGFlMzU1YWFkMzNhNGQ5NGI4MzJiZmViNWIyMTYzM2M5NjVlIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjNhNTdmMTU1ZjU0ZTQ4NjBmN2RkNDIxMzhkOWJlYTFhZjYxNWI5OWRm
YWI1YWI0Y2Q3MjhmYzhjMDlhNjQ3YTQiCiAKIGluaGVyaXQgZ2V0dGV4dCBhdXRvdG9vbHMgdXBk
YXRlLWFsdGVybmF0aXZlcyBwa2djb25maWcKIAotLSAKMi40NC4xCgo=

--===============6487962594479184093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.27.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.28.tar.xz"
packages/core2-64-poky-linux/msmtp: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 462056 to 462280 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 116721 to 116972 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-es: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-es: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ro: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ro: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ru: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ru: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PKGSIZE changed from 45456 to 45662 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-sv: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-sv: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-src: PKGSIZE changed from 520376 to 521379 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-src: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.27" to "1.8.28"
packages/core2-64-poky-linux/msmtp/msmtp: PKGV changed from 1.8.27 [default] to 1.8.28 [default]
packages/core2-64-poky-linux/msmtp/msmtp: PV changed from "1.8.27" to "1.8.28"

--===============6487962594479184093==--

