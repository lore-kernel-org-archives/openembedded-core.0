Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWnd-0001zv-HU
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:09:17 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720805"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:16 -0800
Message-Id: <8248d6e6f6c5a524aae4871fdefed8b028496e50.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 16/26] lame: Update to 3.99.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 23:09:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lame/{lame_3.99.1.bb => lame_3.99.3.bb}        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/lame/{lame_3.99.1.bb => lame_3.99.3.bb} (86%)

diff --git a/meta/recipes-multimedia/lame/lame_3.99.1.bb b/meta/recipes-multimedia/lame/lame_3.99.3.bb
similarity index 86%
rename from meta/recipes-multimedia/lame/lame_3.99.1.bb
rename to meta/recipes-multimedia/lame/lame_3.99.3.bb
index 31766fd..3c42cc7 100644
--- a/meta/recipes-multimedia/lame/lame_3.99.1.bb
+++ b/meta/recipes-multimedia/lame/lame_3.99.3.bb
@@ -10,8 +10,8 @@ PR = "r0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
            file://no-gtk1.patch"
 
-SRC_URI[md5sum] = "2576a7368b5c90a87adc9de6b9f0628c"
-SRC_URI[sha256sum] = "1eedcbe238f81cdef822f367f104a8ff918062727b61f0c62b24e9f79d941cf0"
+SRC_URI[md5sum] = "5ad31e33e70455eb3a7b79a5dd934fce"
+SRC_URI[sha256sum] = "d4ea3c8d00d2cc09338425a25dbfeb4d587942cb3c83a677c09aeb1e850c74cf"
 
 inherit autotools
 
-- 
1.7.6.4



