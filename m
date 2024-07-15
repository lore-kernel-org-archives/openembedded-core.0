Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A40EC52D7C
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:15 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1370.1721071147062817925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZMN68Y3u;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ExIvuxLv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010190b7d59de3-6de9a3ae-6952-4606-84b6-7ab5a6fcadeb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3F+/3TTMK+xo45leadMkFzjJVLHqCV1+44eRMLlLqiY=;
	b=ZMN68Y3ulJOWh9IHBbfM+RAoW3JYGk/kwfwgKbKG9E/eFSz6rpOvmz9l0r27Yr1w
	aKcF/EjI4Y4c3tAE3ZJsTSKWijFrA0EGbJmp8E+uM3vEGgWW0P7jyv11llFDe2e9ALK
	A0IshHDuYpm4oKWn+88dlsZRnQc4KIuKStqH9eu8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3F+/3TTMK+xo45leadMkFzjJVLHqCV1+44eRMLlLqiY=;
	b=ExIvuxLv2hRAUWLfxPSWyk6qulifHOOdKuvpgoPrGR8XgwlT87PFOU9crwvKT4ly
	zlwFIv/r60fyJSYdTQn4McVl/qjikHoNEc+xW/gUHW5PiP+j2LyScb7rt7r9d+zZmW/
	BE2JOsu8a0MqtJ+m1zS1YdS1riSGFzJ+L8Zh6bqU=
Content-Type: multipart/mixed; boundary="===============3237966753295855493=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.20 SUCCEEDED
Message-ID: <01010190b7d59de3-6de9a3ae-6952-4606-84b6-7ab5a6fcadeb-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202031

--===============3237966753295855493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *debianutils* to *5.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.19-5.20.patch
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
From f6f9158d45899e4a1b9979d4a9aadc65fa37657a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 17:57:20 +0000
Subject: [PATCH] debianutils: upgrade 5.19 -> 5.20

---
 .../debianutils/{debianutils_5.19.bb => debianutils_5.20.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.19.bb => debianutils_5.20.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.19.bb b/meta/recipes-support/debianutils/debianutils_5.20.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.19.bb
rename to meta/recipes-support/debianutils/debianutils_5.20.bb
index 0fe9b1ec14..61438121da 100644
--- a/meta/recipes-support/debianutils/debianutils_5.19.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.20.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "295d7674cdd526f3c9ec9de76db50efa280a5df0"
+SRCREV = "9f3d6fa6b8d91849a78d681294fa8ea7bfa9086f"
 
 inherit autotools update-alternatives
 
-- 
2.44.0


--===============3237966753295855493==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.19-5.20.patch"

RnJvbSBmNmY5MTU4ZDQ1ODk5ZTRhMWI5OTc5ZDRhOWFhZGM2NWZhMzc2NTdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTc6NTc6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZWJpYW51dGlsczogdXBncmFkZSA1LjE5IC0+IDUuMjAKCi0tLQogLi4uL2RlYmlhbnV0aWxzL3tk
ZWJpYW51dGlsc181LjE5LmJiID0+IGRlYmlhbnV0aWxzXzUuMjAuYmJ9ICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMve2RlYmlhbnV0aWxzXzUuMTkuYmIgPT4gZGViaWFu
dXRpbHNfNS4yMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9k
ZWJpYW51dGlscy9kZWJpYW51dGlsc181LjE5LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGVi
aWFudXRpbHMvZGViaWFudXRpbHNfNS4yMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjE5LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181
LjIwLmJiCmluZGV4IDBmZTliMWVjMTQuLjYxNDM4MTIxZGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMTkuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4yMC5iYgpAQCAtMTEsNyAr
MTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9kZWJpYW4vY29weXJpZ2h0O21kNT00
YjY2N2YzMDQxMWQyMWJjOGZkN2RiODVkNTAyYThlOQogU1JDX1VSSSA9ICJnaXQ6Ly9zYWxzYS5k
ZWJpYW4ub3JnL2RlYmlhbi9kZWJpYW51dGlscy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1h
c3RlciBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gIjI5NWQ3Njc0Y2RkNTI2ZjNjOWVjOWRl
NzZkYjUwZWZhMjgwYTVkZjAiCitTUkNSRVYgPSAiOWYzZDZmYTZiOGQ5MTg0OWE3OGQ2ODEyOTRm
YThlYTdiZmE5MDg2ZiIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdXBkYXRlLWFsdGVybmF0aXZlcwog
Ci0tIAoyLjQ0LjAKCg==

--===============3237966753295855493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.19 [default] to 5.20 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PV changed from "5.19" to "5.20"
packages/core2-64-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.19 [default] to 5.20 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dev: PV changed from "5.19" to "5.20"
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.19 [default] to 5.20 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: PV changed from "5.19" to "5.20"
packages/core2-64-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.19 [default] to 5.20 [default]
packages/core2-64-poky-linux/debianutils/debianutils-locale: PV changed from "5.19" to "5.20"
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.19 [default] to 5.20 [default]
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.19" to "5.20"
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGV changed from 5.19 [default] to 5.20 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PV changed from "5.19" to "5.20"
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.19 [default] to 5.20 [default]
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.19" to "5.20"
packages/core2-64-poky-linux/debianutils/debianutils: PKGSIZE changed from 49656 to 49679 (+0%)
packages/core2-64-poky-linux/debianutils/debianutils: PKGV changed from 5.19 [default] to 5.20 [default]
packages/core2-64-poky-linux/debianutils/debianutils: PV changed from "5.19" to "5.20"
packages/core2-64-poky-linux/debianutils: PKGV changed from 5.19 [default] to 5.20 [default]
packages/core2-64-poky-linux/debianutils: PV changed from "5.19" to "5.20"

--===============3237966753295855493==--

