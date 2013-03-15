Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1UGInb-0007Fi-LD
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 01:47:13 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2F0UNnf009687
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2013 17:30:23 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 14 Mar 2013 17:30:23 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Mar 2013 17:30:22 -0700
Message-ID: <1363307422-24753-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1363307422-24753-1-git-send-email-jslater@windriver.com>
References: <1363307422-24753-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] [v2]tzcode-native & tzdata: update to 2013b versions
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
X-List-Received-Date: Fri, 15 Mar 2013 00:47:25 -0000
Content-Type: text/plain

Rename 2012j recipes and update version related
information.  Add one comment.
---
 ...code-native_2012j.bb => tzcode-native_2013b.bb} |   12 +++--
 .../tzdata/{tzdata_2012j.bb => tzdata_2013b.bb}    |   54 +++++++++++++-------
 2 files changed, 43 insertions(+), 23 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2012j.bb => tzcode-native_2013b.bb} (52%)
 rename meta/recipes-extended/tzdata/{tzdata_2012j.bb => tzdata_2013b.bb} (88%)

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
similarity index 88%
rename from meta/recipes-extended/tzdata/tzdata_2012j.bb
rename to meta/recipes-extended/tzdata/tzdata_2013b.bb
index 25220cc..3f98739 100644
--- a/meta/recipes-extended/tzdata/tzdata_2012j.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2013b.bb
@@ -1,3 +1,6 @@
+#
+# Copyright (C) 2013 Wind River Systems, Inc.
+#
 DESCRIPTION = "Timezone data"
 HOMEPAGE = "ftp://elsie.nci.nih.gov/pub/"
 SECTION = "base"
@@ -5,9 +8,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
-PR = "r3"
-
-inherit allarch
+PR = "r1"
 
 RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarctica \
              timezone-arctic timezone-asia timezone-atlantic \
@@ -16,8 +17,8 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "ba2f92ae7ad099090e8f86cff2f2d799"
-SRC_URI[tzdata.sha256sum] = "4b6a3c2831bdbb68ab1a1bf906bcf11d18ab78009713a0339da6fe96b6afceaa"
+SRC_URI[tzdata.md5sum] = "489dbca77d1f2e287a3987ca047bb246"
+SRC_URI[tzdata.sha256sum] = "70d589d0e76a3749403d2bb404e9214c2520dda4c13e4b07b1b945ed2c64edb2"
 
 S = "${WORKDIR}"
 
@@ -47,40 +48,57 @@ do_install () {
         cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
 
         # Install default timezone
-        if [ -e ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ]; then
-            install -d ${D}${sysconfdir}
-            echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
-            ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
-        else
-            bberror "DEFAULT_TIMEZONE is set to an invalid value."
-            exit 1
-        fi
+        install -d ${D}${sysconfdir}
+        echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
 
         chown -R root:root ${D}
 }
 
 pkg_postinst_${PN} () {
+
+# code taken from Gentoo's tzdata ebuild
+
 	etc_lt="$D${sysconfdir}/localtime"
 	src="$D${sysconfdir}/timezone"
 
 	if [ -e ${src} ] ; then
 		tz=$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e '/^$/d' "${src}")
+	else
+		tz="FUBAR"
 	fi
 	
 	if [ -z ${tz} ] ; then
 		return 0
 	fi
 	
+	if [ ${tz} = "FUBAR" ] ; then
+		echo "You do not have TIMEZONE set in ${src}."
+
+		if [ ! -e ${etc_lt} ] ; then
+			# if /etc/localtime is a symlink somewhere, assume they
+			# know what they're doing and they're managing it themselves
+			if [ ! -L ${etc_lt} ] ; then
+				cp -f "$D${datadir}/zoneinfo/Universal" "${etc_lt}"
+				echo "Setting ${etc_lt} to Universal."
+			else
+				echo "Assuming your ${etc_lt} symlink is what you want; skipping update."
+			fi
+		else
+			echo "Skipping auto-update of ${etc_lt}."
+		fi
+		return 0
+	fi
+
 	if [ ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
 		echo "You have an invalid TIMEZONE setting in ${src}"
 		echo "Your ${etc_lt} has been reset to Universal; enjoy!"
 		tz="Universal"
-		echo "Updating ${etc_lt} with $D${datadir}/zoneinfo/${tz}"
-		if [ -L ${etc_lt} ] ; then
-			rm -f "${etc_lt}"
-		fi
-		ln -s "${datadir}/zoneinfo/${tz}" "${etc_lt}"
 	fi
+	echo "Updating ${etc_lt} with $D${datadir}/zoneinfo/${tz}"
+	if [ -L ${etc_lt} ] ; then
+		rm -f "${etc_lt}"
+	fi
+	cp -f "$D${datadir}/zoneinfo/${tz}" "${etc_lt}"
 }
 
 # Packages primarily organized by directory with a major city
-- 
1.7.3.4



