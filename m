Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9A50C60721
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 09:19:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 09 Feb 2016 01:19:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,420,1449561600"; d="scan'208";a="880249362"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 09 Feb 2016 01:19:55 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	nicolas.dechesne@linaro.org
Date: Tue,  9 Feb 2016 11:24:53 +0200
Message-Id: <ecd72fb35034d043c02c09d0da5c46061c1e05ec.1455008560.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
References: <aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1455008560.git.jussi.kukkonen@intel.com>
References: <cover.1455008560.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/4] wpa-supplicant: Only depend on libgcrypt when needed
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
X-List-Received-Date: Tue, 09 Feb 2016 09:19:55 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
index 2126377..935c8af 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
@@ -6,11 +6,11 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=36b27801447e0662ee0138d17fe93880 \
                     file://README;beginline=1;endline=56;md5=7f393579f8b109fe91f3b9765d26c7d3 \
                     file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=3430fda79f2ba1dd545f0b3c4d6e4d24"
-DEPENDS = "dbus libnl libgcrypt"
+DEPENDS = "dbus libnl"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
 PACKAGECONFIG ??= "gnutls"
-PACKAGECONFIG[gnutls] = ",,gnutls"
+PACKAGECONFIG[gnutls] = ",,gnutls libgcrypt"
 PACKAGECONFIG[openssl] = ",,openssl"
 
 inherit systemd
-- 
2.1.4


