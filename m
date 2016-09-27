Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8775860403
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 09:02:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 27 Sep 2016 02:02:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,404,1470726000"; d="scan'208";a="1046403332"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2016 02:02:51 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 60F7F6A4080;
	Tue, 27 Sep 2016 02:02:23 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2016 11:51:54 +0300
Message-Id: <1474966314-19598-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CABcZANnzHTW3Jj1GQ=OReji8K535ArUZ8AijVQzCnWzCLDJuUg@mail.gmail.com>
References: <CABcZANnzHTW3Jj1GQ=OReji8K535ArUZ8AijVQzCnWzCLDJuUg@mail.gmail.com>
Subject: [wic][PATCH] image_types.bbclass: remove redundant dependency
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
X-List-Received-Date: Tue, 27 Sep 2016 09:02:49 -0000

Removed parted-native dependency from do_image_wic as it's
already mentioned in IMAGE_DEPENDS_wic variable.

Thanks to Christopher Larson for pointing out to this.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 0bb6252..5ef6f60 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -218,7 +218,6 @@ IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
-do_image_wic[depends] += "parted-native:do_populate_sysroot"
 
 python do_write_wks_template () {
     """Write out expanded template contents to WKS_FULL_PATH."""
-- 
2.1.4


