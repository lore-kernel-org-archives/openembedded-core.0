Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8284.1604644110706190146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: HTWQXJJoxOxhXvDa93oAxA/hWI40jb8RXavEthJvn/6VX6Lg/Lbb+MJ4Tz6oncw11pJ+00g0Bw
 rBqGpW0NAXMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187428919"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="187428919"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:58 -0800
IronPort-SDR: uw4MJ/cQf04ePFRUYBN4MPa6b79rARxOvwAL9NYtd8dr+AOIAVItzQNHWJ1wuvmHQAX7LVEpHR
 Y9ut5T/gxb5Q==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="321490135"
Received: from gcquah-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.239])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:57 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 20/22] recipes-core/busybox: fixup licensing information
Date: Fri,  6 Nov 2020 14:28:18 +0800
Message-Id: <003550eddbce261f3d6294602552cc433a0689c5.1604643684.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604643684.git.anuj.mittal@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Commit 7d32417b4d (busybox: Correct the name of the bzip2 license)
changes the licesne from 'bzip2' to 'bzip2-1.0.6' on the rationale
that the 'bzip2 license was renamed from "bzip2" to "bzip2-1.0.6"
[...] to match the official SPDX identifier.'

Though the above is true for the bzip2 and pbzip2 packages, the bzip2
code bundled in busybox is a copy from the bzip2 1.0.4 version, not the
1.0.6 version.

As such, using bzip2-1.0.6 is wrong.

Unfortunately, there is no official SPDX license identifier for this
bzip2 1.0.4 version, so we just mimick the existing ones (bzip2-1.0.5
and bzip2-1.0.6) by using bzip2-1.0.4.

Also, there is a license file attached to that, so we add it to the
list.

(From OE-Core rev: 6238ee3ecd385cbadd8e75eb8b22a96d9cb13639)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre BELLONI <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0776bf6600c42cec2961d3f6d33c8c9c09cbb1ce)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/busybox/busybox.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 45aaa2b41c..e0522be729 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -5,10 +5,11 @@ BUGTRACKER = "https://bugs.busybox.net/"
 
 DEPENDS += "kern-tools-native virtual/crypt"
 
-# bzip2 applet in busybox is based on lightly-modified bzip2 source
+# bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 source
 # the GPL is version 2 only
-LICENSE = "GPLv2 & bzip2-1.0.6"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
+LICENSE = "GPLv2 & bzip2-1.0.4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb \
+                    file://archival/libarchive/bz/LICENSE;md5=28e3301eae987e8cfe19988e98383dae"
 
 SECTION = "base"
 
-- 
2.28.0

