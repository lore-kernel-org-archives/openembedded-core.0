Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6D960E07
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 08:23:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,808,1389740400"; d="scan'208";a="44847150"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 07 Apr 2014 10:23:22 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Mon, 7 Apr 2014 10:23:22 +0200
Received: from u75.usr.ingenico.loc (10.23.7.75) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Mon, 7 Apr 2014 10:23:21 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Apr 2014 10:21:22 +0200
Message-ID: <1396858882-22678-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH] documentation.conf (LICENSE): tiny addition
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
X-List-Received-Date: Mon, 07 Apr 2014 08:23:27 -0000
Content-Type: text/plain

Examples:

LICENSE = "MIT"
LICENSE = "GPLv2 & LGPLv2.1"
LICENSE = "AFL-2 | GPLv2+"
LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
LICENSE = "GPLv2 & (LGPLv2.1 | MPL-1.1 | BSD)"
LICENSE = "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/conf/documentation.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 9d6e78f..7fa3f31 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -253,7 +253,7 @@ LAYERDIR[doc] = "When used inside the layer.conf configuration file, this variab
 LAYERVERSION[doc] = "Optionally specifies the version of a layer as a single number. This variable is used in the conf/layer.conf file and must be suffixed with the name of the specific layer."
 LEAD_SONAME[doc] = "Specifies the lead (or primary) compiled library file (.so) that the debian class applies its naming policy to given a recipe that packages multiple libraries."
 LIC_FILES_CHKSUM[doc] = "Checksums of the license text in the recipe source code."
-LICENSE[doc] = "The list of source licenses for the recipe."
+LICENSE[doc] = "The list of source licenses for the recipe. Logical operators '&' or '|' and parentheses can be used."
 LICENSE_PATH[doc] = "Path to additional licenses used during the build."
 LINUX_KERNEL_TYPE[doc] = "Defines the kernel type to be used in assembling the configuration."
 LINUX_VERSION[doc] = "The Linux version from kernel.org on which the Linux kernel image being built using the OpenEmbedded build system is based. You define this variable in the kernel recipe."
-- 
1.8.5.4


