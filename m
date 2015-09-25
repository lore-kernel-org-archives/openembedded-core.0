Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 19FCD76FFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 22:32:21 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so39392191wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 15:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UkgHDIHlvsmMQZZ9kUQVZlQOv9B0PBv64c+UC+wqw9A=;
	b=HkmQ5reXA8eTymY4Dqx5zaoJ1KhAZnXq5E3so+86eGpkZxS7SsEV3GHBl/8fKnnasR
	tRn/+Uy5J86EAEozO3o00FHu3BbHfWP6UHxNOiuTjw8bHtFO0bkIr2wMcjB5Q07fCt8I
	Eb76TTyapxAXbxWrUdOsSWiDyyISKBBtr+o1tUfT3U4TlUNxjvY81TH9kPqZF4LZlM2f
	fzyErGTJmHNqZh0/u9LREoGRkCmSEDUKmCOM06Y1JqgeNpz906fh8Pe7EkmxzUJMUO/H
	byM3YDgS2zu8X+0waKuMEOtzHLOdahz7hnysTFkH/5Z0PI0ImuC1eRIQgFIKUCFqH+bw
	rdrA==
X-Gm-Message-State: ALoCoQl5sZBJbafbblJQ9fW/RgwddIpGvP/ufcKQTXy4BYt0WaSJH+tFqM9k3dXbd4ICTIewRb8g
X-Received: by 10.194.114.199 with SMTP id ji7mr8167089wjb.19.1443220341403;
	Fri, 25 Sep 2015 15:32:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	ki7sm5408816wjc.28.2015.09.25.15.32.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Sep 2015 15:32:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 23:25:11 +0100
Message-Id: <1443219913-18502-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/3] gdk-pixbuf: move gdk-pixbuf-pixdata to gdk-pixbuf-dev
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
X-List-Received-Date: Fri, 25 Sep 2015 22:32:22 -0000

This is a development tool, similar to gdk-pixbuf-csource, so move it to the
-dev package.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
index bdf173a..1985ac4 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
@@ -50,17 +50,17 @@ FILES_${PN}-xlib = "${libdir}/*pixbuf_xlib*${SOLIBS}"
 ALLOW_EMPTY_${PN}-xlib = "1"
 
 FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
-	${bindir}/gdk-pixbuf-pixdata \
 	${libdir}/lib*.so.*"
 
 FILES_${PN}-dev += " \
 	${bindir}/gdk-pixbuf-csource \
+	${bindir}/gdk-pixbuf-pixdata \
 	${includedir}/* \
 	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/*.la \
 "
 
 FILES_${PN}-dbg += " \
-        ${libdir}/.debug/* \
+	${libdir}/.debug/* \
 	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug/* \
 "
 
-- 
2.1.4


