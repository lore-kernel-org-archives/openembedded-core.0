Return-Path: <valentin.popa@intel.com>
X-Greylist: delayed 566 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Apr 2014 15:49:31 UTC
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 47B8E60D71
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 15:49:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2014 08:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,959,1389772800"; d="scan'208";a="523845889"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by fmsmga001.fm.intel.com with ESMTP; 30 Apr 2014 08:39:46 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 18:39:33 +0300
Message-Id: <153e7dbb41620edc7920b6c31556a4965dd4ed1d.1398871949.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398871949.git.valentin.popa@intel.com>
References: <cover.1398871949.git.valentin.popa@intel.com>
In-Reply-To: <cover.1398871949.git.valentin.popa@intel.com>
References: <cover.1398871949.git.valentin.popa@intel.com>
Subject: [PATCH 3/3] wpa-supplicant: add libgcrypt as a dependencie
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
X-List-Received-Date: Wed, 30 Apr 2014 15:49:34 -0000

gnutls doesn't depend on libgcrypt anymore but
wpa-supplicant does. So add it as a dependencie.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 6eb3d2d..61c29ef 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -6,7 +6,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
                     file://README;beginline=1;endline=56;md5=a07250b28e857455336bb59fc31cb845 \
                     file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=e8e021e30f3a6ab7c341b66b86626a5a"
-DEPENDS = "gnutls dbus libnl openssl"
+DEPENDS = "gnutls dbus libnl openssl libgcrypt"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
 inherit systemd
-- 
1.9.1


