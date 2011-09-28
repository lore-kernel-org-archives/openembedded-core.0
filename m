Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrew_Gabbasov@mentor.com>) id 1R8t3f-0004N4-Py
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 14:16:16 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1R8syQ-00028f-Q7 from Andrew_Gabbasov@mentor.com ;
	Wed, 28 Sep 2011 05:10:50 -0700
Received: from [172.30.176.48] ([172.30.176.48]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 28 Sep 2011 05:01:11 -0700
Message-ID: <4E830EB6.3050004@mentor.com>
Date: Wed, 28 Sep 2011 16:10:30 +0400
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-OriginalArrivalTime: 28 Sep 2011 12:01:12.0140 (UTC)
	FILETIME=[50F1D0C0:01CC7DD6]
Subject: [PATCH] libpam: add flex-native to DEPENDS
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
X-List-Received-Date: Wed, 28 Sep 2011 12:16:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

flex-native is required for building libpam. Although this dependency
is now fulfilled indirectly through bison recipe, having an explicit one
would be preferable.

Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 meta/recipes-extended/pam/libpam_1.1.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.4.bb b/meta/recipes-extended/pam/libpam_1.1.4.bb
index d6f95b1..868bffd 100644
--- a/meta/recipes-extended/pam/libpam_1.1.4.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
 
 PR = "r2"
 
-DEPENDS = "bison flex cracklib"
+DEPENDS = "bison flex flex-native cracklib"
 RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit pam-plugin-warn pam-plugin-unix"
 RDEPENDS_${PN}-xtests = "libpam pam-plugin-access pam-plugin-debug pam-plugin-cracklib pam-plugin-pwhistory \
                         pam-plugin-succeed-if pam-plugin-time coreutils"


