Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RWYlA-0004vX-JQ
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 20:27:00 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 11:20:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,285,1320652800"; d="scan'208";a="43382324"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.18])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2011 11:20:16 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 11:20:15 -0800
Message-Id: <ed529230db609189a2d571d7f93b664013862207.1322853315.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322853315.git.josh@linux.intel.com>
References: <cover.1322853315.git.josh@linux.intel.com>
In-Reply-To: <cover.1322853315.git.josh@linux.intel.com>
References: <cover.1322853315.git.josh@linux.intel.com>
Subject: [PATCH 1/1] default-distrovars: missing checksums should raise an error
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
X-List-Received-Date: Fri, 02 Dec 2011 19:27:00 -0000

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



