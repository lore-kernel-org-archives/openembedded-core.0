Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 53ADF6AC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 14:58:20 +0000 (UTC)
Received: by pacan13 with SMTP id an13so25645951pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=BHYEOADofPDSA9sJJESw2/t+bNPegGCIoxdSiSqyu7A=;
	b=dsJ0X9jh0q91IZvnT2upM1RMydjayxBPRyantwUDX242Ye2JyOYX6pHoOR17J9QZxt
	pFdhpWoPvu0VZBdE+Id2svCCYGIJZH/G0BOIujPbPRGNVslRM31H+9zImcmWCrQtcg+n
	vODcwMDtg43jwGyzT/VDGWX2JlWV8+ISiKHXRukY3HUHa1Xta5cBrnmbmemDsxxWAgho
	muYxS2G6DJ7PQ7sKCAGkRZhLdoP4v7s3LGYXhOxa5OAVt9FJ2GIZrUWb7mlxxga2zIz/
	Nm8rS2EqwFBQHChBzuzMQAdS/Ojisn3Wip/4VuMd4joDb9xHJd/whWVGppdCsx1oEh+a
	m0Mg==
X-Received: by 10.66.141.109 with SMTP id rn13mr8788315pab.127.1436972300523; 
	Wed, 15 Jul 2015 07:58:20 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	pd10sm4960064pdb.66.2015.07.15.07.58.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jul 2015 07:58:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 07:58:15 -0700
Message-Id: <1436972295-5399-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH] gtk+: fix compile error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jul 2015 14:58:21 -0000

add introspection configure flag.

make[4]: *** No rule to make target `Gdk-2.0.typelib', needed by `all-am'.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 1c0558c..760c6f8 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -21,6 +21,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}
 PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
 # without --with-gdktarget=directfb it will check for cairo-xlib which isn't available without X11 DISTRO_FEATURE
 PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
+PACKAGECONFIG[introspection] = "--enable-introspection=yes, --enable-introspection=no, libgirepository"
 
 inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-cache
 
-- 
2.3.5


