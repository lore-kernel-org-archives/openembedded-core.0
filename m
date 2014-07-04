Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 508AC6E608
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 08:46:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s648kR3L010540
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Jul 2014 01:46:27 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 4 Jul 2014 01:46:27 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jul 2014 16:45:13 +0800
Message-ID: <5d00040de2573c76b3d85d3cd35f06e9ce234b0d.1404463017.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1404463017.git.Chong.Lu@windriver.com>
References: <cover.1404463017.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] adt_installer: remove unnecessary variable
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
X-List-Received-Date: Fri, 04 Jul 2014 08:46:33 -0000
Content-Type: text/plain

YOCTOADT_VERSION is not included in adt_installer.conf file.
Remove this variable, because we don't need it.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/installer/adt-installer_1.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 6380b6c..6a63e79 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -34,7 +34,6 @@ PR = "r11"
 
 ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
-YOCTOADT_VERSION = "${SDK_VERSION}"
 S = "${WORKDIR}/opkg-${PV}"
 
 PV = "0.2.0"
@@ -74,7 +73,6 @@ fakeroot do_populate_adt () {
 	cp -r scripts ${ADT_DIR}/
 	cp adt_installer ${ADT_DIR}
 	cp adt_installer.conf ${ADT_DIR}
-	sed -i -e 's#YOCTOADT_VERSION#${SDK_VERSION}#' ${ADT_DIR}/adt_installer.conf
 	sed -i -e 's#ADTREPO#${ADTREPO}#' ${ADT_DIR}/adt_installer.conf
 	echo 'SDK_VENDOR=${SDK_VENDOR}' >> ${ADT_DIR}/scripts/data_define
 	echo 'DEFAULT_INSTALL_FOLDER=${SDKPATH}' >> ${ADT_DIR}/scripts/data_define
-- 
1.9.1


