Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RSEjx-0000GR-SJ
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Nov 2011 22:15:53 +0100
Received: (qmail invoked by alias); 20 Nov 2011 21:09:25 -0000
Received: from p5B0A3816.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.56.22]
	by mail.gmx.net (mp056) with SMTP; 20 Nov 2011 22:09:25 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18QrBdr6I0QxAIfQVXXIOkGon5mJlUemH7QxsCZAY
	uZNLCfOQ9Yo00v
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Nov 2011 22:09:23 +0100
Message-Id: <1321823363-3863-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [PATCH] mime.bbclass: Add --disable-update-mimedb to EXTRA_OECONF
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
X-List-Received-Date: Sun, 20 Nov 2011 21:15:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* ensure update-mime-database is not called during build time
* this patch was included in meta-oe [1] about the same time when mime.bbclass
  was migrated from meta-oe -> oe-core so it seems it got lost.
* tests: build from scratch / run on overo / additional check: no unpacked
  files for gnome-control-center

[1] http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/classes?id=6b765989a42ab314d1611f4dec78b07b562a9e7d

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta/classes/mime.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index c349cdb..dcdc27a 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -1,5 +1,7 @@
 DEPENDS += "shared-mime-info-native shared-mime-info"
 
+EXTRA_OECONF += "--disable-update-mimedb"
+
 mime_postinst() {
 if [ "$1" = configure ]; then
 	UPDATEMIMEDB=`which update-mime-database`
-- 
1.7.4.4



