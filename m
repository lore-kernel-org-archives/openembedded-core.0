Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U09Lc-0006R6-M2
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 12:27:36 +0100
Received: from mail-we0-f198.google.com ([74.125.82.198])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 29 Jan 2013 03:11:40 -0800
Received: by mail-we0-f198.google.com with SMTP id k14so389861wer.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 03:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=13Mizc5U8TSHvrjIGXFkmuo7ggSXNliqCeiDCiMs26E=;
	b=CIGF1XzgBSA1Eo59KkYUVPrmmEzEp09N6GZ609tdUa3/S2ztpN1lIECTKbDPchXFUA
	el+3l6m5pm6Xw3PjXJUCraWLnfrDsH/F8aMAHQLgpiSlthRmj1e+uNJl6MjYqXtyYJlS
	f9kjaElHTeoCOj9sn5vi2cyLMuNuuimL8AuLuCs5qntslOI5c6q62BZClMMssGNH8uVC
	qwnGE+ZExNs+1ajX5MoQRhUv9E75nVQJ/2BZqJEO9PlsfSyz3mrDu4Dw70yCskMrWEYu
	0PWW+tFt9lZ9Aczx5K9c6x+TUDBa9ZDtJ4E3rzvoOkX/qS3Nbf1Xp+zyv5JzIEerKegX
	uQ6Q==
X-Received: by 10.194.216.66 with SMTP id oo2mr1215411wjc.4.1359457898305;
	Tue, 29 Jan 2013 03:11:38 -0800 (PST)
X-Received: by 10.194.216.66 with SMTP id oo2mr1215376wjc.4.1359457897990;
	Tue, 29 Jan 2013 03:11:37 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fa15sm2576633wid.7.2013.01.29.03.11.36
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 03:11:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 11:09:31 +0000
Message-Id: <1f1304ac51438de46cd47c0fdeb9f7471c77f016.1359457685.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359457685.git.ross.burton@intel.com>
References: <cover.1359457685.git.ross.burton@intel.com>
In-Reply-To: <cover.1359457685.git.ross.burton@intel.com>
References: <cover.1359457685.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQky+C1XlsxsPQJE3OZ85LGRh1jV0DTd/b5hcU2dXyhqQt2Zp1VUsD+9iN2WFH0IhZOtdmXw2vURu2NLnfy+EVXtKC6N7ag9GHNUaupo1o/wcxgoOVnjq8HQExlu7th4s9lrcx7jLi4ceNcqMmFpdIBZhcZ/eUIPeSaf6cPMmiEwO3mJBdjncSMphkXsOBNKXMMa3PvX
Subject: [PATCH 2/2] metacity: remove, migrated to meta-gnome
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 11:27:43 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../metacity/remove-yelp-help-rules-var.patch      |   28 ------------------
 meta/recipes-gnome/gnome/metacity_2.34.13.bb       |   30 --------------------
 2 files changed, 58 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch
 delete mode 100644 meta/recipes-gnome/gnome/metacity_2.34.13.bb

diff --git a/meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch b/meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch
deleted file mode 100644
index 1970e9a..0000000
--- a/meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Remove unused variable (YELP_HELP_RULES)
-
-Upstream-Status: Pending
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Index: metacity-2.34.13/doc/creating_themes/Makefile.am
-===================================================================
---- metacity-2.34.13.orig/doc/creating_themes/Makefile.am
-+++ metacity-2.34.13/doc/creating_themes/Makefile.am
-@@ -1,6 +1,5 @@
- ### This part of Makefile.am can be customized by you.
- 
--@YELP_HELP_RULES@
- 
- # The name of the directory in /usr/share/gnome/help/, 
- # and the name of the main .xml file:
-Index: metacity-2.34.13/doc/creating_themes/Makefile.in
-===================================================================
---- metacity-2.34.13.orig/doc/creating_themes/Makefile.in
-+++ metacity-2.34.13/doc/creating_themes/Makefile.in
-@@ -455,7 +455,6 @@ uninstall-am:
- 	mostlyclean-libtool pdf pdf-am ps ps-am uninstall uninstall-am
- 
- 
--@YELP_HELP_RULES@
- 
- # Tell versions [3.59,3.63) of GNU make to not export all variables.
- # Otherwise a system limit (for SysV at least) may be exceeded.
diff --git a/meta/recipes-gnome/gnome/metacity_2.34.13.bb b/meta/recipes-gnome/gnome/metacity_2.34.13.bb
deleted file mode 100644
index 3605201..0000000
--- a/meta/recipes-gnome/gnome/metacity_2.34.13.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SECTION = "x11/wm"
-DESCRIPTION = "Metacity is the boring window manager for the adult in you."
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/include/main.h;endline=24;md5=c2242df552c880280315989bab626b90"
-
-DEPENDS = "gsettings-desktop-schemas startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils"
-PR = "r0"
-
-inherit gnome update-alternatives
-
-GNOME_COMPRESS_TYPE = "xz"
-
-SRC_URI += "file://remove-yelp-help-rules-var.patch"
-SRC_URI[archive.md5sum] = "6d89b71672d4fa49fc87f83d610d0ef6"
-SRC_URI[archive.sha256sum] = "8cf4dbf0da0a6f36357ce7db7f829ec685908a7792453c662fb8184572b91075"
-
-ALTERNATIVE_${PN} = "x-window-manager"
-ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/metacity"
-ALTERNATIVE_PRIORITY = "10"
-
-EXTRA_OECONF += "--disable-verbose \
-	         --disable-xinerama"
-
-do_configure_prepend() {
-	sed -i -e 's:$ZENITY:$NOZENITY:g' -e 's:-Werror::g' ${S}/configure.in
-}
-
-FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
-
-- 
1.7.10.4



