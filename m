Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RXkiB-00059f-RU
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 03:24:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Dec 2011 18:18:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,302,1320652800"; d="scan'208";a="82548336"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.192])
	by azsmga001.ch.intel.com with ESMTP; 05 Dec 2011 18:18:03 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 18:18:00 -0800
Message-Id: <e315d0976bb88e87617575927bd68cc5c0961403.1323137480.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1323137480.git.josh@linux.intel.com>
References: <cover.1323137480.git.josh@linux.intel.com>
In-Reply-To: <cover.1323137480.git.josh@linux.intel.com>
References: <cover.1323137480.git.josh@linux.intel.com>
Subject: [PATCH 3/4] default-distrovars: missing checksums should raise an error
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
X-List-Received-Date: Tue, 06 Dec 2011 02:24:52 -0000

Set BB_STRICT_CHECKSUM in default-distrovars so that an error is raised
if no checksum is set.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/conf/distro/include/default-distrovars.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 6f5f1c0..e1594f3 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -48,3 +48,6 @@ NO32LIBS ??= "1"
 BBINCLUDELOGS ??= "yes"
 SDK_VERSION ??= "oe-core.0"
 DISTRO_VERSION ??= "oe-core.0"
+
+# Missing checksums should raise an error
+BB_STRICT_CHECKSUM = "1"
-- 
1.7.7.3



