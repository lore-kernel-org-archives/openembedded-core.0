Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0AE59606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:03:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 27 Jul 2016 06:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,429,1464678000"; d="scan'208";a="1003489627"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2016 06:03:48 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A09CB6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 06:03:36 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 16:02:55 +0300
Message-Id: <1469624577-24972-8-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
References: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 7/9] libgpg-error : upgrade to 1.24
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
X-List-Received-Date: Wed, 27 Jul 2016 13:03:48 -0000

1.23 -> 1.24

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libgpg-error/{libgpg-error_1.23.bb => libgpg-error_1.24.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.23.bb => libgpg-error_1.24.bb} (92%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.23.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.24.bb
similarity index 92%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.23.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.24.bb
index 5f967b3..e45a7b8 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.23.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.24.bb
@@ -15,8 +15,8 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
 	  "
-SRC_URI[md5sum] = "5bc2d7ec28f91f883fb6f23d5c784ca7"
-SRC_URI[sha256sum] = "7f0c7f65b98c4048f649bfeebfa4d4c1559707492962504592b985634c939eaa"
+SRC_URI[md5sum] = "feb42198c0aaf3b28eabe8f41a34b983"
+SRC_URI[sha256sum] = "9268e1cc487de5e6e4460fca612a06e4f383072ac43ae90603e5e46783d3e540"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.4.0


