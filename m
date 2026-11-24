Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12522.1795501916390832392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DlDYQKIN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TdKsKKye;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a20c40fe11-150f9985-e359-4dee-bbe3-6ee8fd5ec23c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795501915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N1hhoGcrqZPhr0grW2qPunJCT1i21joT2O26PoPh/s0=;
	b=DlDYQKIN/1sjp4Q6DXSCdrnghs8SqPQYt61s6V3AuAnJbZbAUV+gsEsiXiiHPOOu
	56mv8I/yM1G/+8LrKY/iBbaRIv8S6qa76ppzfcd9Ss0LzOfE1/fEOlhfHf/zFlfCjSP
	lru6S8t2a5qNzb5nkoOC8+mWs1mHLm2ZARNjDh5o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795501915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N1hhoGcrqZPhr0grW2qPunJCT1i21joT2O26PoPh/s0=;
	b=TdKsKKye5Q0UogzDOCy56Y8IfAp+1QOuQ2pnbCCPn0ptiJJ4VzLnmcUkYXWsuvod
	ZzMnFfoOoEBYqOa7T3iJ3Lcbx1BKa13gnHfQMJbEEF7CJQt3GRDQlflxxCjGNsIy/fJ
	jiLKvELoJ2J0LM+Hl02R1sOJP7WRYzKEuO4gSvi4=
Content-Type: multipart/mixed; boundary="===============7115510845251129006=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anders Heimer <anders.heimer@est.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ca-certificates: upgrading to 20261123 SUCCEEDED
Message-ID: <010101a20c40fe11-150f9985-e359-4dee-bbe3-6ee8fd5ec23c-000000@us-west-2.amazonses.com>
Date: Tue, 24 Nov 2026 06:31:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.24-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250958

--===============7115510845251129006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ca-certificates* to *20261123* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ca-certificates-upgrade-20260816-20261123.patch
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
From 5fffa5445cecefa561cb139ad7f00ba60a58e4b8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 24 Nov 2026 06:31:48 +0000
Subject: [PATCH] ca-certificates: upgrade 20260816 -> 20261123

ca-certificates (20261123) unstable; urgency=medium
 -- Julien Cristau <jcristau@debian.org>  Mon, 23 Nov 2026 17:31:10 +0100
ca-certificates (20260816+nmu1) unstable; urgency=medium
 -- Salvatore Bonaccorso <carnil@debian.org>  Tue, 20 Oct 2026 16:40:44 +0200
---
 ...cklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch | 7 ++-----
 ...ert-mozilla-certdata2pem.py-print-a-warning-for-e.patch | 6 +++---
 ...ate-ca-certificates-don-t-use-Debianisms-in-run-p.patch | 2 +-
 ...ate-ca-certificates-use-relative-symlinks-from-ET.patch | 2 +-
 ...ertificates_20260816.bb => ca-certificates_20261123.bb} | 2 +-
 5 files changed, 8 insertions(+), 11 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260816.bb => ca-certificates_20261123.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
index 9a0258919a..78dbbd1b25 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
@@ -1,4 +1,4 @@
-From d5e08f63b1ca6746a51e62cda4df5483c0d3e2ec Mon Sep 17 00:00:00 2001
+From 5b9176971c22fd645622e272726d0b6521d7e0a5 Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@pbarker.dev>
 Date: Wed, 21 Oct 2026 07:16:23 +0100
 Subject: [PATCH] Blacklist "emSign ECC Root CA - G3" and "Comodo AAA Services
@@ -17,7 +17,7 @@ Signed-off-by: Paul Barker <paul@pbarker.dev>
  1 file changed, 5 insertions(+)
 
 diff --git a/mozilla/blacklist.txt b/mozilla/blacklist.txt
-index d84ceb919906..ba3635f7af87 100644
+index d84ceb9..ba3635f 100644
 --- a/mozilla/blacklist.txt
 +++ b/mozilla/blacklist.txt
 @@ -3,4 +3,9 @@
@@ -30,6 +30,3 @@ index d84ceb919906..ba3635f7af87 100644
 +"Comodo AAA Services root"
 +
  # Expired CAs
