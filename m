Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TyJGu-000200-4Y
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 10:39:00 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0O9NQ6V029355
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jan 2013 01:23:26 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 24 Jan 2013 01:23:25 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Thu, 24 Jan 2013 17:24:35 +0800
Message-ID: <f2c03c666c1c03ce1fc778d430fa7f0330ad1681.1359019292.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1359019292.git.kai.kang@windriver.com>
References: <cover.1359019292.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] perl-native: update to 5.14.3:
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 09:39:00 -0000
Content-Type: text/plain

There is a securty issue:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-5195
Update perl to 5.14.3 could resolve this problem. And update perl-native
first.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../Configure-multilib.patch                       |    0
 .../{perl-5.14.2 => perl-5.14.3}/MM_Unix.pm.patch  |    0
 .../native-nopacklist.patch                        |    0
 .../native-perlinc.patch                           |    0
 .../perl-build-in-t-dir.patch                      |    0
 .../perl-configpm-switch.patch                     |    0
 ...perl-native_5.14.2.bb => perl-native_5.14.3.bb} |    6 +++---
 7 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/Configure-multilib.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/MM_Unix.pm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/native-nopacklist.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/native-perlinc.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-build-in-t-dir.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-configpm-switch.patch (100%)
 rename meta/recipes-devtools/perl/{perl-native_5.14.2.bb => perl-native_5.14.3.bb} (96%)

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/Configure-multilib.patch b/meta/recipes-devtools/perl/perl-5.14.3/Configure-multilib.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/Configure-multilib.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/Configure-multilib.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/MM_Unix.pm.patch b/meta/recipes-devtools/perl/perl-5.14.3/MM_Unix.pm.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/MM_Unix.pm.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/MM_Unix.pm.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/native-nopacklist.patch b/meta/recipes-devtools/perl/perl-5.14.3/native-nopacklist.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/native-nopacklist.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/native-nopacklist.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/native-perlinc.patch b/meta/recipes-devtools/perl/perl-5.14.3/native-perlinc.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/native-perlinc.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/native-perlinc.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch b/meta/recipes-devtools/perl/perl-5.14.3/perl-build-in-t-dir.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/perl-build-in-t-dir.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-configpm-switch.patch b/meta/recipes-devtools/perl/perl-5.14.3/perl-configpm-switch.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/perl-configpm-switch.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/perl-configpm-switch.patch
diff --git a/meta/recipes-devtools/perl/perl-native_5.14.2.bb b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
similarity index 96%
rename from meta/recipes-devtools/perl/perl-native_5.14.2.bb
rename to meta/recipes-devtools/perl/perl-native_5.14.3.bb
index 9f6a077..9416005 100644
--- a/meta/recipes-devtools/perl/perl-native_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 		    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
-PR = "r1"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
@@ -20,8 +20,8 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
            file://MM_Unix.pm.patch \
            file://perl-build-in-t-dir.patch"
 
-SRC_URI[md5sum] = "3306fbaf976dcebdcd49b2ac0be00eb9"
-SRC_URI[sha256sum] = "6488359573bd7d41761bf935f66f827dc220fb3df961ef9b775d51fbd66548d3"
+SRC_URI[md5sum] = "f6a3d878c688d111b495c87db56c5be5"
+SRC_URI[sha256sum] = "03638a4f01bc26b81231233671524b4163849a3a9ea5cc2397293080c4ea339f"
 
 S = "${WORKDIR}/perl-${PV}"
 
-- 
1.7.5.4



