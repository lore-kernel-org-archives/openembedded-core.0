Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id 609A479F6F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:45:17 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 542B5FF80A;
	Sat,  3 Nov 2018 16:45:15 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:17 -0700
Message-Id: <20181103164427.16125-16-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 15/25] openssl_1.0: drop obsolete ca.patch
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
X-List-Received-Date: Sat, 03 Nov 2018 16:45:17 -0000

From: Andre McCurdy <armccurdy@gmail.com>

This patch adds a second line to the -help output of the CA.pl script
(which lists almost the same command line options as the line above
it but in a slightly different order). Although it's tagged as a
Debian backport, there's no patch like it in recent Debian patch sets
for openssl 1.0.2.

(From OE-Core rev: 9b3af406747a3d565d12d948400d44fb12ab0d96)

(From OE-Core rev: 4a136f8b2cfb6cdd5ba16a2ebbe9b418fead1c76)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openssl/openssl-1.0.2o/debian/ca.patch    | 22 -------------------
 .../openssl/openssl_1.0.2o.bb                 |  1 -
 2 files changed, 23 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
deleted file mode 100644
index fb745e4394..0000000000
--- a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8m/apps/CA.pl.in
-===================================================================
---- openssl-0.9.8m.orig/apps/CA.pl.in	2006-04-28 00:28:51.000000000 +0000
-+++ openssl-0.9.8m/apps/CA.pl.in	2010-02-27 00:36:51.000000000 +0000
-@@ -65,6 +65,7 @@
- foreach (@ARGV) {
- 	if ( /^(-\?|-h|-help)$/ ) {
- 	    print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-signcert|-verify\n";
-+	    print STDERR "usage: CA -signcert certfile keyfile|-newcert|-newreq|-newca|-sign|-verify\n";
- 	    exit 0;
- 	} elsif (/^-newcert$/) {
- 	    # create a certificate
-@@ -165,6 +166,7 @@
- 	} else {
- 	    print STDERR "Unknown arg $_\n";
- 	    print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-verify\n";
-+	    print STDERR "usage: CA -signcert certfile keyfile|-newcert|-newreq|-newca|-sign|-verify\n";
- 	    exit 1;
- 	}
- }
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index d48265e884..d2dfc5925a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -23,7 +23,6 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://engines-install-in-libdir-ssl.patch \
            file://debian1.0.2/block_diginotar.patch \
            file://debian1.0.2/block_digicert_malaysia.patch \
-           file://debian/ca.patch \
            file://debian/c_rehash-compat.patch \
            file://debian/debian-targets.patch \
            file://debian/man-dir.patch \
-- 
2.18.1


