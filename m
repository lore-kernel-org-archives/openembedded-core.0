Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1T2H98-0004ct-BK
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 09:39:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7H7R6sm029372
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 17 Aug 2012 00:27:06 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Fri, 17 Aug 2012 00:27:06 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <sgw@linux.intel.com>
Date: Fri, 17 Aug 2012 15:27:02 +0800
Message-ID: <2d63d5cc202a3c53175484a8251a530546d114a4.1345187942.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1345187942.git.jackie.huang@windriver.com>
References: <cover.1345187942.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python: Add Upstream-Status entries for bsddb patches, no code changes
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
X-List-Received-Date: Fri, 17 Aug 2012 07:39:06 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/python-2.7.3-berkeley-db-5.3.patch      |    2 ++
 .../python/python-2.7.3-remove-bsdb-rpath.patch    |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/python/python/python-2.7.3-berkeley-db-5.3.patch b/meta/recipes-devtools/python/python/python-2.7.3-berkeley-db-5.3.patch
index 469cbb3..3df3336 100644
--- a/meta/recipes-devtools/python/python/python-2.7.3-berkeley-db-5.3.patch
+++ b/meta/recipes-devtools/python/python/python-2.7.3-berkeley-db-5.3.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not author]
+
 Fix to support db 5.3 for bsddb module in python 2.7.2
 
 This patch is made from the db5.1.diff in
diff --git a/meta/recipes-devtools/python/python/python-2.7.3-remove-bsdb-rpath.patch b/meta/recipes-devtools/python/python/python-2.7.3-remove-bsdb-rpath.patch
index dfd346f..216be0a 100644
--- a/meta/recipes-devtools/python/python/python-2.7.3-remove-bsdb-rpath.patch
+++ b/meta/recipes-devtools/python/python/python-2.7.3-remove-bsdb-rpath.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 Remove the RPATH to avoid QA issue warning.
 
 RP: Added secondary unnecessary rpath to the list 2012/8/7
-- 
1.7.4



