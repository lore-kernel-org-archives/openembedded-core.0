Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D35671A54
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:59:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2017 12:59:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="1122912399"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.85.39])
	by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2017 12:59:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  6 Feb 2017 12:59:11 -0800
Message-Id: <1486414751-24947-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486414751-24947-1-git-send-email-sgw@linux.intel.com>
References: <1486414751-24947-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] meta-intel.inc: Enable linux-intel and 4.9 by default for meta-intel hardware
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
X-List-Received-Date: Mon, 06 Feb 2017 20:59:15 -0000

Enable the linux-intel production kernel for meta-intel by default for 4.9,
this will enable using the Intel production kernel.

This is a well tested 4.9 tree that will start to include additional
support for the Apollolake and Joule hardware.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 conf/machine/include/meta-intel.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/meta-intel.inc b/conf/machine/include/meta-intel.inc
index 21587fb..eb759c4 100644
--- a/conf/machine/include/meta-intel.inc
+++ b/conf/machine/include/meta-intel.inc
@@ -9,8 +9,8 @@
 #
 
 # Soft set linux-yocto as preferred kernel like x86-base.inc
-PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "4.8%"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-intel"
+PREFERRED_VERSION_linux-intel ?= "4.9%"
 
 # for Xserver older than 1.13.0
 OLD_XSERVER_X86_EXT = "xserver-xorg-extension-dri \
-- 
2.7.4


