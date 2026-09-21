Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56CFC982DE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 05:40:14 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43178.1789969207588697181
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 22:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uk+NzLR8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BjOBCeJY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0c27aa6fb-77d87e5c-4892-49af-8b9b-e229e804aeef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789969213;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Y++kB/E+3qxOHpizzy7SmKRX2o2QWKlQd2YKOti8ZIU=;
	b=uk+NzLR8HIzV1CIpvlNpbQHFuBjsTEcX5DDLDAfPmOrkb+m8pqDA691MFcHmC8j9
	gg69BUpbGJxjvCyJAMHWdK79gKkLmR2Kf3yxcQiZwDKC7ugmjf0UNHzgYF3QgOlD/QA
	G2sp1U7+OaPzBq4fpIJcPBdK9A92ZhFbLIoC5oMk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789969213;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Y++kB/E+3qxOHpizzy7SmKRX2o2QWKlQd2YKOti8ZIU=;
	b=BjOBCeJYACfT1gFoBK4PQAdoJTPiSi6y/7NAI/VwGHrw3iakQsy71cVnQZPTq9nB
	DcB/Cg6PJNvSKsZGq0n4veGSP00QjCdpEMb6EsthkZxppihljvg0HNannu/OWxOH7pu
	nYK1uPTIDwQ8RvgcqjvZhRueV/iNDQF7pLfoRXAo=
Content-Type: multipart/mixed; boundary="===============2458791600050257273=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] utfcpp: upgrading to 4.2.1 SUCCEEDED
Message-ID: <010101a0c27aa6fb-77d87e5c-4892-49af-8b9b-e229e804aeef-000000@us-west-2.amazonses.com>
Date: Mon, 21 Sep 2026 05:40:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.21-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 05:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246286

--===============2458791600050257273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *utfcpp* to *4.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-utfcpp-upgrade-4.2.0-4.2.1.patch
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
From 7ab4e9f14dd6e9a83057362dba94526a8e60c574 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 21 Sep 2026 05:40:03 +0000
Subject: [PATCH] utfcpp: upgrade 4.2.0 -> 4.2.1

3d1ff6d Release 4.2.1
32e3ed1 next16: report invalid_utf16 for a lone trail surrogate at the end of a range (#147)
30e55c2 Add utf8cpp::utf8cpp target available when consuming directly (#146)
---
 .../recipes-support/utfcpp/{utfcpp_4.2.0.bb => utfcpp_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.2.0.bb => utfcpp_4.2.1.bb} (94%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.2.0.bb b/meta/recipes-support/utfcpp/utfcpp_4.2.1.bb
similarity index 94%
rename from meta/recipes-support/utfcpp/utfcpp_4.2.0.bb
rename to meta/recipes-support/utfcpp/utfcpp_4.2.1.bb
index c56d03b7c7..e891b7fc57 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.2.0.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.2.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest"
 
-SRCREV = "2d8e20b22dcb3e9b3c4f52103182ebda949c6089"
+SRCREV = "3d1ff6dbf54e471c846dff55dda6c8ee10c0ee5c"
 
 inherit cmake ptest
 
-- 
2.47.1


--===============2458791600050257273==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-utfcpp-upgrade-4.2.0-4.2.1.patch"

RnJvbSA3YWI0ZTlmMTRkZDZlOWE4MzA1NzM2MmRiYTk0NTI2YThlNjBjNTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjEgU2VwIDIwMjYgMDU6NDA6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGZjcHA6IHVwZ3JhZGUgNC4yLjAgLT4gNC4yLjEKCjNkMWZmNmQgUmVsZWFzZSA0LjIuMQozMmUz
ZWQxIG5leHQxNjogcmVwb3J0IGludmFsaWRfdXRmMTYgZm9yIGEgbG9uZSB0cmFpbCBzdXJyb2dh
dGUgYXQgdGhlIGVuZCBvZiBhIHJhbmdlICgjMTQ3KQozMGU1NWMyIEFkZCB1dGY4Y3BwOjp1dGY4
Y3BwIHRhcmdldCBhdmFpbGFibGUgd2hlbiBjb25zdW1pbmcgZGlyZWN0bHkgKCMxNDYpCi0tLQog
Li4uL3JlY2lwZXMtc3VwcG9ydC91dGZjcHAve3V0ZmNwcF80LjIuMC5iYiA9PiB1dGZjcHBfNC4y
LjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3t1dGZjcHBfNC4yLjAuYmIg
PT4gdXRmY3BwXzQuMi4xLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L3V0ZmNwcC91dGZjcHBfNC4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC91dGZjcHAv
dXRmY3BwXzQuMi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNC4yLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNC4yLjEuYmIKaW5kZXggYzU2ZDAzYjdjNy4uZTg5MWI3
ZmM1NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNwcF80LjIu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMi4xLmJiCkBA
IC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWU0
MjI0Y2NhZWNiMTRkOTQyYzcxZDMxYmVmMjBkNzhjIFwKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS9uZW10cmlmL3V0ZmNwcDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZz12JHtQ
Vn0gXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IgogCi1TUkNSRVYgPSAiMmQ4ZTIwYjIy
ZGNiM2U5YjNjNGY1MjEwMzE4MmViZGE5NDljNjA4OSIKK1NSQ1JFViA9ICIzZDFmZjZkYmY1NGU0
NzFjODQ2ZGZmNTVkZGE2YzhlZTEwYzBlZTVjIgogCiBpbmhlcml0IGNtYWtlIHB0ZXN0CiAKLS0g
CjIuNDcuMQoK

--===============2458791600050257273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/utfcpp: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/utfcpp: SRC_URI changed from "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v4.2.0 file://run-ptest" to "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v4.2.1 file://run-ptest"
packages/x86-64-v3-poky-linux/utfcpp: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGSIZE changed from 3581640 to 3602928 (+1%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGSIZE changed from 64666 to 64747 (+0%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGSIZE changed from 332777 to 336873 (+1%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: FILELIST: directory renamed /usr/src/debug/utfcpp/4.2.0/tests -> /usr/src/debug/utfcpp/4.2.1/tests, directory renamed /usr/src/debug/utfcpp/4.2.0/source/utf8 -> /usr/src/debug/utfcpp/4.2.1/source/utf8
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGSIZE changed from 106614 to 107070 (+0%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PKGV changed from 4.2.0 [default] to 4.2.1 [default]

--===============2458791600050257273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="utfcpp-changelog.txt"

Changelog for utfcpp: 4.2.0 -> 4.2.1

3d1ff6d Release 4.2.1
32e3ed1 next16: report invalid_utf16 for a lone trail surrogate at the end of a range (#147)
30e55c2 Add utf8cpp::utf8cpp target available when consuming directly (#146)

--===============2458791600050257273==--

