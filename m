Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE627CF9C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 00:32:21 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id a28so4962729lfo.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 17:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=KKQvldrfOnWMXf9UtHS+kHleiU0YntdVIvZmF1cyBoc=;
	b=Ddan/KvuFbLNIHIx63gU6bHf8JJBCbcBzG4x2++sqRfYnpnDjjLukzmIZ/0TEaJdRs
	sS3zEtgAoxU1892OOZjHIjIYeFWMuyBfFdYJSW2KdIfDnxXt0/j4CeeU4zpDB5JWEuR4
	/pGGk2aHgLrVa63v4QW7lzvSpzgO1P8/5itKCZxUi4LLrRfcvufdaZ0qEbUVQUQtly3z
	XMHFZIJXgcLO681vr0yYYdsHNOHYTJbBx9e+UwA9Vv0a6GVLFsvcj804ht2AFjSHQ3kt
	wp90QNSZWhL72fRqio1tw5OLRhu+lllNM9qZmT4BFuMzcVxPUHY9gb3gHFoSJrl5htEV
	OfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KKQvldrfOnWMXf9UtHS+kHleiU0YntdVIvZmF1cyBoc=;
	b=g3u0KvmD3MxpERtcOKKChT61pIFw8F86zvzQFDbbSUmXMvGOufywnG47Ay7s0YNmg4
	V89i0RzfRkFskTNd9epOUjk964sI5I6XJlIlkX3Onx2UVQyB8pZJBNs5Rzir5f15g1WR
	71iQDpQoIAoVFttKb2ObKAxtwHdaMN2c3eGgRY+jwvL7h2pFb5wScmQubsxXFLgpUGBk
	5EZaNz+50oAiNxOyfWoRDg+JOU93/Mh093WeHlZBvzhqWrsP0jaX5JTBnAP+yLqdtKmp
	mLQZZdoztGug7KkQsl0I1cuqBM6Y7p+iyIJkeN553B/AvN0+vZM1t7dDndcRo2A6AHEi
	eFow==
X-Gm-Message-State: APjAAAUa1uiXPBWH6I/6SzgsHiyAprIrK+VhSlokb46qB71lUVsGt7mA
	BpicoBl2qxYvoFxbw7snVv9/7aq9R14=
X-Google-Smtp-Source: APXvYqyTzKl6uhSgId8SERlJU2szqOVYktu/yMixY9pz2gg3P+P75kKzdBsbX88JILt93Q3nVBIGFQ==
X-Received: by 2002:ac2:548f:: with SMTP id t15mr8174017lfk.166.1554078741329; 
	Sun, 31 Mar 2019 17:32:21 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id n5sm1544681lfh.6.2019.03.31.17.32.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 17:32:20 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 02:32:15 +0200
Message-Id: <20190401003215.6843-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxext: update to 1.3.4
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
X-List-Received-Date: Mon, 01 Apr 2019 00:32:22 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/{libxext_1.3.3.bb => libxext_1.3.4.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.3.3.bb => libxext_1.3.4.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.3.3.bb b/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxext_1.3.3.bb
rename to meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb
index aae8f2af6d..9493111a67 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_1.3.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb
@@ -22,5 +22,5 @@ XORG_PN = "libXext"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "52df7c4c1f0badd9f82ab124fb32eb97"
-SRC_URI[sha256sum] = "b518d4d332231f313371fdefac59e3776f4f0823bcb23cf7c7305bfb57b16e35"
+SRC_URI[md5sum] = "f5b48bb76ba327cd2a8dc7a383532a95"
+SRC_URI[sha256sum] = "59ad6fcce98deaecc14d39a672cf218ca37aba617c9a0f691cac3bcd28edf82b"
-- 
2.17.1


