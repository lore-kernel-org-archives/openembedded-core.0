Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B5A78607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 26 Oct 2016 06:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="1059418222"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2016 06:28:03 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 3DB8B6A4006;
	Wed, 26 Oct 2016 06:27:29 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:46 +0300
Message-Id: <9c82c200fe5e6507524463a2b3f24ac14fd276c2.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
References: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
Subject: [PATCH 05/14] libsoup-2.4: Upgrade 2.54.1 -> 2.56.0
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:15 -0000

Six-monthly feature release, mostly bug fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libsoup/{libsoup-2.4_2.54.1.bb => libsoup-2.4_2.56.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.54.1.bb => libsoup-2.4_2.56.0.bb} (90%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb
similarity index 90%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb
index b93a9fd..16c6068 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.56.0.bb
@@ -11,8 +11,8 @@ SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "73b1fb774de16c29b380f87016f9f9dd"
-SRC_URI[sha256sum] = "47b42c232034734d66e5f093025843a5d8cc4b2357c011085a2fd04ef02dd633"
+SRC_URI[md5sum] = "465083f74b7bb035959ddb0599313986"
+SRC_URI[sha256sum] = "d8216b71de8247bc6f274ec054c08547b2e04369c1f8add713e9350c8ef81fe5"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.1.4


