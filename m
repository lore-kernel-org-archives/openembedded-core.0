Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03682C5DF6E
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 05:20:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23743.1786944032536270859
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 22:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G7RRTgi+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iYFGPl4v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a00e2a0b26-09b022ef-9087-481f-8fa7-f09f36bf1d11-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786944031;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=rs1U5rNFzXWhYSivBRdImW/wmVCMZLXHl2dmAqWaw3Q=;
	b=G7RRTgi+0JImQoZAjP+EPXD/4HxVXqgjxEvI3adZgVtoR0y1aLgdSi+gTBjLU5tH
	qFqjWSpWWrs4gNwHjIWe8Vq5z+ZbJ9EErB8z3ViPUeU7czCaxg1opgKt77+Y9KuK8cJ
	DO1eexPnle0E2CaTEOD7Z0xWDX3+T6hOkOHm2+oI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786944031;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=rs1U5rNFzXWhYSivBRdImW/wmVCMZLXHl2dmAqWaw3Q=;
	b=iYFGPl4va5Jlfm7IaO0b4UUZ1iVV0PWDrbxulCqNs6ojDVORvWLCxKduQMnjR2J4
	M1uwiDjHloRTlI6rb+4zKcQbVI7z9CodHCfAoKL8IaFS9d6Kgvv0+9c428SFZOHGKDc
	tQ8f53GV18CQwoRT6uvtZeY1ZsXUnPqrBRrHbaEs=
Content-Type: multipart/mixed; boundary="===============3446477949875302233=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] ca-certificates: upgrading to 20260816 SUCCEEDED
Message-ID: <010101a00e2a0b26-09b022ef-9087-481f-8fa7-f09f36bf1d11-000000@us-west-2.amazonses.com>
Date: Mon, 17 Aug 2026 05:20:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.17-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 05:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243592

--===============3446477949875302233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ca-certificates* to *20260816* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ca-certificates-upgrade-20260601-20260816.patch
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
From bf931717db21df2b66eac0e3373d584a717e914d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 17 Aug 2026 05:20:25 +0000
Subject: [PATCH] ca-certificates: upgrade 20260601 -> 20260816

Source: debian/changelog

ca-certificates (20260816) unstable; urgency=medium

  * Update Mozilla certificate authority bundle to version 2.90
    The following certificate authorities were added (+):
    + "SECOM TLS ECC Root CA 2024"
    + "SECOM TLS RSA Root CA 2024"
    + "Telia EC TLS Root CA v3"
    + "Telia RSA TLS Root CA v3"
    The following certificate authorities were removed (-):
    - "Atos TrustedRoot 2011"
    - "Entrust Root Certification Authority"
    - "SecureSign Root CA12"
    - "ePKI Root Certification Authority"

 -- Julien Cristau <jcristau@debian.org>  Sun, 16 Aug 2026 23:04:36 +0200
---
 ...vert-mozilla-certdata2pem.py-print-a-warning-for-e.patch | 6 +++---
 ...date-ca-certificates-don-t-use-Debianisms-in-run-p.patch | 2 +-
 ...date-ca-certificates-use-relative-symlinks-from-ET.patch | 2 +-
 ...certificates_20260601.bb => ca-certificates_20260816.bb} | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260601.bb => ca-certificates_20260816.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
index 1226508c98..001b468624 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
@@ -1,4 +1,4 @@
-From 743774cd53ed1c45bb660eddacf6dadb5ee3e145 Mon Sep 17 00:00:00 2001
+From 8ea56b7d5eadb04309dc3cf1e6b0d94d1d053d80 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 18 Oct 2021 12:05:49 +0200
 Subject: [PATCH] Revert "mozilla/certdata2pem.py: print a warning for expired
@@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  3 files changed, 1 insertion(+), 13 deletions(-)
 
 diff --git a/debian/changelog b/debian/changelog
-index dbe3e9c..496e05d 100644
+index 7ad495f..058ef5e 100644
 --- a/debian/changelog
 +++ b/debian/changelog
