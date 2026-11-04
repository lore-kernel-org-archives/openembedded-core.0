Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2431.1793770296236912983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 21:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y0YWQi6Q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dxNBAqnj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1a50a8fbb-62f2cad8-5c89-4f4e-bba0-86fe8a932c2a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793770295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XbsXeZbWQmVT6pyV0VAaL0RiV53MTXmKN57o1543oPQ=;
	b=Y0YWQi6QY2R/93QeomwJfYePxJhshiuK/zAhHrGEDl7JZY7XUkBit1AXFAXv3ACt
	JYhJKQ1KSHU83JVVDZqQLHJSBB5eQ8xx7BlVlDlFcKJ3pkk1aNe056PfOZNrESoBGKp
	X+2+Tc57F86KMm7DghWc6EtQNLFkwKVIJ2TVfwGE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793770295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XbsXeZbWQmVT6pyV0VAaL0RiV53MTXmKN57o1543oPQ=;
	b=dxNBAqnjAQF0e1GOOdoeC9GRuRasA0WPhi96a7QD6NnH33Btbi1cd2VwOfptjqjO
	ProNhMHes86U9wxBpa4hWNE0AVZi7LoYb7k2Ed8WQSZ8IeLqdMoKH8S5t8VGUvrFMXk
	JMywJ6Wjkijp5mEf7RlY8WHPvv2nz7jAe1tvFDbQ=
Content-Type: multipart/mixed; boundary="===============6981789153923264611=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.413 SUCCEEDED
Message-ID: <010101a1a50a8fbb-62f2cad8-5c89-4f4e-bba0-86fe8a932c2a-000000@us-west-2.amazonses.com>
Date: Wed, 4 Nov 2026 05:31:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.04-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 05:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249324

--===============6981789153923264611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.413* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.411-0.413.patch
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
From 5cfb1fbd04323fa54a4f99530ddc1625804b4513 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 4 Nov 2026 05:31:28 +0000
Subject: [PATCH] hwdata: upgrade 0.411 -> 0.413

Update pci and vendor ids
Fix commit message and changelog
Update pci
---
 .../recipes-support/hwdata/{hwdata_0.411.bb => hwdata_0.413.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.411.bb => hwdata_0.413.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.411.bb b/meta/recipes-support/hwdata/hwdata_0.413.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.411.bb
rename to meta/recipes-support/hwdata/hwdata_0.413.bb
index b83c11f09d..cbda8816dd 100644
--- a/meta/recipes-support/hwdata/hwdata_0.411.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.413.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later OR X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "7fc63d411377e40aab66bfbf77dce6a439c3fe87"
+SRCREV = "1cf7032160ad57e2eaad36c4f23eede1edd8203b"
 
 inherit allarch
 
-- 
2.47.1


--===============6981789153923264611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.411 [default] to 0.413 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.411" to "0.413"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.411 [default] to 0.413 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.411" to "0.413"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.411 [default] to 0.413 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.411" to "0.413"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.411 [default] to 0.413 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.411" to "0.413"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.411 [default] to 0.413 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.411" to "0.413"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.411 [default] to 0.413 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.411" to "0.413"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.411 [default] to 0.413 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.411" to "0.413"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10556262 to 10634146 (+1%)
packages/all-poky-linux/hwdata: PKGV changed from 0.411 [default] to 0.413 [default]
packages/all-poky-linux/hwdata: PV changed from "0.411" to "0.413"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.411" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.413"

--===============6981789153923264611==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.411-0.413.patch"

RnJvbSA1Y2ZiMWZiZDA0MzIzZmE1NGE0Zjk5NTMwZGRjMTYyNTgwNGI0NTEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNCBOb3YgMjAyNiAwNTozMToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
ZGF0YTogdXBncmFkZSAwLjQxMSAtPiAwLjQxMwoKVXBkYXRlIHBjaSBhbmQgdmVuZG9yIGlkcwpG
aXggY29tbWl0IG1lc3NhZ2UgYW5kIGNoYW5nZWxvZwpVcGRhdGUgcGNpCi0tLQogLi4uL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEve2h3ZGF0YV8wLjQxMS5iYiA9PiBod2RhdGFfMC40MTMuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC40MTEuYmIgPT4gaHdkYXRh
XzAuNDEzLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0
YS9od2RhdGFfMC40MTEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAu
NDEzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2h3ZGF0YS9od2RhdGFfMC40MTEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2h3ZGF0YS9od2RhdGFfMC40MTMuYmIKaW5kZXggYjgzYzExZjA5ZC4uY2JkYTg4MTZkZCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjQxMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDEzLmJiCkBAIC04LDcgKzgs
NyBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb3ItbGF0ZXIgT1IgWDExIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MTU1NjU0NzcxMWU4MjQ2OTkyYjk5OWVkZDk0NDVhNTci
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS92Y3Job25lay8ke0JQTn0uZ2l0O2JyYW5j
aD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHM7dGFnPXYke1BWfSIKLVNSQ1JFViA9ICI3ZmM2M2Q0MTEz
NzdlNDBhYWI2NmJmYmY3N2RjZTZhNDM5YzNmZTg3IgorU1JDUkVWID0gIjFjZjcwMzIxNjBhZDU3
ZTJlYWFkMzZjNGYyM2VlZGUxZWRkODIwM2IiCiAKIGluaGVyaXQgYWxsYXJjaAogCi0tIAoyLjQ3
LjEKCg==

--===============6981789153923264611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="hwdata-changelog.txt"

Update pci and vendor ids
Fix commit message and changelog
Update pci

--===============6981789153923264611==--
