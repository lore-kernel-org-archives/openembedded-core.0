Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1R7rDj-0002oW-Pf
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 18:06:26 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PG3TBG016353 for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:29 +0100
X-Quarantine-ID: <jV4Gn7-NldKC>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jV4Gn7-NldKC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:28 +0100 (BST)
Received: from ted (tim [93.97.173.237])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PG3Pmk016309
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 17:03:27 +0100
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1R7r4g-0005Wx-Ig
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 16:57:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2011 16:56:56 +0100
Message-Id: <34a14ce3ea78be299175e1a803f92519aa02355b.1316963134.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8ad24306d8bc9c2fd73f4b814eb1a64c04707da5.1316963134.git.richard.purdie@linuxfoundation.org>
References: <8ad24306d8bc9c2fd73f4b814eb1a64c04707da5.1316963134.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1316963134.git.richard.purdie@linuxfoundation.org>
References: <cover.1316963134.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/9] libsndfile1: Disable external codec librbaries since we don't list in DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Sep 2011 16:06:26 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libsndfile/libsndfile1_1.0.24.bb               |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.24.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.24.bb
index a547d76..7b8bcae 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.24.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.24.bb
@@ -4,7 +4,7 @@ AUTHOR = "Erik de Castro Lopo"
 DEPENDS = "sqlite3"
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz"
 
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
 
 S = "${WORKDIR}/libsndfile-${PV}"
 
+EXTRA_OECONF = "--disable-external-libs"
+
 inherit autotools lib_package pkgconfig
 
 do_configure_prepend_arm() {
-- 
1.7.5.4



