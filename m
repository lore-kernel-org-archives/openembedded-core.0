Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1SBAIV-0003NP-2x
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 20:37:15 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id A8262F811DF; Fri, 23 Mar 2012 13:28:19 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 13:28:15 -0600
Message-Id: <1332530896-27466-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 1/2 v2] python: remove target dependency
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
X-List-Received-Date: Fri, 23 Mar 2012 19:37:15 -0000

The target dependency DEPENDS_sharprom does not belong in this
core recipe and should be moved to a .bbappend file in the appropriate
layer if still required.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-devtools/python/python_2.7.2.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index cb0a1d5..8111b31 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,5 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
 PR = "${INC_PR}.8"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
-- 
1.7.7.6



