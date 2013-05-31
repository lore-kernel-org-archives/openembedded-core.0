Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 081986A430
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:09:15 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id m6so791703wiv.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=Vas7rW7vD2Qwp47C4bVVnYWlgACdDWfPVCkPJW0PW4g=;
	b=pSnWY/hBqigzUUof5ZCj0XhqbNlUuT8SdMWRlDdq1c/57dCEGaYRb0V0JdRGUw0SOh
	4cIUeuTkRhvQWT7WFXOPi0NVHf5q2RwF7g2g4D2L0B1+B6UAX9h19v2dVfIKkJC0th5C
	xMLRzRfGlC6PQZnJEilzIMfKJJ+bl4EQkd1rN7p8qjyBg6M6LfoqcECZJIj689Yix4LD
	HjxrL6yoKCjR/pwfJWSCd4+bE0O0d2ajWfnWw3sUxxfZQaxLFjwLdXbL5RmpcDuSr1HD
	8XVTLxs5/AmO1U6NwYT8U1LDfkGcE299Ht6QUu0Etiwn+WX92pGuBXIvw8nxpZ/YwGow
	p17Q==
X-Received: by 10.194.179.2 with SMTP id dc2mr9847569wjc.53.1370012956750;
	Fri, 31 May 2013 08:09:16 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fu14sm4546170wic.8.2013.05.31.08.09.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:09:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:05:43 +0100
Message-Id: <68005f8f3fd41191bc0c32abf0bbc523ec386bb0.1370012689.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkbn+yDCJbgWIEG3xxg7lRfMRoAHPtF3s35V0R9OLfTge8dl0UnJfsXfRigIcCx20PYi5A3
Subject: [PATCH 07/11] gtk+: remove spurious libgcrypt dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 May 2013 15:09:16 -0000

This dependency was for the display migration patch set, which was finally
dropped entirely in 2007.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc       |    2 +-
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 84edaf3..73d624c 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -12,7 +12,7 @@ SECTION = "libs"
 
 X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
 DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native \
- libgcrypt cairo gdk-pixbuf"
+ cairo gdk-pixbuf"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
index cc51fcd..9dff4a5 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.gtk.org"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "libs"
 
-DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf libgcrypt \
+DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
            docbook-utils-native gdk-pixbuf-native"
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
-- 
1.7.10.4


