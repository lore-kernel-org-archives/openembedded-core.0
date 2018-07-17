Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2B178985
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:30 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id v25-v6so49766wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OGVhppn3FJGbyr9m6c1gk3q66sAc2gH/BLnsW9sJNEs=;
	b=lvqJgulz91wN87+ohBnmyjLj/H+6JPLGmTuU+I+P79m/uJsqAUfGIfRxyOSLs+zhh4
	dpj/Ald3kuDDe8gq/P5V6DVq9I9PP1C7h/plnbGVJyI2n7I30LIJPJjSkE+jWjRxZ0b1
	WCcAoZQdTgaD4qyO/sIJXm86J0gz15DsqnCdxdv2Y0sQsBvYps8gNabU54AUq0aRz4e9
	7YIfMJU0TOY7Yktq/y/PTO4kvwQgDKOoai9tTVNZ4Zc1pw6nPU7pJe+dTX5u0a/KfUkE
	e6qa8S2Kg2zWf7cIhUBvx+7FBoQJJUCtVdrFoWZkHzyAxVME40MYEgjuIdECP4svmKcN
	nEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OGVhppn3FJGbyr9m6c1gk3q66sAc2gH/BLnsW9sJNEs=;
	b=Zj7gNIGQAqHxbMLKfUT8LEkBlXqBay1SDThk1ljWhNQHmKKbFrBReFHMna8y/xegP9
	lriPCGCmxQirhTAmfa6akXCketHpEj+IhAZdq3Wa2WZzoYoJdGzvBsL4D+GyRFBKn53a
	kxjbwzjdVqThA67lQWeht8zUo00cTeoTXgXNLoZc4+4Bm1K5ZUWSbvVCxIRLte08vUUb
	/PfLytnyed1old+SQjRJncLRDXWEYO0S5Kzrf48sgQ8NzAvpRQUH5TOmbyb6+7fQVZCH
	52Jx1px6gvmbMMTt1C7EYzeG9tQUsK/bjFYpdmYEhT49OTNmsuJCxRK+icb+stZxafst
	5v6w==
X-Gm-Message-State: AOUpUlFQk2w2f+MkXlD2sUF2C61XjnLn8+mqjoOafGY6IPyZjpLf7h+w
	V8FTwe+NBsO6UOh3Ube42cLfnxP4
X-Google-Smtp-Source: AAOMgpdx1flYER7+rvxzWhOFhPufaWR8jKXgNV1/qB6Ks2VUEPrtbiIAs871D2ckgds4HSMz/Bf1bg==
X-Received: by 2002:a1c:ea17:: with SMTP id
	i23-v6mr1881535wmh.29.1531845570824; 
	Tue, 17 Jul 2018 09:39:30 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:39:09 +0100
Message-Id: <20180717163910.3196-14-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 14/15] xf86-input-libinput: upgrade 0.27.1 -> 0.28.0
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:30 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../{xf86-input-libinput_0.27.1.bb => xf86-input-libinput_0.28.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.27.1.bb => xf86-input-libinput_0.28.0.bb} (63%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.27.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.0.bb
similarity index 63%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.27.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.0.bb
index d31a91192e3..5853b5b5c04 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.27.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.28.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
 
 DEPENDS += "libinput"
 
-SRC_URI[md5sum] = "bdad198a7a9f2ce2c1f90d5e6760462b"
-SRC_URI[sha256sum] = "d4ad8dc5ad6f962a3f15f61ba9e9f8e37fa0b57eee9f484e2bd721d60ca72ee6"
+SRC_URI[md5sum] = "2d7519ac0e39d4c88f3be32e81a637aa"
+SRC_URI[sha256sum] = "21994d065fc26e85d1c3fc87d8479b9c22699ed5a0119df98fbe0000e84630a1"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.11.0


