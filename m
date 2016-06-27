Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5BE966FF60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 08:47:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 27 Jun 2016 01:47:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,536,1459839600"; d="scan'208";a="1010308079"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jun 2016 01:47:42 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A487C6A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 01:47:38 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2016 06:54:16 +0300
Message-Id: <1466999661-1892-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1466999661-1892-1-git-send-email-maxin.john@intel.com>
References: <1466999661-1892-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/6] gstreamer1.0_git: bump to 1.8.2
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
X-List-Received-Date: Mon, 27 Jun 2016 08:47:45 -0000

Upgrade _git version to 1.8.2 release

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
index f04fc6e..6112f2a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -6,16 +6,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
 
 SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gstreamer;name=base \
+    git://anongit.freedesktop.org/gstreamer/gstreamer;branch=1.8;name=base \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
 "
 
-PV = "1.7.2+git${SRCPV}"
+PV = "1.8.2+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV_base = "9e33bfa2c7a5f43da2c49b0a8235fd43cba9feaf"
-SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
+SRCREV_base = "3de8a4f728a7194a12b784ec4085f6a8e7d9b5bd"
+SRCREV_common = "f363b3205658a38e84fa77f19dee218cd4445275"
 SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


