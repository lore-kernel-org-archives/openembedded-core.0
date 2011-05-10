Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso@secretlab.ca>) id 1QJoMN-0000Iv-HV
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:56:27 +0200
Received: by gwb11 with SMTP id 11so2362112gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 07:53:38 -0700 (PDT)
Received: by 10.91.137.11 with SMTP id p11mr6718747agn.17.1305039214729;
	Tue, 10 May 2011 07:53:34 -0700 (PDT)
Received: from localhost.localdomain
	(adsl-99-61-231-223.dsl.emhril.sbcglobal.net [99.61.231.223])
	by mx.google.com with ESMTPS id e9sm7503482ann.50.2011.05.10.07.53.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 07:53:34 -0700 (PDT)
From: Adrian Alonso <aalonso@secretlab.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2011 09:53:08 -0500
Message-Id: <1305039188-3458-1-git-send-email-aalonso@secretlab.ca>
X-Mailer: git-send-email 1.7.4.4
X-Mailman-Approved-At: Tue, 10 May 2011 16:58:59 +0200
Cc: Adrian Alonso <aalonso@secretlab.ca>
Subject: [PATCH] readline: delete recipe version 6.1
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
X-List-Received-Date: Tue, 10 May 2011 14:56:27 -0000

* Readline delete recipe version 6.1
  in favor of using readline version 6.2

Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
---
 meta/recipes-core/readline/readline_6.1.bb |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-core/readline/readline_6.1.bb

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
-- 
1.7.4.4



