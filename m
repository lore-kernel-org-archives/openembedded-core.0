Return-Path: <Baogen.Shang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E97E56C76F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 07:35:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0R7ZoOM010168
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 23:35:50 -0800 (PST)
Received: from pek-bshang-d1.wrs.com (128.224.162.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Sun, 26 Jan 2014 23:35:49 -0800
From: Baogen Shang <baogen.shang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jan 2014 15:35:20 +0800
Message-ID: <1390808120-15299-1-git-send-email-baogen.shang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs:fix build native package error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jan 2014 07:35:51 -0000
Content-Type: text/plain

e2fsprogs requires pkgconfig to build native package

Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index aea74f7..a34df37 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -22,5 +22,5 @@ DEPENDS = "util-linux"
 SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz \
            file://mkdir.patch"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
-- 
1.7.9.5


