Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 904F87CDC0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 13:32:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:09 -0800
X-IronPort-AV: E=Sophos;i="5.69,277,1571727600"; d="scan'208";a="205389432"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.178])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:08 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 21:31:47 +0800
Message-Id: <dcaac7e79e46960ba2392049aa13623d110f2f4d.1575465665.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1575465665.git.anuj.mittal@intel.com>
References: <cover.1575465665.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 06/10] ghostscript: fix for CVE-2019-14811 is same as CVE-2019-14813
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
X-List-Received-Date: Wed, 04 Dec 2019 13:32:08 -0000
Content-Transfer-Encoding: 8bit

https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2019-14813
https://www.openwall.com/lists/oss-security/2019/08/28/2

(From OE-Core rev: afef29326b4332fc87c53a5d9d43288cddcdd944)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


