Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T3Xi3-0002BD-1q
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 21:32:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7KJKJrS009969
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 12:20:19 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Mon, 20 Aug 2012 12:20:19 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2012 14:36:46 -0500
Message-ID: <25e31faf0bfb1b281184238c2c51d184a941840c.1345491292.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1345491292.git.mark.hatle@windriver.com>
References: <cover.1345491292.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1 v2] grub-1.99: Add flex-native to DEPENDS
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
X-List-Received-Date: Mon, 20 Aug 2012 19:32:23 -0000
Content-Type: text/plain

From: Xin Ouyang <Xin.Ouyang@windriver.com>

[YOCTO #2916]

On some systems the host version of flex may be too old to work properly,
instead we depend on flex-native to ensure that we have the proper version
available to us.  (Flex version 2.5.35 or newer is requried.)

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>

Clarified commit message

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-bsp/grub/grub_1.99.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
index 9879651..64cefe0 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -11,9 +11,9 @@ SECTION = "bootloaders"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "autogen-native"
+DEPENDS = "autogen-native flex-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-install.in.patch \
-- 
1.7.3.4



