Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S8Cf4-0002cc-27
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 16:32:20 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id CC6522FE9D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 11:22:54 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 08:22:55 -0700
Message-Id: <497a99b4c3631d869ae1b1c6d52419fcc63606bf.1331824888.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331824888.git.scott.a.garman@intel.com>
References: <cover.1331824888.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331824888.git.scott.a.garman@intel.com>
References: <cover.1331824888.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: CC6522FE9D.9A19E
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/4] sudo: upgrade to 1.8.4p4
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
X-List-Received-Date: Thu, 15 Mar 2012 15:32:20 -0000

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../sudo/{sudo_1.8.4.bb => sudo_1.8.4p4.bb}        |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.4.bb => sudo_1.8.4p4.bb} (83%)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.4.bb b/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
similarity index 83%
rename from meta/recipes-extended/sudo/sudo_1.8.4.bb
rename to meta/recipes-extended/sudo/sudo_1.8.4p4.bb
index dfa7291..2315322 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.4.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            file://libtool.patch \
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "5a54dde137618bbc1dd46bb0ef725d7d"
-SRC_URI[sha256sum] = "17a91da1857954aa73445197e6f73d5d50cc8c48719f6db457723bb8badc32a5"
+SRC_URI[md5sum] = "b9be6df7ecefedff2263052ed9fc5e93"
+SRC_URI[sha256sum] = "bf965b09bde9b0cf7fd2355c53a81884d02d522af2d539cf40218436e9a5051e"
 
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.7.5.4



