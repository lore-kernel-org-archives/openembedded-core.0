Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QnpcZ-0003Pn-MJ
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 12:21:15 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QnpYP-00063z-31 from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 03:16:57 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 1 Aug 2011 12:16:55 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 15:16:18 +0500
Message-Id: <1312193778-26396-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 01 Aug 2011 10:16:56.0018 (UTC)
	FILETIME=[240BDB20:01CC5034]
Subject: [PATCH] bison: Add dependency on flex-native
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
X-List-Received-Date: Mon, 01 Aug 2011 10:21:15 -0000

* This is 0479b70418ef553859029911c57c63a7aaebe299 from OE. flex-native is needed to build bison. The dependency was being satisfied indirectly but we need to add it explicitly.

Signed-off-by: Noor, Ahsan <noor_ahsan@mentor.com>
---
 meta/recipes-devtools/bison/bison_2.3.bb |    4 ++--
 meta/recipes-devtools/bison/bison_2.5.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/bison/bison_2.3.bb b/meta/recipes-devtools/bison/bison_2.3.bb
index 22f884b..388476b 100644
--- a/meta/recipes-devtools/bison/bison_2.3.bb
+++ b/meta/recipes-devtools/bison/bison_2.3.bb
@@ -7,9 +7,9 @@ HOMEPAGE = "http://www.gnu.org/software/bison/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 SECTION = "devel"
-DEPENDS = "bison-native"
+DEPENDS = "bison-native flex-native"
 
-PR = "r0"
+PR = "r1"
 
 BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
          file://bison-2.3_m4.patch"
diff --git a/meta/recipes-devtools/bison/bison_2.5.bb b/meta/recipes-devtools/bison/bison_2.5.bb
index 63f4e76..eb5d87c 100644
--- a/meta/recipes-devtools/bison/bison_2.5.bb
+++ b/meta/recipes-devtools/bison/bison_2.5.bb
@@ -7,9 +7,9 @@ HOMEPAGE = "http://www.gnu.org/software/bison/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
-DEPENDS = "bison-native"
+DEPENDS = "bison-native flex-native"
 
-PR = "r0"
+PR = "r1"
 
 BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
 	   file://m4.patch \
-- 
1.7.0.4



