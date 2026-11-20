Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1166.1795158391839978217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:06:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MtjH0wIr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=amOlZd8p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1f7c73877-457b558d-3ed9-4436-b9d5-1f4f969766dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795158391;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=DMQo1cS5QWw0ZgJD05ICk63vR8+PpqBjT74nbanAjME=;
	b=MtjH0wIrKO+VHOIGynlRH+HNvSZWiG/6xqL/k6uYtO/+EhTuYJbxJ6bAQd86yR70
	a8Qd/LtpH42vlsJUDLr0d8HkQNg7Pso5gqkF92jMhB6O+2ppaZAIAUiQSUsvvlPHrxA
	BkGIjZqG4oq3aLXo4CX8g7w88ntMWxRkjohQr4V0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795158391;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=DMQo1cS5QWw0ZgJD05ICk63vR8+PpqBjT74nbanAjME=;
	b=amOlZd8pQE4S/HNIGT0+pShqLBlHXORJB9kPAlXpI51hEb+VROh/DW0PfbhFMN/P
	eBRJbEv3Rjse3Fv43VyNwQ/dy0w8xxkwXyKn3EuUtMf6aVy4LC3+XhlO5KhgqDtguR0
	DvL/pJTGzocxrM3IJ6+GPM9Iyiv2skCDN3YI4J4I=
Content-Type: multipart/mixed; boundary="===============7328955212410394846=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libmicrohttpd: upgrading to 1.0.11 SUCCEEDED
Message-ID: <010101a1f7c73877-457b558d-3ed9-4436-b9d5-1f4f969766dd-000000@us-west-2.amazonses.com>
Date: Fri, 20 Nov 2026 07:06:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.20-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250734

--===============7328955212410394846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libmicrohttpd* to *1.0.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmicrohttpd-upgrade-1.0.10-1.0.11.patch
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
From 351b4c172e3d7308d3e5c6e430ca5fbb55926f99 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 20 Nov 2026 07:06:22 +0000
Subject: [PATCH] libmicrohttpd: upgrade 1.0.10 -> 1.0.11

Thu Nov 19 11:50:38 PM CET 2026
    Fix hang until timeout when epoll() would return exactly
    a full batch of events. Optimize header parsing, resulting
    in non-trivial speed-up for request handling. Both
    issues reported and fixed by Ken Zangelin, thanks a lot!
    Releasing GNU libmicrohttpd 1.0.11. -CG
