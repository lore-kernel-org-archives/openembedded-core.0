Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QeLi7-00033H-3e
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 08:35:47 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Wed, 6 Jul 2011
	08:31:55 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2011 08:31:46 +0200
Message-ID: <7689f3ce7a38ebaea0517cc762ef085f42a426e7.1309933834.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309933834.git.anders@chargestorm.se>
References: <cover.1309933834.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v6 2/2] task-base: remove unconditional inclusion of kernel-module-rtc-sa1100
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
X-List-Received-Date: Wed, 06 Jul 2011 06:35:47 -0000
Content-Type: text/plain

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-core/tasks/task-base.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index 527bc6d..97a854c 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -109,7 +109,6 @@ RRECOMMENDS_task-base = "\
     kernel-module-rtc-dev \
     kernel-module-rtc-proc \
     kernel-module-rtc-sysfs \
-    kernel-module-rtc-sa1100 \
     kernel-module-unix"
 
 RDEPENDS_task-base-extended = "\
-- 
1.7.4.1



