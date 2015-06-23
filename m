Return-Path: <hugo.saldanha@aker.com.br>
X-Greylist: delayed 608 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Jun 2015 14:54:41 UTC
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id 59DD873905
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:54:41 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Tue, 23 Jun 2015 11:54:36 -0300
	(envelope-from hugo.saldanha@aker.com.br)
Received: from saldanha.aker.com.br (10.4.3.1) by mail.aker.com.br (10.0.0.20)
	with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 23 Jun 2015 11:44:31 -0300
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2015 11:48:23 -0300
Message-ID: <1435070903-24433-1-git-send-email-hugo.saldanha@aker.com.br>
X-Mailer: git-send-email 2.4.4
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: efa1de5243ffebe9bf836ee14063171c1764dbbe
X-AkerSMTPGW-MessageID: ea8b55c32c6786c8848694b3575743eff0efe161-10o
Subject: [dizzy][PATCH] openssl: upgrade to v1.0.1o
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jun 2015 14:54:43 -0000
Content-Type: text/plain

The upgrade fixes the following CVEs:

CVE-2015-4000
CVE-2015-1788
CVE-2015-1789
CVE-2015-1790
CVE-2015-1792
CVE-2015-1791

A patch was updated so it could be applied cleanly to the new version.

Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
---
 .../openssl/openssl/debian/man-section.patch                | 13 ++++++-------
 .../openssl/{openssl_1.0.1m.bb => openssl_1.0.1o.bb}        |  4 ++--
 2 files changed, 8 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.1m.bb => openssl_1.0.1o.bb} (92%)

diff --git a/meta/recipes-connectivity/openssl/openssl/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl/debian/man-section.patch
index 21c1d1a..583b5d8 100644
--- a/meta/recipes-connectivity/openssl/openssl/debian/man-section.patch
+++ b/meta/recipes-connectivity/openssl/openssl/debian/man-section.patch
@@ -1,11 +1,10 @@
 Upstream-Status: Backport [debian]
 
-Index: openssl-1.0.0c/Makefile.org
-===================================================================
---- openssl-1.0.0c.orig/Makefile.org	2010-12-12 16:11:37.000000000 +0100
-+++ openssl-1.0.0c/Makefile.org	2010-12-12 16:13:28.000000000 +0100
+diff -ur openssl-1.0.1o.orig/Makefile.org openssl-1.0.1o/Makefile.org
+--- openssl-1.0.1o.orig/Makefile.org	2015-06-12 12:17:52.000000000 -0300
++++ openssl-1.0.1o/Makefile.org	2015-06-23 09:57:43.929893419 -0300
 @@ -160,7 +160,8 @@
- MANDIR=/usr/share/man
+ MANDIR=$(OPENSSLDIR)/man
  MAN1=1
  MAN3=3
 -MANSUFFIX=
@@ -14,7 +13,7 @@ Index: openssl-1.0.0c/Makefile.org
  HTMLSUFFIX=html
  HTMLDIR=$(OPENSSLDIR)/html
  SHELL=/bin/sh
-@@ -651,7 +652,7 @@
+@@ -642,7 +643,7 @@
  		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
  		(cd `$(PERL) util/dirname.pl $$i`; \
  		sh -c "$$pod2man \
@@ -23,7 +22,7 @@ Index: openssl-1.0.0c/Makefile.org
  			--release=$(VERSION) `basename $$i`") \
  			>  $(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX); \
  		$(PERL) util/extract-names.pl < $$i | \
-@@ -668,7 +669,7 @@
+@@ -659,7 +660,7 @@
  		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
  		(cd `$(PERL) util/dirname.pl $$i`; \
  		sh -c "$$pod2man \
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1m.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1o.bb
similarity index 92%
rename from meta/recipes-connectivity/openssl/openssl_1.0.1m.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.1o.bb
index cab6b3f..44d4d27 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1m.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1o.bb
@@ -37,8 +37,8 @@ SRC_URI += "file://configure-targets.patch \
             file://run-ptest \
            "
 
-SRC_URI[md5sum] = "d143d1555d842a069cb7cc34ba745a06"
-SRC_URI[sha256sum] = "095f0b7b09116c0c5526422088058dc7e6e000aa14d22acca6a4e2babcdfef74"
+SRC_URI[md5sum] = "af1096f500a612e2e2adacb958d7eab1"
+SRC_URI[sha256sum] = "16e678c6a05f2502811e075f2c4059ac01c878d091c9c585afc49ebc541f7b13"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
2.4.4



