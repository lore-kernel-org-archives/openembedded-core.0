Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Rj5ok-0007dI-Um
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 10:10:31 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Jan 2012 01:03:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="93582141"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by orsmga001.jf.intel.com with ESMTP; 06 Jan 2012 01:03:06 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2012 17:05:00 +0800
Message-Id: <225babe546891342c9ea02c4d31fb97c2f143ed0.1325840474.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1325840092.git.dongxiao.xu@intel.com>
References: <cover.1325840092.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1325840474.git.dongxiao.xu@intel.com>
References: <cover.1325840474.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/7] image.bbclass: Use ?= to set LINGUAS_INSTALL
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
X-List-Received-Date: Fri, 06 Jan 2012 09:10:31 -0000

Hob may dynamically sets BBLAYERS to bitbake server, thus we need a
flexible way to load LINGUAS_INSTALL value.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/image.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 275b28f..295b653 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -119,7 +119,7 @@ ROOTFS_POSTPROCESS_COMMAND ?= ""
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
 
-LINGUAS_INSTALL = "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS', 1).split()))}"
+LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS', 1).split()))}"
 
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}"
 
-- 
1.7.0.4



