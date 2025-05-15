Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238FEC71132
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.11260.1747312312429516824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ao8S+6an;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=sqvXyKUc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010196d3ee403e-ab1ed353-1923-4dec-8a6c-b5dbea2bc67f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BhIriWQbWCohCPxVw5AAogPcWleqxlCvX5s6rv6/RDY=;
	b=ao8S+6angUTVcKrcwO61lW0gDi7JhwmdL1259/Qy9juiujlPZ+MqfycYoL4bb4Vu
	xeOItZp9y6cK7tw1zrr0Es5fL9hmAiPyr3iisiptzCkpcVRL7gvIqOZEKnJ2SMn8dBW
	aTlUBVTcMsoHIhCJYvKKPXXM32cNv+TvCDW74OCs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BhIriWQbWCohCPxVw5AAogPcWleqxlCvX5s6rv6/RDY=;
	b=sqvXyKUcx8g+rq55fGCjv9w9R+7gF6ehkRyt0lxVj/O2KKQNkGGqXLofUwMWHwAl
	99CIbZi1IAylMhMeCbo2AAI6ssVu3NaCVtmUdG5yW40I+R+czntI5qH2s/h2m0zB6/g
	Jj3RQt+lYCo5wVZ0swahMhFivIwJTe61qyHU5PHA=
Content-Type: multipart/mixed; boundary="===============3184024312142909946=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburcu: upgrading to 0.15.3 SUCCEEDED
Message-ID: <01010196d3ee403e-ab1ed353-1923-4dec-8a6c-b5dbea2bc67f-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216662

--===============3184024312142909946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *liburcu* to *0.15.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-liburcu-upgrade-0.15.2-0.15.3.patch
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
From afe75cf7303f6c0c185ad4ec94192e1225b4cfbf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 12:27:45 +0000
Subject: [PATCH] liburcu: upgrade 0.15.2 -> 0.15.3

---
 .../liburcu/{liburcu_0.15.2.bb => liburcu_0.15.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.15.2.bb => liburcu_0.15.3.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.15.2.bb b/meta/recipes-support/liburcu/liburcu_0.15.3.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.15.2.bb
rename to meta/recipes-support/liburcu/liburcu_0.15.3.bb
index 93d6a6551f..fb4e457719 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.2.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.3.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "59f36f2b8bda1b7620a7eced2634f26c549444818a8313025a3bb09c0766a61d"
+SRC_URI[sha256sum] = "26687ec84e3e114759454c884a08abeaf79dec09b041895ddf4c45ec150acb6d"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.47.1


--===============3184024312142909946==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-liburcu-upgrade-0.15.2-0.15.3.patch"

RnJvbSBhZmU3NWNmNzMwM2Y2YzBjMTg1YWQ0ZWM5NDE5MmUxMjI1YjRjZmJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMTI6Mjc6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1cmN1OiB1cGdyYWRlIDAuMTUuMiAtPiAwLjE1LjMKCi0tLQogLi4uL2xpYnVyY3Uve2xpYnVy
Y3VfMC4xNS4yLmJiID0+IGxpYnVyY3VfMC4xNS4zLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlidXJjdS97bGlidXJjdV8wLjE1LjIuYmIgPT4gbGlidXJjdV8wLjE1
LjMuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXJjdS9s
aWJ1cmN1XzAuMTUuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVyY3UvbGlidXJjdV8w
LjE1LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlidXJjdS9saWJ1cmN1XzAuMTUuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlidXJjdS9saWJ1cmN1XzAuMTUuMy5iYgppbmRleCA5M2Q2YTY1NTFmLi5mYjRlNDU3
NzE5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1cmN1L2xpYnVyY3VfMC4x
NS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVyY3UvbGlidXJjdV8wLjE1LjMu
YmIKQEAgLTE0LDcgKzE0LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5t
ZDttZDU9YzJhOTI0OThiNmU4OGUyNzZmOTg2ODc3OTk1NDI1YjggXAogCiBTUkNfVVJJID0gImh0
dHA6Ly9sdHRuZy5vcmcvZmlsZXMvdXJjdS91c2Vyc3BhY2UtcmN1LSR7UFZ9LnRhci5iejIiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1OWYzNmYyYjhiZGExYjc2MjBhN2VjZWQyNjM0ZjI2YzU0
OTQ0NDgxOGE4MzEzMDI1YTNiYjA5YzA3NjZhNjFkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI2
Njg3ZWM4NGUzZTExNDc1OTQ1NGM4ODRhMDhhYmVhZjc5ZGVjMDliMDQxODk1ZGRmNGM0NWVjMTUw
YWNiNmQiCiAKIFMgPSAiJHtXT1JLRElSfS91c2Vyc3BhY2UtcmN1LSR7UFZ9IgogaW5oZXJpdCBh
dXRvdG9vbHMgbXVsdGlsaWJfaGVhZGVyCi0tIAoyLjQ3LjEKCg==

--===============3184024312142909946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/liburcu: PV changed from "0.15.2" to "0.15.3"
packages/core2-64-poky-linux/liburcu: SRC_URI changed from "http://lttng.org/files/urcu/userspace-rcu-0.15.2.tar.bz2" to "http://lttng.org/files/urcu/userspace-rcu-0.15.3.tar.bz2"
packages/core2-64-poky-linux/liburcu: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/core2-64-poky-linux/liburcu/liburcu-dbg: PV changed from "0.15.2" to "0.15.3"
packages/core2-64-poky-linux/liburcu/liburcu-dbg: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/core2-64-poky-linux/liburcu/liburcu-dev: PV changed from "0.15.2" to "0.15.3"
packages/core2-64-poky-linux/liburcu/liburcu-dev: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/core2-64-poky-linux/liburcu/liburcu-dev: PKGSIZE changed from 361909 to 362025 (+0%)
packages/core2-64-poky-linux/liburcu/liburcu-doc: PV changed from "0.15.2" to "0.15.3"
packages/core2-64-poky-linux/liburcu/liburcu-doc: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/core2-64-poky-linux/liburcu/liburcu-locale: PV changed from "0.15.2" to "0.15.3"
packages/core2-64-poky-linux/liburcu/liburcu-locale: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/core2-64-poky-linux/liburcu/liburcu-src: PV changed from "0.15.2" to "0.15.3"
packages/core2-64-poky-linux/liburcu/liburcu-src: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/core2-64-poky-linux/liburcu/liburcu-staticdev: PV changed from "0.15.2" to "0.15.3"
packages/core2-64-poky-linux/liburcu/liburcu-staticdev: PKGV changed from 0.15.2 [default] to 0.15.3 [default]
packages/core2-64-poky-linux/liburcu/liburcu: PV changed from "0.15.2" to "0.15.3"
packages/core2-64-poky-linux/liburcu/liburcu: PKGV changed from 0.15.2 [default] to 0.15.3 [default]

--===============3184024312142909946==--

