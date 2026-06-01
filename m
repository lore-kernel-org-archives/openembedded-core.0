Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0167DCD6E72
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1569.1780328137833093025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WvFFYYN6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=E7voeoaR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e83d3d0f6-adac9ae7-f14d-47fa-bd28-b38fb53ec5b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8Yhyo5WRU4XgMxsUrx+YqkOeuYLcyrML83oJIwHbufA=;
	b=WvFFYYN67J140JGTd2p2asaSNjqvCzHEaI5yjEAv0psjMLeFgxDNfFHpHVJThJ8X
	4agEMBN2j8EUaR902BG2ZyD+Jzt6KEVrAo0vtfLEu+A1y6g5Krl62XuwSZJ15/ec0SO
	2qgFSchb56sy0hgLf9Y6EC660Dm1wMVmtj+ArP5A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8Yhyo5WRU4XgMxsUrx+YqkOeuYLcyrML83oJIwHbufA=;
	b=E7voeoaRotRA1ugv5KQlg42402HC9StJZ8akzpgWQ74aAHXZgxDmFqgoj9lXfxew
	eA+ipr50EfmWQrIfDH+MRWqB9yWi+bfFk5zyBTInql1sg8UU5O1qfmt891NjZwehaWA
	tFKOfbGNYaA3AtmTrB9y30T6P3fNGJoGaFJPh86c=
Content-Type: multipart/mixed; boundary="===============6324426280993627044=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libusb1: upgrading to 1.0.30 SUCCEEDED
Message-ID: <0101019e83d3d0f6-adac9ae7-f14d-47fa-bd28-b38fb53ec5b3-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237958

--===============6324426280993627044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libusb1* to *1.0.30* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libusb1-upgrade-1.0.29-1.0.30.patch
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
From d5adf69bc3b0c1b7cadb0a9169f5d12eb1318e55 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 15:03:51 +0000
Subject: [PATCH] libusb1: upgrade 1.0.29 -> 1.0.30

