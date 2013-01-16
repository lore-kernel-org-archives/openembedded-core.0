Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TvZBg-0004S7-IO
	for Openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 21:02:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Jan 2013 11:46:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,480,1355126400"; d="scan'208";a="244760162"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by azsmga001.ch.intel.com with ESMTP; 16 Jan 2013 11:46:53 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 11:46:52 -0800
Message-Id: <9ab00cdffdd81cbdcd68ac03aafd925372f25ad7.1358365495.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1358365495.git.nitin.a.kamble@intel.com>
References: <cover.1358365495.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] linux-yocto_3.4: use ${KSRC_linux_yocto_3_4_repo} based SRC_URI
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
X-List-Received-Date: Wed, 16 Jan 2013 20:02:38 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This makes replacing kernel git repository easy.
For example you can add the following line in your local.conf to use your
own local kernel repository:

KSRC_linux_yocto_3_4_repo = "/home/nitin/linux-yocto-3.4.git/;protocol=file"

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 70ed967..92129b6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -11,7 +11,8 @@ SRCREV_machine_qemux86-64 ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
 SRCREV_machine ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
 SRCREV_meta ?= "7e0cd2990798aae80565baa17d3b6c771874f284"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+KSRC_linux_yocto_3_4_repo ?= "git.yoctoproject.org/linux-yocto-3.4.git;protocol=git"
+SRC_URI = "git://${KSRC_linux_yocto_3_4_repo};nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
 LINUX_VERSION ?= "3.4.24"
 
-- 
1.7.3.4



