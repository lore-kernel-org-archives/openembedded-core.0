Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831EACD98DE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50437.1781195520236972115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YwE7MMCY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UpxOTF6P;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019eb786cb11-a64134b1-bd8d-42df-8bd4-654b7f60da7e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195525;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BFbTGrqUtWbE7o2S1rC5wp6JZMY1KnZI4kzxixdy128=;
	b=YwE7MMCYKXuN52nHGlC+SqzIv+VXtIwhCmnv4l51TasNcVb4px68ZNtL++M7k7pi
	CRODkas3H2HXJC79wp8Qfddc+bZdC8R26gwZOxRq4pgubL1AfnKp/UWbFwU78xWjSim
	FZNuzocYZhjbcAPWRkHlBNEwGlR/6diLIOC6Jr+U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195525;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BFbTGrqUtWbE7o2S1rC5wp6JZMY1KnZI4kzxixdy128=;
	b=UpxOTF6P5n3JZm3K0H6UqhTUVBtb+Tlu3yiUoIr/bFyOjy0QvoeyVGS3mlc6aucQ
	8xApFvZV1A+q98dX8xYshy+tMbap8R8ggvyujwJyRjfdPMVQ0OCj1LHlQYi1jofMKr6
	AHU6YQmIVGkEenRtgYyP7f7isYTxfU5JV6WpmyFg=
Content-Type: multipart/mixed; boundary="===============0271996192230849379=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] utfcpp: upgrading to 4.1.1 SUCCEEDED
Message-ID: <0101019eb786cb11-a64134b1-bd8d-42df-8bd4-654b7f60da7e-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:32:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238577

--===============0271996192230849379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *utfcpp* to *4.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-utfcpp-upgrade-4.0.9-4.1.1.patch
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
From 0c029296866c6d9a6dfa16a17f8990943d6fb24b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 16:28:26 +0000
Subject: [PATCH] utfcpp: upgrade 4.0.9 -> 4.1.1

---
 .../recipes-support/utfcpp/{utfcpp_4.0.9.bb => utfcpp_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.0.9.bb => utfcpp_4.1.1.bb} (94%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.9.bb b/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
similarity index 94%
rename from meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
rename to meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
index 55780b1c7c..80da59bf90 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest"
 
-SRCREV = "63d64de49fd6b829f7c8694df5ab2ee625cb7134"
+SRCREV = "819011bb01628fe1aa2f1da9f2c842a48fd5680b"
 
 inherit cmake ptest
 
-- 
2.47.1


--===============0271996192230849379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/utfcpp: SRC_URI changed from "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v4.0.9 file://run-ptest" to "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v4.1.1 file://run-ptest"
packages/x86-64-v3-poky-linux/utfcpp: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGSIZE changed from 2822184 to 3547752 (+26%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGSIZE changed from 61021 to 64363 (+5%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGSIZE changed from 267225 to 328657 (+23%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGSIZE changed from 86752 to 104766 (+21%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: FILELIST: directory renamed /usr/src/debug/utfcpp/4.0.9/source/utf8 -> /usr/src/debug/utfcpp/4.1.1/source/utf8, directory renamed /usr/src/debug/utfcpp/4.0.9/tests -> /usr/src/debug/utfcpp/4.1.1/tests
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PV changed from "4.0.9" to "4.1.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PKGV changed from 4.0.9 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PV changed from "4.0.9" to "4.1.1"

--===============0271996192230849379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGSIZE changed from 2822184 to 3547752 (+26%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGSIZE changed from 267225 to 328657 (+23%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGSIZE changed from 86752 to 104766 (+21%)

--===============0271996192230849379==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-utfcpp-upgrade-4.0.9-4.1.1.patch"

RnJvbSAwYzAyOTI5Njg2NmM2ZDlhNmRmYTE2YTE3Zjg5OTA5NDNkNmZiMjRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTY6Mjg6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGZjcHA6IHVwZ3JhZGUgNC4wLjkgLT4gNC4xLjEKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC91
dGZjcHAve3V0ZmNwcF80LjAuOS5iYiA9PiB1dGZjcHBfNC4xLjEuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvdXRmY3BwL3t1dGZjcHBfNC4wLjkuYmIgPT4gdXRmY3BwXzQuMS4xLmJifSAo
OTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNC4w
LjkuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMS4xLmJiCnNpbWls
YXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91
dGZjcHBfNC4wLjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZj
cHBfNC4xLjEuYmIKaW5kZXggNTU3ODBiMWM3Yy4uODBkYTU5YmY5MCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNwcF80LjAuOS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMS4xLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWU0MjI0Y2NhZWNiMTRkOTQyYzcxZDMx
YmVmMjBkNzhjIFwKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9uZW10cmlmL3V0ZmNwcDtw
cm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZz12JHtQVn0gXAogICAgICAgICAgICBmaWxl
Oi8vcnVuLXB0ZXN0IgogCi1TUkNSRVYgPSAiNjNkNjRkZTQ5ZmQ2YjgyOWY3Yzg2OTRkZjVhYjJl
ZTYyNWNiNzEzNCIKK1NSQ1JFViA9ICI4MTkwMTFiYjAxNjI4ZmUxYWEyZjFkYTlmMmM4NDJhNDhm
ZDU2ODBiIgogCiBpbmhlcml0IGNtYWtlIHB0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============0271996192230849379==--

