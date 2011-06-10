Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QV7MI-0004Aw-Ds
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 21:27:06 +0200
Received: from localhost (85.231.30.150) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Fri, 10 Jun 2011
	21:22:38 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jun 2011 21:22:11 +0200
Message-ID: <1307733731-3693-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.3
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH] perl-native: fix download url
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
X-List-Received-Date: Fri, 10 Jun 2011 19:27:06 -0000
Content-Type: text/plain

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/perl/perl-native_5.12.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-native_5.12.3.bb b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
index cbb4e78..1751516 100644
--- a/meta/recipes-devtools/perl/perl-native_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
@@ -9,7 +9,7 @@ PR = "r2"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
 
-SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
+SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/5.0/perl-${PV}.tar.gz \
            file://Configure-multilib.patch \
            file://perl-configpm-switch.patch \
            file://parallel_build_fix_1.patch \
-- 
1.7.4.1