-@@ -156,7 +156,6 @@ ca-certificates (20211004) unstable; urgency=low
+@@ -234,7 +234,6 @@ ca-certificates (20211004) unstable; urgency=low
      - "Trustis FPS Root CA"
      - "Staat der Nederlanden Root CA - G3"
    * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
index 1a29da756f..dcfa355411 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -1,4 +1,4 @@
-From 63086d41f76b1c3357e23c6509df72d3f75af20c Mon Sep 17 00:00:00 2001
+From bab2e13b69af12c1864cccf371ebc4ef57a6fec2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Jul 2015 15:19:41 +0100
 Subject: [PATCH] ca-certificates: remove Debianism in run-parts invocation
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
index 929945b56f..4d97c81b0d 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
@@ -1,4 +1,4 @@
-From a69933f96a8675369de702bdb55e57dc21f65e7f Mon Sep 17 00:00:00 2001
+From 8a5b4e2dd1479de0338db7a7234d037ef0f71c2f Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Wed, 28 Mar 2018 16:45:05 +0100
 Subject: [PATCH] update-ca-certificates: use relative symlinks from
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
similarity index 97%
rename from meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
index 90a8568947..c9702d545a 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "7ab6301f7f34eef90a4d278647c260bc0762e0e14561f4649854cf4b0d4bea21"
+SRC_URI[sha256sum] = "d939bcdd0cb058712cf4175bac76997676eb8b68fe9473765e1b40fb3d5b186a"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
-- 
2.47.1


--===============3446477949875302233==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ca-certificates-upgrade-20260601-20260816.patch"

