Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tl2fK-0001ic-Ip
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 20:17:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBIJ2dML008666
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Dec 2012 11:02:39 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 18 Dec 2012 11:02:38 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Dec 2012 13:19:24 -0600
Message-ID: <1355858364-26511-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH resend] gcc-cross-canadian.inc: Add dependency on cross-gcc
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
X-List-Received-Date: Tue, 18 Dec 2012 19:17:23 -0000
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

gcc-cross-canadian uses cross compiler during libgcc build
when building from sstate the build failed when building
gcc-cross-canadian since it did not populate gcc-cross
therefore add an explicit dependency on virtual/${TARGET_PREFIX}gcc
to make sure that gcc-cross is available before building
gcc-cross-canadian

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 64cf54e..f1824fa 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -4,5 +4,5 @@ DESCRIPTION = "The cross-canadian GNU cc and gcc C compilers for ${TARGET_ARCH}
 PN = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gcc"
 
-DEPENDS = "virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc nativesdk-gettext"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc nativesdk-gettext"
 
-- 
1.7.3.4



