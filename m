Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEDACEDD8A
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:17 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11963.1763224751168826436
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Si3F/CWQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fD8wGJhi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a886298dc-0ab3395b-bd39-449e-80b4-2ac0fd8a9f82-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mJ4gIDnbH9IGboDn9zyUPT2ATVQDoDUebryd0ejxZXc=;
	b=Si3F/CWQo7RqPhQZEdN0+mvTJjzdzXqGlARrLcnoa0C2VxnD5nFCAhvipdnmO62z
	meTOuYHvQ3lFgkSuHrCaUDI5zuXvOhdLu6CXk60C2sYAfQimTwN3RUay8/7MduFlynR
	tkyi54d6FODMF79b0CUOUPjBq9Ab5M55jw4ZItEc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mJ4gIDnbH9IGboDn9zyUPT2ATVQDoDUebryd0ejxZXc=;
	b=fD8wGJhiD6z6KsHlb8yHUdE0MTphudDA/0EvpSBn/cYYSDn+z+6vtQXw1SE62IPJ
	GNz/7l1sSCDD8ouZwUoCJJQ/2p3W/mKflptmjzLi0Z8LOQM//Mkdmso+tuvsRBq/STb
	wHOuVkba7mt3786RqKn9IH+t7STeUjy3bxHvH5tc=
Content-Type: multipart/mixed; boundary="===============7753325616765713722=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburcu: upgrading to 0.15.5 SUCCEEDED
Message-ID: <0101019a886298dc-0ab3395b-bd39-449e-80b4-2ac0fd8a9f82-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226454

--===============7753325616765713722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *liburcu* to *0.15.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-liburcu-upgrade-0.15.3-0.15.5.patch
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
From e2434f818bee29af1ea06cb5366303c4be1fe020 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 16:31:18 +0000
Subject: [PATCH] liburcu: upgrade 0.15.3 -> 0.15.5

---
 .../liburcu/{liburcu_0.15.3.bb => liburcu_0.15.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.15.3.bb => liburcu_0.15.5.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.15.3.bb b/meta/recipes-support/liburcu/liburcu_0.15.5.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.15.3.bb
rename to meta/recipes-support/liburcu/liburcu_0.15.5.bb
index fdbd79e016..94124c6391 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.3.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.5.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "26687ec84e3e114759454c884a08abeaf79dec09b041895ddf4c45ec150acb6d"
+SRC_URI[sha256sum] = "b2f787a8a83512c32599e71cdabcc5131464947b82014896bd11413b2d782de1"
 
 S = "${UNPACKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.47.1


--===============7753325616765713722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/liburcu: SRC_URI changed from "http://lttng.org/files/urcu/userspace-rcu-0.15.3.tar.bz2" to "http://lttng.org/files/urcu/userspace-rcu-0.15.5.tar.bz2"
packages/x86-64-v3-poky-linux/liburcu: PKGV changed from 0.15.3 [default] to 0.15.5 [default]
packages/x86-64-v3-poky-linux/liburcu: PV changed from "0.15.3" to "0.15.5"
packages/x86-64-v3-poky-linux/liburcu/liburcu-dbg: PKGSIZE changed from 896768 to 897248 (+0%)
packages/x86-64-v3-poky-linux/liburcu/liburcu-dbg: PKGV changed from 0.15.3 [default] to 0.15.5 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-dbg: PV changed from "0.15.3" to "0.15.5"
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: PKGSIZE changed from 362025 to 365006 (+1%)
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: FILELIST: added "/usr/include/urcu/uatomic/builtins-x86.h"
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: PKGV changed from 0.15.3 [default] to 0.15.5 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: PV changed from "0.15.3" to "0.15.5"
packages/x86-64-v3-poky-linux/liburcu/liburcu-doc: PKGV changed from 0.15.3 [default] to 0.15.5 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-doc: PV changed from "0.15.3" to "0.15.5"
packages/x86-64-v3-poky-linux/liburcu/liburcu-locale: PKGV changed from 0.15.3 [default] to 0.15.5 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-locale: PV changed from "0.15.3" to "0.15.5"
packages/x86-64-v3-poky-linux/liburcu/liburcu-src: PKGV changed from 0.15.3 [default] to 0.15.5 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-src: PV changed from "0.15.3" to "0.15.5"
packages/x86-64-v3-poky-linux/liburcu/liburcu-staticdev: PKGV changed from 0.15.3 [default] to 0.15.5 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-staticdev: PV changed from "0.15.3" to "0.15.5"
packages/x86-64-v3-poky-linux/liburcu/liburcu: PKGV changed from 0.15.3 [default] to 0.15.5 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu: PV changed from "0.15.3" to "0.15.5"
Changes to packages/x86-64-v3-poky-linux/liburcu (sysroot):
  /usr/include/urcu/uatomic/builtins-x86.h was added

--===============7753325616765713722==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-liburcu-upgrade-0.15.3-0.15.5.patch"

RnJvbSBlMjQzNGY4MThiZWUyOWFmMWVhMDZjYjUzNjYzMDNjNGJlMWZlMDIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTY6MzE6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1cmN1OiB1cGdyYWRlIDAuMTUuMyAtPiAwLjE1LjUKCi0tLQogLi4uL2xpYnVyY3Uve2xpYnVy
Y3VfMC4xNS4zLmJiID0+IGxpYnVyY3VfMC4xNS41LmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlidXJjdS97bGlidXJjdV8wLjE1LjMuYmIgPT4gbGlidXJjdV8wLjE1
LjUuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXJjdS9s
aWJ1cmN1XzAuMTUuMy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVyY3UvbGlidXJjdV8w
LjE1LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlidXJjdS9saWJ1cmN1XzAuMTUuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlidXJjdS9saWJ1cmN1XzAuMTUuNS5iYgppbmRleCBmZGJkNzllMDE2Li45NDEyNGM2
MzkxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1cmN1L2xpYnVyY3VfMC4x
NS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVyY3UvbGlidXJjdV8wLjE1LjUu
YmIKQEAgLTEzLDcgKzEzLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5t
ZDttZDU9YzJhOTI0OThiNmU4OGUyNzZmOTg2ODc3OTk1NDI1YjggXAogCiBTUkNfVVJJID0gImh0
dHA6Ly9sdHRuZy5vcmcvZmlsZXMvdXJjdS91c2Vyc3BhY2UtcmN1LSR7UFZ9LnRhci5iejIiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyNjY4N2VjODRlM2UxMTQ3NTk0NTRjODg0YTA4YWJlYWY3
OWRlYzA5YjA0MTg5NWRkZjRjNDVlYzE1MGFjYjZkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImIy
Zjc4N2E4YTgzNTEyYzMyNTk5ZTcxY2RhYmNjNTEzMTQ2NDk0N2I4MjAxNDg5NmJkMTE0MTNiMmQ3
ODJkZTEiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9L3VzZXJzcGFjZS1yY3UtJHtQVn0iCiBpbmhlcml0
IGF1dG90b29scyBtdWx0aWxpYl9oZWFkZXIKLS0gCjIuNDcuMQoK

--===============7753325616765713722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: FILELIST: added "/usr/include/urcu/uatomic/builtins-x86.h"
Changes to packages/x86-64-v3-poky-linux/liburcu (sysroot):
  /usr/include/urcu/uatomic/builtins-x86.h was added

--===============7753325616765713722==--

