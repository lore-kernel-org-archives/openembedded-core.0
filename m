Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AFFD973178
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 14:08:09 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2016 07:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,352,1464678000"; d="scan'208";a="137812698"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2016 07:07:59 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id F0D4C6A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 07:07:51 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 17:07:42 +0300
Message-Id: <1468332463-4154-8-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
References: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 7/8] layer.conf: remove pointercal
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
X-List-Received-Date: Tue, 12 Jul 2016 14:08:09 -0000

Since we removed the pointercal recipe, remove it from layer.conf

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/conf/layer.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 81dd4be..b922234 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -26,7 +26,6 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   connman-conf \
   formfactor \
   xserver-xf86-config \
-  pointercal \
   pointercal-xinput \
   base-files \
   keymaps \
-- 
2.4.0


