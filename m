Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Tg4nA-0005pY-AR
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 03:32:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB52IYpf004266
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 18:18:34 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 4 Dec 2012 18:18:32 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2012 10:19:04 +0800
Message-ID: <043d11bd8ccaa5641fc1a180840a405045778711.1354673809.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354673809.git.Qi.Chen@windriver.com>
References: <cover.1354673809.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] qt4-native & ghostscript: update upstream status for their patches
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
X-List-Received-Date: Wed, 05 Dec 2012 02:32:57 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Update the upstream status for patches of long building path.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...tscript-work-with-long-building-directory.patch |    5 ++++-
 ...e-qt4-native-work-with-long-building-path.patch |    3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch
index a4ce70a..4dbf86f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch
@@ -1,7 +1,10 @@
-Upstream-Status: Inappropriate [distribution]
+Upstream-Status: Accepted
 
 Make ghost script work with long building directory
 
+This patch has been accepted by upstream and should be removed
+at the next update of ghostscript.
+
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
 Index: base/genconf.c
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch
index 74f4e1a..e004745 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch
@@ -1,6 +1,7 @@
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Submitted
 
 Make qt4-native work with long building path.
+Reference: https://bugreports.qt-project.org/browse/QTBUG-28292
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
-- 
1.7.9.5



