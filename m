Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5F4136120B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 05:54:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Feb 2020 21:47:17 -0800
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="219629194"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.21.206])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Feb 2020 21:47:16 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2020 13:47:05 +0800
Message-Id: <20200204054707.913173-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200204054707.913173-1-anuj.mittal@intel.com>
References: <20200204054707.913173-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] ncurses: add CVE_VERSION
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
X-List-Received-Date: Tue, 04 Feb 2020 05:54:22 -0000
Content-Transfer-Encoding: 8bit

Include the version number in a format that is comparable to what we get
from NVD.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/ncurses/ncurses_6.1+20191019.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses_6.1+20191019.bb b/meta/recipes-core/ncurses/ncurses_6.1+20191019.bb
index ee7d4bed28..187777f6ef 100644
--- a/meta/recipes-core/ncurses/ncurses_6.1+20191019.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.1+20191019.bb
@@ -9,3 +9,5 @@ SRCREV = "ea70ec815b362f5bbad7a827a2edf50fd2b459cc"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5 --cache-file=${B}/config.cache"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
+
+CVE_VERSION = "6.1.${@d.getVar("PV").split('+')[1]}"
-- 
2.24.1


