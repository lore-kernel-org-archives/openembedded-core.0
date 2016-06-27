Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 67BCA6FF93
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 08:47:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 27 Jun 2016 01:47:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,536,1459839600"; d="scan'208";a="1010308101"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jun 2016 01:47:45 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 089236A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 01:47:41 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2016 06:54:18 +0300
Message-Id: <1466999661-1892-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1466999661-1892-1-git-send-email-maxin.john@intel.com>
References: <1466999661-1892-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/6] gstreamer1.0-plugins-bad_git: bump version to 1.8.2
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
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index ef6581b..d3fbd12 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
 
 SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gst-plugins-bad;name=base \
+    git://anongit.freedesktop.org/gstreamer/gst-plugins-bad;branch=1.8;name=base \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
     file://configure-allow-to-disable-libssh2.patch \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
@@ -17,12 +17,12 @@ SRC_URI = " \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
 "
 
-PV = "1.7.2+git${SRCPV}"
+PV = "1.8.2+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV_base = "50ae46cc0f8827bf966920d9c221e5cf86e811ba"
-SRCREV_common = "a25397448942079002622be231e9ec49b985745a"
+SRCREV_base = "5e73b5a4843d9675246f4efec158624475ed9586"
+SRCREV_common = "f363b3205658a38e84fa77f19dee218cd4445275"
 SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


