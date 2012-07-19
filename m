Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVy-0002Ge-Lb
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:46 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:58 -0700
Received: by weyt11 with SMTP id t11so1708371wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=MOCgmAFkphvGVZx4pq0D6ucZt9dT0WJ9/pC7E6Jdelk=;
	b=IkCFrbBtBfAs6cXxfGkVyl6iwIPg9i0tWVYkUw3l40QLoDWA4WIpkzXZnmfW3jsNS3
	HTm4rV+PTA9zesVcaBiogJqXKOCr5s8P7CuRNb0dc4QQvXiec9yxRPCJgX3I4B55ne4M
	Xxnjq9Kocdbp2gwHLXgxRiFRwEqUX2BB+Dky+XlLflM4K5EtQ/ejecs1xi9n8qCqPxEj
	BlKpMjE+ctKsHdjedOieu0eVLFtocuZj618Fwb0lYt6TpRuUxwEBfQ1Kqq/DME+DHME7
	y3F/l74tjsR4p5DGJi81GC/cGtHnbzP8bOOnE9jdAH4jxwnUCk6lhSG1aLuLr7Aw8GNC
	AI/Q==
Received: by 10.180.104.197 with SMTP id gg5mr6138314wib.9.1342714317303;
	Thu, 19 Jul 2012 09:11:57 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:11:05 +0100
Message-Id: <78c2ecbbd646845da8cb76c7794a752129b039ea.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmQjIgurpmr9Gx2YA0X5EuAxBrzTkmUo6gpWC6nZC7O9+5cpdCIufTR/GGTEGpld4kcfLCA
Subject: [PATCH 18/26] librsvg: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:47 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index a3e8f0f..6eba686 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -11,9 +11,9 @@ DEPENDS = "gtk+ libcroco cairo libxml2 popt"
 DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
 BBCLASSEXTEND = "native"
 
-PR = "r6"
+PR = "r7"
 
-inherit autotools pkgconfig gnome
+inherit autotools pkgconfig gnome gtk-doc
 
 EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz --without-croco --disable-gnome-vfs"
 
@@ -24,7 +24,6 @@ SRC_URI[archive.sha256sum] = "91b98051f352fab8a6257688d6b2fd665b4648ed66144861f2
 
 do_configure_prepend () {
 	export GDK_PIXBUF_QUERYLOADERS="${libdir}/gtk-2.0/version/loaders"
-	echo "CLEANFILES=" > gtk-doc.make
 }
 
 PACKAGES =+ "librsvg-gtk librsvg-gtk-dbg librsvg-gtk-dev rsvg"
-- 
1.7.10



