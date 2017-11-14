Return-Path: <shashwatx.pandey@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ACBDB65C5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 06:19:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2017 22:19:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,393,1505804400"; 
   d="scan'208";a="7364043"
Received: from refkit.png.intel.com ([10.221.70.151])
	by orsmga002.jf.intel.com with ESMTP; 13 Nov 2017 22:19:56 -0800
From: Shashwat Pandey <shashwatx.pandey@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 22:14:58 +0800
Message-Id: <1510668898-21058-2-git-send-email-shashwatx.pandey@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510668898-21058-1-git-send-email-shashwatx.pandey@intel.com>
References: <1510668898-21058-1-git-send-email-shashwatx.pandey@intel.com>
Cc: Shashwat Pandey <shashwatx.pandey@intel.com>
Subject: [PATCH 1/1] Image_types: use ustar format in cpio command
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
X-List-Received-Date: Tue, 14 Nov 2017 06:19:55 -0000

Using ustar format due to ROOTFS size exceeding issue.
Ustar supports up to 8GB.
Where as newc support up to 4GB.

[YOCTO #11674]

Signed-off-by: Shashwat Pandey <shashwatx.pandey@intel.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index b373b21..4540bc3 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -138,7 +138,7 @@ IMAGE_CMD_cpio () {
 			else
 				touch ${WORKDIR}/cpio_append/init
 			fi
-			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
+			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H ustar -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
 		fi
 	fi
 }
-- 
2.7.4


