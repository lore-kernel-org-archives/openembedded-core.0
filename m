Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <anders.roxell@gmail.com>) id 1UKPNi-0007In-Di
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 09:37:24 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 26 Mar 2013 09:20:22 +0100
Received: by sestofb10.enea.se (Postfix, from userid 3976)	id 65210289A9F;
	Tue, 26 Mar 2013 09:20:22 +0100 (CET)
From: <anders.roxell@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Mar 2013 09:20:13 +0100
Message-ID: <1364286013-25970-1-git-send-email-anders.roxell@gmail.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: Neutral (SESTOEX08.enea.se: 172.21.3.145 is neither permitted
	nor denied by domain of anders.roxell@gmail.com)
Cc: Anders Roxell <anders.roxell@enea.com>
Subject: [PATCH] initscripts: RDEPENDS sed to remove "sed: command not found".
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 08:37:24 -0000
Content-Type: text/plain

From: Anders Roxell <anders.roxell@enea.com>

Log:
/etc/rcS.d/S37populate-volatile.sh: line 13: sed: command not found
/etc/rcS.d/S37populate-volatile.sh: line 152: sed: command not found
/etc/rcS.d/S37populate-volatile.sh: line 152: sed: command not found

Signed-off-by: Anders Roxell <anders.roxell@enea.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 649e182..bfd3d28 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r140"
+PR = "r141"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -39,6 +39,7 @@ KERNEL_VERSION = ""
 
 inherit update-alternatives
 DEPENDS_append = " update-rc.d-native"
+RDEPENDS_${PN} = " sed"
 
 ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE_${PN} = "functions"
-- 
1.7.5.4



