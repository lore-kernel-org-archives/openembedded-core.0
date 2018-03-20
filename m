Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 17DE26E666
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 12:10:14 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u46so1426371wrc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 05:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h1HpUdDEstCyU84sALo5P7MI+xK9RMtFQR2VnKR+4pY=;
	b=BC3jbLYkXwsKmP5Uj9+vRLrWytLYtNkyLHTiKLTV1BxE3rds9+spHFmsKiJ2u9eu4B
	gSJ+Yj0sRnvju2vveEC7OMiORYspixxQ5pq6w1uR3ZKksTj2SG8ab9zw4WpdEVtOJCeW
	VabuyIPx6mW0kRp19GsCHzY3n84iqz1fMrZi5Wm7CHxA0BSeTuCfW8oHXJi0aSnxis3S
	eM4ZK+Sotf8S+CuQ+d6Ou9ftueYZ99odvWlWYQ40Tkhx1k4OUzf2w3gf601Wq/cqDSyW
	exJMCG2T2SLxUfZjEogsDOhWHsGlkJiR8WCoPN2Yu8tQZJx4BlNF1m5FUgXnaEvVKjCH
	NCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h1HpUdDEstCyU84sALo5P7MI+xK9RMtFQR2VnKR+4pY=;
	b=q9TKeEyEzChM74ez8MUG9wZCRDAjIpgvEeeMJFr72T5JnYFDh8GXfC6oyo1m5FRi6s
	wEp1WTK9GISrOwC2Mb237xuLZf2DCJDc4fRUB+roX1c/dF6xk61tnr2C+GabPylmvFVD
	/yf/5VIVvrBV0/4nULRN9i8ZADuoCEvqI+ivbv8bBb4DLGlbyWe6YbevcIalEIdSDwh2
	D84eUw0e9X8reFw9ffTQMiAGS9BK/GyYk+6zTPE52rVVUV9Ces2b99+zwGGVBaB5DChH
	NdD+l9kRq8Wr/t4qk57Xaq1II1xkWtnVj6EthFLWLdeIdwhW3KjgnBnJQ9Y2rmGjzeja
	DK0A==
X-Gm-Message-State: AElRT7ESi1cxDtetoEwCCpt5/9S5/oESAUpUa3F45KyxI1/QDEOIhkea
	DNd07ote1HimQeuXstJggVTpvg==
X-Google-Smtp-Source: AG47ELuO6xFZrHgP2uVuObXSb40d33stZgBM3xlXd+RNBv1NynDqI+vQAlFsKuivhCbNiu/Kq6CHHA==
X-Received: by 10.223.155.2 with SMTP id b2mr12013574wrc.185.1521547815843;
	Tue, 20 Mar 2018 05:10:15 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e10sm1551424wrh.38.2018.03.20.05.10.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Mar 2018 05:10:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 12:10:16 +0000
Message-Id: <20180320121017.943-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <43d5b925-755b-3dbc-63b0-0df6e89396db@linux.intel.com>
References: <43d5b925-755b-3dbc-63b0-0df6e89396db@linux.intel.com>
Subject: [PATCH 1/2] gio-module-cache.bbclass: disable update_gio_module_cache postinst script for nativesdk
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
X-List-Received-Date: Tue, 20 Mar 2018 12:10:15 -0000

* it fails to find postinst_intercept dir:
  NOTE: IMAGE/1.0.0-1-r3/sdk/image///usr/lib/opkg/info/nativesdk-libglib-2.0-0.postinst: 4:
        IMAGE/1.0.0-1-r3/sdk/image///usr/lib/opkg/info/nativesdk-libglib-2.0-0.postinst:
        IMAGE/1.0.0-1-r3/intercept_scripts/postinst_intercept: not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/gio-module-cache.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-module-cache.bbclass
index a8190b7b89..179090d32e 100644
--- a/meta/classes/gio-module-cache.bbclass
+++ b/meta/classes/gio-module-cache.bbclass
@@ -2,6 +2,7 @@ PACKAGE_WRITE_DEPS += "qemu-native"
 inherit qemu
 
 GIO_MODULE_PACKAGES ??= "${PN}"
+GIO_MODULE_PACKAGES_class-nativesdk = ""
 
 gio_module_cache_common() {
 if [ "x$D" != "x" ]; then
-- 
2.15.1


