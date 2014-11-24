Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 39C1B72272
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 13:49:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43892964"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Nov 2014 21:46:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAODnNre011986
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 21:49:23 +0800
Received: from localhost.localdomain (10.167.226.59) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 24 Nov 2014 21:49:40 +0800
From: leimaohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Nov 2014 21:49:11 +0800
Message-ID: <1416836951-45420-2-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1416836951-45420-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1416836951-45420-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.59]
Subject: [PATCH 2/2] spdx: add necessary configuration file for spdx.class
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
X-List-Received-Date: Mon, 24 Nov 2014 13:49:42 -0000
Content-Type: text/plain

Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com>
---
 meta/conf/licenses.conf | 61 ++++++++++---------------------------------------
 1 file changed, 12 insertions(+), 49 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 629916b..82f50be 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -115,75 +115,38 @@ SPDXLICENSEMAP[SGIv1] = "SGI-1"
 # LICENSE_PATH += "${COREBASE}/custom-licenses"
 
 # Set if you want the license.manifest copied to the image
-#COPY_LIC_MANIFEST = "1"
+COPY_LIC_MANIFEST = "1"
 
 # If you want the pkg licenses copied over as well you must set
 # both COPY_LIC_MANIFEST and COPY_LIC_DIRS
-#COPY_LIC_DIRS = "1"
+COPY_LIC_DIRS = "1"
 
 ## SPDX temporary directory
 SPDX_TEMP_DIR = "${WORKDIR}/spdx_temp"
 SPDX_MANIFEST_DIR = "/home/yocto/fossology_scans"
 
 ## SPDX Format info
-SPDX_VERSION = "SPDX-1.1"
+SPDX_VERSION = "SPDX-1.2"
 DATA_LICENSE = "CC0-1.0"
+## If your fossylogy server is from 2.4.0 to 2.6.1,the LICENSELISTVERSION is 1.19
+## Reference to http://www.fossology.org/projects/fossology/wiki/Release_Notes
+LICENSELISTVERSION = "1.19"
+CREATOR_TOOL = "yocto+fossology-spdx"
 
 ## Fossology scan information
 # You can set option to control if the copyright information will be skipped
 # during the identification process.
 #
 # It is defined as [FOSS_COPYRIGHT] in ./meta/conf/licenses.conf.
-# FOSS_COPYRIGHT = "true"
-#   NO copyright will be processed. That means only license information will be
-#   identified and output to SPDX file
-# FOSS_COPYRIGHT = "false"
-#   Copyright will be identified and output to SPDX file along with license
-#   information. The process will take more time than not processing copyright
-#   information.
-#
-
-FOSS_NO_COPYRIGHT = "true"
 
-# A option defined as[FOSS_RECURSIVE_UNPACK] in ./meta/conf/licenses.conf. is
-# used to control if FOSSology server need recursively unpack tar.gz file which
-# is sent from do_spdx task.
-#
-# FOSS_RECURSIVE_UNPACK = "false":
-#    FOSSology server does NOT recursively unpack. In the current release, this
-#    is the default choice because recursively unpack will not necessarily break
-#    down original compressed files.
-# FOSS_RECURSIVE_UNPACK = "true":
-#    FOSSology server recursively unpack components.
-#
-
-FOSS_RECURSIVE_UNPACK = "false"
-
-# An option defined as [FOSS_FULL_SPDX] in ./meta/conf/licenses.conf is used to
-# control what kind of SPDX output to get from the FOSSology server.
-#
-# FOSS_FULL_SPDX = "true":
-#   Tell FOSSology server to return full SPDX output, like if the program was
-#   run from the command line. This is needed in order to get license refs for
-#   the full package rather than individual files only.
-#
-# FOSS_FULL_SPDX = "false":
-#   Tell FOSSology to only process license information for files. All package
-#   license tags in the report will be "NOASSERTION"
-#
-
-FOSS_FULL_SPDX = "true"
-
-# FOSSologySPDX instance server. http://localhost/repo is the default
-# installation location for FOSSology.
-#
+# FOSSologySPDX instance server.
 # For more information on FOSSologySPDX commandline:
 #   https://github.com/spdx-tools/fossology-spdx/wiki/Fossology-SPDX-Web-API
-#
+# 
 
-FOSS_BASE_URL = "http://localhost/repo/?mod=spdx_license_once"
-FOSS_SERVER = "${FOSS_BASE_URL}&fullSPDXFlag=${FOSS_FULL_SPDX}&noCopyright=${FOSS_NO_COPYRIGHT}&recursiveUnpack=${FOSS_RECURSIVE_UNPACK}"
+# The following commnd is suit for the FOSSologySPDX instance server in localhost.
 
-FOSS_WGET_FLAGS = "-qO - --no-check-certificate --timeout=0"
+FOSS_SERVER = "http://127.0.0.1/repo/ --noproxy 127.0.0.1"
+FOSS_CURL_FLAGS = "-F "mod=spdx_license_once" -F "noCopyright=false" -F "jsonOutput=false" -F "fullSPDXFlag=true""
 
 
-- 
1.9.1


