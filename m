Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RcQPD-000766-AV
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 00:44:35 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id BF4422FE9D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 18:37:28 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2011 15:37:28 -0800
Message-Id: <bbf50a78fd6993ae324e539fd6625eb3456cdc8d.1324251354.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324251354.git.scott.a.garman@intel.com>
References: <cover.1324251354.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1324251354.git.scott.a.garman@intel.com>
References: <cover.1324251354.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: BF4422FE9D.31537
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] mktemp: mark patch as upstreamed
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
X-List-Received-Date: Sun, 18 Dec 2011 23:44:35 -0000

Patch sumitted and accepted upstream, updating Upstream-Status.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../mktemp/files/fix-parallel-make.patch           |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/mktemp/files/fix-parallel-make.patch b/meta/recipes-extended/mktemp/files/fix-parallel-make.patch
index 8c693cc..f3b6dcc 100644
--- a/meta/recipes-extended/mktemp/files/fix-parallel-make.patch
+++ b/meta/recipes-extended/mktemp/files/fix-parallel-make.patch
@@ -1,6 +1,7 @@
 This fixes the parallel make install failure
 
-Upstream-Status: Pending
+Upstream-Status: Accepted
+http://www.gratisoft.us/bugzilla/show_bug.cgi?id=528
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-- 
1.7.5.4



