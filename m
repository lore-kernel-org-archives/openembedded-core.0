Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QVLqG-0007h6-21
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 12:55:00 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Sat, 11 Jun 2011
	12:50:35 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jun 2011 12:50:21 +0200
Message-ID: <1307789421-20911-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH v2] perl-native: fix download url
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
X-List-Received-Date: Sat, 11 Jun 2011 10:55:00 -0000
Content-Type: text/plain

Signed-off-by: Anders Darander <anders@chargestorm.se>
---

v2: Changed to www.cpan.org instead of ftp.funet.fi.

 meta/recipes-devtools/perl/perl-native_5.12.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-native_5.12.3.bb b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
index cbb4e78..50fa1c9 100644
--- a/meta/recipes-devtools/perl/perl-native_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
@@ -9,7 +9,7 @@ PR = "r2"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
 
-SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
+SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
            file://Configure-multilib.patch \
            file://perl-configpm-switch.patch \
            file://parallel_build_fix_1.patch \
-- 
1.7.4.1



