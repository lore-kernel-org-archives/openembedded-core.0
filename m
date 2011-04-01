Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W2A-0005Id-Jp
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:30 +0200
Received: by pzk35 with SMTP id 35so573808pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=iQmA0+R1yMxcGbg72pgcsQ+BWK2PW0nwIP4phDrouuA=;
	b=PswkVNtsHxSOmSRaCfu0UhMXDuzfXt4qk19vPCa2Z0D+1nqQ0p6BmAG5RjD25RDsOv
	KydnO0M4FNfKnvfp0MBWOv40rcl6sSabMORAUpkiocYtUmSyG+QzBw03r1R4qbE7fCAi
	UwEqP5I+vPksHSQoMMRN1rB4ws/eTY4yCnr4Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=FebOxAjIA73lQzrQp7B4Zzr+fzf2i1agJwM49GIMzkwnqpRl082cmOrWFONJq79JlX
	8LGA7xuuuhUy4Z/RTV5o5y8xzOOl/6gAUIhZsnx3L5psNYXuZLBwO4h8O9msEK8ZHaCK
	lSyREqYLeJAhTQ2jE1HLk8ya7t7hZ8tSr1xjw=
Received: by 10.142.136.19 with SMTP id j19mr2578692wfd.167.1301632229197;
	Thu, 31 Mar 2011 21:30:29 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x11sm2395444wfd.1.2011.03.31.21.30.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:30:20 -0700
Message-Id: <6f70f4748bb55104261606d3ea3a1f0c879396b2.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 39/46] clutter.inc: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:32:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/clutter/clutter.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter.inc b/meta/recipes-graphics/clutter/clutter.inc
index bdfcb91..2f9a55c 100644
--- a/meta/recipes-graphics/clutter/clutter.inc
+++ b/meta/recipes-graphics/clutter/clutter.inc
@@ -7,7 +7,7 @@ COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qe
 STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk+ libxi"
 BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
 
-DEPENDS = "${STDDEPENDS} virtual/libgl gettext"
+DEPENDS = "${STDDEPENDS} virtual/libgl"
 EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
 
 DEPENDS_zylonite = "${STDDEPENDS} libgles-zylonite tslib"
@@ -45,7 +45,7 @@ PACKAGE_ARCH_menlow = "${MACHINE_ARCH}"
 
 FILESPATH = "${FILE_DIRNAME}/clutter"
 
-inherit autotools pkgconfig gtk-doc
+inherit autotools pkgconfig gtk-doc gettext
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
 require clutter-fpu.inc
-- 
1.7.4.1



