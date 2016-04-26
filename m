Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1657270101
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 13:58:33 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id e201so113851435wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LOuh9s7fRV880gOISaqsTc8ZoFOCbFIHhBYIwl5LUEM=;
	b=Q86LTXWcUOQ7l1GZep7yByotbegTcehmAH9+p79tQIYRXq9SOvgdyJCcjP7N6byugx
	aGfNB/wNilWS+XZbLkKEbQHNe7e8bgct1cUxheIPiFz0up1pnDpmoYGCw0hgO7mhhx47
	rulb5c/CVHsfC7IWLY6whPtCDgJjzhw47MB/e0gZK9m1qHzez7T/ep5QlV4IjfIAAIog
	NyOoKxaush805DJtM00T7vhf9l2+ljbn+UGW5u2FxnlAaJ/84NheA9jvJVXQy9ZGMcXR
	Ev9Hidhe4yXlFxqJxYkRNUqgfGgQt1oR8v7LhfscDiBuJipWKsxhuA5JHSUFOFWAEw9x
	yqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LOuh9s7fRV880gOISaqsTc8ZoFOCbFIHhBYIwl5LUEM=;
	b=S06wJekm7+r+3y2DIxi4znpzdNwRbhxqYDcXcObrvaGtrTpm3ul8fj7tVesAoWsv+n
	EJhVTeMjdIyOx8lUDPlF6+cZ9Pd03zkaEf/3RE+FOC4a4yy2zGc/GJ5/Rw/kkpwyokph
	wPxqPl9YEX7t+gfmNueegFJXPoXwjaFBkqh1Qyy3FM6YyRCdo0Tq0X/c7mgPAQ9CpR21
	me594fbuYcay3xGDNJtx9mwZkzgFqwfBWQKPsfJIDjGFv7KkrT+S5cfQzng92ysmchlW
	cWdGW+cyKbi5TLVWhZq+L8nOUBVOP7UZCBVioTS7LGWItLRhtZ7m/DuKGXwzE+K+Zv1t
	6FUQ==
X-Gm-Message-State: AOPr4FX01g3XrQNza/Qot0mb+xtdU4WykGItgAKyN2FZEH6WKxk6eiB5L31ekmCmqKRQ40cz
X-Received: by 10.28.129.6 with SMTP id c6mr4093496wmd.75.1461679108506;
	Tue, 26 Apr 2016 06:58:28 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	y91sm3354887wmh.10.2016.04.26.06.58.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Apr 2016 06:58:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2016 14:58:23 +0100
Message-Id: <1461679103-2828-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1461679103-2828-1-git-send-email-ross.burton@intel.com>
References: <1461679103-2828-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] mesa: add PACKAGECONFIG for gbm
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
X-List-Received-Date: Tue, 26 Apr 2016 13:58:34 -0000

gbm is an optional library and some environments (for example, mesa-gl where
there are separate drivers that provide libgbm) may not want to build it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 442479a..a4e5351 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -24,11 +24,13 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 
 EXTRA_OECONF = "--enable-shared-glapi"
 
-PACKAGECONFIG ??= "egl gles dri ${MESA_CRYPTO} \
+PACKAGECONFIG ??= "gbm egl gles dri ${MESA_CRYPTO} \
 		${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
 		${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
 		"
 
+PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
+
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
@@ -37,7 +39,7 @@ PACKAGECONFIG[wayland] = ",,wayland-native wayland"
 DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
-PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS} --enable-gbm, --disable-dri, dri2proto libdrm"
+PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, dri2proto libdrm"
 PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, dri3proto presentproto libxshmfence"
 
 PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
-- 
2.8.0.rc3


