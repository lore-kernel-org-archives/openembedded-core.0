Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVJ-00012y-43
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:05 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:42 -0700
Received: by weyt11 with SMTP id t11so1708130wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=WfsmD57enejAst3e705F/7rkcly6hf8iDr8jYAT3C3Y=;
	b=BK8NDFEsPRo+C8X/SBhtIW5XEmzMD/MSP9quKpEECUhGUpmwxTPAWecaimQMY5tfpJ
	MbZ3IXTgc6SHGgZQHV4as2bzHCMDRKO2A8iWArF+Rm8RH2O4nvfGXTzasDfmmq4HIH60
	sR3i6J9n09GMx9i0s2aI/YMzPR17bFRn5RIeglsJ8rtKm5zuQu7QcxOtzA2yFRJkr83w
	gUlbpioZd9wE8jBsjkSJsFfq449teQySULG2ugjnb/mrskWzEvl0M7KTVA0lJrWbPupG
	ytckOUp/D6ZPeGp3ZNGz8LY3qKQLlfqJDmZu6tTZ9pN4wIEy8AE6/d2Nc5mMysm+dMmI
	ouVg==
Received: by 10.180.92.7 with SMTP id ci7mr2635330wib.1.1342714300112;
	Thu, 19 Jul 2012 09:11:40 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:10:53 +0100
Message-Id: <744e40a32471e2ec5fd5effd5a6177083e20e40c.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnnM/heJX67H4mC/Gi1RmhnLzpGWLEYQ1mIyH9nJvku+BYidD62lX8Yz4COE/yzfeRPK7Ok
Subject: [PATCH 06/26] cogl: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:07 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/clutter/cogl.inc      |    4 ++--
 meta/recipes-graphics/clutter/cogl_1.8.2.bb |    2 +-
 meta/recipes-graphics/clutter/cogl_git.bb   |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/clutter/cogl.inc b/meta/recipes-graphics/clutter/cogl.inc
index f2ad6d1..7d840be 100644
--- a/meta/recipes-graphics/clutter/cogl.inc
+++ b/meta/recipes-graphics/clutter/cogl.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "a modern 3D graphics API with associated utility APIs"
 HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
 LICENSE = "LGPLv2.1+"
 
-STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gdk-pixbuf libxi"
-BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
+STDDEPENDS = "virtual/libx11 pango glib-2.0 libxfixes gdk-pixbuf libxi"
+BASE_CONF = "${@get_clutter_fpu_setting(bb, d)}"
 
 DEPENDS = "${STDDEPENDS} virtual/libgl libxcomposite"
 EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
diff --git a/meta/recipes-graphics/clutter/cogl_1.8.2.bb b/meta/recipes-graphics/clutter/cogl_1.8.2.bb
index 25875f3..f733598 100644
--- a/meta/recipes-graphics/clutter/cogl_1.8.2.bb
+++ b/meta/recipes-graphics/clutter/cogl_1.8.2.bb
@@ -1,6 +1,6 @@
 require cogl.inc
 
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta/recipes-graphics/clutter/cogl_git.bb b/meta/recipes-graphics/clutter/cogl_git.bb
index 689b965..682f931 100644
--- a/meta/recipes-graphics/clutter/cogl_git.bb
+++ b/meta/recipes-graphics/clutter/cogl_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 # the 1.8.2 tag
 SRCREV = "e398e374e2ff0e88bc1d63577a192f8ca04a1cb5"
 PV = "1.8.2+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.10



