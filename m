Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBc-0001nO-NW
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:52 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:19 -0700
Received: by wibhn17 with SMTP id hn17so923629wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=S0i8P+B9mF1W8nYGIzfBRQNfKQm2u1Xpx0FRij6rcIY=;
	b=EErJVI/0WEo9rtFtfxmR0fYOTkTHAVsUYAw0XGIRZ6ElR9LRVTlGZjpfWMPZ0yLy6S
	uP7S4S7UCbmJOCMKSWfilfmtaQXujsCJUd8nOwc2ipEUclWVyQRRLmhu/GuKuu0jndPC
	+8GVw7Bg6Yor+Dbg4HOjFTwxT6oBHck3XyztkAfZZfReb34tQDen6zNvR19Fvan4zRU7
	5fQNoOY1UTIxor22tsQb8emwW+34ObZgWXsdFH0RVaMzxId6Fej8MmOIrAlwfcaXsA7V
	cWOBRct6kYJ0rp9zXF7vTe3YHZ6ODRjHe9IZvzrvXVjfOEebGWeXuGl2+rVI7FtmrMtB
	+wow==
Received: by 10.180.20.11 with SMTP id j11mr27166411wie.12.1347391158215;
	Tue, 11 Sep 2012 12:19:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:18:04 +0100
Message-Id: <1347391088-30390-14-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmhFyY7Pfam+lLc1FMkcjOZbSxgvTQ6vAe0V5sEL9tmE//2MbzwKRLEvMrZ2b/u5+q4xLCl
Subject: [RFC 14/18] distro-tracking: remove libx11-trim
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
X-List-Received-Date: Tue, 11 Sep 2012 19:31:52 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-yocto/conf/distro/include/distro_alias.inc |    1 -
 meta-yocto/conf/distro/include/maintainers.inc  |    1 -
 meta-yocto/conf/distro/include/recipe_color.inc |    1 -
 3 files changed, 3 deletions(-)

diff --git a/meta-yocto/conf/distro/include/distro_alias.inc b/meta-yocto/conf/distro/include/distro_alias.inc
index c63bd47..509dcde 100644
--- a/meta-yocto/conf/distro/include/distro_alias.inc
+++ b/meta-yocto/conf/distro/include/distro_alias.inc
@@ -183,7 +183,6 @@ DISTRO_PN_ALIAS_pn-liburcu = "Fedora=userspace-rcu Ubuntu=liburcu0"
 DISTRO_PN_ALIAS_pn-libusb-compat = "OSPDT"
 DISTRO_PN_ALIAS_pn-libx11 = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
 DISTRO_PN_ALIAS_pn-libx11-diet = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
-DISTRO_PN_ALIAS_pn-libx11-trim = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
 DISTRO_PN_ALIAS_pn-libxcalibrate = "OSPDT upstream=http://cgit.freedesktop.org/xorg/lib/libXCalibrate/"
 DISTRO_PN_ALIAS_pn-libxfontcache = "Mandriva=libxfontcache Debian=libxfontcache"
 DISTRO_PN_ALIAS_pn-libxft = "Mandriva=libxft Debian=libxft2 Ubuntu=libxft2"
diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
index dace3b9..fe8284e 100644
--- a/meta-yocto/conf/distro/include/maintainers.inc
+++ b/meta-yocto/conf/distro/include/maintainers.inc
@@ -358,7 +358,6 @@ RECIPE_MAINTAINER_pn-libuser = "Valentin Popa <valentin.popa@intel.com>"
 RECIPE_MAINTAINER_pn-libvorbis = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-libx11 = "Valentin Popa <valentin.popa@intel.com>"
 RECIPE_MAINTAINER_pn-libx11-diet = "Kai Kang <kai.kang@windriver.com>"
-RECIPE_MAINTAINER_pn-libx11-trim = "Valentin Popa <valentin.popa@intel.com>"
 RECIPE_MAINTAINER_pn-libxau = "Valentin Popa <valentin.popa@intel.com>"
 RECIPE_MAINTAINER_pn-libxaw = "Valentin Popa <valentin.popa@intel.com>"
 RECIPE_MAINTAINER_pn-libxcalibrate = "Valentin Popa <valentin.popa@intel.com>"
diff --git a/meta-yocto/conf/distro/include/recipe_color.inc b/meta-yocto/conf/distro/include/recipe_color.inc
index 612a698..894c76a 100644
--- a/meta-yocto/conf/distro/include/recipe_color.inc
+++ b/meta-yocto/conf/distro/include/recipe_color.inc
@@ -210,7 +210,6 @@ RECIPE_COLOR_pn-liburcu = "yellow"
 RECIPE_COLOR_pn-libusb1 = "yellow"
 RECIPE_COLOR_pn-libuser = "yellow"
 RECIPE_COLOR_pn-libx11 = "yellow"
-RECIPE_COLOR_pn-libx11-trim = "yellow"
 RECIPE_COLOR_pn-libxau = "yellow"
 RECIPE_COLOR_pn-libxaw = "red"
 RECIPE_COLOR_pn-libxcalibrate = "yellow"
-- 
1.7.10



