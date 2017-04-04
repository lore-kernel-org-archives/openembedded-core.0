Return-Path: <yin.thong.choong@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D6AFF77C72
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491298177; x=1522834177;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=IR5omKgnIFjqUZqyuD9dCRNZBx+nHY+/8WW+6TxRU34=;
	b=mIb/dzs9oKD5xVsWZMTi4mKtaEadGlF6eYlyKWarAYcwaf5WHyHk8pw9
	FGY7CpKpWuEZyCvz/BVfM8AYB1oijA==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 02:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,274,1486454400"; d="scan'208";a="1115160791"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2017 02:29:35 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 02:29:12 -0700
Message-Id: <1491298154-68270-7-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491298154-68270-1-git-send-email-yin.thong.choong@intel.com>
References: <1491298154-68270-1-git-send-email-yin.thong.choong@intel.com>
Subject: [PATCH v2 6/8] liberation-fonts: replace fedorahosted.org SRC_URI with pagure.io source
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
X-List-Received-Date: Tue, 04 Apr 2017 09:29:36 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

fedorahosted.org was retired on March 1st, 2017. This is to
update the SRC_URI to point to pagure.io. pagure.io is a
replacement for fedorahosted.

[YOCTO #11226]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
---
 meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
index bda82e7..74212e7 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
@@ -2,7 +2,7 @@ SUMMARY = "Liberation(tm) Fonts"
 DESCRIPTION = "The Liberation(tm) Fonts is a font family originally \
 created by Ascender(c) which aims at metric compatibility with \
 Arial, Times New Roman, Courier New."
-HOMEPAGE = "https://fedorahosted.org/liberation-fonts/"
+HOMEPAGE = "https://releases.pagure.org/liberation-fonts/"
 BUGTRACKER = "https://bugzilla.redhat.com/"
 
 RECIPE_NO_UPDATE_REASON = "2.x depends on fontforge package, which is not yet provided in oe-core"
@@ -17,7 +17,7 @@ inherit allarch fontcache
 
 FONT_PACKAGES = "${PN}"
 
-SRC_URI = "https://fedorahosted.org/releases/l/i/liberation-fonts/liberation-fonts-${PV}.tar.gz \
+SRC_URI = "https://releases.pagure.org/liberation-fonts/liberation-fonts-${PV}.tar.gz \
            file://30-liberation-aliases.conf"
 
 SRC_URI[md5sum] = "4846797ef0fc70b0cbaede2514677c58"
-- 
2.7.4


