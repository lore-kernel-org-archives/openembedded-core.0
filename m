Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7E9607F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 08:47:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jun 2016 01:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,536,1459839600"; d="scan'208";a="995677657"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2016 01:47:44 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 63D1D6A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 01:47:40 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2016 06:54:17 +0300
Message-Id: <1466999661-1892-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1466999661-1892-1-git-send-email-maxin.john@intel.com>
References: <1466999661-1892-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/6] gstreamer1.0-plugins-good_git: bump version to 1.8.2
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
X-List-Received-Date: Mon, 27 Jun 2016 08:47:44 -0000

Upgrade _git version to 1.8.2 release

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_git.bb                   | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index 9cadc9a..9b79af2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -7,18 +7,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
 SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gst-plugins-good;name=base \
+    git://anongit.freedesktop.org/gstreamer/gst-plugins-good;branch=1.8;name=base \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
+    file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
 "
 
-PV = "1.7.2+git${SRCPV}"
+PV = "1.8.2+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV_base = "1b6fdce67c15d59957e395b1957aa625322092d4"
-SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
+SRCREV_base = "9f73b5818f98cd045e7049bb313da1c943635109"
+SRCREV_common = "f363b3205658a38e84fa77f19dee218cd4445275"
 SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


