Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2AFED6F309
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:37:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2014 08:37:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,562,1389772800"; d="scan'208";a="490064832"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.227])
	by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2014 08:37:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 16:37:22 +0000
Message-Id: <75ab95f750a8921736ab189f6f9620fd3e96f20f.1393605405.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393605405.git.paul.eggleton@linux.intel.com>
References: <cover.1393605405.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393605405.git.paul.eggleton@linux.intel.com>
References: <cover.1393605405.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/6] chrpath: upgrade to 0.16
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
X-List-Received-Date: Fri, 28 Feb 2014 16:37:31 -0000

I elected not to use ${PV} in SRC_URI because the URL still needs to
have a unique number in it per release, so there doesn't seem to be any
point.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/chrpath/{chrpath_0.15.bb => chrpath_0.16.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/chrpath/{chrpath_0.15.bb => chrpath_0.16.bb} (78%)

diff --git a/meta/recipes-devtools/chrpath/chrpath_0.15.bb b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
similarity index 78%
rename from meta/recipes-devtools/chrpath/chrpath_0.15.bb
rename to meta/recipes-devtools/chrpath/chrpath_0.16.bb
index 461710e..0a3b06e 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.15.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
@@ -7,11 +7,11 @@ BUGTRACKER = "http://alioth.debian.org/tracker/?atid=412807&group_id=31052"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "http://alioth.debian.org/frs/download.php/file/3968/chrpath-${PV}.tar.gz \
+SRC_URI = "http://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz \
            file://standarddoc.patch"
 
-SRC_URI[md5sum] = "2d2dc80e25e17425d8af849baae60654"
-SRC_URI[sha256sum] = "f1125f5dd0f7c7eaa4d0b64bf17c5b9cb4ee828722246970e201a18a77e18879"
+SRC_URI[md5sum] = "2bf8d1d1ee345fc8a7915576f5649982"
+SRC_URI[sha256sum] = "bb0d4c54bac2990e1bdf8132f2c9477ae752859d523e141e72b3b11a12c26e7b"
 
 inherit autotools
 
-- 
1.8.5.3


