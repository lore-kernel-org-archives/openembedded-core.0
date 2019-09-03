Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 382787DE4B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 11:19:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g7so17078502wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 04:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SL7HW8EW4Qlkn7Zlon/vAf9qc07jK45ogF+0LSRGz70=;
	b=DVI/fnMw6va1ZEIp7ekU7Ai8vUKEpI/vZf3SRBkQ8b1HZdbu/XwfYTUWkOoNGIiBB0
	F80L/r5DEPQoU21ZUPYCjAMFL6mwlO9/duqNySQtDJ9ACunWdhvCqSmzU66ouhoUxaOi
	sOGFSUiUqFHdOznGlmAUsx/lhzQuqYA5GjZRDWK5cLd0MWxU2BSqVUuaNdMPH65zI8Kx
	+p/tkdD3YoOPyNBvWBGY+/dxDxy5P7qCZeh670SdLoKV1YPbr1rdthnygMCx2+9r/FIg
	2mWFK7mxlrvX3nO3Cybcr/85qCgldFFMR3L2RAY1Xuz7f5ibTUAuetnpz6FsBAEOGOi9
	sHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SL7HW8EW4Qlkn7Zlon/vAf9qc07jK45ogF+0LSRGz70=;
	b=aAJzc0fvgZTX9hEuTKrQn6XVndfxrC9Am4CwtHCDkXlmhlvxNk+9nBGNaH2epwvfWQ
	AKudpUGJr6f1Eujpjlpi14r2D0C/Pj4YduINE3bAk+gHXTMnf56J09/trrGTHhaIufca
	FCUQ1mJPt3hESBm1MKw54MEkGoSEDslf4ShFeCYvhd/Z+6t9Du+rQMagGRUCk+1n6iCa
	3AtNV+Pp5LDGqI+bR2aBKhPvmC90b96GNsCUayWSsh/owc3bjWy9EEVvoDDwxU4Sr6+c
	0cCXSv1V8mX9312FnnDVlEZvOGITNOCNnaujo0aL/wyQfu0rM57jkCoaWkrCKe2jDRlP
	lZDA==
X-Gm-Message-State: APjAAAVFlGuUVUpG9b/XovqFqIyW0j09jlNwc/lfum20Ra2n1JHRvx5T
	EsVU7ktGNq0HQknk2PwLx84EeR5pI9k=
X-Google-Smtp-Source: APXvYqzwTRYRYUts6JVmUSbwkKTPdl/Bw9d8lkqCCP7pzi1jq4+lpIM6YghhoiNM2TLsEu5O6dbM9w==
X-Received: by 2002:adf:f505:: with SMTP id q5mr25210044wro.242.1567509558816; 
	Tue, 03 Sep 2019 04:19:18 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	u68sm27358471wmu.12.2019.09.03.04.19.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 04:19:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 12:19:15 +0100
Message-Id: <20190903111915.15803-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libnl: upgrade to 3.5.0
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
X-List-Received-Date: Tue, 03 Sep 2019 11:19:19 -0000
Content-Transfer-Encoding: 8bit

Drop the musl workaround, as upstream has solved this correctly now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...fix-libnl-3.4.0-musl-compile-problem.patch | 38 -------------------
 .../libnl/{libnl_3.4.0.bb => libnl_3.5.0.bb}  |  5 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-support/libnl/libnl/0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch
 rename meta/recipes-support/libnl/{libnl_3.4.0.bb => libnl_3.5.0.bb} (87%)

diff --git a/meta/recipes-support/libnl/libnl/0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch b/meta/recipes-support/libnl/libnl/0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch
deleted file mode 100644
index b20a2996234..00000000000
--- a/meta/recipes-support/libnl/libnl/0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Subject: [PATCH] fix libnl-3.4.0 musl compile problem  
-Avoid in6_addr redefinition
-
-Upstream-Status: Pending
-
-Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
----
- include/linux-private/linux/if_bridge.h | 1 -
- include/linux-private/linux/ipv6.h      | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/include/linux-private/linux/if_bridge.h b/include/linux-private/linux/if_bridge.h
-index f24050b..8f7490c 100644
---- a/include/linux-private/linux/if_bridge.h
-+++ b/include/linux-private/linux/if_bridge.h
-@@ -15,7 +15,6 @@
- 
- #include <linux/types.h>
- #include <linux/if_ether.h>
--#include <linux/in6.h>
- 
- #define SYSFS_BRIDGE_ATTR	"bridge"
- #define SYSFS_BRIDGE_FDB	"brforward"
-diff --git a/include/linux-private/linux/ipv6.h b/include/linux-private/linux/ipv6.h
-index e05e684..f16349d 100644
---- a/include/linux-private/linux/ipv6.h
-+++ b/include/linux-private/linux/ipv6.h
-@@ -2,7 +2,6 @@
- #define _IPV6_H
- 
- #include <asm/byteorder.h>
--#include <linux/in6.h>
- 
- /* The latest drafts declared increase in minimal mtu up to 1280. */
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-support/libnl/libnl_3.4.0.bb b/meta/recipes-support/libnl/libnl_3.5.0.bb
similarity index 87%
rename from meta/recipes-support/libnl/libnl_3.4.0.bb
rename to meta/recipes-support/libnl/libnl_3.5.0.bb
index 90dc644be4a..e6a225af525 100644
--- a/meta/recipes-support/libnl/libnl_3.4.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.5.0.bb
@@ -11,13 +11,12 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
            file://fix-pc-file.patch \
-           file://0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
 
-SRC_URI[md5sum] = "8f71910c03db363b41e2ea62057a4311"
-SRC_URI[sha256sum] = "b7287637ae71c6db6f89e1422c995f0407ff2fe50cecd61a312b6a9b0921f5bf"
+SRC_URI[md5sum] = "74ba57b1b1d6f9f92268aa8141d8e8e4"
+SRC_URI[sha256sum] = "352133ec9545da76f77e70ccb48c9d7e5324d67f6474744647a7ed382b5e05fa"
 
 inherit autotools pkgconfig
 
-- 
2.20.1


