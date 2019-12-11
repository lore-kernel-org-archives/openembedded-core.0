Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id A7F177FB11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 16:48:22 +0000 (UTC)
IronPort-SDR: 5V9I2w/gqtm6C5qZe3dqM3FZ0A3c1JVjGvCxu54lxMvdH5i8W6+LG1CNjC4GhN6+ipL1jV+z1n
	9WVhoMmVxpCiss+7uXN5vIPwjFYKY/EElROhCHrSl0aMNYyMPNX2xZlJ5twxhw6LEVRY+6/jBb
	CC2QTAMHprFHks/vGenwsnHLriCum7BfvM2GWPOpCvpdWb2MMB64eI4nvY/7gw0rItZ5zv6KH1
	OChNhJmTXaF8SxPB0LDJMv85BBXCr1S+9ny/k+gwVCm3xjfw5Xlt+hHtaA7sHENbaQncoTYci5
	Azs=
X-IronPort-AV: E=Sophos;i="5.69,302,1571695200"; 
   d="scan'208";a="3494974"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2019 17:48:14 +0100
Message-Id: <20191211164820.26588-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191211164820.26588-1-pkj@axis.com>
References: <20191211164820.26588-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCHv3 2/8] licenses.conf: Remove the SRC_DISTRIBUTE_LICENSES variable
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
X-List-Received-Date: Wed, 11 Dec 2019 16:48:23 -0000
Content-Transfer-Encoding: 8bit

The SRC_DISTRIBUTE_LICENSES variable and its static list of licenses
has been replaced by AVAILABLE_LICENSES, which automatically contains
all available licenses.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/licenses.conf | 43 -----------------------------------------
 1 file changed, 43 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 7b01c57632..1c586a3bc6 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -1,44 +1,3 @@
