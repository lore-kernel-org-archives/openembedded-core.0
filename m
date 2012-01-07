Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RjONQ-0004sE-53
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 05:59:32 +0100
Received: by mail-iy0-f175.google.com with SMTP id h37so3665967iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 20:52:09 -0800 (PST)
Received: by 10.50.89.197 with SMTP id bq5mr10018548igb.24.1325911929494;
	Fri, 06 Jan 2012 20:52:09 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id gh7sm109453857igb.1.2012.01.06.20.52.07
	(version=SSLv3 cipher=OTHER); Fri, 06 Jan 2012 20:52:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2012 20:51:53 -0800
Message-Id: <1325911915-16001-3-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH RFC v2] gtk-icon-cache.bbclass: add -f option to gtk-update-icon-cache in postinst
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
X-List-Received-Date: Sat, 07 Jan 2012 04:59:32 -0000

The gtk-update-icon-cache utility does not create a cache file if
one does not already exist.  Since some packages (notably gnome-icon-theme)
do not ship a cache file by default, the results of the utility are
not saved.  Adding the force option writes out the cache even if there
wasn't a default cache in the package.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/gtk-icon-cache.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index eac3061..0204fd3 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -14,7 +14,7 @@ GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-lo
 
 for icondir in /usr/share/icons/* ; do
     if [ -d $icondir ] ; then
-        gtk-update-icon-cache -qt  $icondir
+        gtk-update-icon-cache -fqt  $icondir
     fi
 done
 }
-- 
1.7.1



