Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy4R-000266-Fn
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:21:55 +0200
Received: by mail-iy0-f175.google.com with SMTP id 12so2181793iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cKu7ZpRmCmnSXn2rc+UR+5ob3c666OVOABoPcXX64+g=;
	b=em/KUt/8TWGLXRdILEW/op6WidM5LYJdslZs9kdWXm0Tk4SBKgfZqA4v5QPNbSbz+V
	HWfUJPDTSsdBiOsa/Z9xU3JMSnwhrJDuBogVkylH8J07jiVMSCgN/UYYVxE1uMm4stGI
	xb7cKPG1vnT45fb4nJfKqdjKIuVlXJRQofj4U=
Received: by 10.42.161.201 with SMTP id u9mr7216420icx.192.1311034672009;
	Mon, 18 Jul 2011 17:17:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm3248255ibg.14.2011.07.18.17.17.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:17:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:26 -0700
Message-Id: <5fb87d4503b90b087cbe85353f827778140f3c46.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
Subject: [PATCH 07/16] tzcode,tzdata: Update tzdata to 2011h
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
X-List-Received-Date: Tue, 19 Jul 2011 00:21:57 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/tzcode/tzcode-native_2011g.bb |    7 +++----
 .../tzdata/{tzdata_2011g.bb => tzdata_2011h.bb}    |    8 ++++----
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2011g.bb => tzdata_2011h.bb} (96%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2011g.bb b/meta/recipes-extended/tzcode/tzcode-native_2011g.bb
index 95ba7ef..c4ed0ec 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2011g.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2011g.bb
@@ -5,13 +5,12 @@ PR = "r0"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=3ae8198f82258417ce29066d3b034035"
 
 SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://elsie.nci.nih.gov/pub/tzdata2011g.tar.gz;name=tzdata"
+           ftp://elsie.nci.nih.gov/pub/tzdata2011h.tar.gz;name=tzdata"
 
 SRC_URI[tzcode.md5sum] = "ecb564279b28c5b184421c525d997d6c"
 SRC_URI[tzcode.sha256sum] = "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
-SRC_URI[tzdata.md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
-SRC_URI[tzdata.sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
-
+SRC_URI[tzdata.md5sum] = "546d27b6c1e5e1097bd512651815017f"
+SRC_URI[tzdata.sha256sum] = "c098786d053736dd18d4f1fbebdf41554c6fd702a36f75c18f1c66712d2abc24"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-extended/tzdata/tzdata_2011g.bb b/meta/recipes-extended/tzdata/tzdata_2011h.bb
similarity index 96%
rename from meta/recipes-extended/tzdata/tzdata_2011g.bb
rename to meta/recipes-extended/tzdata/tzdata_2011h.bb
index 1437e43..284cc5c 100644
--- a/meta/recipes-extended/tzdata/tzdata_2011g.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2011h.bb
@@ -5,17 +5,17 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
-PR = "r1"
+PR = "r0"
 
 RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
              timezone-arctic timezone-asia timezone-atlantic \
              timezone-australia timezone-europe timezone-indian \
              timezone-iso3166.tab timezone-pacific timezone-zone.tab"
 
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz"
+SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
-SRC_URI[sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
+SRC_URI[tzdata.md5sum] = "546d27b6c1e5e1097bd512651815017f"
+SRC_URI[tzdata.sha256sum] = "c098786d053736dd18d4f1fbebdf41554c6fd702a36f75c18f1c66712d2abc24"
 
 S = "${WORKDIR}"
 
-- 
1.7.4.1



