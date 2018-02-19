Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 533FC788BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:35:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:35:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="29064665"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 19 Feb 2018 00:35:11 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 575AD58030D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:35:10 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:37:10 +0200
Message-Id: <1519029438-11092-20-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 19/27] connman: specify dbusconfdir
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
X-List-Received-Date: Mon, 19 Feb 2018 08:35:09 -0000

Explicitly specify the dbusconfdir.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 2b03f9c..e2b5f47 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -28,6 +28,7 @@ EXTRA_OECONF += "\
     --enable-tools \
     --disable-polkit \
     --enable-client \
+    --with-dbusconfdir=${sysconfdir} \
 "
 
 PACKAGECONFIG ??= "wispr \
-- 
2.4.0


