Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D9129782EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 09:09:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 02:09:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="1160323125"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jun 2017 02:09:03 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 710BD58038E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 02:09:02 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 12:07:06 +0300
Message-Id: <e1f070c97f190bcbac9fefad6b294454a03c5b9a.1497430965.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497430965.git.ed.bartosh@linux.intel.com>
References: <cover.1497430965.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/3] image.bbclass: fix setting of vardeps flag
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
X-List-Received-Date: Wed, 14 Jun 2017 09:09:02 -0000

Added leading space to vardeps to avoid flag value to be
added to the existing value without a separator.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index e18ac72..9a04b43 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -500,7 +500,7 @@ python () {
         d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
         d.appendVarFlag(task, 'postfuncs', ' create_symlinks')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
-        d.appendVarFlag(task, 'vardeps', ' '.join(vardeps))
+        d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', 'DATETIME')
 
         bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
-- 
2.1.4


