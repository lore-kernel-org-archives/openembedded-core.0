Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TC6Ug-00010b-J1
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 12:17:58 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 13 Sep 2012 03:05:22 -0700
Received: by weyr6 with SMTP id r6so1582129wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 03:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=r8PSP3rpn9CY1IfX+G1XPg+BeHM2NKo35mKcDY9//WQ=;
	b=U3ypV8R9zmR9U/FxE7W00gkYKr0qISBvHj1yegHt0zCmksFoojwi8dlEgeF9n8tzR7
	LZ0eenfoXpdBW1C38u7FtnPDrVv1cUJKMMZzDJMRaeWlGIMvevr3XIsRXh4RRCg+P8dm
	6DIkZFohMGHN4JAbZu3IyWZ8GGp0ioWcPUZ3g+/Ja2Zory++p7ug5ipH15Wf33RrrzNC
	yjchxcF+SNejHxcgFuLZF95GmxFmYXy6FduBW7cifwEfMpIytBjqx0T4deyt9w4g9u9R
	p5Ys5lc8jHSRyDWD04LGVxi7yuCA0Tuhz88rlASszxEtdwFWwuov+rN8jAPBNuHldbJy
	OiiQ==
Received: by 10.180.105.6 with SMTP id gi6mr3767763wib.4.1347530721104;
	Thu, 13 Sep 2012 03:05:21 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k2sm19344600wiz.7.2012.09.13.03.05.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Sep 2012 03:05:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 11:04:29 +0100
Message-Id: <1347530671-16622-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQltx1Edhz/SwkpUJCioIisegrcTAuXJanBs6fW4A3vOpGF3ILpxnnnkaLF7EU5Ni+uU5xfU
Subject: [PATCH 1/3] librsvg: --disable-gnome-vfs doesn't exist anymore, remove
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
X-List-Received-Date: Thu, 13 Sep 2012 10:17:58 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 6eba686..364f6f2 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -11,11 +11,11 @@ DEPENDS = "gtk+ libcroco cairo libxml2 popt"
 DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
 BBCLASSEXTEND = "native"
 
-PR = "r7"
+PR = "r8"
 
 inherit autotools pkgconfig gnome gtk-doc
 
-EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz --without-croco --disable-gnome-vfs"
+EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz --without-croco"
 
 SRC_URI += "file://doc_Makefile.patch"
 
-- 
1.7.10



