Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QcXrh-0005m8-2w
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 09:10:13 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Fri, 1 Jul 2011
	09:06:28 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jul 2011 09:06:18 +0200
Message-ID: <01c2872d85a1bc28887e886592e5238920ff812a.1309503939.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309503939.git.anders@chargestorm.se>
References: <cover.1309503939.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v4 5/8] modutils-initscripts: move recipe prior to modutils removal
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
X-List-Received-Date: Fri, 01 Jul 2011 07:10:13 -0000
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



