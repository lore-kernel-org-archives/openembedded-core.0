Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4839877E9A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 13:18:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2018 05:18:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,517,1511856000"; d="scan'208";a="175463883"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 15 Feb 2018 05:18:53 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 8ADEF580385
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 05:18:52 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Feb 2018 15:19:32 +0200
Message-Id: <1518700772-14988-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1518700772-14988-1-git-send-email-maxin.john@intel.com>
References: <1518700772-14988-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH] swig.inc: inherit pkgconfig
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
X-List-Received-Date: Thu, 15 Feb 2018 13:18:52 -0000

swig uses pkg-config for pcre detection

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/swig/swig.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
index 8cb6fbd..bf61b02 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -11,7 +11,7 @@ DEPENDS = "libpcre python3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
-inherit autotools python3native
+inherit autotools python3native pkgconfig
 
 EXTRA_OECONF = " \
     --with-python3=${PYTHON} \
-- 
2.4.0