--- 
-2.43.0
-
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
index 001b468624..d57ee31638 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
@@ -1,4 +1,4 @@
-From 8ea56b7d5eadb04309dc3cf1e6b0d94d1d053d80 Mon Sep 17 00:00:00 2001
+From 302f1ac1dae928b29cda3821d333c38972c32ee6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 18 Oct 2021 12:05:49 +0200
 Subject: [PATCH] Revert "mozilla/certdata2pem.py: print a warning for expired
@@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  3 files changed, 1 insertion(+), 13 deletions(-)
 
 diff --git a/debian/changelog b/debian/changelog
-index 7ad495f..058ef5e 100644
+index 8a2a6c6..7ae60fb 100644
 --- a/debian/changelog
 +++ b/debian/changelog
-@@ -234,7 +234,6 @@ ca-certificates (20211004) unstable; urgency=low
+@@ -254,7 +254,6 @@ ca-certificates (20211004) unstable; urgency=low
      - "Trustis FPS Root CA"
      - "Staat der Nederlanden Root CA - G3"
    * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
index dcfa355411..23335fbf59 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -1,4 +1,4 @@
-From bab2e13b69af12c1864cccf371ebc4ef57a6fec2 Mon Sep 17 00:00:00 2001
+From c8d73c5ebc095a9f5d06d841461dc1701d0cf4c5 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Jul 2015 15:19:41 +0100
 Subject: [PATCH] ca-certificates: remove Debianism in run-parts invocation
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
index 4d97c81b0d..63b4799408 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
@@ -1,4 +1,4 @@
-From 8a5b4e2dd1479de0338db7a7234d037ef0f71c2f Mon Sep 17 00:00:00 2001
+From 33d2d57bf0a7087ae014f99f53b930cbdcee3cd0 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Wed, 28 Mar 2018 16:45:05 +0100
 Subject: [PATCH] update-ca-certificates: use relative symlinks from
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb b/meta/recipes-support/ca-certificates/ca-certificates_20261123.bb
similarity index 97%
rename from meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20261123.bb
index be1ffeae4f..04055fd119 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20261123.bb
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "d939bcdd0cb058712cf4175bac76997676eb8b68fe9473765e1b40fb3d5b186a"
+SRC_URI[sha256sum] = "ca7c16b757f342d34248874edf40e15a85d6dcf221b7e2ef2fe026e4fa4c6a51"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
-- 
2.47.1


--===============7115510845251129006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/ca-certificates/ca-certificates: FILELIST: removed "/usr/share/ca-certificates/mozilla/emSign_ECC_Root_CA_-_C3.crt /usr/share/ca-certificates/mozilla/emSign_Root_CA_-_C1.crt"
Changes to packages/all-poky-linux/ca-certificates (sysroot):
  /usr/share/ca-certificates/mozilla/emSign_ECC_Root_CA_-_C3.crt was removed
  /usr/share/ca-certificates/mozilla/emSign_Root_CA_-_C1.crt was removed

--===============7115510845251129006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ca-certificates-changelog.txt"

ca-certificates (20261123) unstable; urgency=medium
 -- Julien Cristau <jcristau@debian.org>  Mon, 23 Nov 2026 17:31:10 +0100
ca-certificates (20260816+nmu1) unstable; urgency=medium
 -- Salvatore Bonaccorso <carnil@debian.org>  Tue, 20 Oct 2026 16:40:44 +0200

