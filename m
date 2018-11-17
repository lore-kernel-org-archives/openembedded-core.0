Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 047696C241
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 22:58:01 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j26-v6so28322736wre.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 14:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=O3D+nL1dMSv8HnnW6c1CuhaahXQEZZxEL90e71umr0U=;
	b=XTbEFFU4wYNpKq1P77lGkSR2yfEVDe72f/bTIIkb0V+ks0GBxp0qyuF0O21QIfc+3c
	J/BULDIzGgEOHxwc3wgJTu52kCxFIjFinyAekowNy4icw7yE14BTPpI3nNpLclfUyNGZ
	HGG5ebIsSAB6ouGJKTy9BBiiqovTzJLgWzhvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=O3D+nL1dMSv8HnnW6c1CuhaahXQEZZxEL90e71umr0U=;
	b=VJEcorR7lINmkad15w2DPTtJP6qyOAtbyG7zCKlOA/HvKM++nDWdHoB4L1iYd3KRL5
	ZEJ5j89NeM9qKneIsikpv3QLyW86RCWnCdfBERYDezjQolA1ZGSW/i6Smub//CN+qYKD
	/TOMS+lkEo+tfRLFiWDMKJedVQ7ZlJbPg4bbxmANgp80fx+NfgOQEcHdEa8b9MFeNYd/
	bLZ9kVZFlntBhPBkJO6hqxWJYZ7VeSgTDsuPtQlpf9AOYE9q1EEXX2oHV3DL/GivJDlC
	i8YMxZBcq8H3VTJrfIx6sgsofdM3AlQCGcQeicGTcF9wAz39JCno7qt5/0YGDWrxvyLu
	oAvg==
X-Gm-Message-State: AGRZ1gJP2W740Ivxtg/hTd6JKeLPBMhS6+xrqrwYLGw+mHPZSrAQv17b
	HVc3gxrI0kcUuG7fL9I2zVQ31gsp864=
X-Google-Smtp-Source: AJdET5cYA6jtBFFAJYLvi7eGOyA+ZJCUeTG+eB1fy0J0RHa3383O6DSzT/9iCGGUJNZJJlx09USUHQ==
X-Received: by 2002:a5d:6487:: with SMTP id r7mr13893754wru.263.1542495482114; 
	Sat, 17 Nov 2018 14:58:02 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l15sm12658470wrw.4.2018.11.17.14.58.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Nov 2018 14:58:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Nov 2018 22:57:51 +0000
Message-Id: <20181117225753.15733-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
References: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 7/9] libinput: upgrade 1.11.3 -> 1.12.1
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
X-List-Received-Date: Sat, 17 Nov 2018 22:58:02 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../wayland/{libinput_1.11.3.bb => libinput_1.12.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.11.3.bb => libinput_1.12.1.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.11.3.bb b/meta/recipes-graphics/wayland/libinput_1.12.1.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/libinput_1.11.3.bb
rename to meta/recipes-graphics/wayland/libinput_1.12.1.bb
index 12e2091c0fe..2cba80f211f 100644
--- a/meta/recipes-graphics/wayland/libinput_1.11.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.12.1.bb
@@ -9,8 +9,8 @@ DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            "
-SRC_URI[md5sum] = "df6e877f11de4a9793511e9abfe7ef01"
-SRC_URI[sha256sum] = "f31191d96e425b4f16319842279d65946d9d983dcd3d9e466ae1206aa10ecb06"
+SRC_URI[md5sum] = "0b6fff34e30cf7aafc33c8f884806960"
+SRC_URI[sha256sum] = "570c48cc7b744b9b4da711ed0c5e8c3de132484684b0c4f0309a9a83df5e8692"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 inherit meson pkgconfig lib_package
-- 
2.17.1