RnJvbSBiZjkzMTcxN2RiMjFkZjJiNjZlYWMwZTMzNzNkNTg0YTcxN2U5MTRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTcgQXVnIDIwMjYgMDU6MjA6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
YS1jZXJ0aWZpY2F0ZXM6IHVwZ3JhZGUgMjAyNjA2MDEgLT4gMjAyNjA4MTYKClNvdXJjZTogZGVi
aWFuL2NoYW5nZWxvZwoKY2EtY2VydGlmaWNhdGVzICgyMDI2MDgxNikgdW5zdGFibGU7IHVyZ2Vu
Y3k9bWVkaXVtCgogICogVXBkYXRlIE1vemlsbGEgY2VydGlmaWNhdGUgYXV0aG9yaXR5IGJ1bmRs
ZSB0byB2ZXJzaW9uIDIuOTAKICAgIFRoZSBmb2xsb3dpbmcgY2VydGlmaWNhdGUgYXV0aG9yaXRp
ZXMgd2VyZSBhZGRlZCAoKyk6CiAgICArICJTRUNPTSBUTFMgRUNDIFJvb3QgQ0EgMjAyNCIKICAg
ICsgIlNFQ09NIFRMUyBSU0EgUm9vdCBDQSAyMDI0IgogICAgKyAiVGVsaWEgRUMgVExTIFJvb3Qg
Q0EgdjMiCiAgICArICJUZWxpYSBSU0EgVExTIFJvb3QgQ0EgdjMiCiAgICBUaGUgZm9sbG93aW5n
IGNlcnRpZmljYXRlIGF1dGhvcml0aWVzIHdlcmUgcmVtb3ZlZCAoLSk6CiAgICAtICJBdG9zIFRy
dXN0ZWRSb290IDIwMTEiCiAgICAtICJFbnRydXN0IFJvb3QgQ2VydGlmaWNhdGlvbiBBdXRob3Jp
dHkiCiAgICAtICJTZWN1cmVTaWduIFJvb3QgQ0ExMiIKICAgIC0gImVQS0kgUm9vdCBDZXJ0aWZp
Y2F0aW9uIEF1dGhvcml0eSIKCiAtLSBKdWxpZW4gQ3Jpc3RhdSA8amNyaXN0YXVAZGViaWFuLm9y
Zz4gIFN1biwgMTYgQXVnIDIwMjYgMjM6MDQ6MzYgKzAyMDAKLS0tCiAuLi52ZXJ0LW1vemlsbGEt
Y2VydGRhdGEycGVtLnB5LXByaW50LWEtd2FybmluZy1mb3ItZS5wYXRjaCB8IDYgKysrLS0tCiAu
Li5kYXRlLWNhLWNlcnRpZmljYXRlcy1kb24tdC11c2UtRGViaWFuaXNtcy1pbi1ydW4tcC5wYXRj
aCB8IDIgKy0KIC4uLmRhdGUtY2EtY2VydGlmaWNhdGVzLXVzZS1yZWxhdGl2ZS1zeW1saW5rcy1m
cm9tLUVULnBhdGNoIHwgMiArLQogLi4uY2VydGlmaWNhdGVzXzIwMjYwNjAxLmJiID0+IGNhLWNl
cnRpZmljYXRlc18yMDI2MDgxNi5iYn0gfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1j
ZXJ0aWZpY2F0ZXMve2NhLWNlcnRpZmljYXRlc18yMDI2MDYwMS5iYiA9PiBjYS1jZXJ0aWZpY2F0
ZXNfMjAyNjA4MTYuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Y2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAxLVJldmVydC1tb3ppbGxhLWNlcnRk
YXRhMnBlbS5weS1wcmludC1hLXdhcm5pbmctZm9yLWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzLzAwMDEtUmV2ZXJ0LW1vemlsbGEt
Y2VydGRhdGEycGVtLnB5LXByaW50LWEtd2FybmluZy1mb3ItZS5wYXRjaAppbmRleCAxMjI2NTA4
Yzk4Li4wMDFiNDY4NjI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0
aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzLzAwMDEtUmV2ZXJ0LW1vemlsbGEtY2VydGRhdGEycGVt
LnB5LXByaW50LWEtd2FybmluZy1mb3ItZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzLzAwMDEtUmV2ZXJ0LW1vemlsbGEtY2Vy
dGRhdGEycGVtLnB5LXByaW50LWEtd2FybmluZy1mb3ItZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gNzQzNzc0Y2Q1M2VkMWM0NWJiNjYwZWRkYWNmNmRhZGI1ZWUzZTE0NSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gOGVhNTZiN2Q1ZWFkYjA0MzA5ZGMzY2YxZTZiMGQ5NGQxZDA1
M2Q4MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBNb24sIDE4IE9jdCAyMDIxIDEyOjA1OjQ5ICswMjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIFJldmVydCAibW96aWxsYS9jZXJ0ZGF0YTJwZW0ucHk6IHByaW50
IGEgd2FybmluZyBmb3IgZXhwaXJlZApAQCAtMTYsMTAgKzE2LDEwIEBAIFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAgMyBmaWxlcyBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMTMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9kZWJpYW4v
Y2hhbmdlbG9nIGIvZGViaWFuL2NoYW5nZWxvZwotaW5kZXggZGJlM2U5Yy4uNDk2ZTA1ZCAxMDA2
NDQKK2luZGV4IDdhZDQ5NWYuLjA1OGVmNWUgMTAwNjQ0CiAtLS0gYS9kZWJpYW4vY2hhbmdlbG9n
CiArKysgYi9kZWJpYW4vY2hhbmdlbG9nCi1AQCAtMTU2LDcgKzE1Niw2IEBAIGNhLWNlcnRpZmlj
YXRlcyAoMjAyMTEwMDQpIHVuc3RhYmxlOyB1cmdlbmN5PWxvdworQEAgLTIzNCw3ICsyMzQsNiBA
QCBjYS1jZXJ0aWZpY2F0ZXMgKDIwMjExMDA0KSB1bnN0YWJsZTsgdXJnZW5jeT1sb3cKICAgICAg
LSAiVHJ1c3RpcyBGUFMgUm9vdCBDQSIKICAgICAgLSAiU3RhYXQgZGVyIE5lZGVybGFuZGVuIFJv
b3QgQ0EgLSBHMyIKICAgICogQmxhY2tsaXN0IGV4cGlyZWQgcm9vdCBjZXJ0aWZpY2F0ZSAiRFNU
IFJvb3QgQ0EgWDMiIChjbG9zZXM6ICM5OTU0MzIpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzLzAwMDEtdXBkYXRlLWNhLWNl
cnRpZmljYXRlcy1kb24tdC11c2UtRGViaWFuaXNtcy1pbi1ydW4tcC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMvMDAwMS11cGRhdGUt
Y2EtY2VydGlmaWNhdGVzLWRvbi10LXVzZS1EZWJpYW5pc21zLWluLXJ1bi1wLnBhdGNoCmluZGV4
IDFhMjlkYTc1NmYuLmRjZmEzNTU0MTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMvMDAwMS11cGRhdGUtY2EtY2VydGlmaWNh
dGVzLWRvbi10LXVzZS1EZWJpYW5pc21zLWluLXJ1bi1wLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMvMDAwMS11cGRhdGUtY2Et
Y2VydGlmaWNhdGVzLWRvbi10LXVzZS1EZWJpYW5pc21zLWluLXJ1bi1wLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA2MzA4NmQ0MWY3NmIxYzMzNTdlMjNjNjUwOWRmNzJkM2Y3NWFmMjBjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiYWIyZTEzYjY5YWYxMmMxODY0Y2NjZjM3MWVi
YzRlZjU3YTZmZWMyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24g
PHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IE1vbiwgNiBKdWwgMjAxNSAxNToxOTo0MSAr
MDEwMAogU3ViamVjdDogW1BBVENIXSBjYS1jZXJ0aWZpY2F0ZXM6IHJlbW92ZSBEZWJpYW5pc20g
aW4gcnVuLXBhcnRzIGludm9jYXRpb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMvMDAwMy11cGRhdGUtY2EtY2VydGlmaWNh
dGVzLXVzZS1yZWxhdGl2ZS1zeW1saW5rcy1mcm9tLUVULnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAzLXVwZGF0ZS1jYS1jZXJ0
aWZpY2F0ZXMtdXNlLXJlbGF0aXZlLXN5bWxpbmtzLWZyb20tRVQucGF0Y2gKaW5kZXggOTI5OTQ1
YjU2Zi4uNGQ5N2M4MWIwZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2Vy
dGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAzLXVwZGF0ZS1jYS1jZXJ0aWZpY2F0ZXMtdXNl
LXJlbGF0aXZlLXN5bWxpbmtzLWZyb20tRVQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAzLXVwZGF0ZS1jYS1jZXJ0aWZp
Y2F0ZXMtdXNlLXJlbGF0aXZlLXN5bWxpbmtzLWZyb20tRVQucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGE2OTkzM2Y5NmE4Njc1MzY5ZGU3MDJiZGI1NWU1N2RjMjFmNjVlN2YgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDhhNWI0ZTJkZDE0NzlkZTAzMzhkYjdhNzIzNGQwMzdlZjBm
NzFjMmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/QW5kcj1DMz1B
OT0yMERyYXN6aWs/PSA8YW5kcmUuZHJhc3ppa0BqY2kuY29tPgogRGF0ZTogV2VkLCAyOCBNYXIg
MjAxOCAxNjo0NTowNSArMDEwMAogU3ViamVjdDogW1BBVENIXSB1cGRhdGUtY2EtY2VydGlmaWNh
dGVzOiB1c2UgcmVsYXRpdmUgc3ltbGlua3MgZnJvbQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlc18yMDI2MDYwMS5iYiBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXNfMjAyNjA4
MTYuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlc18yMDI2MDYwMS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlc18yMDI2
MDgxNi5iYgppbmRleCA5MGE4NTY4OTQ3Li5jOTcwMmQ1NDVhIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzXzIwMjYwNjAxLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0
ZXNfMjAyNjA4MTYuYmIKQEAgLTE0LDcgKzE0LDcgQEAgREVQRU5EUzpjbGFzcy1uYXRpdmVzZGsg
PSAib3BlbnNzbC1uYXRpdmUiCiAjIE5lZWQgcmVoYXNoIGZyb20gb3BlbnNzbCBhbmQgcnVuLXBh
cnRzIGZyb20gZGViaWFudXRpbHMKIFBBQ0tBR0VfV1JJVEVfREVQUyArPSAib3BlbnNzbC1uYXRp
dmUgZGViaWFudXRpbHMtbmF0aXZlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2FiNjMwMWY3
ZjM0ZWVmOTBhNGQyNzg2NDdjMjYwYmMwNzYyZTBlMTQ1NjFmNDY0OTg1NGNmNGIwZDRiZWEyMSIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkOTM5YmNkZDBjYjA1ODcxMmNmNDE3NWJhYzc2OTk3Njc2
ZWI4YjY4ZmU5NDczNzY1ZTFiNDBmYjNkNWIxODZhIgogU1JDX1VSSSA9ICIke0RFQklBTl9NSVJS
T1J9L21haW4vYy9jYS1jZXJ0aWZpY2F0ZXMvJHtCUE59XyR7UFZ9LnRhci54eiBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLXVwZGF0ZS1jYS1jZXJ0aWZpY2F0ZXMtZG9uLXQtdXNlLURlYmlhbmlz
bXMtaW4tcnVuLXAucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMy11cGRhdGUtY2EtY2Vy
dGlmaWNhdGVzLXVzZS1yZWxhdGl2ZS1zeW1saW5rcy1mcm9tLUVULnBhdGNoIFwKLS0gCjIuNDcu
MQoK

