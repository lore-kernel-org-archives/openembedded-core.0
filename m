Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rn6GG-0005B3-46
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 11:27:28 +0100
Received: by wibhi8 with SMTP id hi8so226656wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 02:19:51 -0800 (PST)
Received: by 10.180.105.129 with SMTP id gm1mr24991310wib.1.1326795591321;
	Tue, 17 Jan 2012 02:19:51 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ek1sm15884960wib.10.2012.01.17.02.19.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 02:19:50 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 11:19:43 +0100
Message-Id: <1326795583-22661-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1326795583-22661-1-git-send-email-koen@dominion.thruhere.net>
References: <1326795583-22661-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] pango: create /etc/pango in module postinsts if it's missing
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
X-List-Received-Date: Tue, 17 Jan 2012 10:27:28 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/pango/pango.inc       |    3 +++
 meta/recipes-graphics/pango/pango_1.28.4.bb |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index bf528f4..ce8b6ba 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -44,6 +44,9 @@ if [ "x$D" != "x" ]; then
   exit 1
 fi
 
+if ! [ -e $D${sysconfdir}/pango ] ; then
+	mkdir -p $D${sysconfdir}/pango
+fi
 }
 
 python populate_packages_prepend () {
diff --git a/meta/recipes-graphics/pango/pango_1.28.4.bb b/meta/recipes-graphics/pango/pango_1.28.4.bb
index 5778c3f..9681f9e 100644
--- a/meta/recipes-graphics/pango/pango_1.28.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.28.4.bb
@@ -2,7 +2,7 @@ require pango.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI += "file://no-tests.patch"
 SRC_URI += "file://noconst.patch"
-- 
1.7.2.5



