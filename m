Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6C98D6FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:15:00 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 28 Oct 2016 08:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,410,1473145200"; d="scan'208";a="24878526"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Oct 2016 08:15:01 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 18:12:07 +0300
Message-Id: <c8c8113e57f7b34224256c27c023846e03520e5c.1477667287.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 04/26] systemd-boot: add a comment about manpages being disabled
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
X-List-Received-Date: Fri, 28 Oct 2016 15:15:00 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-bsp/systemd-boot/systemd-boot.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/systemd-boot/systemd-boot.bb b/meta/recipes-bsp/systemd-boot/systemd-boot.bb
index 5b1164e..7036664 100644
--- a/meta/recipes-bsp/systemd-boot/systemd-boot.bb
+++ b/meta/recipes-bsp/systemd-boot/systemd-boot.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://0001-use-lnr-wrapper-instead-of-looking-for-relative-opti.pat
 inherit autotools pkgconfig gettext
 inherit deploy
 
+# Man pages are packaged through the main systemd recipe
 EXTRA_OECONF = " --enable-gnuefi \
                  --with-efi-includedir=${STAGING_INCDIR} \
                  --with-efi-ldsdir=${STAGING_LIBDIR} \
-- 
2.9.3


