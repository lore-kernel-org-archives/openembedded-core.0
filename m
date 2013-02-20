Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1U87pe-0000YJ-B5
	for Openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 12:27:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1KBBFcj004783
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 03:11:15 -0800 (PST)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 20 Feb 2013 03:11:14 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 05:11:12 -0600
Message-ID: <1361358672-65311-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] genext2fs.inc: Add nativesdk build capability
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
X-List-Received-Date: Wed, 20 Feb 2013 11:27:35 -0000
Content-Type: text/plain

In order to generate new disk images for ext(2,3,4) which contain root
file systems we do not want to rely on the host's genext2fs which may
have different arguments and features, so allow the nativesdk
genext2fs binary to be built.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-devtools/genext2fs/genext2fs.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/genext2fs/genext2fs.inc b/meta/recipes-devtools/genext2fs/genext2fs.inc
index 8bf2fce..0e39068 100644
--- a/meta/recipes-devtools/genext2fs/genext2fs.inc
+++ b/meta/recipes-devtools/genext2fs/genext2fs.inc
@@ -13,4 +13,4 @@ S = "${WORKDIR}/genext2fs-${PV}"
 
 inherit autotools
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.1



