Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QSRrL-0005FO-46 for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 12:44:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QSRoG-0003YF-Ch; Fri, 03 Jun 2011 12:40:56 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 03 Jun 2011 11:40:55 +0100
Message-ID: <1307097655.2529.250.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] sqlite: remove dependency on tcl-native
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
X-List-Received-Date: Fri, 03 Jun 2011 10:44:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Older versions of sqlite required tclsh at compile time but this is no longer
the case with recent 3.7.x.

See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-June/003653.html

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-support/sqlite/sqlite3.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index d8ef8dc..939df14 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "An Embeddable SQL Database Engine"
 HOMEPAGE = "http://www.sqlite.org"
 SECTION = "libs"
 PRIORITY = "optional"
-DEPENDS = "readline ncurses tcl-native"
-DEPENDS_virtclass-native = "tcl-native"
+DEPENDS = "readline ncurses"
+DEPENDS_virtclass-native = ""
 LICENSE = "PD"
 
 inherit autotools pkgconfig
-- 
1.7.2.5





