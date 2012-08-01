Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SwZqO-0000V6-6T
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:24:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q71ECXmL010039
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 07:12:33 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 07:12:33 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 10:12:19 -0400
Message-ID: <1343830340-25351-19-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 18/19] powertop: use new update-alternatives
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
X-List-Received-Date: Wed, 01 Aug 2012 14:24:12 -0000
Content-Type: text/plain


Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 meta/recipes-kernel/powertop/powertop_1.13.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/powertop/powertop_1.13.bb b/meta/recipes-kernel/powertop/powertop_1.13.bb
index b4f45dd..fd04b72 100644
--- a/meta/recipes-kernel/powertop/powertop_1.13.bb
+++ b/meta/recipes-kernel/powertop/powertop_1.13.bb
@@ -11,7 +11,7 @@
 DEPENDS = "virtual/libintl ncurses"
 # powertop 1.13 needs lspci
 RDEPENDS_${PN} = "pciutils"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.lesswatts.org/projects/powertop/download/powertop-${PV}.tar.gz \
            file://stub_out_the_ncurses_calls_in_dump_mode.patch \
@@ -26,9 +26,9 @@
 EXTRA_OEMAKE = "VERSION=\"${PV}\" EXTRA_LIBS=${EXTRA_LIBS}"
 EXTRA_LIBS_libc-uclibc = "-lintl"
 
 inherit update-alternatives
-ALTERNATIVE_NAME = "powertop"
-ALTERNATIVE_PATH = "${bindir}/powertop"
-ALTERNATIVE_LINK = "${base_bindir}/powertop"
+ALTERNATIVE_${PN} = "powertop"
+ALTERNATIVE_TARGET[powertop] = "${bindir}/powertop"
+ALTERNATIVE_LINK_NAME[powertop] = "${base_bindir}/powertop"
 ALTERNATIVE_PRIORITY = "100"
 
 do_configure() {
-- 
1.7.0.4



