Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CFEC06011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:29:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 10 Aug 2016 02:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,499,1464678000"; d="scan'208";a="746760926"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Aug 2016 02:29:49 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B6F866A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:29:34 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2016 12:30:29 +0300
Message-Id: <1470821429-6094-11-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
References: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 10/10] layer.conf: remove pointercal
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
X-List-Received-Date: Wed, 10 Aug 2016 09:29:49 -0000

remove pointercal reference from layer.conf file since we moved the
pointercal recipe from oe-core.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/conf/layer.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index b6d5f1c..24b4df0 100644
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


