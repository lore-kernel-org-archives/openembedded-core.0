Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1GWc-0001FM-HS
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 14:19:34 +0100
Received: from mail-la0-f71.google.com ([209.85.215.71])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 05:02:19 -0800
Received: by mail-la0-f71.google.com with SMTP id fr10so2257030lab.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 05:03:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=13Mizc5U8TSHvrjIGXFkmuo7ggSXNliqCeiDCiMs26E=;
	b=bjtPEjaOpaEWaENvk7g41U4D18E6ayBnjIZVwzS65uFVmg/8y0UkMBBRiO7cDPCUC/
	C+bAwZ9OxkbEPtqUKhsEEGRrWf+li1IYyHNSQuTJ5ScngxVgB1/W8TfbrOe+MmndpR7x
	6+PjbkFmDCMCJE3jdQpQhiSTyhma3LB3KaLpzlx3vE+T8lnJTXnHeXRibHdZUdjBDeO+
	trHl4Rp25M2ejc3FO57ClFHLoEWlLDTGpMSJtNAHU4b6eYBzHREBHrR9aoila/5yhDm5
	43xf/pRlJXM8Waoklr6mQJIVyKI7n4OPr1a8iJF48AKLfOAgMpKOl216ET8vCwi0oPUy
	rDuA==
X-Received: by 10.194.122.131 with SMTP id ls3mr15637516wjb.55.1359723810134; 
	Fri, 01 Feb 2013 05:03:30 -0800 (PST)
X-Received: by 10.194.122.131 with SMTP id ls3mr15637508wjb.55.1359723810053; 
	Fri, 01 Feb 2013 05:03:30 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hu8sm3146594wib.6.2013.02.01.05.03.28
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Feb 2013 05:03:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 13:01:18 +0000
Message-Id: <f079439e1fad9c38037994755b0a43de488811df.1359723526.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359723526.git.ross.burton@intel.com>
References: <cover.1359723526.git.ross.burton@intel.com>
In-Reply-To: <cover.1359723526.git.ross.burton@intel.com>
References: <cover.1359723526.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnohDSsm0ySLGbDE5rdGa84SMWktE8U7/37c7q7+9wTnWT6fBE0t1rRtmU3aUydFh8FPTJlC1PjLkcjx3jWu7TsR973mhYTwWfX72+1fDA293NX0H2/zieV5fuzULgPTMWiB/6FhMpDoYGFD18Il8cwmyex9Yd2GYSOqDtYfTuKwGeaXnr2HPjIP80NCwmstF1TQEuB
Subject: [PATCH 2/6] metacity: remove, migrated to meta-gnome
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
X-List-Received-Date: Fri, 01 Feb 2013 13:19:36 -0000


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



