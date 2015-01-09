Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7415D72A78
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 05:33:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t095Xi9H027464
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Jan 2015 21:33:44 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 8 Jan 2015 21:33:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Jan 2015 21:33:40 -0800
Message-ID: <2a58ed4089c722caa7e92f7ee25868a165c28791.1420781433.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1420781433.git.liezhi.yang@windriver.com>
References: <cover.1420781433.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] python-gitdb: upgrade to 0.6.1
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
X-List-Received-Date: Fri, 09 Jan 2015 05:33:48 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...python-gitdb_0.5.4.bb => python-gitdb_0.6.1.bb} |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-gitdb_0.5.4.bb => python-gitdb_0.6.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python-gitdb_0.5.4.bb b/meta/recipes-devtools/python/python-gitdb_0.6.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python-gitdb_0.5.4.bb
rename to meta/recipes-devtools/python/python-gitdb_0.6.1.bb
index 9e96152..ead93e1 100644
--- a/meta/recipes-devtools/python/python-gitdb_0.5.4.bb
+++ b/meta/recipes-devtools/python/python-gitdb_0.6.1.bb
@@ -6,8 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=59e5ecb13339a936eedf83282eaf4528"
 DEPENDS = "python-async python-smmap"
 
 SRC_URI = "https://pypi.python.org/packages/source/g/gitdb/gitdb-${PV}.tar.gz"
-SRC_URI[md5sum] = "25353bb8d3ea527ba443dd88cd4e8a1c"
-SRC_URI[sha256sum] = "de5d2dac0daec4a9cd7bb1ae1cd42d53510dcf597397c608c12a154b69ad3783"
+
+SRC_URI[md5sum] = "daeb85a5e97d2d100fd37cf522fd65d5"
+SRC_URI[sha256sum] = "0d784ec4a75e93c8f65d4aca219c17e388a052d461714ed0edfda657e542b716"
 
 S = "${WORKDIR}/gitdb-${PV}"
 
-- 
1.7.9.5


