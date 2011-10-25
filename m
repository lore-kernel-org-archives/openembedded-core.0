Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RIolt-0004to-Sm
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 23:42:58 +0200
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id AD80F304CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 17:36:47 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2011 14:36:31 -0700
Message-Id: <93bb165f051b7cc80aaa1fb18a6f646388e5f229.1319576293.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1319576293.git.scott.a.garman@intel.com>
References: <cover.1319576293.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1319576293.git.scott.a.garman@intel.com>
References: <cover.1319576293.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: AD80F304CC.6C82A
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 3/5] mtools: upgrade to 4.0.17
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
X-List-Received-Date: Tue, 25 Oct 2011 21:42:58 -0000

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../mtools/{mtools_4.0.16.bb => mtools_4.0.17.bb}  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.16.bb => mtools_4.0.17.bb} (80%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.16.bb b/meta/recipes-devtools/mtools/mtools_4.0.17.bb
similarity index 80%
rename from meta/recipes-devtools/mtools/mtools_4.0.16.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.17.bb
index df67854..e4666ff 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.16.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.17.bb
@@ -11,8 +11,8 @@ SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
            file://no-x11.gplv3.patch"
 
-SRC_URI[md5sum] = "e9b07f35272210f407012abaf5d1b9b5"
-SRC_URI[sha256sum] = "7c9e337786d142399d37202ff2002f95bfb3f4e96620223a18d7206708ad2ed5"
+SRC_URI[md5sum] = "15571c615d8f75f5f6d294272f80c7fa"
+SRC_URI[sha256sum] = "0ecc358e30a72d215b1d4c625b27e67121cd6f6075370dfb791ef2a8b980ecb6"
 
 inherit autotools
 
-- 
1.7.5.4



