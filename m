Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RJd7B-00067E-Kw
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 05:28:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Oct 2011 20:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,416,1315206000"; d="scan'208";a="78820652"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga001.fm.intel.com with ESMTP; 27 Oct 2011 20:22:14 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 11:35:45 +0800
Message-Id: <d0cfb363478bff654f1a9e004accf044dde23e92.1319772853.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
Subject: [PATCH 06/11] telepathy-idle: upgrade to version 0.1.10
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
X-List-Received-Date: Fri, 28 Oct 2011 03:28:21 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...athy-idle_0.1.8.bb => telepathy-idle_0.1.10.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.8.bb => telepathy-idle_0.1.10.bb} (81%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.8.bb b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.10.bb
similarity index 81%
rename from meta/recipes-connectivity/telepathy/telepathy-idle_0.1.8.bb
rename to meta/recipes-connectivity/telepathy/telepathy-idle_0.1.10.bb
index bc1fb4e..22caf42 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.8.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.10.bb
@@ -9,8 +9,8 @@ PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "82f5eafa07df5e1abc785061143bbfd2"
-SRC_URI[sha256sum] = "384119cc64022626b6f51aaaef605abf248602d8fae25baff82762a097f20fe9"
+SRC_URI[md5sum] = "570a431e3e28ca6ebf3f0c84198f0b9a"
+SRC_URI[sha256sum] = "e14327a8b47c83ed32c73c5fdad1d9c2291ae8592d3da4482e0a6cbd541f35b0"
 
 inherit autotools pkgconfig
 
-- 
1.7.1



