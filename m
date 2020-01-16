Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id DFF517F95C
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:59 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id w62so10357818pfw.8
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=79PEM5FVkphXRcBWiXOSZz2204CnX5jEOn+Csh6cXFU=;
	b=HxDr1U2sB1bq9/8eBDy+IwJA2MkGO5sI9fTdmFSuYjSJGMp411fVlwKz93ozK+lc1a
	OCk59/2/QuVyWtNCqbiC8dsF1nxbgOaDk4xMR9KxJueX/HruHDxCQr/mOA4DxVQtLOed
	MLC1AugKxccfR1ugrIweIlostf51CMtgcYlDcOAJJoOUR34+/t9vThYJsfFhsmipkTCz
	H/yATXN2ln6hi8kWlWlizaDkiQXocE6EbI8kvsD8vjYwuIb8JYXnT4aWt+c0CYjoGLcY
	Zxu6adRa3Vs+rIuH9j6ihnc2RIZsMCG4U0rgm5wfR3cpowOisx2CaUStOIMgYNmnbIjc
	u1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=79PEM5FVkphXRcBWiXOSZz2204CnX5jEOn+Csh6cXFU=;
	b=eH3LdtCrx3SVQC0CqxETQiV2DLEzVlXPEKVo+wyrrh4U8n4OXaPgrg0OP7Ab2OR3xI
	Yc2IUkJeCCFV56UjGiJsl/n7FQZPoWr4O2ZefO205UAaXOVVM+DD0dFAWbBPl9bO56uf
	7tq0A+hCqHb9Aqv9INyl/F/E3ZWhWvLqpXnI0iHczWkn/9zszbWDQWj+t7u+YEhE3bLU
	xsaWxvR7uoNDTiGsASHvJXInPjrV6ZFNHgwjyVtvGWaJx8HOtsR0+XojnZosrWqETuqG
	N0ccovtK+lc+icy0D9Ncv4oM5sJ2GhzkC3vCQ/QY0ygR9ZaivLIv7r/n3jj7aKJ3EOuS
	AaMQ==
X-Gm-Message-State: APjAAAWDmXw6Kij0eNL6sgrJFkaEAXqZ4e6n94Bg03LEuivoD+MdbhdY
	eWLKTRBOxLR1j1WKZCNx7IHMYjC4
X-Google-Smtp-Source: APXvYqx14GTJ3jjxZbo9VdDIHzD9ZcD4GbZl5v+B90yGTTag08JAsU/bMwjrbgqV0L3E698cWXM9YA==
X-Received: by 2002:aa7:8f33:: with SMTP id y19mr36504582pfr.47.1579188060814; 
	Thu, 16 Jan 2020 07:21:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.59
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:25 -0800
Message-Id: <d0e3d1f9437b2e2c6284d9fad51bb11ebe72a46c.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 16/32] libpcap: upgrade 1.9.0 -> 1.9.1
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:00 -0000

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


