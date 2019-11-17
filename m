Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E243A7F959
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 23:24:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2019 15:24:21 -0800
X-IronPort-AV: E=Sophos;i="5.68,318,1569308400"; d="scan'208";a="195955438"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.20.29])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2019 15:24:20 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 07:23:37 +0800
Message-Id: <20191117232337.5635-8-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117232337.5635-1-anuj.mittal@intel.com>
References: <20191117232337.5635-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 7/7] iputils: Whitelist CVE-2000-1213 CVE-2000-1214
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
X-List-Received-Date: Sun, 17 Nov 2019 23:24:20 -0000
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@stusta.de>

(From OE-Core rev: 9fea7c3fae30bb1eecb31ec3bf777db981dc1eed)

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/iputils/iputils_s20190709.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index d8f2470d0c..3f9e9917f0 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -17,6 +17,10 @@ S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
 
+# Fixed in 2000-10-10, but the versioning of iputils
+# breaks the version order.
+CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
+
 PACKAGECONFIG ??= "libcap libgcrypt rarpd traceroute6"
 PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap"
 PACKAGECONFIG[libgcrypt] = "-DUSE_CRYPTO=gcrypt, -DUSE_CRYPTO=none, libgcrypt"
-- 
2.21.0