-# These aren't actually used anywhere that I can tell
-# They may be in the future (or are used by someone else
-# For completion sake, I've updated them
-SRC_DISTRIBUTE_LICENSES += "AAL Adobe AFL-1.2 AFL-2.0 AFL-2.1 AFL-3.0"
-SRC_DISTRIBUTE_LICENSES += "AGPL-3.0 ANTLR-PD Apache-1.0 Apache-1.1 Apache-2.0"
-SRC_DISTRIBUTE_LICENSES += "APL-1.0 APSL-1.0 APSL-1.1 APSL-1.2 APSL-2.0"
-SRC_DISTRIBUTE_LICENSES += "Artistic-1.0 Artistic-2.0 BitstreamVera BSD"
-SRC_DISTRIBUTE_LICENSES += "BSD-2-Clause BSD-3-Clause BSD-4-Clause BSL-1.0"
-SRC_DISTRIBUTE_LICENSES += "CATOSL-1.1 CC0-1.0 CC-BY-1.0 CC-BY-2.0 CC-BY-2.5"
-SRC_DISTRIBUTE_LICENSES += "CC-BY-3.0 CC-BY-NC-1.0 CC-BY-NC-2.0 CC-BY-NC-2.5"
-SRC_DISTRIBUTE_LICENSES += "CC-BY-NC-3.0 CC-BY-NC-ND-1.0 CC-BY-NC-ND-2.0"
-SRC_DISTRIBUTE_LICENSES += "CC-BY-NC-ND-2.5 CC-BY-NC-ND-3.0 CC-BY-NC-SA-1.0"
-SRC_DISTRIBUTE_LICENSES += "CC-BY-NC-SA-2.0 CC-BY-NC-SA-2.5 CC-BY-NC-SA-3.0"
-SRC_DISTRIBUTE_LICENSES += "CC-BY-ND-1.0 CC-BY-ND-2.0 CC-BY-ND-2.5 CC-BY-ND-3.0"
-SRC_DISTRIBUTE_LICENSES += "CC-BY-SA-1.0 CC-BY-SA-2.0 CC-BY-SA-2.5 CC-BY-SA-3.0 CC-BY-SA-4.0"
-SRC_DISTRIBUTE_LICENSES += "CDDL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B CECILL-C"
-SRC_DISTRIBUTE_LICENSES += "ClArtistic CPAL-1.0 CPL-1.0 CUA-OPL-1.0 DSSSL"
-SRC_DISTRIBUTE_LICENSES += "ECL-1.0 ECL-2.0 eCos-2.0 EDL-1.0 EFL-1.0 EFL-2.0"
-SRC_DISTRIBUTE_LICENSES += "Entessa EPL-1.0 EPL-2.0 ErlPL-1.1"
-SRC_DISTRIBUTE_LICENSES += "EUDatagrid EUPL-1.0 EUPL-1.1 Fair Frameworx-1.0"
-SRC_DISTRIBUTE_LICENSES += "FreeType GFDL-1.1 GFDL-1.2 GFDL-1.3 GPL-1.0"
-SRC_DISTRIBUTE_LICENSES += "GPL-2.0 GPL-2.0-with-autoconf-exception"
-SRC_DISTRIBUTE_LICENSES += "GPL-2.0-with-classpath-exception"
-SRC_DISTRIBUTE_LICENSES += "GPL-2.0-with-font-exception"
-SRC_DISTRIBUTE_LICENSES += "GPL-2.0-with-GCC-exception"
-SRC_DISTRIBUTE_LICENSES += "GPL-2-with-bison-exception GPL-3.0"
-SRC_DISTRIBUTE_LICENSES += "GPL-3.0-with-autoconf-exception"
-SRC_DISTRIBUTE_LICENSES += "GPL-3.0-with-GCC-exception"
-SRC_DISTRIBUTE_LICENSES += "gSOAP-1 gSOAP-1.3b HPND IPA IPL-1.0 ISC LGPL-2.0"
-SRC_DISTRIBUTE_LICENSES += "LGPL-2.1 LGPL-3.0 Libpng LPL-1.02 LPPL-1.0 LPPL-1.1"
-SRC_DISTRIBUTE_LICENSES += "LPPL-1.2 LPPL-1.3c MirOS MIT Motosoto MPL-1.0"
-SRC_DISTRIBUTE_LICENSES += "MPL-1.1 MS-PL MS-RL Multics NASA-1.3 Nauman NCSA"
-SRC_DISTRIBUTE_LICENSES += "NGPL Nokia NPOSL-3.0 NTP OASIS OCLC-2.0 ODbL-1.0"
-SRC_DISTRIBUTE_LICENSES += "OFL-1.1 OGTSL OLDAP-2.8 OpenSSL OSL-1.0 OSL-2.0"
-SRC_DISTRIBUTE_LICENSES += "OSL-3.0 PD PHP-3.0 PostgreSQL Proprietary"
-SRC_DISTRIBUTE_LICENSES += "Python-2.0 QPL-1.0 RHeCos-1 RHeCos-1.1 RPL-1.5"
-SRC_DISTRIBUTE_LICENSES += "RPSL-1.0 RSCPL Ruby SAX-PD SGI-1 Simple-2.0 Sleepycat"
-SRC_DISTRIBUTE_LICENSES += "SPL-1.0 SugarCRM-1 SugarCRM-1.1.3 UCB VSL-1.0 W3C"
-SRC_DISTRIBUTE_LICENSES += "Watcom-1.0 WXwindows XFree86-1.0 XFree86-1.1 Xnet XSL YPL-1.1"
-SRC_DISTRIBUTE_LICENSES += "Zimbra-1.3 Zlib ZPL-1.1 ZPL-2.0 ZPL-2.1"
-
 # Standards are great! Everyone has their own. In an effort to standardize licensing
 # names, common-licenses will use the SPDX standard license names. In order to not
 # break the non-standardized license names that we find in LICENSE, we'll set
@@ -188,5 +147,3 @@ FOSS_BASE_URL = "http://localhost/repo/?mod=spdx_license_once"
 FOSS_SERVER = "${FOSS_BASE_URL}&fullSPDXFlag=${FOSS_FULL_SPDX}&noCopyright=${FOSS_NO_COPYRIGHT}&recursiveUnpack=${FOSS_RECURSIVE_UNPACK}"
 
 FOSS_WGET_FLAGS = "-qO - --no-check-certificate --timeout=0"
-
-
-- 
2.21.0


