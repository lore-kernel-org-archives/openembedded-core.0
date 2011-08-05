Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QpLJ9-00073U-9l
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 16:23:27 +0200
Received: by wyf19 with SMTP id 19so283279wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2011 07:19:02 -0700 (PDT)
Received: by 10.227.32.73 with SMTP id b9mr1909553wbd.107.1312553942411;
	Fri, 05 Aug 2011 07:19:02 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fn12sm2332076wbb.38.2011.08.05.07.19.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Aug 2011 07:19:01 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 16:18:57 +0200
Message-Id: <1312553937-29414-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gtk-icon-cache: add hicolor-icon-theme to DEPENDS
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
X-List-Received-Date: Fri, 05 Aug 2011 14:23:27 -0000

This fixes do_rootfs breaking because OE didn't resolve the RDEPENDS added with python

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/gtk-icon-cache.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 4981aec..8436cd3 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,5 +1,7 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
 
+DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']}"
+
 # This could run on the host as icon cache files are architecture independent,
 # but there is no gtk-update-icon-cache built natively.
 gtk_icon_cache_postinst() {
-- 
1.6.6.1