--===============7115510845251129006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dbg: PKGV changed from 20260816 [default] to 20261123 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-dbg: PV changed from "20260816" to "20261123"
packages/all-poky-linux/ca-certificates/ca-certificates-dev: PKGV changed from 20260816 [default] to 20261123 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.o /lib/*.la /lib/lib*.so"
packages/all-poky-linux/ca-certificates/ca-certificates-dev: PV changed from "20260816" to "20261123"
packages/all-poky-linux/ca-certificates/ca-certificates-doc: PKGV changed from 20260816 [default] to 20261123 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-doc: PV changed from "20260816" to "20261123"
packages/all-poky-linux/ca-certificates/ca-certificates-locale: PKGV changed from 20260816 [default] to 20261123 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-locale: PV changed from "20260816" to "20261123"
packages/all-poky-linux/ca-certificates/ca-certificates-src: PKGV changed from 20260816 [default] to 20261123 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-src: PV changed from "20260816" to "20261123"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: PKGV changed from 20260816 [default] to 20261123 [default]
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: PV changed from "20260816" to "20261123"
packages/all-poky-linux/ca-certificates/ca-certificates: PKGV changed from 20260816 [default] to 20261123 [default]
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/bin/* /lib/*.so.* /sbin/*", added "/usr/lib/*.so.*"
packages/all-poky-linux/ca-certificates/ca-certificates: FILELIST: removed "/usr/share/ca-certificates/mozilla/emSign_Root_CA_-_C1.crt /usr/share/ca-certificates/mozilla/emSign_ECC_Root_CA_-_C3.crt"
packages/all-poky-linux/ca-certificates/ca-certificates: PV changed from "20260816" to "20261123"
packages/all-poky-linux/ca-certificates/ca-certificates: PKGSIZE changed from 191348 to 189209 (-1%)
packages/all-poky-linux/ca-certificates: PKGV changed from 20260816 [default] to 20261123 [default]
packages/all-poky-linux/ca-certificates: SRC_URI changed from "http://deb.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20260816.tar.xz file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch file://0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch" to "http://deb.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20261123.tar.xz file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch file://0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch"
packages/all-poky-linux/ca-certificates: PV changed from "20260816" to "20261123"
Changes to packages/all-poky-linux/ca-certificates (sysroot):
  /usr/share/ca-certificates/mozilla/emSign_ECC_Root_CA_-_C3.crt was removed
  /usr/share/ca-certificates/mozilla/emSign_Root_CA_-_C1.crt was removed

--===============7115510845251129006==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ca-certificates-upgrade-20260816-20261123.patch"

RnJvbSA1ZmZmYTU0NDVjZWNlZmE1NjFjYjEzOWFkN2YwMGJhNjBhNThlNGI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjQgTm92IDIwMjYgMDY6MzE6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
YS1jZXJ0aWZpY2F0ZXM6IHVwZ3JhZGUgMjAyNjA4MTYgLT4gMjAyNjExMjMKCmNhLWNlcnRpZmlj
YXRlcyAoMjAyNjExMjMpIHVuc3RhYmxlOyB1cmdlbmN5PW1lZGl1bQogLS0gSnVsaWVuIENyaXN0
YXUgPGpjcmlzdGF1QGRlYmlhbi5vcmc+ICBNb24sIDIzIE5vdiAyMDI2IDE3OjMxOjEwICswMTAw
CmNhLWNlcnRpZmljYXRlcyAoMjAyNjA4MTYrbm11MSkgdW5zdGFibGU7IHVyZ2VuY3k9bWVkaXVt
CiAtLSBTYWx2YXRvcmUgQm9uYWNjb3JzbyA8Y2FybmlsQGRlYmlhbi5vcmc+ICBUdWUsIDIwIE9j
dCAyMDI2IDE2OjQwOjQ0ICswMjAwCi0tLQogLi4uY2tsaXN0LWVtU2lnbi1FQ0MtUm9vdC1DQS1H
My1hbmQtQ29tb2RvLUFBQS1TZXJ2aS5wYXRjaCB8IDcgKystLS0tLQogLi4uZXJ0LW1vemlsbGEt
Y2VydGRhdGEycGVtLnB5LXByaW50LWEtd2FybmluZy1mb3ItZS5wYXRjaCB8IDYgKysrLS0tCiAu
Li5hdGUtY2EtY2VydGlmaWNhdGVzLWRvbi10LXVzZS1EZWJpYW5pc21zLWluLXJ1bi1wLnBhdGNo
IHwgMiArLQogLi4uYXRlLWNhLWNlcnRpZmljYXRlcy11c2UtcmVsYXRpdmUtc3ltbGlua3MtZnJv
bS1FVC5wYXRjaCB8IDIgKy0KIC4uLmVydGlmaWNhdGVzXzIwMjYwODE2LmJiID0+IGNhLWNlcnRp
ZmljYXRlc18yMDI2MTEyMy5iYn0gfCAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMTEgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2Vy
dGlmaWNhdGVzL3tjYS1jZXJ0aWZpY2F0ZXNfMjAyNjA4MTYuYmIgPT4gY2EtY2VydGlmaWNhdGVz
XzIwMjYxMTIzLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Nh
LWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMvMDAwMS1CbGFja2xpc3QtZW1TaWduLUVDQy1S
b290LUNBLUczLWFuZC1Db21vZG8tQUFBLVNlcnZpLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAxLUJsYWNrbGlzdC1lbVNpZ24t
RUNDLVJvb3QtQ0EtRzMtYW5kLUNvbW9kby1BQUEtU2VydmkucGF0Y2gKaW5kZXggOWEwMjU4OTE5
YS4uNzhkYmJkMWIyNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlm
aWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAxLUJsYWNrbGlzdC1lbVNpZ24tRUNDLVJvb3QtQ0Et
RzMtYW5kLUNvbW9kby1BQUEtU2VydmkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Y2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAxLUJsYWNrbGlzdC1lbVNpZ24tRUND
LVJvb3QtQ0EtRzMtYW5kLUNvbW9kby1BQUEtU2VydmkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGQ1ZTA4ZjYzYjFjYTY3NDZhNTFlNjJjZGE0ZGY1NDgzYzBkM2UyZWMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDViOTE3Njk3MWMyMmZkNjQ1NjIyZTI3MjcyNmQwYjY1MjFkN2Uw
YTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXVsIEJhcmtlciA8cGF1bEBwYmFy
a2VyLmRldj4KIERhdGU6IFdlZCwgMjEgT2N0IDIwMjYgMDc6MTY6MjMgKzAxMDAKIFN1YmplY3Q6
IFtQQVRDSF0gQmxhY2tsaXN0ICJlbVNpZ24gRUNDIFJvb3QgQ0EgLSBHMyIgYW5kICJDb21vZG8g
QUFBIFNlcnZpY2VzCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IFBhdWwgQmFya2Vy
IDxwYXVsQHBiYXJrZXIuZGV2PgogIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKIAog
ZGlmZiAtLWdpdCBhL21vemlsbGEvYmxhY2tsaXN0LnR4dCBiL21vemlsbGEvYmxhY2tsaXN0LnR4
dAotaW5kZXggZDg0Y2ViOTE5OTA2Li5iYTM2MzVmN2FmODcgMTAwNjQ0CitpbmRleCBkODRjZWI5
Li5iYTM2MzVmIDEwMDY0NAogLS0tIGEvbW96aWxsYS9ibGFja2xpc3QudHh0CiArKysgYi9tb3pp
bGxhL2JsYWNrbGlzdC50eHQKIEBAIC0zLDQgKzMsOSBAQApAQCAtMzAsNiArMzAsMyBAQCBpbmRl
eCBkODRjZWI5MTk5MDYuLmJhMzYzNWY3YWY4NyAxMDA2NDQKICsiQ29tb2RvIEFBQSBTZXJ2aWNl
cyByb290IgogKwogICMgRXhwaXJlZCBDQXMKLS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMvMDAwMS1S
ZXZlcnQtbW96aWxsYS1jZXJ0ZGF0YTJwZW0ucHktcHJpbnQtYS13YXJuaW5nLWZvci1lLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8w
MDAxLVJldmVydC1tb3ppbGxhLWNlcnRkYXRhMnBlbS5weS1wcmludC1hLXdhcm5pbmctZm9yLWUu
cGF0Y2gKaW5kZXggMDAxYjQ2ODYyNC4uZDU3ZWUzMTYzOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAxLVJldmVydC1t
b3ppbGxhLWNlcnRkYXRhMnBlbS5weS1wcmludC1hLXdhcm5pbmctZm9yLWUucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRlcy8wMDAx
LVJldmVydC1tb3ppbGxhLWNlcnRkYXRhMnBlbS5weS1wcmludC1hLXdhcm5pbmctZm9yLWUucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDhlYTU2YjdkNWVhZGIwNDMwOWRjM2NmMWU2YjBkOTRk
MWQwNTNkODAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDMwMmYxYWMxZGFlOTI4YjI5
Y2RhMzgyMWQzMzNjMzg5NzJjMzJlZTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogTW9uLCAxOCBPY3Qg
MjAyMSAxMjowNTo0OSArMDIwMAogU3ViamVjdDogW1BBVENIXSBSZXZlcnQgIm1vemlsbGEvY2Vy
dGRhdGEycGVtLnB5OiBwcmludCBhIHdhcm5pbmcgZm9yIGV4cGlyZWQKQEAgLTE2LDEwICsxNiwx
MCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRl
PgogIDMgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEzIGRlbGV0aW9ucygtKQogCiBk
aWZmIC0tZ2l0IGEvZGViaWFuL2NoYW5nZWxvZyBiL2RlYmlhbi9jaGFuZ2Vsb2cKLWluZGV4IDdh
ZDQ5NWYuLjA1OGVmNWUgMTAwNjQ0CitpbmRleCA4YTJhNmM2Li43YWU2MGZiIDEwMDY0NAogLS0t
IGEvZGViaWFuL2NoYW5nZWxvZwogKysrIGIvZGViaWFuL2NoYW5nZWxvZwotQEAgLTIzNCw3ICsy
MzQsNiBAQCBjYS1jZXJ0aWZpY2F0ZXMgKDIwMjExMDA0KSB1bnN0YWJsZTsgdXJnZW5jeT1sb3cK
K0BAIC0yNTQsNyArMjU0LDYgQEAgY2EtY2VydGlmaWNhdGVzICgyMDIxMTAwNCkgdW5zdGFibGU7
IHVyZ2VuY3k9bG93CiAgICAgIC0gIlRydXN0aXMgRlBTIFJvb3QgQ0EiCiAgICAgIC0gIlN0YWF0
IGRlciBOZWRlcmxhbmRlbiBSb290IENBIC0gRzMiCiAgICAqIEJsYWNrbGlzdCBleHBpcmVkIHJv
b3QgY2VydGlmaWNhdGUgIkRTVCBSb290IENBIFgzIiAoY2xvc2VzOiAjOTk1NDMyKQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRpZmljYXRl
cy8wMDAxLXVwZGF0ZS1jYS1jZXJ0aWZpY2F0ZXMtZG9uLXQtdXNlLURlYmlhbmlzbXMtaW4tcnVu
LXAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlm
aWNhdGVzLzAwMDEtdXBkYXRlLWNhLWNlcnRpZmljYXRlcy1kb24tdC11c2UtRGViaWFuaXNtcy1p
bi1ydW4tcC5wYXRjaAppbmRleCBkY2ZhMzU1NDExLi4yMzMzNWZiZjU5IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzLzAwMDEt
dXBkYXRlLWNhLWNlcnRpZmljYXRlcy1kb24tdC11c2UtRGViaWFuaXNtcy1pbi1ydW4tcC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNh
dGVzLzAwMDEtdXBkYXRlLWNhLWNlcnRpZmljYXRlcy1kb24tdC11c2UtRGViaWFuaXNtcy1pbi1y
dW4tcC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmFiMmUxM2I2OWFmMTJjMTg2NGNjY2Yz
NzFlYmM0ZWY1N2E2ZmVjMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzhkNzNjNWVi
YzA5NWE5ZjVkMDZkODQxNDYxZGMxNzAxZDBjZjRjNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBNb24sIDYg
SnVsIDIwMTUgMTU6MTk6NDEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gY2EtY2VydGlmaWNhdGVz
OiByZW1vdmUgRGViaWFuaXNtIGluIHJ1bi1wYXJ0cyBpbnZvY2F0aW9uCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2EtY2VydGlmaWNhdGVzLzAwMDMt
dXBkYXRlLWNhLWNlcnRpZmljYXRlcy11c2UtcmVsYXRpdmUtc3ltbGlua3MtZnJvbS1FVC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMv
MDAwMy11cGRhdGUtY2EtY2VydGlmaWNhdGVzLXVzZS1yZWxhdGl2ZS1zeW1saW5rcy1mcm9tLUVU
LnBhdGNoCmluZGV4IDRkOTdjODFiMGQuLjYzYjQ3OTk0MDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMvMDAwMy11cGRhdGUt
Y2EtY2VydGlmaWNhdGVzLXVzZS1yZWxhdGl2ZS1zeW1saW5rcy1mcm9tLUVULnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXMvMDAw
My11cGRhdGUtY2EtY2VydGlmaWNhdGVzLXVzZS1yZWxhdGl2ZS1zeW1saW5rcy1mcm9tLUVULnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4YTViNGUyZGQxNDc5ZGUwMzM4ZGI3YTcyMzRkMDM3
ZWYwZjcxYzJmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzM2QyZDU3YmYwYTcwODdh
ZTAxNGY5OWY1M2I5MzBjYmRjZWUzY2QwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
PT9VVEYtOD9xP0FuZHI9QzM9QTk9MjBEcmFzemlrPz0gPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4K
IERhdGU6IFdlZCwgMjggTWFyIDIwMTggMTY6NDU6MDUgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0g
dXBkYXRlLWNhLWNlcnRpZmljYXRlczogdXNlIHJlbGF0aXZlIHN5bWxpbmtzIGZyb20KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0
ZXNfMjAyNjA4MTYuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZpY2F0ZXMvY2Et
Y2VydGlmaWNhdGVzXzIwMjYxMTIzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9jYS1jZXJ0aWZpY2F0ZXNfMjAy
NjA4MTYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2NhLWNlcnRpZmljYXRlcy9j
YS1jZXJ0aWZpY2F0ZXNfMjAyNjExMjMuYmIKaW5kZXggYmUxZmZlYWU0Zi4uMDQwNTVmZDExOSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY2EtY2VydGlmaWNhdGVzL2NhLWNlcnRp
ZmljYXRlc18yMDI2MDgxNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jYS1jZXJ0aWZp
Y2F0ZXMvY2EtY2VydGlmaWNhdGVzXzIwMjYxMTIzLmJiCkBAIC0xNCw3ICsxNCw3IEBAIERFUEVO
RFM6Y2xhc3MtbmF0aXZlc2RrID0gIm9wZW5zc2wtbmF0aXZlIgogIyBOZWVkIHJlaGFzaCBmcm9t
IG9wZW5zc2wgYW5kIHJ1bi1wYXJ0cyBmcm9tIGRlYmlhbnV0aWxzCiBQQUNLQUdFX1dSSVRFX0RF
UFMgKz0gIm9wZW5zc2wtbmF0aXZlIGRlYmlhbnV0aWxzLW5hdGl2ZSIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImQ5MzliY2RkMGNiMDU4NzEyY2Y0MTc1YmFjNzY5OTc2NzZlYjhiNjhmZTk0NzM3
NjVlMWI0MGZiM2Q1YjE4NmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2E3YzE2Yjc1N2YzNDJk
MzQyNDg4NzRlZGY0MGUxNWE4NWQ2ZGNmMjIxYjdlMmVmMmZlMDI2ZTRmYTRjNmE1MSIKIFNSQ19V
UkkgPSAiJHtERUJJQU5fTUlSUk9SfS9tYWluL2MvY2EtY2VydGlmaWNhdGVzLyR7QlBOfV8ke1BW
fS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS11cGRhdGUtY2EtY2VydGlmaWNhdGVz
LWRvbi10LXVzZS1EZWJpYW5pc21zLWluLXJ1bi1wLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDMtdXBkYXRlLWNhLWNlcnRpZmljYXRlcy11c2UtcmVsYXRpdmUtc3ltbGlua3MtZnJvbS1F
VC5wYXRjaCBcCi0tIAoyLjQ3LjEKCg==

--===============7115510845251129006==--