--===============3446477949875302233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dbg: PV changed from "20260601" to "20260816"
packages/all-poky-linux/ca-certificates/ca-certificates-dbg: PKGV changed from 20260601 [default] to 20260816 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-dev: PV changed from "20260601" to "20260816"
packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.la /lib/*.o /lib/lib*.so"
packages/all-poky-linux/ca-certificates/ca-certificates-dev: PKGV changed from 20260601 [default] to 20260816 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-doc: PV changed from "20260601" to "20260816"
packages/all-poky-linux/ca-certificates/ca-certificates-doc: PKGV changed from 20260601 [default] to 20260816 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-locale: PV changed from "20260601" to "20260816"
packages/all-poky-linux/ca-certificates/ca-certificates-locale: PKGV changed from 20260601 [default] to 20260816 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-src: PV changed from "20260601" to "20260816"
packages/all-poky-linux/ca-certificates/ca-certificates-src: PKGV changed from 20260601 [default] to 20260816 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: PV changed from "20260601" to "20260816"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: PKGV changed from 20260601 [default] to 20260816 [default]
packages/all-poky-linux/ca-certificates/ca-certificates: PKGSIZE changed from 192791 to 192243 (-0%)
packages/all-poky-linux/ca-certificates/ca-certificates: PV changed from "20260601" to "20260816"
packages/all-poky-linux/ca-certificates/ca-certificates: FILELIST: removed "/usr/share/ca-certificates/mozilla/ePKI_Root_Certification_Authority.crt /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority.crt /usr/share/ca-certificates/mozilla/SecureSign_Root_CA12.crt /usr/share/ca-certificates/mozilla/Atos_TrustedRoot_2011.crt", added "/usr/share/ca-certificates/mozilla/SECOM_TLS_RSA_Root_CA_2024.crt /usr/share/ca-certificates/mozilla/SECOM_TLS_ECC_Root_CA_2024.crt /usr/share/ca-certificates/mozilla/Telia_RSA_TLS_Root_CA_v3.crt /usr/share/ca-certificates/mozilla/Telia_EC_TLS_Root_CA_v3.crt"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/bin/* /sbin/* /lib/*.so.*", added "/usr/lib/*.so.*"
packages/all-poky-linux/ca-certificates/ca-certificates: PKGV changed from 20260601 [default] to 20260816 [default]
packages/all-poky-linux/ca-certificates: PV changed from "20260601" to "20260816"
packages/all-poky-linux/ca-certificates: SRC_URI changed from "http://deb.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20260601.tar.xz file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch" to "http://deb.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20260816.tar.xz file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch"
packages/all-poky-linux/ca-certificates: PKGV changed from 20260601 [default] to 20260816 [default]
Changes to packages/all-poky-linux/ca-certificates (sysroot):
  /usr/share/ca-certificates/mozilla/SECOM_TLS_ECC_Root_CA_2024.crt was added
  /usr/share/ca-certificates/mozilla/SECOM_TLS_RSA_Root_CA_2024.crt was added
  /usr/share/ca-certificates/mozilla/Telia_EC_TLS_Root_CA_v3.crt was added
  /usr/share/ca-certificates/mozilla/Telia_RSA_TLS_Root_CA_v3.crt was added
  /usr/share/ca-certificates/mozilla/Atos_TrustedRoot_2011.crt was removed
  /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority.crt was removed
  /usr/share/ca-certificates/mozilla/ePKI_Root_Certification_Authority.crt was removed
  /usr/share/ca-certificates/mozilla/SecureSign_Root_CA12.crt was removed

--===============3446477949875302233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/ca-certificates/ca-certificates: FILELIST: removed "/usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority.crt /usr/share/ca-certificates/mozilla/ePKI_Root_Certification_Authority.crt /usr/share/ca-certificates/mozilla/Atos_TrustedRoot_2011.crt /usr/share/ca-certificates/mozilla/SecureSign_Root_CA12.crt", added "/usr/share/ca-certificates/mozilla/SECOM_TLS_ECC_Root_CA_2024.crt /usr/share/ca-certificates/mozilla/Telia_EC_TLS_Root_CA_v3.crt /usr/share/ca-certificates/mozilla/Telia_RSA_TLS_Root_CA_v3.crt /usr/share/ca-certificates/mozilla/SECOM_TLS_RSA_Root_CA_2024.crt"
Changes to packages/all-poky-linux/ca-certificates (sysroot):
  /usr/share/ca-certificates/mozilla/SECOM_TLS_ECC_Root_CA_2024.crt was added
  /usr/share/ca-certificates/mozilla/SECOM_TLS_RSA_Root_CA_2024.crt was added
  /usr/share/ca-certificates/mozilla/Telia_EC_TLS_Root_CA_v3.crt was added
  /usr/share/ca-certificates/mozilla/Telia_RSA_TLS_Root_CA_v3.crt was added
  /usr/share/ca-certificates/mozilla/Atos_TrustedRoot_2011.crt was removed
  /usr/share/ca-certificates/mozilla/Entrust_Root_Certification_Authority.crt was removed
  /usr/share/ca-certificates/mozilla/ePKI_Root_Certification_Authority.crt was removed
  /usr/share/ca-certificates/mozilla/SecureSign_Root_CA12.crt was removed

--===============3446477949875302233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ca-certificates-changelog.txt"

Changelog for ca-certificates: 20260601 -> 20260816
Source: debian/changelog

ca-certificates (20260816) unstable; urgency=medium

  * Update Mozilla certificate authority bundle to version 2.90
    The following certificate authorities were added (+):
    + "SECOM TLS ECC Root CA 2024"
    + "SECOM TLS RSA Root CA 2024"
    + "Telia EC TLS Root CA v3"
    + "Telia RSA TLS Root CA v3"
    The following certificate authorities were removed (-):
    - "Atos TrustedRoot 2011"
    - "Entrust Root Certification Authority"
    - "SecureSign Root CA12"
    - "ePKI Root Certification Authority"

 -- Julien Cristau <jcristau@debian.org>  Sun, 16 Aug 2026 23:04:36 +0200

--===============3446477949875302233==--

