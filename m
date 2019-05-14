Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7CCA7DED0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 03:57:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4E3vg2G018092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 20:57:42 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 13 May 2019 20:57:41 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 May 2019 23:57:14 -0400
Message-ID: <20190514035716.27376-3-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] valgrind: update the ptest subdirs list
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
X-List-Received-Date: Tue, 14 May 2019 03:57:42 -0000
Content-Type: text/plain

Split the list into one directory per line.
Sort the list alphabetically.
Add the gdbserver_tests directory to get the 'gone' executable
which is needed by:
    memcheck/tests/gone_abrt_xml.vgtest

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.15.0.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index b72f4d76ee..4c5a4b3c70 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -139,7 +139,17 @@ do_install_ptest() {
         # exclude shell or the package won't install
         rm -rf none/tests/shell* 2>/dev/null
 
-        subdirs="tests cachegrind/tests callgrind/tests drd/tests helgrind/tests massif/tests memcheck/tests none/tests"
+        subdirs=" \
+	   cachegrind/tests \
+	   callgrind/tests \
+	   drd/tests \
+	   gdbserver_tests \
+	   helgrind/tests \
+	   massif/tests \
+	   memcheck/tests \
+	   none/tests \
+	   tests \
+	"
 
         # Get the vg test scripts, filters, and expected files
         for dir in $subdirs ; do
-- 
2.17.0