---
 .../libusb/{libusb1_1.0.29.bb => libusb1_1.0.30.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.29.bb => libusb1_1.0.30.bb} (93%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.29.bb b/meta/recipes-support/libusb/libusb1_1.0.30.bb
similarity index 93%
rename from meta/recipes-support/libusb/libusb1_1.0.29.bb
rename to meta/recipes-support/libusb/libusb1_1.0.30.bb
index 856e32d1c6..caac5ceb57 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.29.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.30.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "5977fc950f8d1395ccea9bd48c06b3f808fd3c2c961b44b0c2e6e29fc3a70a85"
+SRC_URI[sha256sum] = "fea36f34f9156400209595e300840767ab1a385ede1dc7ee893015aea9c6dbaf"
 
 S = "${UNPACKDIR}/libusb-${PV}"
 
-- 
2.47.1


--===============6324426280993627044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libusb1/libusb1: FILELIST: removed "/usr/lib/libusb-1.0.so.0.5.0", added "/usr/lib/libusb-1.0.so.0.6.0"
Changes to packages/x86-64-v3-poky-linux/libusb1 (sysroot):
  /usr/lib/libusb-1.0.so.0 changed symlink target from libusb-1.0.so.0.5.0 to libusb-1.0.so.0.6.0
  /usr/lib/libusb-1.0.so changed symlink target from libusb-1.0.so.0.5.0 to libusb-1.0.so.0.6.0
  /usr/lib/libusb-1.0.so.0.5.0 moved to /usr/lib/libusb-1.0.so.0.6.0

--===============6324426280993627044==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libusb1-upgrade-1.0.29-1.0.30.patch"

RnJvbSBkNWFkZjY5YmMzYjBjMWI3Y2FkYjBhOTE2OWY1ZDEyZWIxMzE4ZTU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNTowMzo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnVzYjE6IHVwZ3JhZGUgMS4wLjI5IC0+IDEuMC4zMAoKLS0tCiAuLi4vbGlidXNiL3tsaWJ1c2Ix
XzEuMC4yOS5iYiA9PiBsaWJ1c2IxXzEuMC4zMC5iYn0gICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJ1c2Ive2xpYnVzYjFfMS4wLjI5LmJiID0+IGxpYnVzYjFfMS4wLjMw
LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVzYi9saWJ1
c2IxXzEuMC4yOS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVzYi9saWJ1c2IxXzEuMC4z
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJ1c2IvbGlidXNiMV8xLjAuMjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYnVzYi9saWJ1c2IxXzEuMC4zMC5iYgppbmRleCA4NTZlMzJkMWM2Li5jYWFjNWNlYjU3IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1c2IvbGlidXNiMV8xLjAuMjkuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXNiL2xpYnVzYjFfMS4wLjMwLmJiCkBAIC0x
OSw3ICsxOSw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BW
fS9saWJ1c2ItJHtQVn0udGFyLmJ6MiBcCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRo
dWIuY29tL2xpYnVzYi9saWJ1c2IvcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJy
ZWxlYXNlcy90YWcvdj8oP1A8cHZlcj5cZCsoXC5cZCspKykkIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNTk3N2ZjOTUwZjhkMTM5NWNjZWE5YmQ0OGMwNmIzZjgwOGZkM2MyYzk2MWI0NGIwYzJl
NmUyOWZjM2E3MGE4NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmZWEzNmYzNGY5MTU2NDAwMjA5
NTk1ZTMwMDg0MDc2N2FiMWEzODVlZGUxZGM3ZWU4OTMwMTVhZWE5YzZkYmFmIgogCiBTID0gIiR7
VU5QQUNLRElSfS9saWJ1c2ItJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============6324426280993627044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libusb1: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1: SRC_URI changed from "https://github.com/libusb/libusb/releases/download/v1.0.29/libusb-1.0.29.tar.bz2 file://run-ptest" to "https://github.com/libusb/libusb/releases/download/v1.0.30/libusb-1.0.30.tar.bz2 file://run-ptest"
packages/x86-64-v3-poky-linux/libusb1/libusb1-dbg: FILELIST: removed "/usr/lib/.debug/libusb-1.0.so.0.5.0", added "/usr/lib/.debug/libusb-1.0.so.0.6.0"
packages/x86-64-v3-poky-linux/libusb1/libusb1-dbg: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-dbg: PKGSIZE changed from 427832 to 439192 (+3%)
packages/x86-64-v3-poky-linux/libusb1/libusb1-dbg: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1-dev: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-dev: PKGSIZE changed from 86610 to 88054 (+2%)
packages/x86-64-v3-poky-linux/libusb1/libusb1-dev: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1-doc: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-doc: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1-locale: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-locale: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1-ptest: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-ptest: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1-src: FILELIST: directory renamed /usr/src/debug/libusb1/1.0.29/libusb -> /usr/src/debug/libusb1/1.0.30/libusb, directory renamed /usr/src/debug/libusb1/1.0.29/tests -> /usr/src/debug/libusb1/1.0.30/tests, directory renamed /usr/src/debug/libusb1/1.0.29/libusb/os -> /usr/src/debug/libusb1/1.0.30/libusb/os
packages/x86-64-v3-poky-linux/libusb1/libusb1-src: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-src: PKGSIZE changed from 566896 to 582671 (+3%)
packages/x86-64-v3-poky-linux/libusb1/libusb1-src: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1-staticdev: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1-staticdev: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
packages/x86-64-v3-poky-linux/libusb1/libusb1: FILELIST: removed "/usr/lib/libusb-1.0.so.0.5.0", added "/usr/lib/libusb-1.0.so.0.6.0"
packages/x86-64-v3-poky-linux/libusb1/libusb1: PV changed from "1.0.29" to "1.0.30"
packages/x86-64-v3-poky-linux/libusb1/libusb1: PKGV changed from 1.0.29 [default] to 1.0.30 [default]
Changes to packages/x86-64-v3-poky-linux/libusb1 (sysroot):
  /usr/lib/libusb-1.0.so.0 changed symlink target from libusb-1.0.so.0.5.0 to libusb-1.0.so.0.6.0
  /usr/lib/libusb-1.0.so changed symlink target from libusb-1.0.so.0.5.0 to libusb-1.0.so.0.6.0
  /usr/lib/libusb-1.0.so.0.5.0 moved to /usr/lib/libusb-1.0.so.0.6.0

--===============6324426280993627044==--

