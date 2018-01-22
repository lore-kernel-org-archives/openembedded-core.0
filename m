Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 661C2786C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 19:55:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2018 11:56:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,398,1511856000"; d="scan'208";a="13241388"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.intel.com)
	([10.255.228.22])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2018 11:56:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 22 Jan 2018 11:55:53 -0800
Message-Id: <20180122195554.13809-2-sgw@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180122195554.13809-1-sgw@linux.intel.com>
References: <20180122195554.13809-1-sgw@linux.intel.com>
Subject: [PATCH 1/2 v2] imagefeatures: disable f2fs from test_image_features by default
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
X-List-Received-Date: Mon, 22 Jan 2018 19:55:59 -0000

Since the primary f2fs utilities are provided by the meta-openembedded
meta-filesystems layer, we disable the testing of that functionality
here.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 0ffb686921c..09e0b20625b 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -211,7 +211,7 @@ class ImageFeatures(OESelftestTestCase):
         image_name = 'core-image-minimal'
 
         img_types = [itype for itype in get_bb_var("IMAGE_TYPES", image_name).split() \
-                         if itype not in ('container', 'elf', 'multiubi')]
+                         if itype not in ('container', 'elf', 'f2fs', 'multiubi')]
 
         config = 'IMAGE_FSTYPES += "%s"\n'\
                  'MKUBIFS_ARGS ?= "-m 2048 -e 129024 -c 2047"\n'\
-- 
2.14.3


