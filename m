Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RIoiF-0004kc-7n
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 23:39:11 +0200
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id E2ED5304CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 17:33:05 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2011 14:32:46 -0700
Message-Id: <d39a82b9d386e973f667b80d4c2b184842692749.1319576293.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1319576293.git.scott.a.garman@intel.com>
References: <cover.1319576293.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1319576293.git.scott.a.garman@intel.com>
References: <cover.1319576293.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: E2ED5304CC.EF7CC
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/5] grep: upgrade to 2.9
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
X-List-Received-Date: Tue, 25 Oct 2011 21:39:11 -0000

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../grep/{grep_2.8.bb => grep_2.9.bb}              |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_2.8.bb => grep_2.9.bb} (88%)

diff --git a/meta/recipes-extended/grep/grep_2.8.bb b/meta/recipes-extended/grep/grep_2.9.bb
similarity index 88%
rename from meta/recipes-extended/grep/grep_2.8.bb
rename to meta/recipes-extended/grep/grep_2.9.bb
index 3425e8f..08ac527 100644
--- a/meta/recipes-extended/grep/grep_2.8.bb
+++ b/meta/recipes-extended/grep/grep_2.9.bb
@@ -9,8 +9,8 @@ PR = "r0"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "cb2dfc502c5afc7a4a6e5f6cefd6850e"
-SRC_URI[sha256sum] = "da48d0e20bceaacc7d05bfcbccb34c3dee0c50bd7e80de5222fd5e319809af27"
+SRC_URI[md5sum] = "03e3451a38b0d615cb113cbeaf252dc0"
+SRC_URI[sha256sum] = "e9118eac72ecc71191725a7566361ab7643edfd3364869a47b78dc934a357970"
 
 inherit autotools gettext
 
-- 
1.7.5.4



