Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RIoi5-0004j9-Pw
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 23:39:01 +0200
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id B514C304CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 17:33:00 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2011 14:32:45 -0700
Message-Id: <df2351cc2e6219aa2024ae42579f16b73a7683e2.1319576293.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1319576293.git.scott.a.garman@intel.com>
References: <cover.1319576293.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1319576293.git.scott.a.garman@intel.com>
References: <cover.1319576293.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: B514C304CD.5DF6D
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/5] sudo: upgrade to 1.8.3
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
X-List-Received-Date: Tue, 25 Oct 2011 21:39:02 -0000

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../sudo/{sudo_1.8.1p2.bb => sudo_1.8.3.bb}        |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.1p2.bb => sudo_1.8.3.bb} (82%)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.1p2.bb b/meta/recipes-extended/sudo/sudo_1.8.3.bb
similarity index 82%
rename from meta/recipes-extended/sudo/sudo_1.8.1p2.bb
rename to meta/recipes-extended/sudo/sudo_1.8.3.bb
index b568291..0ac0851 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.1p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.3.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            file://libtool.patch \
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "e8330f0e63b0ecb2e12b5c76922818cc"
-SRC_URI[sha256sum] = "281f90c80547cf22132e351e7f61c25ba4ba9cf393438468f318f9a7884026fb"
+SRC_URI[md5sum] = "9e5517bbf3aee420b38c2d1d7a71bcad"
+SRC_URI[sha256sum] = "ff1fcc410c5465063ee4912912e29936ea39f017d9a8a57ec76b0ded71b7c3c4"
 
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.7.5.4



