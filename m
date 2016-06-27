Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE016FFA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 08:47:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 27 Jun 2016 01:47:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,536,1459839600"; d="scan'208";a="1010308108"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jun 2016 01:47:47 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A42776A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 01:47:43 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2016 06:54:19 +0300
Message-Id: <1466999661-1892-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1466999661-1892-1-git-send-email-maxin.john@intel.com>
References: <1466999661-1892-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/6] gstreamer1.0-plugins-base_git: bump version to 1.8.2
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
X-List-Received-Date: Mon, 27 Jun 2016 08:47:46 -0000

Upgrade _git version to 1.8.2 release

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../gstreamer/gstreamer1.0-plugins-base_git.bb               | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
index 38a9fcc..3c2b504 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -7,17 +7,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
 
 SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gst-plugins-base;name=base \
+    git://anongit.freedesktop.org/gstreamer/gst-plugins-base;branch=1.8;name=base \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
+    file://get-caps-from-src-pad-when-query-caps.patch \
+    file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
+    file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
+    file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
     file://make-gio_unix_2_0-dependency-configurable.patch \
 "
 
-PV = "1.7.2+git${SRCPV}"
+PV = "1.8.2+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV_base = "97e108bebaa58821f4566a74cbf0135e93407c01"
-SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
+SRCREV_base = "70f3750773bf5dba4098f6d72d63aa6c84f1f539"
+SRCREV_common = "f363b3205658a38e84fa77f19dee218cd4445275"
 SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


