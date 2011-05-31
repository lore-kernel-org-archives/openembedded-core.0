Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRNBE-0004Rc-UF for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 13:32:13 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QRN8D-0000ir-B4; Tue, 31 May 2011 13:29:05 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306405632.2525.306.camel@phil-desktop>
References: <1306342881.2525.258.camel@phil-desktop>
	<1306405632.2525.306.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 31 May 2011 12:29:04 +0100
Message-ID: <1306841344.2525.484.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] prelink: remove dependency on transfig-native
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
X-List-Received-Date: Tue, 31 May 2011 11:32:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Per http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/003179.html

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-devtools/prelink/prelink_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/prelink/prelink_git.bb
b/meta/recipes-devtools/prelink/prelink_git.bb
index 44aac2d..1eea30a 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -1,6 +1,7 @@
 SECTION = "devel"
 # Need binutils for libiberty.a
-DEPENDS = "elfutils binutils transfig-native"
+# Would need transfig-native for documentation if it wasn't disabled
+DEPENDS = "elfutils binutils"
 SUMMARY = "An ELF prelinking utility"
 DESCRIPTION = "The prelink package contains a utility which modifies
ELF shared libraries \
 and executables, so that far fewer relocations need to be resolved at \
-- 
1.7.1





