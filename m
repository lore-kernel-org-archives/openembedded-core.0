Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1R0OKx-0005Aw-Bi
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 03:50:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p851jxoN023781
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Sep 2011 18:45:59 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 4 Sep 2011 18:45:58 -0700
Message-ID: <81906455aaaba904179737860569fa415ed1ce52.1315186871.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1315186871.git.xiaofeng.yan@windriver.com>
References: <cover.1315186871.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 5 Sep 2011 09:33:12 +0800
Date: Mon, 5 Sep 2011 09:47:41 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qt4e-demo-image:Fix bug 999
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
X-List-Received-Date: Mon, 05 Sep 2011 01:50:59 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

"/bin/sh" is needed by qt4e-demo-image, So I add busybox for fixing this problem.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-qt/images/qt4e-demo-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
index f2150ca..6a7c086 100644
--- a/meta/recipes-qt/images/qt4e-demo-image.bb
+++ b/meta/recipes-qt/images/qt4e-demo-image.bb
@@ -11,6 +11,7 @@ RDEPENDS_${PN} += " \
 	"
 
 IMAGE_INSTALL += "\
+	busybox \
 	module-init-tools \
 	task-qt4e-base \
 "
-- 
1.7.0.4



