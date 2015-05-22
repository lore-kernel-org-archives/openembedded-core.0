Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D93686B0CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 18:52:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 22 May 2015 11:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,477,1427785200"; d="scan'208";a="497168926"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com) ([10.252.3.49])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 11:52:15 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 21:51:56 +0300
Message-Id: <5c2bbc518c91e38811b1cadf5771b0fd8211e0a4.1432320274.git.tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
References: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
In-Reply-To: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
References: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
Subject: [PATCH v3 5/5] packagegroup-core-x11-sato: add PulseAudio
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
X-List-Received-Date: Fri, 22 May 2015 18:52:16 -0000

This enables PulseAudio in the Sato images.

[YOCTO #7517]

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 2d046c4..04d1e99 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -39,6 +39,8 @@ RDEPENDS_${PN}-base = "\
     libsdl \
     ${NETWORK_MANAGER} \
     udev-extraconf \
+    pulseaudio-server \
+    pulseaudio-client-conf-sato \
     "
 
 # pcmanfm doesn't work on mips
-- 
1.9.3


