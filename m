Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C93B960125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 08:06:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 07 Oct 2015 01:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,648,1437462000"; d="scan'208";a="786453428"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 07 Oct 2015 01:06:38 -0700
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C94F26A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 01:05:40 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Oct 2015 06:20:06 +0300
Message-Id: <1444188006-12139-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] kbd: provide a workaround for build failures
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
X-List-Received-Date: Wed, 07 Oct 2015 08:06:38 -0000

An easy workaround for kbd build failure is to disable
parallel make install for now.

[YOCTO #7436]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/kbd/kbd_2.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/kbd/kbd_2.0.2.bb b/meta/recipes-core/kbd/kbd_2.0.2.bb
index 136dc7a..49bb6c9 100644
--- a/meta/recipes-core/kbd/kbd_2.0.2.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.2.bb
@@ -34,3 +34,4 @@ ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt"
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
+PARALLEL_MAKEINST = ""
-- 
2.4.0


