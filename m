Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644D5D4899D
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:03 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1443.1768526752194540509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YZa8ytZm;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=GrRigxff;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019bc468c457-6b231e9b-32c2-47fa-86db-087c8f0d875b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526759;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=An+N3x30UtGqRDEUE/cK2hNsM79zeDAI9uuPZvn+Qyo=;
	b=YZa8ytZmbHHGil9hPGiKpK+s5ITY+0qN6F3cyCDRdsvNfo8nG9f5q0tCRk7aGyar
	ZlSmHFCjgTq2eGiYTduLiSNif7tLvHaCMhf20eDrBU3mwShrEqPMiAE0B5ZDWZ8IzIG
	osP44gSe2nHIFnHKD26jB3rHazTWKnzczPLLlR+c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526759;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=An+N3x30UtGqRDEUE/cK2hNsM79zeDAI9uuPZvn+Qyo=;
	b=GrRigxffGc9UUcX6M0vZ3Sy/3sk1oXeP/r70tDbmv3Tg2OdBbKeYkSddWA22pmqM
	1zlr7BanVlI77RkUkFfWWHzjdFi3InqqoCn+lHI10/qPlGgwWjNv0hs/l7lmK2BFse4
	0ZAwIVVIreBT+Bi/EQwjJY9lTkZ/OJWwMY7Lqdj8=
Content-Type: multipart/mixed; boundary="===============1646690321889359375=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] utfcpp: upgrading to 4.0.9 SUCCEEDED
Message-ID: <0101019bc468c457-6b231e9b-32c2-47fa-86db-087c8f0d875b-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229517

--===============1646690321889359375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *utfcpp* to *4.0.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-utfcpp-upgrade-4.0.8-4.0.9.patch
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
From ef17c15fedaf8505a68ef3f53d5afce6220a39e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 01:23:03 +0000
Subject: [PATCH] utfcpp: upgrade 4.0.8 -> 4.0.9

---
 .../recipes-support/utfcpp/{utfcpp_4.0.8.bb => utfcpp_4.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.0.8.bb => utfcpp_4.0.9.bb} (94%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
similarity index 94%
rename from meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
rename to meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
index 628e8ee0ce..55780b1c7c 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest"
 
-SRCREV = "f9319195dfddf369f68f18e7c0039b3f351797fd"
+SRCREV = "63d64de49fd6b829f7c8694df5ab2ee625cb7134"
 
 inherit cmake ptest
 
-- 
2.47.1


--===============1646690321889359375==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-utfcpp-upgrade-4.0.8-4.0.9.patch"

RnJvbSBlZjE3YzE1ZmVkYWY4NTA1YTY4ZWYzZjUzZDVhZmNlNjIyMGEzOWUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDE6MjM6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGZjcHA6IHVwZ3JhZGUgNC4wLjggLT4gNC4wLjkKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC91
dGZjcHAve3V0ZmNwcF80LjAuOC5iYiA9PiB1dGZjcHBfNC4wLjkuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvdXRmY3BwL3t1dGZjcHBfNC4wLjguYmIgPT4gdXRmY3BwXzQuMC45LmJifSAo
OTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNC4w
LjguYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMC45LmJiCnNpbWls
YXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91
dGZjcHBfNC4wLjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZj
cHBfNC4wLjkuYmIKaW5kZXggNjI4ZThlZTBjZS4uNTU3ODBiMWM3YyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNwcF80LjAuOC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMC45LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWU0MjI0Y2NhZWNiMTRkOTQyYzcxZDMx
YmVmMjBkNzhjIFwKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9uZW10cmlmL3V0ZmNwcDtw
cm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZz12JHtQVn0gXAogICAgICAgICAgICBmaWxl
Oi8vcnVuLXB0ZXN0IgogCi1TUkNSRVYgPSAiZjkzMTkxOTVkZmRkZjM2OWY2OGYxOGU3YzAwMzli
M2YzNTE3OTdmZCIKK1NSQ1JFViA9ICI2M2Q2NGRlNDlmZDZiODI5ZjdjODY5NGRmNWFiMmVlNjI1
Y2I3MTM0IgogCiBpbmhlcml0IGNtYWtlIHB0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============1646690321889359375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/utfcpp: SRC_URI changed from "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v4.0.8 file://run-ptest" to "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v4.0.9 file://run-ptest"
packages/x86-64-v3-poky-linux/utfcpp: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGSIZE changed from 2545496 to 2545152 (-0%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGSIZE changed from 61252 to 61021 (-0%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGSIZE changed from 86983 to 86752 (-0%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: FILELIST: directory renamed /usr/src/debug/utfcpp/4.0.8/source/utf8 -> /usr/src/debug/utfcpp/4.0.9/source/utf8, directory renamed /usr/src/debug/utfcpp/4.0.8/tests -> /usr/src/debug/utfcpp/4.0.9/tests
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PV changed from "4.0.8" to "4.0.9"

--===============1646690321889359375==--

