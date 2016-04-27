Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D6B4B73281
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 13:04:12 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id e201so37921037wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0bGXzofdBOIksT/LcTkIh28PgS2u4jMrMVamqy1Kwks=;
	b=rFC3qYyEI3VB0s+zhgyyq1eBDT1D+X8xsJq/xhmJN3xwYp5hbRK9G8tEswQq+dbFkc
	Iajo1iQFreIIDl9yuRCUKhX8g6e3gbVotpVtYK2iDJZZkHAtXgO4zeRwpik6sOAo0yly
	cj5MyBTrx1gCMZp18zUsWKMwzmxYDg2U+DQzR3OqPycpNw5t5geS5o29vS55U6Kf1qg+
	3CzbSgCJso+dRRiKqDRkcxSJfyX1Or0khOOaVlOIy5/Ju3M8Vd9/uK+XpsHYOeHtMRK7
	lAi6z3ejTXr2WI3cexLLmvgSK2mG40maO0KYvHyEk48Z2pUAuqYq9sch4fs7GRmzzD7Y
	J+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0bGXzofdBOIksT/LcTkIh28PgS2u4jMrMVamqy1Kwks=;
	b=F55udNK5/dKDGf7cUYbGl62zagC3KhEtYecqlmUbdP39Q5puWq0bdjCgvkwa4vv/pJ
	2Rhyi3GxaJRM9kWD5RIjWPZ9T/Xd4+QyL3gNfGNaINMHxZ2EzdVez4D2TAUSoztkxLPj
	tVDWSFyLM9RQikqiBCC6v64dZSxukstJIdqn0Ir1dp2aZmKIwlO/koGQhnD5ZvdtZgAA
	xJ/u6y1FzuRwyYf9mb79iuObFN0X09srh/IwB61aIcobKDE9VDppPUmKUIJIWyB6Kq/y
	cXxgd7aY40eBr4SFcWa+MNz4oq+TR7vv+6jk19CGlH5OahG3wOK7BQZvfAWiARDVUZSt
	rA9g==
X-Gm-Message-State: AOPr4FWrpku2zYZlMia0e8uXQdxsLzFhgG/Qf6b92QMaULCoK74dIyCet6gWeqEum2SmXahy
X-Received: by 10.28.48.145 with SMTP id w139mr23577140wmw.51.1461762252480;
	Wed, 27 Apr 2016 06:04:12 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id s10sm4034781wjp.3.2016.04.27.06.04.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 06:04:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 14:04:10 +0100
Message-Id: <1461762250-30434-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] webkitgtk: remove gnome-common dependency
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
X-List-Received-Date: Wed, 27 Apr 2016 13:04:13 -0000

webkitgtk ported to CMake long ago, so by definition can't use gnome-common's
autoconf macros anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.10.7.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
index d4f1d3b..269ae4b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
@@ -29,7 +29,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
            gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
-	   pango icu bison-native gnome-common gawk intltool-native libwebp \
+	   pango icu bison-native gawk intltool-native libwebp \
 	   atk udev harfbuzz jpeg libpng pulseaudio librsvg libtheora libvorbis libxcomposite libxtst \
 	   ruby-native libnotify gstreamer1.0-plugins-bad \
           "
@@ -85,4 +85,3 @@ ARM_INSTRUCTION_SET = "arm"
 # qemu: uncaught target signal 11 (Segmentation fault) - core dumped
 # Segmentation fault
 EXTRA_OECMAKE_append_powerpc = " -DENABLE_INTROSPECTION=OFF "
-
-- 
2.8.0.rc3


