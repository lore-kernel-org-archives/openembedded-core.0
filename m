Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qbz2A-00083N-Kd
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 19:58:42 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Wed, 29 Jun 2011
	19:55:00 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jun 2011 19:54:52 +0200
Message-ID: <73e1921e7e98a8c0e86c8ac531f02fb983c22b17.1309370038.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309370038.git.anders@chargestorm.se>
References: <cover.1309370038.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [RFC v3 PATCH 6/9] modutils-initscripts: move recipe prior to modutils removal
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
X-List-Received-Date: Wed, 29 Jun 2011 17:58:42 -0000
Content-Type: text/plain

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 .../{modutils => module-init-tools}/files/PD.patch |    0
 .../files/modutils.sh                              |    0
 .../modutils-initscripts.bb                        |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-kernel/{modutils => module-init-tools}/files/PD.patch (100%)
 rename meta/recipes-kernel/{modutils => module-init-tools}/files/modutils.sh (100%)
 rename meta/recipes-kernel/{modutils => module-init-tools}/modutils-initscripts.bb (100%)

diff --git a/meta/recipes-kernel/modutils/files/PD.patch b/meta/recipes-kernel/module-init-tools/files/PD.patch
similarity index 100%
rename from meta/recipes-kernel/modutils/files/PD.patch
rename to meta/recipes-kernel/module-init-tools/files/PD.patch
diff --git a/meta/recipes-kernel/modutils/files/modutils.sh b/meta/recipes-kernel/module-init-tools/files/modutils.sh
similarity index 100%
rename from meta/recipes-kernel/modutils/files/modutils.sh
rename to meta/recipes-kernel/module-init-tools/files/modutils.sh
diff --git a/meta/recipes-kernel/modutils/modutils-initscripts.bb b/meta/recipes-kernel/module-init-tools/modutils-initscripts.bb
similarity index 100%
rename from meta/recipes-kernel/modutils/modutils-initscripts.bb
rename to meta/recipes-kernel/module-init-tools/modutils-initscripts.bb
-- 
1.7.4.1