---
 .../{libmicrohttpd_1.0.10.bb => libmicrohttpd_1.0.11.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.10.bb => libmicrohttpd_1.0.11.bb} (91%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.11.bb
similarity index 91%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.11.bb
index aab3041280..b20a0d4cb2 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.11.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "04bfe8ef75db7d629a33de767599765cecadc56274a39822d5d081030d577685"
+SRC_URI[sha256sum] = "f227a044b75688e449b58ddedf0582255cc562899ff69f173a8ef76439744b4e"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.47.1


--===============7328955212410394846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 11473425 to 11273993 (-2%)
packages/x86-64-v3-poky-linux/libmicrohttpd: PV changed from "1.0.10" to "1.0.11"
packages/x86-64-v3-poky-linux/libmicrohttpd: SRC_URI changed from "https://ftpmirror.gnu.org//libmicrohttpd/libmicrohttpd-1.0.10.tar.gz" to "https://ftpmirror.gnu.org//libmicrohttpd/libmicrohttpd-1.0.11.tar.gz"
packages/x86-64-v3-poky-linux/libmicrohttpd: PKGV changed from 1.0.10 [default] to 1.0.11 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-bin: PV changed from "1.0.10" to "1.0.11"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-bin: PKGV changed from 1.0.10 [default] to 1.0.11 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PV changed from "1.0.10" to "1.0.11"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGV changed from 1.0.10 [default] to 1.0.11 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGSIZE changed from 884512 to 884176 (-0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PV changed from "1.0.10" to "1.0.11"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PKGV changed from 1.0.10 [default] to 1.0.11 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PV changed from "1.0.10" to "1.0.11"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGV changed from 1.0.10 [default] to 1.0.11 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGSIZE changed from 536239 to 536243 (+0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-locale: PV changed from "1.0.10" to "1.0.11"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-locale: PKGV changed from 1.0.10 [default] to 1.0.11 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PV changed from "1.0.10" to "1.0.11"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: FILELIST: directory renamed /usr/src/debug/libmicrohttpd/1.0.10/src/microhttpd -> /usr/src/debug/libmicrohttpd/1.0.11/src/microhttpd, directory renamed /usr/src/debug/libmicrohttpd/1.0.10/src/include -> /usr/src/debug/libmicrohttpd/1.0.11/src/include
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGV changed from 1.0.10 [default] to 1.0.11 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGSIZE changed from 1722235 to 1722962 (+0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PV changed from "1.0.10" to "1.0.11"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PKGV changed from 1.0.10 [default] to 1.0.11 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PV changed from "1.0.10" to "1.0.11"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PKGV changed from 1.0.10 [default] to 1.0.11 [default]

--===============7328955212410394846==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmicrohttpd-upgrade-1.0.10-1.0.11.patch"

RnJvbSAzNTFiNGMxNzJlM2Q3MzA4ZDNlNWM2ZTQzMGNhNWZiYjU1OTI2Zjk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjAgTm92IDIwMjYgMDc6MDY6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJtaWNyb2h0dHBkOiB1cGdyYWRlIDEuMC4xMCAtPiAxLjAuMTEKClRodSBOb3YgMTkgMTE6NTA6
MzggUE0gQ0VUIDIwMjYKICAgIEZpeCBoYW5nIHVudGlsIHRpbWVvdXQgd2hlbiBlcG9sbCgpIHdv
dWxkIHJldHVybiBleGFjdGx5CiAgICBhIGZ1bGwgYmF0Y2ggb2YgZXZlbnRzLiBPcHRpbWl6ZSBo
ZWFkZXIgcGFyc2luZywgcmVzdWx0aW5nCiAgICBpbiBub24tdHJpdmlhbCBzcGVlZC11cCBmb3Ig
cmVxdWVzdCBoYW5kbGluZy4gQm90aAogICAgaXNzdWVzIHJlcG9ydGVkIGFuZCBmaXhlZCBieSBL
ZW4gWmFuZ2VsaW4sIHRoYW5rcyBhIGxvdCEKICAgIFJlbGVhc2luZyBHTlUgbGlibWljcm9odHRw
ZCAxLjAuMTEuIC1DRwotLS0KIC4uLi97bGlibWljcm9odHRwZF8xLjAuMTAuYmIgPT4gbGlibWlj
cm9odHRwZF8xLjAuMTEuYmJ9ICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1p
Y3JvaHR0cGQve2xpYm1pY3JvaHR0cGRfMS4wLjEwLmJiID0+IGxpYm1pY3JvaHR0cGRfMS4wLjEx
LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1pY3JvaHR0
cGQvbGlibWljcm9odHRwZF8xLjAuMTAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtaWNy
b2h0dHBkL2xpYm1pY3JvaHR0cGRfMS4wLjExLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1pY3JvaHR0cGQvbGlibWljcm9odHRwZF8x
LjAuMTAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1pY3JvaHR0cGQvbGli
bWljcm9odHRwZF8xLjAuMTEuYmIKaW5kZXggYWFiMzA0MTI4MC4uYjIwYTBkNGNiMiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWljcm9odHRwZC9saWJtaWNyb2h0dHBkXzEu
MC4xMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1pY3Jv
aHR0cGRfMS4wLjExLmJiCkBAIC03LDcgKzcsNyBAQCBTRUNUSU9OID0gIm5ldCIKIERFUEVORFMg
PSAiZmlsZSIKIAogU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2xpYm1pY3JvaHR0cGQvJHtCUE59
LSR7UFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwNGJmZThlZjc1ZGI3ZDYyOWEz
M2RlNzY3NTk5NzY1Y2VjYWRjNTYyNzRhMzk4MjJkNWQwODEwMzBkNTc3Njg1IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImYyMjdhMDQ0Yjc1Njg4ZTQ0OWI1OGRkZWRmMDU4MjI1NWNjNTYyODk5ZmY2
OWYxNzNhOGVmNzY0Mzk3NDRiNGUiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGxpYl9wYWNrYWdlIHBr
Z2NvbmZpZyBnZXR0ZXh0CiAKLS0gCjIuNDcuMQoK

--===============7328955212410394846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libmicrohttpd-changelog.txt"

Thu Nov 19 11:50:38 PM CET 2026
    Fix hang until timeout when epoll() would return exactly
    a full batch of events. Optimize header parsing, resulting
    in non-trivial speed-up for request handling. Both
    issues reported and fixed by Ken Zangelin, thanks a lot!
    Releasing GNU libmicrohttpd 1.0.11. -CG

--===============7328955212410394846==--
