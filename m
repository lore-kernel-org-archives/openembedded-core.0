Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1R5vqG-0007xz-A1
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 10:38:12 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Tue, 20 Sep 2011
	10:32:54 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2011 10:33:07 +0200
Message-ID: <7a7b90e15b10f98602c985b9eface8c344057e08.1316507540.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.6.3
In-Reply-To: <cover.1316507540.git.anders@chargestorm.se>
References: <cover.1316507540.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH 2/3] sat-solver: git repo moved to github
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
X-List-Received-Date: Tue, 20 Sep 2011 08:38:12 -0000
Content-Type: text/plain

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index 9b212db..0d9a439 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -12,7 +12,7 @@ PR = "r11"
 
 PARALLEL_MAKE=""
 
-SRC_URI = "git://gitorious.org/opensuse/sat-solver.git;protocol=git \
+SRC_URI = "git://github.com/openSUSE/sat-solver.git;protocol=git \
            file://sat-solver_rpm5.patch \
            file://sat-solver_obsolete.patch \
            file://cmake.patch \
-- 
1.7.6.3



