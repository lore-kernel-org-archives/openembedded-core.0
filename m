Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwYHB-0004Za-9t
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:43:46 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 05:32:07 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so4631233wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=Jg2yoZmmQMAI91OPfSbcZJKd3Lt9y+6ec1/CCYkRqqY=;
	b=aSySkKTIBPDFW0NOMstqkpspQW0+mleZBkZtBfi5SiavGAlYcw6i+sPiSpVpYAGmfe
	w/OTyGOI3ImLrW2dY2Mf4fE1SUmXTYqxGDFJe30ZMIZVfxoFalNBcSq1fmr/wCLc8vy7
	4aQzw7OMXkcu0Ifds1AosgqW22YzcXYojrP0Ls/nwLneMPAIcma0DL8rsHDqrzTIk4Ks
	934v0dmFNwio6BbFxfhOxaLsX/sefdTmpHwpR78ki3JyvMAWV5wpT8qHU780wNdm62dx
	ruCasMDwoXjyTOEZTjUh+PXJuJkpquMlfA+OKkxQl53i2DtDEPjPhOimnwq65tJmjNzk
	jVGQ==
Received: by 10.216.3.85 with SMTP id 63mr8049409weg.134.1343824327064;
	Wed, 01 Aug 2012 05:32:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm8444981wid.1.2012.08.01.05.32.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:32:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 13:31:18 +0100
Message-Id: <9a9c6f98362245a91a2e58daef6c4ff1bb415881.1343823907.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkJS4qToPtiwhQmUuE53SPj+ooxAQnRCZqskHT1Jhs0WkwcELqr1SDGnS4/OLpaHd+i70I6
Subject: [PATCH 12/12] mesa-demos: fix GLES2 build
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
X-List-Received-Date: Wed, 01 Aug 2012 12:43:47 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb b/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
index bfc62c5..0685711 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
@@ -11,10 +11,11 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=9142
 
 DEPENDS = "virtual/libx11 virtual/libgl glew"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
-	file://dso_linking_change_build_fix.patch"
+	file://dso_linking_change_build_fix.patch \
+        file://gles2-info.patch"
 
 inherit autotools pkgconfig
 
-- 
1.7.10



