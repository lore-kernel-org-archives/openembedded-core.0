Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6077B78558
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 14:51:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jan 2018 06:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,372,1511856000"; d="scan'208";a="23103586"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2018 06:51:58 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id A582B580328
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 06:51:57 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 16:53:29 +0200
Message-Id: <1516200810-25661-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] gst-examples: upgrade to latest revision
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
X-List-Received-Date: Wed, 17 Jan 2018 14:51:57 -0000

As suggested by updated AUH

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-examples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_git.bb b/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
index 8891328..1d87f24 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-examples \
            file://0001-Make-player-examples-installable.patch \
            file://gst-player.desktop"
 
-SRCREV = "e88c04ff34cf56984e62a524a0bcc16ab51b282d"
+SRCREV = "48247c6ab6807d6ae179cf653cbdc64714d3313c"
 PV = "0.0.1+git${SRCPV}"
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.4.0


