Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SwZqI-0000Sm-34
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:24:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q71ECQqw008516
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 07:12:26 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 07:12:25 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 10:12:07 -0400
Message-ID: <1343830340-25351-7-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/19] mingetty: use new update-alternatives
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
X-List-Received-Date: Wed, 01 Aug 2012 14:24:07 -0000
Content-Type: text/plain


Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 meta/recipes-extended/mingetty/mingetty_1.08.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index fed5dfd..a0883a1 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -2,7 +2,7 @@
 DESCRIPTION = " A compact getty program for virtual consoles only"
 SECTION = "console/utils"
 HOMEPAGE = "http://sourceforge.net/projects/mingetty/"
 LICENSE = "GPLv2"
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
 SRC_URI = "http://cdnetworks-kr-1.dl.sourceforge.net/project/mingetty/mingetty/${PV}/mingetty-${PV}.tar.gz"
@@ -20,7 +20,7 @@ 
 do_install(){
 
 inherit update-alternatives
 
-ALTERNATIVE_NAME = "getty"
-ALTERNATIVE_LINK = "${base_sbindir}/getty"
-ALTERNATIVE_PATH = "${base_sbindir}/mingetty"
+ALTERNATIVE_${PN} = "getty"
+ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
+ALTERNATIVE_TARGET[getty] = "${base_sbindir}/mingetty"
 ALTERNATIVE_PRIORITY = "50"
-- 
1.7.0.4



