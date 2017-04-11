Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8F87677D19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491908132; x=1523444132;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=r79FJL30Qgd+s3yH3LArzYOwi9jbuo00KOSEqNKlrNo=;
	b=mLpC0VgfwE5VbIJzKQTwzj6sZo7krJac0KGrlsIVlmwTeMfVsa4eIW0v
	swzU2AONzPRmUeyMHW7H75ShwnWMhQ==;
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2017 03:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,185,1488873600"; d="scan'208";a="87690532"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 11 Apr 2017 03:55:31 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 3172A6A4006;
	Tue, 11 Apr 2017 03:55:20 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 13:55:21 +0300
Message-Id: <ef69698dcd1f7b0c1003de2da961bbd8a7686557.1491907553.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1491907553.git.jussi.kukkonen@intel.com>
References: <cover.1491907553.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 1/4] mkfontdir: Remove x11 requirement for -native
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
X-List-Received-Date: Tue, 11 Apr 2017 10:55:31 -0000

Make sure we can build native tools without "x11" in features.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb b/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
index a453e24..737bc9d 100644
--- a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
@@ -11,6 +11,9 @@ files."
 PE = "1"
 PR = "${INC_PR}.0"
 
+DEPENDS = "util-macros-native"
+REQUIRED_DISTRO_FEATURES_class-native = ""
+
 RDEPENDS_${PN} += "mkfontscale"
 RDEPENDS_${PN}_class-native += "mkfontscale-native"
 
-- 
2.1.4


