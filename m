Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1R5vqI-0007y0-Pj
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 10:38:15 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Tue, 20 Sep 2011
	10:32:55 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2011 10:33:08 +0200
Message-ID: <a5e40a4e60097d946bee0781cc593d93f5f8f852.1316507540.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.6.3
In-Reply-To: <cover.1316507540.git.anders@chargestorm.se>
References: <cover.1316507540.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH 3/3] zypper: git repo moved to github
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
X-List-Received-Date: Tue, 20 Sep 2011 08:38:15 -0000
Content-Type: text/plain

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-extended/zypper/zypper_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/zypper/zypper_git.bb b/meta/recipes-extended/zypper/zypper_git.bb
index 299fcb5..7f7ceb3 100644
--- a/meta/recipes-extended/zypper/zypper_git.bb
+++ b/meta/recipes-extended/zypper/zypper_git.bb
@@ -11,7 +11,7 @@ SRCREV = "2c5bb6ceb99ecd950ef993e43d77bf0569ea0582"
 
 inherit cmake
 
-SRC_URI = "git://gitorious.org/opensuse/zypper.git;protocol=git \
+SRC_URI = "git://github.com/openSUSE/zypper.git;protocol=git \
            file://cmake.patch \
            file://dso_linking_change_build_fix.patch \
            file://rpm5-flag.patch \
-- 
1.7.6.3



