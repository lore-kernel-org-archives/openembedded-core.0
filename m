Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S69fS-0005J7-0Z
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Mar 2012 00:56:14 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Mar 2012 00:47:32 +0100
Message-Id: <1331336852-3219-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1331336852-3219-1-git-send-email-obi@opendreambox.org>
References: <1331336852-3219-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/2] python-2.7.2: depend on bzip2
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
X-List-Received-Date: Fri, 09 Mar 2012 23:56:14 -0000

* Python auto-detects libbz2 and there's no way to
  force-disable it, so just enable it.
* Adds bz2 support to python-compression.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/python/python_2.7.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 5ad4109..46ffd23 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,7 +1,7 @@
 require python.inc
-DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
+DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.7"
+PR = "${INC_PR}.8"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
-- 
1.7.7



