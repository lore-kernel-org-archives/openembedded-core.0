Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 98D1860DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:38:36 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so54366wgh.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xAfvKp06huMIHcqgGyy06WwOL/wlAAUmuQZB2CsNuf0=;
	b=TFZunBQJKfpWHSxPxue/x4F1uvoNeCATNmpcGwPzgTbe/h6sFjnXOa9GD6x+uHAU+z
	Jpy8nvI3ri2f3T3Y1uxDAnl1Q+gVE36G4PBXL1zrv3AztnUXh9l9U8deTQByTMJjknrc
	GF2/WoL2EWGIETmNnTajz3ZUN2ZjGeO20F0yXLKyyy0jDSapTIJGyouRhHRP2LBzIjdg
	Qdh9pZ7MsKF/npbpAl3B3TEEgJTwBvQI5KudBZzK9RM2iRUKTtKRrZWp1eTGrXhxGN2c
	jbsYSR+cObZ7q1hiQaCUxMdG5HLdBTXUo2kQKDunxx0pZqjFX7DrEWvYxQgybOmlf5gm
	eNBA==
X-Gm-Message-State: ALoCoQmsmSY2uMP27LNDqNTSYkgINtd25aOEPbYhfd5/GUXWjI4492zJ4l9mIRx3uZ9F9GnK8kG7
X-Received: by 10.180.80.70 with SMTP id p6mr17646659wix.22.1406054316957;
	Tue, 22 Jul 2014 11:38:36 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jy8sm2847638wjc.7.2014.07.22.11.38.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 11:38:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 19:38:17 +0100
Message-Id: <1406054301-9027-7-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
References: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 07/11] gdk-pixbuf: upgrade to 2.30.8
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
X-List-Received-Date: Tue, 22 Jul 2014 18:38:37 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.30.7.bb => gdk-pixbuf_2.30.8.bb}      |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.30.7.bb => gdk-pixbuf_2.30.8.bb} (96%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.7.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
similarity index 96%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.7.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
index 7bdd723..3d08146 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.7.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
@@ -20,8 +20,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            "
 
-SRC_URI[md5sum] = "1195d26f14adfe99ff0878d37678a70a"
-SRC_URI[sha256sum] = "0aafc365eab1083a53f15e4828333b968219ffcb1a995ac6289c0147c9ffad06"
+SRC_URI[md5sum] = "4fed0d54432f1b69fc6e66e608bd5542"
+SRC_URI[sha256sum] = "4853830616113db4435837992c0aebd94cbb993c44dc55063cee7f72a7bef8be"
 
 inherit autotools pkgconfig gettext pixbufcache ptest
 
-- 
1.7.10.4


