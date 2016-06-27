Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A8A80607F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 08:47:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Jun 2016 01:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,536,1459839600"; d="scan'208";a="1005800799"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 27 Jun 2016 01:47:49 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 505FC6A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 01:47:45 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2016 06:54:20 +0300
Message-Id: <1466999661-1892-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1466999661-1892-1-git-send-email-maxin.john@intel.com>
References: <1466999661-1892-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 5/6] gstreamer1.0-plugins-ugly_git: bump version to 1.8.2
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
X-List-Received-Date: Mon, 27 Jun 2016 08:47:48 -0000

Upgrade _git version to 1.8.2 release

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
index 0c9bc23..22cca3a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
@@ -6,16 +6,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
 
 SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gst-plugins-ugly;name=base \
+    git://anongit.freedesktop.org/gstreamer/gst-plugins-ugly;branch=1.8;name=base \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
 "
 
-PV = "1.7.2+git${SRCPV}"
+PV = "1.8.2+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV_base = "8bdb68edbc605e21314b608e7a39bdbaab7302b8"
-SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
+SRCREV_base = "79fe43c00925455a37fab6fc428e7f08655a9bbd"
+SRCREV_common = "f363b3205658a38e84fa77f19dee218cd4445275"
 SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


