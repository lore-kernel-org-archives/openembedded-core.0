Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=elite.brightsigndigital.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>) id 1UXVok-0004F5-Pr
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 14:07:29 +0200
Received: from lander.brightsign ([172.30.1.6])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1UXV0b-000478-Fd; Wed, 01 May 2013 12:15:37 +0100
Received: from mac by lander.brightsign with local (Exim 4.72)
	(envelope-from <mac@lander.brightsign>)
	id 1UXV0b-0000gY-8O; Wed, 01 May 2013 12:15:37 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2013 12:15:26 +0100
Message-Id: <1367406926-2315-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] gdb-cross: gdb-cross requires readline-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 12:07:32 -0000

gdb depends on readline so gdb-cross needs to depend on readline-native to
build successfully.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Acked-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-devtools/gdb/gdb-cross.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index a92d032..6fc98ff 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -1,6 +1,6 @@
 require gdb-common.inc
 
-DEPENDS = "expat-native ncurses-native"
+DEPENDS = "expat-native ncurses-native readline-native"
 
 EXTRA_OECONF += "--without-python"
 
-- 
1.7.10.4



