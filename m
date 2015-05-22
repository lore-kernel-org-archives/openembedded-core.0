Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 08B8A755CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 14:16:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 22 May 2015 07:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,475,1427785200"; d="scan'208";a="497061958"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com) ([10.252.3.49])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 07:16:08 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 17:15:49 +0300
Message-Id: <e9497d052e028d8d6bde3ecc2a29d655b7c804f7.1432303757.git.tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <bbc0c5d2ae38edbfb1c0a5e0542a8f4ff99a256b.1432303757.git.tanu.kaskinen@linux.intel.com>
References: <bbc0c5d2ae38edbfb1c0a5e0542a8f4ff99a256b.1432303757.git.tanu.kaskinen@linux.intel.com>
In-Reply-To: <cover.1432303757.git.tanu.kaskinen@linux.intel.com>
References: <cover.1432303757.git.tanu.kaskinen@linux.intel.com>
Subject: [PATCH v2 5/5] packagegroup-core-x11-sato: add PulseAudio
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
X-List-Received-Date: Fri, 22 May 2015 14:16:08 -0000

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


