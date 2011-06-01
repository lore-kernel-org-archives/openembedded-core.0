Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerj-00041j-7p
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:15 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203791"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:30 -0700
Message-Id: <18f9a54770fe56e71b7de3fbce01a1ec49d1ed1d.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/32] tzdata: update to 2011g
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:15 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../tzdata/{tzdata_2010o.bb => tzdata_2011g.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2010o.bb => tzdata_2011g.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2010o.bb b/meta/recipes-extended/tzdata/tzdata_2011g.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2010o.bb
rename to meta/recipes-extended/tzdata/tzdata_2011g.bb
index d250e5c..ed343c0 100644
--- a/meta/recipes-extended/tzdata/tzdata_2010o.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2011g.bb
@@ -15,8 +15,8 @@ RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
 
 SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5cae5c56fad81dc29f8fcd933a05768e"
-SRC_URI[sha256sum] = "cd0f3799688b3b870cd988505e47c2975b1808e73ec0677bc9db4b705b534c07"
+SRC_URI[md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
+SRC_URI[sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
 
 S = "${WORKDIR}"
 
-- 
1.7.3.4



