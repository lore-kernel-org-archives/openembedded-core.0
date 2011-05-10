Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso@secretlab.ca>) id 1QJrWl-0008HB-TC
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 20:19:24 +0200
Received: by iye7 with SMTP id 7so6028296iye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 11:16:36 -0700 (PDT)
Received: by 10.42.217.66 with SMTP id hl2mr7969591icb.474.1305051396050;
	Tue, 10 May 2011 11:16:36 -0700 (PDT)
Received: from localhost.localdomain
	(adsl-99-61-231-223.dsl.emhril.sbcglobal.net [99.61.231.223])
	by mx.google.com with ESMTPS id ui7sm2921811icb.14.2011.05.10.11.16.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 11:16:35 -0700 (PDT)
From: Adrian Alonso <aalonso@secretlab.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2011 13:16:12 -0500
Message-Id: <1305051372-9137-1-git-send-email-aalonso@secretlab.ca>
X-Mailer: git-send-email 1.7.4.4
Cc: Adrian Alonso <aalonso@secretlab.ca>
Subject: [PATCH][v2] readline: update version
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
X-List-Received-Date: Tue, 10 May 2011 18:19:24 -0000

* v2 redo commit to include remove previous version
* Readline new recipe version 6.2
* Readline remove version 6.1

Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
---
 meta/recipes-core/readline/readline_6.1.bb |    6 ------
 meta/recipes-core/readline/readline_6.2.bb |    6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-core/readline/readline_6.1.bb
 create mode 100644 meta/recipes-core/readline/readline_6.2.bb

diff --git a/meta/recipes-core/readline/readline_6.1.bb b/meta/recipes-core/readline/readline_6.1.bb
deleted file mode 100644
index b6773b2..0000000
--- a/meta/recipes-core/readline/readline_6.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require readline.inc
-
-PR = "r0"
-
-SRC_URI[md5sum] = "fc2f7e714fe792db1ce6ddc4c9fb4ef3"
-SRC_URI[sha256sum] = "f0caf608c06ccd6d56b3bee1843458d509c53f9b53dffffe07cc11d8f03fa969"
diff --git a/meta/recipes-core/readline/readline_6.2.bb b/meta/recipes-core/readline/readline_6.2.bb
new file mode 100644
index 0000000..5e32bb5
--- /dev/null
+++ b/meta/recipes-core/readline/readline_6.2.bb
@@ -0,0 +1,6 @@
+require readline.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "67948acb2ca081f23359d0256e9a271c"
+SRC_URI[sha256sum] = "79a696070a058c233c72dd6ac697021cc64abd5ed51e59db867d66d196a89381"
-- 
1.7.4.4



