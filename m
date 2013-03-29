Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ULgzA-0004X1-5w
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 22:37:20 +0100
Received: by mail-ee0-f54.google.com with SMTP id e51so376606eek.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 14:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=PIEKPQI0Eydrdf4D6B2kh0UHPEd1qasLhzi7Ip/rKpU=;
	b=e/lCm67rctiyfq6bALQZxyWccXLZW4MJKfB2/GkiN/iadLiHWCatTB1kd1qDeSvN2t
	2TALVVcEKXQYralpJ9+O7oYguZgnaoa+wbGSCtrk4j7cpibyqpQaIs/h/Q1K7+oR1va3
	/ImTyRsiTC5fe7Fvfo6gDsPheg/MHNSdVc1gmM/o/xQH9810jLU6IHfUnGRet2qeq5OE
	J5AWPjJYzGRhpuZrOJ8IEPce01KHaskdAm//QLO8iA+ITIrOHSIzK+Dvv2F6zrJO3NMF
	oQDNqHw4GLbhtst4j9WgJy8fE9EPLq3xrkESS6SFgNv/r7bQSbcyFWerrhe77C+TB/EH
	6U5g==
X-Received: by 10.14.223.69 with SMTP id u45mr11579684eep.23.1364592015971;
	Fri, 29 Mar 2013 14:20:15 -0700 (PDT)
Received: from localhost.localdomain (p4FDF04AD.dip.t-dialin.net.
	[79.223.4.173])
	by mx.google.com with ESMTPS id f47sm6366494eep.13.2013.03.29.14.20.14
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 14:20:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 22:19:58 +0100
Message-Id: <1364592001-3562-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364592001-3562-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364592001-3562-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] remove gtk-update-icon-cache-native virtuals
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
X-List-Received-Date: Fri, 29 Mar 2013 21:37:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gtk-update-icon-cache-native is the only provider now

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/gtk-icon-cache.bbclass                |    2 +-
 meta/conf/distro/include/default-providers.inc     |    1 -
 .../gtk+/gtk-update-icon-cache-native_3.4.4.bb     |    2 --
 3 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index a5d642c..6d205a1 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,6 +1,6 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
 
-DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} virtual/gtk-update-icon-cache-native"
+DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk-update-icon-cache-native"
 
 #
 # On host, the postinstall MUST return 1 because we do not know if the intercept
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index e3a44e6..4b66522 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -12,7 +12,6 @@ PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
 PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
-PREFERRED_PROVIDER_virtual/gtk-update-icon-cache-native ?= "gtk-update-icon-cache-native"
 
 #
 # Default virtual runtime providers
diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
index ea99c14..93c30a7 100644
--- a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
@@ -2,8 +2,6 @@ SUMMARY = "gtk-update-icon-cache built natively"
 DESCRIPTION = "Just gtk-update-icon-cache built from GTK+ natively, for on-host postinst script execution."
 SECTION = "libs"
 
-PROVIDES = "virtual/gtk-update-icon-cache-native"
-
 DEPENDS = "gdk-pixbuf-native"
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
-- 
1.7.4.4



