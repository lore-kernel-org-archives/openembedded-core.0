Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1SB6X9-0006Sm-3g
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 16:36:07 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id 2BD12F8126C; Fri, 23 Mar 2012 09:27:12 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 09:27:07 -0600
Message-Id: <1332516428-9675-2-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1332516428-9675-1-git-send-email-gary@mlbassoc.com>
References: <1332516428-9675-1-git-send-email-gary@mlbassoc.com>
Subject: [PATCH 1/2] python: remove a target dependency
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
X-List-Received-Date: Fri, 23 Mar 2012 15:36:07 -0000

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



