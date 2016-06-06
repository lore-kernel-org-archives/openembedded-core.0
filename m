Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A35C87719D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 09:13:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Jun 2016 02:13:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,426,1459839600"; d="scan'208";a="969692103"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 06 Jun 2016 02:13:13 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 03FC56A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 03:00:39 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 12:13:40 +0300
Message-Id: <1465204421-22556-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] maintainers.inc: change maintainer of db package
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
X-List-Received-Date: Mon, 06 Jun 2016 09:13:14 -0000

As discussed in the mail, change db maintainership.
http://lists.openembedded.org/pipermail/openembedded-core/2016-June/122460.html

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta-poky/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/include/maintainers.inc b/meta-poky/conf/distro/include/maintainers.inc
index dbc33fc..125613b 100644
--- a/meta-poky/conf/distro/include/maintainers.inc
+++ b/meta-poky/conf/distro/include/maintainers.inc
@@ -123,7 +123,7 @@ RECIPE_MAINTAINER_pn-cups = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-curl = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-cwautomacros = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-damageproto = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
-RECIPE_MAINTAINER_pn-db = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-db = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus-glib = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus-test = "Chen Qi <Qi.Chen@windriver.com>"
-- 
2.4.0


