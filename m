Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RGlfM-0007C1-GR
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 07:59:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9K5rpMJ001934
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 22:53:51 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 19 Oct 2011 22:53:51 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Oct 2011 13:59:57 +0800
Message-ID: <b475d0b4e57ccfa1b7001238aabe7d88b0fa5c3d.1319090166.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1319090166.git.wenzong.fan@windriver.com>
References: <cover.1319090166.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3 v2] ccache: update to 3.1.6
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
X-List-Received-Date: Thu, 20 Oct 2011 05:59:44 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Update ccache to 3.1.6 from 3.1.5.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../ccache/{ccache_3.1.5.bb => ccache_3.1.6.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.1.5.bb => ccache_3.1.6.bb} (47%)

diff --git a/meta/recipes-devtools/ccache/ccache_3.1.5.bb b/meta/recipes-devtools/ccache/ccache_3.1.6.bb
similarity index 47%
rename from meta/recipes-devtools/ccache/ccache_3.1.5.bb
rename to meta/recipes-devtools/ccache/ccache_3.1.6.bb
index 9a967b2..e87468a 100644
--- a/meta/recipes-devtools/ccache/ccache_3.1.5.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.1.6.bb
@@ -4,5 +4,5 @@ PR = "r0"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e92ec45d4fca91f127864fb9e5d932"
 
-SRC_URI[md5sum] = "b1a9684828eae68382d6afc98ce80d24"
-SRC_URI[sha256sum] = "54afc35c672ce451e04a478cfc0eb74c1ba184e27ef24881206602aa0eb94d63"
+SRC_URI[md5sum] = "e6565e7d6c95d1e35b7a0d67e39901e8"
+SRC_URI[sha256sum] = "59f58bb73f00db5bbff36b8eb530d3000c86b3110e34cf8dba9e2a5d19eb684f"
-- 
1.7.0.4



