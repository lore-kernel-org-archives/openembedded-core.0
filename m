Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVW-0000tD-9u
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:18 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:57 -0700
Received: by weyt11 with SMTP id t11so1708350wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=WHcXm3xCJonlJdvfezTT89tvTZdW7W+wIA0yEJlSxn4=;
	b=NuwHEmvMTR0GYeWeo4mGeseRSUYGb1pvjhtvE/sGTFHH02WY8lGFYLXP0MtC7vT5Vd
	VKOt+LvFJAOnjXSXouiCkbEMJ1GeODHm376gZ9uty57/U2ioZnM/DYBydjL0VTrfX8LM
	IzCMZ+5a8luG1Fpb0dSuUrI+bPZXpgXDk3wOZe63BJyJ1OTndXFMJ70n6gTHi/9JX3lS
	UKpjMeKDCwkeK9vHWxwNM1ZgNZAu+OenUz6ifmWTyqpBHhjylRjcaHxQvvHxkEBPoH2s
	llhVXVd5hpJuKfkTQjDrHGWsiWUk7tv4GkfnirDy11Mw6pPCn0yW/CHoS3jT4TKJp2GV
	Dz6w==
Received: by 10.216.61.83 with SMTP id v61mr1701695wec.31.1342714315979;
	Thu, 19 Jul 2012 09:11:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:11:04 +0100
Message-Id: <b07c67061baa4afa2c94ceab4be65a290d90c973.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkQJBPOKy/tdEbSE7+SBADP+hxxs+wMjhm9Rxtlpqqy4quDKTJ5cfsfXcA6Aoeaarg3Ya/d
Subject: [PATCH 17/26] libglade: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:19 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/libglade/libglade_2.6.4.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/libglade/libglade_2.6.4.bb b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
index 747b4ed..0b01dc1 100644
--- a/meta/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://glade/glade-gtk.c;endline=22;md5=766f993433e2642fec87936d319990ff"
 
 SECTION = "libs"
-PR = "r3"
-DEPENDS = "zlib gdk-pixbuf gtk+ gtk-doc-native"
+PR = "r4"
+DEPENDS = "zlib gdk-pixbuf gtk+"
 
-inherit autotools pkgconfig gnome
+inherit autotools pkgconfig gnome gtk-doc
 
 SRC_URI += "file://glade-cruft.patch file://no-xml2.patch file://python_environment.patch"
 
-- 
1.7.10



