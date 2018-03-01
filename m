Return-Path: <california.l.sullivan@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D92357894E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 02:16:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 18:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,407,1515484800"; d="scan'208";a="178932835"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 28 Feb 2018 18:16:13 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 18:15:14 -0800
Message-Id: <20180301021518.29564-18-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301021518.29564-1-california.l.sullivan@intel.com>
References: <20180301021518.29564-1-california.l.sullivan@intel.com>
Subject: [PATCH v3 17/21] layer.conf: add -bootconf recipes to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Thu, 01 Mar 2018 02:16:14 -0000

The bootloaders depend on these to be functional in the non-deploy case,
but changes in them don't require rebuilding of the packages.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 67820588d37..7193f113885 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -61,10 +61,12 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   initramfs-module-install->grub \
   initramfs-module-install->parted \
   initramfs-module-install->util-linux \
+  grub-efi->grub-bootconf \
   liberation-fonts->fontconfig \
   cantarell-fonts->fontconfig \
   gnome-icon-theme->librsvg \
   font-alias->font-util \
+  systemd-boot->systemd-bootconf \
   weston-init->weston \
   weston-init->kbd \
 "
-- 
2.14.3


