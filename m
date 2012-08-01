Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SwZqO-0000VH-Ot
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:24:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q71ECYXD008537
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 07:12:34 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 07:12:33 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 10:12:20 -0400
Message-ID: <1343830340-25351-20-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 19/19] rxvt-unicode: use new update-alternatives
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
X-List-Received-Date: Wed, 01 Aug 2012 14:24:14 -0000
Content-Type: text/plain


Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
index 2415ba5..ad63dd6 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
@@ -10,7 +10,7 @@
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
@@ -23,8 +23,9 @@
 SRC_URI[sha256sum] = "ec1aa2932da844979ed8140bd92223defb12042aa5e877e05ac31139ca
 inherit autotools update-alternatives
 
 PROVIDES = "virtual/x-terminal-emulator"
-ALTERNATIVE_NAME = "x-terminal-emulator"
-ALTERNATIVE_PATH = "${bindir}/rxvt"
+
+ALTERNATIVE_${PN} = "x-terminal-emulator"
+ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/rxvt"
 
 CFLAGS_append = " -fpermissive"
 
-- 
1.7.0.4



