Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B805C433FE
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:46:40 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.7230.1643118392810459867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=IvbQyjqe;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643118399; x=1674654399;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=V8BCzzgUsa0zedbzHZ9vuVZjd0telVoboeRUc5ATOxk=;
  b=IvbQyjqeoNJekJyjFeYwaKDlrvHYi6D6/wItQ3eqVSpL/QUybbm1dKkU
   rQYbdXsQLwluR3tH5v4FFgSF9NLI9eNyzg9HzHUx/Dd2LqN7+MxPkggdM
   fKh/pW7e6YZ8HNqLucdwNnewFyA32ZkXnz0P/kRba5LqdjnzkGqBGL5i/
   4P/1G+btjObv5XyUOKWYURql9S7pPPuWNcwEUR+i7NjxGwE60pErDV3k9
   krwR/QDJnnRCXV4C6XFwlTEs4Hd+GjGREyxS87Kj0jMbpAAjziOO5Ff3i
   HfjiK8Czi+9gxpiv7Qbk1nsIPF91v1fE2IGgh1RNbyYfTEJsO0yWvfug3
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="307016477"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="307016477"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="479494332"
Received: from gleong3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.227.175])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:38 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/13] bootchart2: Add missing python3-math
 dependency
Date: Tue, 25 Jan 2022 21:45:59 +0800
Message-Id: 
 <2dff7f8630e4db75fb6c57e165376e43eca7ba28.1643113252.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643113252.git.anuj.mittal@intel.com>
References: <cover.1643113252.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 13:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160926

From: Marek Vasut <marex@denx.de>

Without this dependency, generating the bootchart may fail with:
"
ModuleNotFoundError: No module named 'random'
"

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Mingli Yu <mingli.yu@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 487e9f16a00f895159b79f1865fe8b626b47ddc2)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 59fcd8c78a..413c9b9499 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -150,7 +150,7 @@ do_install () {
 
 PACKAGES =+ "pybootchartgui"
 FILES:pybootchartgui += "${PYTHON_SITEPACKAGES_DIR}/pybootchartgui ${bindir}/pybootchartgui"
-RDEPENDS:pybootchartgui = "python3-pycairo python3-compression python3-image python3-shell python3-compression python3-codecs"
+RDEPENDS:pybootchartgui = "python3-pycairo python3-compression python3-image python3-math python3-shell python3-compression python3-codecs"
 RDEPENDS:${PN}:class-target += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
 RDEPENDS:${PN}:class-target += "lsb-release"
 DEPENDS:append:class-native = " python3-pycairo-native"
-- 
2.34.1


