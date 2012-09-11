Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBN-0001jA-0q
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:37 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:07 -0700
Received: by weyr6 with SMTP id r6so507606wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=zDx0mGGATWometpwVcTfLgvDwv9UkibeDMXYOtL3aNY=;
	b=a2yBV6f+p/shM6mXygIwB7WOzO3n0MtztpDKKvZbdbc3TMSToNzgTkCTpS3h4u2FzK
	RHx//rBx8mAI4fLGc5OUGcQqvcltkwrCVVsBBFmIX6uCTryWG1PEzi5c594mF4LlFpqI
	GrIE620+AF33JmaocYYRAsR+B2B5HV+KSAGPILUMjwfdMNRU7L5zqM3CmIHm5o8ottUN
	zqaTrk1/La/nnWDVlw/P7kOSAY0AmmGqGd7qLpQYleaJhn3Ei/Vp24o5OgP57HuM2EaR
	9zoJBmivYWD8izmNWRigimeiaEnQuU3w9Euk596F9cB3R1umett5JPrL+54hE+C+1kmJ
	PXPA==
Received: by 10.216.200.201 with SMTP id z51mr10930791wen.0.1347391142112;
	Tue, 11 Sep 2012 12:19:02 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:17:54 +0100
Message-Id: <1347391088-30390-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlLujzmGjvDHQhFHSk1GxZWSXAHFhndUE8FzUHffelsm6+VwEdBRXNya/KjyskMDyIQlvnc
Subject: [RFC 04/18] xorg-lib: move options to disable documentation to xorg-lib-common
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
X-List-Received-Date: Tue, 11 Sep 2012 19:31:37 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11.inc          |    4 +---
 meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb      |    4 +---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    3 ++-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 9e8c863..fb1daf2 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -9,7 +9,7 @@ require xorg-lib-common.inc
 inherit siteinfo
 
 PE = "1"
-INC_PR = "r1"
+INC_PR = "r2"
 
 PROVIDES = "virtual/libx11"
 
@@ -17,8 +17,6 @@ XORG_PN = "libX11"
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-EXTRA_OECONF += "--with-groff=no --with-ps2pdf=no --with-fop=no --disable-specs"
-
 PACKAGES =+ "${PN}-xcb"
 
 FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb b/meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb
index 575d130..c327f25 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb
@@ -14,11 +14,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=17b064789fab936a1c58c4e13d965b0f \
 DEPENDS += "libxext inputproto"
 
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 XORG_PN = "libXi"
 
-EXTRA_OECONF_append = " --enable-specs=no"
-
 SRC_URI[md5sum] = "78ee882e1ff3b192cf54070bdb19938e"
 SRC_URI[sha256sum] = "f2e3627d7292ec5eff488ab58867fba14a62f06e72a8d3337ab6222c09873109"
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 55eaf49..c911925 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -13,7 +13,8 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--enable-malloc0returnsnull --with-fop=no --without-xmlto"
+EXTRA_OECONF = "--enable-malloc0returnsnull \
+                --disable-specs --with-groff=no --with-ps2pdf=no --with-fop=no --without-xmlto"
 
 python () {
         whitelist = [ "pixman", "libpciaccess" ]
-- 
1.7.10



