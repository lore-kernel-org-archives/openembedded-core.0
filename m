Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0083B730B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:27:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 00:27:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,193,1484035200"; d="scan'208";a="1114018026"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2017 00:27:47 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 10:27:10 +0200
Message-Id: <1487752042-19804-39-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
References: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v2 13/25] systemd: Do not add libnss_* to systemd package
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
X-List-Received-Date: Wed, 22 Feb 2017 08:27:47 -0000

libnss_* files should be part of corresponding sub-packages, the split happens
by do_package_split(). By adding ${libdir}/libnss_* to FILES_${PN}, those files
endup in systemd package when ${libdir} == ${base_libdir}.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-core/systemd/systemd_232.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index bf0fadc..a18907a 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -451,7 +451,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${rootlibexecdir}/systemd/* \
                 ${systemd_unitdir}/* \
                 ${base_libdir}/security/*.so \
-                ${libdir}/libnss_* \
                 /cgroup \
                 ${bindir}/systemd* \
                 ${bindir}/busctl \
-- 
2.7.4


