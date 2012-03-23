Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SBEQb-0000au-Jp
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 01:01:53 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Mar 2012 16:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144370032"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.233])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2012 16:51:50 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 16:51:47 -0700
Message-Id: <fac3cb7a8e4e6792622a7b3484aa9c6e055ab192.1332546190.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <f0393ed61291561b5823079b9528e8df24d56a3f.1332546190.git.elizabeth.flanagan@intel.com>
References: <f0393ed61291561b5823079b9528e8df24d56a3f.1332546190.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1332546190.git.elizabeth.flanagan@intel.com>
References: <cover.1332546190.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 8/8] setserial: Correct LICENSE
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
X-List-Received-Date: Sat, 24 Mar 2012 00:01:53 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

setserial's license is GPL version 2.0 per:

http://sourceforge.net/projects/setserial/develop

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-bsp/setserial/setserial_2.17.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
index 64f541c..5666be7 100644
--- a/meta/recipes-bsp/setserial/setserial_2.17.bb
+++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
@@ -1,11 +1,11 @@
+
 SUMMARY = "Controls the configuration of serial ports"
 DESCRIPTION = "setserial is a program designed to set and/or report the configuration information associated with a serial port"
 HOMEPAGE = "http://setserial.sourceforge.net"
 AUTHOR = "Theodore Ts'o <tytso@mit.edu>"
 SECTION = "console/utils"
 
-# general GPL, no specific version
-LICENSE = "GPL"
+LICENSE = "GPLv2.0"
 LIC_FILES_CHKSUM = "file://version.h;beginline=1;endline=6;md5=2e7c59cb9e57e356ae81f50f4e4dfd99"
 PR = "r3"
 
-- 
1.7.1



