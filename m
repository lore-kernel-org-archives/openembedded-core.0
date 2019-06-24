Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A65477C5F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 16:27:14 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c66so4763wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Kihgc3vEQmjc2Ew/QrU6JS1R2IR6GYXhVF02Pl+ahrA=;
	b=MOkUwfmGT55IdGfwh7Fza5TT2qT4tkHXk49nm6carcsyp9hrIphTxHDBkhHY0CCWo1
	K0mGrU0olJR7VrNIRjgIVhukaLBZqAkQL/oM7t9pZL6ynj8Bl9qr8dkPSZdB+Ga86hMC
	vyb0cb9yDofnwyxqjZoX23cimfkSiVWHC8ktZmMauERDur7tQSG6hvC0OyLeqp3kme7M
	uvysoc+S4i/77NwHd4LbBT9BGw2yqrBi5d/1F04m8gSiT/LZCxogKWNbW0NBGr/rAVlB
	hR0xu8zWGpVtFvO0J0XE5E+PJOuNYT/lg3KV/w54ejyDFO+47q+FQeJjGRVCI7g4PGEv
	o0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Kihgc3vEQmjc2Ew/QrU6JS1R2IR6GYXhVF02Pl+ahrA=;
	b=SA1D2PGFDC6Yf2Dp+wys74b7BGN7WMyTQRB9tDIKiXWx4JYEHu680GvqcXBPn5VVNZ
	3usX7qgBKbrH9ftoeAKVPh6n23mPl6BiuuumEOnTIb0drUR3tF4UTDZhiAkpq9JqHr83
	edmh25TtttVIE2PhN1K+p+K9GEWumSuEFCMCooOQ4n+SDQ9neszU0ZAdcEo1QQ4Bx54Y
	jvWtPPS2KJCcyIVwFlJncP0i53/ZNpv43SbspY54sJ7/f/+y7Fsdbl/jcQp873/JJR3Q
	9B9teOJNUyAUCZQgc5aHL4db6cOQCuNcUjWzFDjmHHj+zk2/zuxiNtesmSGUXXa4+uYG
	v7vw==
X-Gm-Message-State: APjAAAXajNNH7vwPMiXOeQZ+a6AO2MclTx7JxdcrbfIiagVM8lb/U/C2
	zfD+a2LOTgkrydKC7Z/mCN6WR2SBgRM=
X-Google-Smtp-Source: APXvYqzlPTXvpUA4nq9HFn2XYAty+FCcmYlOgr/5mlMaxs5NnnmPZd8bS4gQJZBquvifwc7ctciGaQ==
X-Received: by 2002:a1c:f512:: with SMTP id t18mr16280468wmh.47.1561393634988; 
	Mon, 24 Jun 2019 09:27:14 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r5sm24685949wrg.10.2019.06.24.09.27.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2019 09:27:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 17:27:11 +0100
Message-Id: <20190624162711.3879-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gtk-icon-cache: rename intercept to update_gtk_icon_cache
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
X-List-Received-Date: Mon, 24 Jun 2019 16:27:15 -0000

The intercept is called update_icon_cache which is vague: rename to
update_gtk_icon_cache to make it clearer what it is for, and add a comment
explaining what class caused it to be used.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass                                   | 4 ++--
 .../postinst-intercepts/{update_icon_cache => update_gtk_icon_cache}  | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename scripts/postinst-intercepts/{update_icon_cache => update_gtk_icon_cache} (76%)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 66fe781bd2c..91cb4ad4090 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -6,7 +6,7 @@ PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
 
 gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
-	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} \
+	$INTERCEPT_DIR/postinst_intercept update_gtk_icon_cache ${PKG} \
 		mlprefix=${MLPREFIX} \
 		libdir_native=${libdir_native}
 else
@@ -24,7 +24,7 @@ fi
 
 gtk_icon_cache_postrm() {
 if [ "x$D" != "x" ]; then
-	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} \
+	$INTERCEPT_DIR/postinst_intercept update_gtk_icon_cache ${PKG} \
 		mlprefix=${MLPREFIX} \
 		libdir=${libdir}
 else
diff --git a/scripts/postinst-intercepts/update_icon_cache b/scripts/postinst-intercepts/update_gtk_icon_cache
similarity index 76%
rename from scripts/postinst-intercepts/update_icon_cache
rename to scripts/postinst-intercepts/update_gtk_icon_cache
index 212209a9daf..99367a2855a 100644
--- a/scripts/postinst-intercepts/update_icon_cache
+++ b/scripts/postinst-intercepts/update_gtk_icon_cache
@@ -2,10 +2,11 @@
 #
 # SPDX-License-Identifier: MIT
 #
+# Post-install intercept for gtk-icon-cache.bbclass
 
 set -e
 
-# update native pixbuf loaders
+# Update native pixbuf loaders
 $STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
 
 for icondir in $D/usr/share/icons/*/ ; do
-- 
2.11.0


