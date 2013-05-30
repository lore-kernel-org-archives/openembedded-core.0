Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 69B376041D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:56:27 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id n12so5123442wgh.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=Vas7rW7vD2Qwp47C4bVVnYWlgACdDWfPVCkPJW0PW4g=;
	b=FUgRmlsPjU7ur+Ars0cy9v/I6JuovNa3HHOY7AL6SM9d6jHUe7g3CiHYzBYCVYgBGY
	/YgGvPz1YQcTh8GjlHEY8950UMdTujs7bCc635s7XKGn60UPY4ZvA1+06782Cadh5L5n
	HOjkPvtHfQOGyWhEqsV4r1zdpDxd+SgwGE6x+2U8v7r009lxGOlHsypRH+8vF6NXVudD
	nbEIG6YQ/1Kcz39oeuglR2G4XhNqmBN4l8DZ5qWj4FIq4s9uke+x3LS0ocYqJhD+f0/b
	82M0eK6sQqxhB2e0F0YVpPmyjHa6LXlO+cc6x1ryUrEhGAtlEJzpJStO9GekPowuysNZ
	KGkQ==
X-Received: by 10.180.74.10 with SMTP id p10mr4717906wiv.39.1369922188108;
	Thu, 30 May 2013 06:56:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm38247963wic.0.2013.05.30.06.56.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:56:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:52:45 +0100
Message-Id: <07abb5e9d5716dcd0000de638af1c8af26633e61.1369921759.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl/VyuOena3zO0pk3TPxGq3YZdgfd8ZblhnCJ4tiwv/d6R/+enHTi0Qs5inQcyEj27LHfCI
Subject: [PATCH 11/14] gtk+: remove spurious libgcrypt dependency
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
X-List-Received-Date: Thu, 30 May 2013 13:56:27 -0000

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


