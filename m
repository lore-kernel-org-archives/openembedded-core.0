Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DEDD060119
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 13:16:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2016 06:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,610,1455004800"; d="scan'208";a="701054140"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 12 May 2016 06:16:37 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 8DE716A4007
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:04:08 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 16:16:51 +0300
Message-Id: <1463059013-4222-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/3] ofono: update to 1.18
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
X-List-Received-Date: Thu, 12 May 2016 13:16:47 -0000

1.17 -> 1.18

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/ofono/{ofono_1.17.bb => ofono_1.18.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.17.bb => ofono_1.18.bb} (59%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.17.bb b/meta/recipes-connectivity/ofono/ofono_1.18.bb
similarity index 59%
rename from meta/recipes-connectivity/ofono/ofono_1.17.bb
rename to meta/recipes-connectivity/ofono/ofono_1.18.bb
index 947f9d7..79d3dd0 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.17.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.18.bb
@@ -5,7 +5,7 @@ SRC_URI  = "\
   file://ofono \
   file://Revert-test-Convert-to-Python-3.patch \
 "
-SRC_URI[md5sum] = "d280b1d267ba5bf391d2a898fea7c748"
-SRC_URI[sha256sum] = "cbf20f07fd15253c682b23c1786d517f505c3688f7c4ea93da777e1523b89635"
+SRC_URI[md5sum] = "0a6b37c8ace891cb2a7ca5d121043a0a"
+SRC_URI[sha256sum] = "53cdbf342913f46bce4827241c60e24255a3d43a94945edf77482ae5b312d51f"
 
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
2.4.0


