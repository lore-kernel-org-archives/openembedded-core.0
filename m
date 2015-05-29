Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 11478756C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 09:46:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96067417"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 May 2015 17:50:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t4T9iX5N028719
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 17:44:33 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 29 May 2015 17:46:01 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 May 2015 17:45:12 +0800
Message-ID: <1432892712-25356-3-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1432892712-25356-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1432892712-25356-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [PATCH v2 2/2] licenses.conf:Modified parameters for new spdx.bbclass
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
X-List-Received-Date: Fri, 29 May 2015 09:46:01 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/conf/licenses.conf | 65 +++++++++++--------------------------------------
 1 file changed, 14 insertions(+), 51 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 629916b..b732451 100644
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
-SPDX_TEMP_DIR = "${WORKDIR}/spdx_temp"
-SPDX_MANIFEST_DIR = "/home/yocto/fossology_scans"
+SPDX_TEMP_DIR ?= "${WORKDIR}/spdx_temp"
+SPDX_MANIFEST_DIR ?= "/home/yocto/fossology_scans"
 
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
+FOSS_SERVER ?= "http://127.0.0.1/repo/ --noproxy 127.0.0.1"
+FOSS_CURL_FLAGS ?= "-F "mod=spdx_license_once" -F "noCopyright=false" -F "jsonOutput=false" -F "fullSPDXFlag=true""
 
 
-- 
1.8.4.2


