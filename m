Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 24D747ED5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 01:31:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jul 2019 18:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,280,1559545200"; d="scan'208";a="252007420"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by orsmga001.jf.intel.com with ESMTP; 18 Jul 2019 18:31:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 09:31:07 +0800
Message-Id: <20190719013108.5712-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719013108.5712-1-anuj.mittal@intel.com>
References: <20190719013108.5712-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] glibc: CVE-2018-20796 is same as CVE-2019-9169
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
X-List-Received-Date: Fri, 19 Jul 2019 01:31:13 -0000
Content-Transfer-Encoding: 8bit

See:
https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34141
https://www.securityfocus.com/bid/107160

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
index bc40361c5d..cf3744b24a 100644
--- a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
@@ -1,4 +1,5 @@
 CVE: CVE-2019-9169
+CVE: CVE-2018-20796
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-- 
2.20.1


