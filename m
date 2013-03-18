Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1UHhDa-0001mQ-Q1
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 22:03:43 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2IKkqqp011441
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 13:46:52 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 18 Mar 2013 13:46:53 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2013 13:46:51 -0700
Message-ID: <1363639611-21822-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1363639611-21822-1-git-send-email-jslater@windriver.com>
References: <1363639611-21822-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [PATCH [v3] 1/1] tzcode & tzdata: update to 2013b versions
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
X-List-Received-Date: Mon, 18 Mar 2013 21:03:45 -0000
Content-Type: text/plain

Rename and modifying existing recipes to use 2013b
versions of time zone.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 ...code-native_2012j.bb => tzcode-native_2013b.bb} |   12 +++++++-----
 .../tzdata/{tzdata_2012j.bb => tzdata_2013b.bb}    |    6 +++---
 2 files changed, 10 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2012j.bb => tzcode-native_2013b.bb} (52%)
 rename meta/recipes-extended/tzdata/{tzdata_2012j.bb => tzdata_2013b.bb} (98%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2012j.bb b/meta/recipes-extended/tzcode/tzcode-native_2013b.bb
similarity index 52%
rename from meta/recipes-extended/tzcode/tzcode-native_2012j.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2013b.bb
index 938f072..d84b0de 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2012j.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2013b.bb
@@ -4,13 +4,15 @@ PR = "r1"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d7a19b8c6d8a28785c4cd04ff2e46d27"
 
+# note that we allow for us to use data later than our code version
+#
 SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2012j.tar.gz;name=tzdata"
+           ftp://ftp.iana.org/tz/releases/tzdata2013b.tar.gz;name=tzdata"
 
-SRC_URI[tzcode.md5sum] = "868b5d0dbf0e115ae4eb39a932ad0c4c"
-SRC_URI[tzcode.sha256sum] = "ee4361b3b4ae201a270857c84d0f063c2a2191b3e4cd7414ea4622bb8bae9a82"
-SRC_URI[tzdata.md5sum] = "ba2f92ae7ad099090e8f86cff2f2d799"
-SRC_URI[tzdata.sha256sum] = "4b6a3c2831bdbb68ab1a1bf906bcf11d18ab78009713a0339da6fe96b6afceaa"
+SRC_URI[tzcode.md5sum] = "c8bb91ce60092ef61d628d104ad3dab1"
+SRC_URI[tzcode.sha256sum] = "fda9a8bd15f06939f0ecd1edba17d5e66d4d526632145609574459b250ab0efb"
+SRC_URI[tzdata.md5sum] = "489dbca77d1f2e287a3987ca047bb246"
+SRC_URI[tzdata.sha256sum] = "70d589d0e76a3749403d2bb404e9214c2520dda4c13e4b07b1b945ed2c64edb2"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-extended/tzdata/tzdata_2012j.bb b/meta/recipes-extended/tzdata/tzdata_2013b.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2012j.bb
rename to meta/recipes-extended/tzdata/tzdata_2013b.bb
index 25220cc..050356b 100644
--- a/meta/recipes-extended/tzdata/tzdata_2012j.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2013b.bb
@@ -5,7 +5,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
-PR = "r3"
+PR = "r1"
 
 inherit allarch
 
@@ -16,8 +16,8 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "ba2f92ae7ad099090e8f86cff2f2d799"
-SRC_URI[tzdata.sha256sum] = "4b6a3c2831bdbb68ab1a1bf906bcf11d18ab78009713a0339da6fe96b6afceaa"
+SRC_URI[tzdata.md5sum] = "489dbca77d1f2e287a3987ca047bb246"
+SRC_URI[tzdata.sha256sum] = "70d589d0e76a3749403d2bb404e9214c2520dda4c13e4b07b1b945ed2c64edb2"
 
 S = "${WORKDIR}"
 
-- 
1.7.3.4



