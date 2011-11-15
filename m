Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cwabbott0@gmail.com>) id 1RQAYJ-00057z-L7
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 05:23:19 +0100
Received: by vcbfl11 with SMTP id fl11so3877274vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 20:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mo7l/TfEFgO0TrG/JtkZCoheVbrtNOxAYYtPB/E6lP8=;
	b=m6y2tz4XdHNx6gv9GwcEX3LEEe/IUWTCoUT3NfQsFBfRtsIHV8LTl30LZBSiV/sWPX
	oVnqJ6pMiGpLGmW20xgfHW2+aY+D7i3CvdHmrErAqTBGJfJeKLhQd193zunsl3y0YjJw
	3hGBj5wKUBk4tfoKH7WDcLuSj23KernmPu9xA=
Received: by 10.52.30.42 with SMTP id p10mr40213139vdh.127.1321330617114;
	Mon, 14 Nov 2011 20:16:57 -0800 (PST)
Received: from localhost.localdomain (ool-4573101f.dyn.optonline.net.
	[69.115.16.31])
	by mx.google.com with ESMTPS id ib2sm35083253vdb.1.2011.11.14.20.16.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 20:16:56 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2011 23:16:37 -0500
Message-Id: <1321330597-12119-1-git-send-email-cwabbott0@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] mime.bbclass: fix typo
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
X-List-Received-Date: Tue, 15 Nov 2011 04:23:19 -0000

Before this patch, nautilus would fail with:
ERROR: Error executing a python function in /home/connor/angstrom/sources/meta-openembedded/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb:
NameError: global name 'dgetVar' is not defined
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 meta/classes/mime.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index 4a2ce8b..c349cdb 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -52,7 +52,7 @@ python populate_packages_append () {
 			postrm += d.getVar('mime_postrm', True)
 			d.setVar('pkg_postrm_%s' % pkg, postrm)
 			bb.note("adding shared-mime-info-data dependency to %s" % pkg)
-			rdepends = explode_deps(dgetVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False)) or ""
+			rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False)) or ""
 			rdepends.append("shared-mime-info-data")
 			d.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends))
 }
-- 
1.7.5.4



