Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EE42A7C69C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 07:32:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2019 23:32:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,372,1544515200"; d="scan'208";a="133777982"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.183])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Feb 2019 23:32:13 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2019 15:32:06 +0800
Message-Id: <20190215073207.30036-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] meson.bbclass: point to llvm-config
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
X-List-Received-Date: Fri, 15 Feb 2019 07:32:14 -0000

Allow packages using llvm-config to find it using meson's dependency
interface.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index dff0485b47..aaf873cad2 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -89,6 +89,7 @@ ld = ${@meson_array('LD', d)}
 strip = ${@meson_array('STRIP', d)}
 readelf = ${@meson_array('READELF', d)}
 pkgconfig = 'pkg-config'
+llvm-config = 'llvm-config8.0'
 
 [properties]
 needs_exe_wrapper = true
-- 
2.17.1


