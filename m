Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 09DA47FCEA
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:45 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id s64so4857446pgb.9
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=79PEM5FVkphXRcBWiXOSZz2204CnX5jEOn+Csh6cXFU=;
	b=OKgKNCB9+tQz4rUQWlnKMbOQZiO41XkrKnjcfkGd+DbwM9NbgXhM9stINIMzRPxldM
	XBRpKssCJxmJ8WLQ11sVrjsFTzGvuJcGi+Al9CXA+Ssrg1KUWAc02sp/oQsd/qe6DZs2
	upcklP/kFHN91EdDy/iFpv4nNO07x62i2PTcf8aE4QGWwYe+4VpDfOGM81oRVw4xEAGx
	IiaUh5fuDlzP1/Sy1GKkszB1cEpuMGCxzaPCS9+akjpupIjgsQi92tflNww6KWJP3ww4
	OVluzVFihqiKXCQxr3kNzaZgTGXdXj4Fy3Xl6wrXWKWtSWBECmsU+vlOtBmyIF5pZXW8
	GOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=79PEM5FVkphXRcBWiXOSZz2204CnX5jEOn+Csh6cXFU=;
	b=W4xWdE3LyASzO8v8/d9p60KRykIzgxyEb0tF9Cr/HO13DA5FtOPxQa8jR+mN6cUsMp
	045tuObm018a0HZjjt86k2XTXRYJNYyNszKyeNngzfClVaO1LF2U+R5XTmokvWKqrzUh
	urb8BvxApXxpr+393s/0IxAoYePI518UQIId37055TnUWMiWNP3qktvzZlb2LiyxHz9P
	TdIovWADAH4OWW/I7lfT/1s4LsTDb6JIjC2JRPacimW+zUqg8cGfEYIh7E+5gITml4mE
	lDuBUir5RYyTdz00cR0zIhpk+OAtkWNMVP+qizynalOUNoLX1kCk5WV17xPouRcFSWqv
	m4gg==
X-Gm-Message-State: APjAAAV0i6aEWljXdu+MLFtYzjdj6+Ka8sumEHIewLRDKjuAnqadyY80
	OKmSt3BT3G056cADOVvGOMOBi15K
X-Google-Smtp-Source: APXvYqxX4HU9FrAgevD3LbuMnxGLWdntD/w+sG2XGme6MNUVQUk9/CEVoVAshaj3d3Mry1cye9MamA==
X-Received: by 2002:a63:4664:: with SMTP id v36mr21053476pgk.147.1578929446094;
	Mon, 13 Jan 2020 07:30:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:11 -0800
Message-Id: <d0e3d1f9437b2e2c6284d9fad51bb11ebe72a46c.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 12/28] libpcap: upgrade 1.9.0 -> 1.9.1
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:46 -0000

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

-libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
 Removed since this is included in 1.9.1.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[CVE-2018-16301 CVE-2019-15161 CVE-2019-15162 CVE-2019-15163 CVE-2019-15164 CVE-2019-15165]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-add-missing-limits.h-for-musl-syste.patch | 29 -------------------
 .../{libpcap_1.9.0.bb => libpcap_1.9.1.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.9.0.bb => libpcap_1.9.1.bb} (88%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch b/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
deleted file mode 100644
index 01773834c7..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From aafa3512b7b742f5e66a5543e41974cc5e7eebfa Mon Sep 17 00:00:00 2001
-From: maxice8 <thinkabit.ukim@gmail.com>
-Date: Sun, 22 Jul 2018 18:54:17 -0300
-Subject: [PATCH] pcap-usb-linux.c: add missing limits.h for musl systems.
-
-fix compilation on musl libc systems like Void Linux and Alpine.
-
-Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/d557c98a16dc254aaff03762b694fe624e180bea]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- pcap-usb-linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/pcap-usb-linux.c b/pcap-usb-linux.c
-index 6f8adf65..b92c05ea 100644
---- a/pcap-usb-linux.c
-+++ b/pcap-usb-linux.c
-@@ -50,6 +50,7 @@
- #include <stdlib.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <string.h>
- #include <dirent.h>
- #include <byteswap.h>
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb b/meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
similarity index 88%
rename from meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
index 78361561e6..a0f66ac0fa 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
-           file://0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch \
            "
-SRC_URI[md5sum] = "dffd65cb14406ab9841f421732eb0f33"
-SRC_URI[sha256sum] = "2edb88808e5913fdaa8e9c1fcaf272e19b2485338742b5074b9fe44d68f37019"
+SRC_URI[md5sum] = "21af603d9a591c7d96a6457021d84e6c"
+SRC_URI[sha256sum] = "635237637c5b619bcceba91900666b64d56ecb7be63f298f601ec786ce087094"
 
 inherit autotools binconfig-disabled pkgconfig bluetooth
 
-- 
2.17.1


