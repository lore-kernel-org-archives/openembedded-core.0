Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D2A577F9BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 00:53:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Nov 2019 16:53:32 -0800
X-IronPort-AV: E=Sophos;i="5.69,247,1571727600"; d="scan'208";a="199009552"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.19.240])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Nov 2019 16:53:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 08:53:24 +0800
Message-Id: <20191127005325.30813-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/2] ghostscript: fix for CVE-2019-14811 is same as CVE-2019-14813
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
X-List-Received-Date: Wed, 27 Nov 2019 00:53:32 -0000
Content-Transfer-Encoding: 8bit

https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2019-14813
https://www.openwall.com/lists/oss-security/2019/08/28/2

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ghostscript/ghostscript/CVE-2019-14811-0001.patch            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
index 3f28555e8a..d4ef0996ec 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14811-0001.patch
@@ -12,6 +12,7 @@ handler being used, but nevertheless, prevent access to .forceput from
 .setuserparams2.
 
 CVE: CVE-2019-14811
+CVE: CVE-2019-14813
 Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
 
 Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
-- 
2.21.0


