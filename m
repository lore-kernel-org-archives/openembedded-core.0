Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5711271C73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:37:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 26 Oct 2016 01:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,549,1473145200"; d="scan'208";a="1075916470"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2016 01:37:50 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 16CC16A4006;
	Wed, 26 Oct 2016 01:37:14 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 11:37:28 +0300
Message-Id: <3b2eba59165cdb07912fd765506252b5e38c6700.1477469885.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
References: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477469885.git.jussi.kukkonen@intel.com>
References: <cover.1477469885.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 05/16] xproto: Upgrade 7.0.29 -> 7.0.31
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
X-List-Received-Date: Wed, 26 Oct 2016 08:37:49 -0000

Tiny bug fix releases.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-proto/{xproto_7.0.29.bb => xproto_7.0.31.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.29.bb => xproto_7.0.31.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-proto/xproto_7.0.29.bb b/meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-proto/xproto_7.0.29.bb
rename to meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb
index 412b6a2..febcc67 100644
--- a/meta/recipes-graphics/xorg-proto/xproto_7.0.29.bb
+++ b/meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb
@@ -15,5 +15,5 @@ SRC_URI += "file://xproto_fix_for_x32.patch"
 EXTRA_OECONF_append = " --enable-specs=no"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "eeeae1f47d43a33ef0d5c56727410326"
-SRC_URI[sha256sum] = "6c1a477092ca73233902b8d5f33012635c4b0208f17e7833cc7efe5c93ba9f8a"
+SRC_URI[md5sum] = "16791f7ca8c51a20608af11702e51083"
+SRC_URI[sha256sum] = "c6f9747da0bd3a95f86b17fb8dd5e717c8f3ab7f0ece3ba1b247899ec1ef7747"
-- 
2.1.4


