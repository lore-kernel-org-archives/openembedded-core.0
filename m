Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id BD14F65C89
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 22:31:27 +0000 (UTC)
Received: by wgjx7 with SMTP id x7so48191950wgj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 15:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WhaZcOfIi2WthE+OmprOqrfViDuuMv022xP3OpZ9tV8=;
	b=iGcfKB5QfWuNGHb/9zYEeN+xX/mL3Rjq9xyMGIslXYHYbexTeTqqLjxKsHOhpeGi65
	tJWDHdpkomA22ToQCU/8Iqr58fqpzU5LCubhXNKjelDJ975/iv84qob+Uce3g0B0Ulxi
	gXghdszRqjiIYxWprLmbpCFAhGw1dZ9ZF907ZheofKEcW17bg7l9U14cbxO6jlLlw4Mo
	qKOwxMayvuZ7WpZBMksRHpj7WbgTSlNlbi49NgH74T54KqdKA4NNqkVd/dtL93TRtf4D
	A17zhZO41IrLCMK77P2/H5tkOjOq62KsemU9BWlQrijA/0D5MroE9zPmDvTw+hbaZhYT
	WJUQ==
X-Gm-Message-State: ALoCoQmyJUyai9diqZ0AZ7LnNZKMmTyBHXg0DylojT7/3WBs269c0F1UnBOdwLhAs5N92cLZj5rP
X-Received: by 10.180.13.10 with SMTP id d10mr47661011wic.57.1435789887773;
	Wed, 01 Jul 2015 15:31:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id a19sm24014590wiv.2.2015.07.01.15.31.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 15:31:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 23:26:03 +0100
Message-Id: <1435789563-9701-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435789563-9701-1-git-send-email-ross.burton@intel.com>
References: <1435789563-9701-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] wayland: enable nativesdk builds
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
X-List-Received-Date: Wed, 01 Jul 2015 22:31:30 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/wayland_1.8.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland_1.8.1.bb b/meta/recipes-graphics/wayland/wayland_1.8.1.bb
index ac631af..0f9a0aa 100644
--- a/meta/recipes-graphics/wayland/wayland_1.8.1.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.8.1.bb
@@ -22,8 +22,7 @@ EXTRA_OECONF_class-native = "--disable-documentation"
 
 inherit autotools pkgconfig
 
-# We need wayland-native for the wayland-scanner utility
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS = "expat libffi wayland-native"
 
-- 
2.1.4


