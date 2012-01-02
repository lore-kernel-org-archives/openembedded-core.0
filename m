Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhlcs-0000w7-Sv
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 18:24:47 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jan 2012 09:16:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102388494"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2012 09:16:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 09:06:08 -0800
Message-Id: <cfd1ece0edcb11fa0eff8650ebe307f700c0a15e.1325523894.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325523894.git.sgw@linux.intel.com>
References: <cover.1325523894.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325523894.git.sgw@linux.intel.com>
References: <cover.1325523894.git.sgw@linux.intel.com>
Subject: [PATCH 1/9] resolvconf: Update to 1.63
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
X-List-Received-Date: Mon, 02 Jan 2012 17:24:47 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{resolvconf_1.62.bb => resolvconf_1.63.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.62.bb => resolvconf_1.63.bb} (88%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.62.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.63.bb
similarity index 88%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.62.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.63.bb
index af72199..61f4309 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.62.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.63.bb
@@ -14,8 +14,8 @@ PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5d9656c9d7a2e1304d9d41ed13cf54a4"
-SRC_URI[sha256sum] = "cd00b3757fc73d2729be6e2532ca033ddd5542c4deff451929695bcc3af97c61"
+SRC_URI[md5sum] = "4a62b7ce617518a5567c9e8c47fa7a41"
+SRC_URI[sha256sum] = "5299a5d7a44b8e09fca31fe246aa199cd6938195e597762c1cc97c1f9d93ad38"
 
 inherit allarch
 
-- 
1.7.6.4



