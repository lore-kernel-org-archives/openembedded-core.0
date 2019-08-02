Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 219377F38D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 20:37:31 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n9so78542188wru.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5OESrkCxyflK1aLfUunLaFZYXlNGrdWhez93xpcQ2Iw=;
	b=k0lbyGLkAAQG7Pu/fsOqFUOu6eZX7F7hPnZJZk0A1sLRMtG3+gu6DOfYq5rxMAAkAg
	zp8V9WEla0lFFkL3UXzdmU/VHFFVUFQjTV1h7Pq1OvkqF27+l/OvxrrgVbdiBMTMA0mu
	tNV4PcAo7KEYSr+J2WL1gkJldeqqtK3yYRaRvtcoEy5+LwN4R0VZha9ACKabtSUQdQ2A
	3yr1EE9Si6uLzoIiiNG9vXljXRKtYBH8zx3bU6crFNsLqIyzj81wLPgSXi+fOqNDqGnc
	6D2WNoywj5pUmKX3Df9i1s0gBemDX5rdw/KHzsiV2Ixp0mA+vph8qig2hS3BDq63EDdH
	Z8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5OESrkCxyflK1aLfUunLaFZYXlNGrdWhez93xpcQ2Iw=;
	b=SyA1S7afbCjchljg/sXlvy2tMwxnGXHDXwZrZSh+cyyrGGIYiw8of2gpUCsGNfA/vr
	RnFgsQ7fM369i4IlD/0VXhmUvEx/4NIy5v0D0cc6SbEzN3DGE/Q2H3skD7IPJ8tPKChC
	VMwjr+ud+YXu56EGeEBcaZc3/F9b6qYCHqia2JTEBsw6gwOigEAygJNo12U4/zoq99Dn
	kH17Degzqck4BOjRIKrE6QwSL2uVjI2BT8mkfTjOiw6XVc9E7OUi3dAC3IhdawVdbdpx
	CAXWcJhHI2PnfgfMRm12rbS8wG5fM2xbM24ANzFfjiXth7kClzoMonzjxSEISHS9G5i1
	FhiQ==
X-Gm-Message-State: APjAAAXybhIrjfThGkotln5Rh7JlNpYh6WH4b2ouw86enAblpjiqZBjN
	jnpRX1QsaMg0aqTv+WxcbBW/Ay0uEm8=
X-Google-Smtp-Source: APXvYqz/Po22K4ZrtS21p0cXMER+bzxyyyuIhr2SYHuJKDggFq1+/952ATyvsOtTwdHJ0bxZV0MOrA==
X-Received: by 2002:a5d:628d:: with SMTP id k13mr21452217wru.69.1564778251701; 
	Fri, 02 Aug 2019 13:37:31 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n1sm59083910wrx.39.2019.08.02.13.37.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 13:37:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 21:37:18 +0100
Message-Id: <20190802203719.20437-8-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802203719.20437-1-ross.burton@intel.com>
References: <20190802203719.20437-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] xserver-xorg: update to 1.20.5
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
X-List-Received-Date: Fri, 02 Aug 2019 20:37:31 -0000
Content-Transfer-Encoding: 8bit

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../{xserver-xorg_1.20.4.bb => xserver-xorg_1.20.5.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.4.bb => xserver-xorg_1.20.5.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.5.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.5.bb
index abc4656b0f8..3de6d22e573 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.5.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
             file://0001-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch \
             file://sdksyms-no-build-path.patch \
             "
-SRC_URI[md5sum] = "c4841cc24b79420205d082fe82e0a650"
-SRC_URI[sha256sum] = "fe0fd493ebe93bfc56bede382fa204458ff5f636ea54d413a5d1bd58e19166ee"
+SRC_URI[md5sum] = "c9fc7e21e11286dbedd22c00df652130"
+SRC_URI[sha256sum] = "a81d8243f37e75a03d4f8c55f96d0bc25802be6ec45c3bfa5cb614c6d01bac9d"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.20.1


