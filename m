Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.2821.1614464057461541788
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Feb 2021 14:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FaqqHxyG;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id p21so8531289pgl.12
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Feb 2021 14:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dz3ARCLx+n0wOQ1QXRO+u0idPrIQDniVLcmfF9+6+bI=;
        b=FaqqHxyGLE9emnLrHxdnfebDdEkMN9lIJjdJ6OeNToc7wY6u5DWOY4N+immjYDi1k6
         lho1k5i8e/upU8g1T/f66TycaCjzMP0gwey5QRSb5JuTEAJmdpeIuyFJe2AbDK2dvOqI
         sZ5tLG5nYY7eDrHKrvzt7mkWHYs6u1NiHuzZrvUuob4ZRxXI0aFpmq/sjrq7qF3/qpM/
         xymorgRVsEZq6+LrYRr6wNB3qy/M9wpIvuVizu7Mk2Tnf0t7eUrM7U35wQs7Yjfqlpli
         Gg5fH4yIGSZhlNz7iiOjYGljBAx1XqSOMnlUtnsx9V8FDrbeabD+b4R0RyxrIC60JSYl
         tGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dz3ARCLx+n0wOQ1QXRO+u0idPrIQDniVLcmfF9+6+bI=;
        b=gEv7AkWA+1/f+z1pJeVNbSyUoEM/yVS2Ovk+siYvwPjNqXbD10Bm1qj7Nn0jyBCqRo
         0MFdG7+tOZ8n5Msnr7Z2bR2rDn+GVUmw/iWj/PPWld+DTQhcx55D1megHuFFAslNAvCe
         Y2lFg65ChKiRYFpDnrkymUsMpkTVPfsVMvsYiJth/I9OIp9H2pnVl+4X9wK26AZ5hguv
         J5GiTikAH/IL+u7PjYkVlkJjyICEpUibqUx0a3wAla9gEzMNigmIICSRaLQ6hWMGEvL5
         jd9N8G1/U9Q5XPav3iTz+POmMX5DiM673Xqp50UzJ5sQGwaQ2rPYV4vTkOC9RGSEFBXp
         MudQ==
X-Gm-Message-State: AOAM531GA/n24TcHl9bkeWBZFLt2Rh86z5M8few0mwsFeBSAwt0SrjHA
	jI4bumdWHnA8fO8b5kp7Bhg3BaYws77bTg==
X-Google-Smtp-Source: ABdhPJzbC1dsZXVJUPb1B2rAxxOQ6J020/AH6LwspJkLlnr7wndre0y0JvrmCCUuFro2Yy1c8vR6PA==
X-Received: by 2002:aa7:81cb:0:b029:1ee:5346:8f1d with SMTP id c11-20020aa781cb0000b02901ee53468f1dmr4583259pfn.4.1614464056731;
        Sat, 27 Feb 2021 14:14:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id j5sm12188811pgl.55.2021.02.27.14.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Feb 2021 14:14:16 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] igt-gpu-tools: Fix warnings with gcc 11
Date: Sat, 27 Feb 2021 14:14:12 -0800
Message-Id: <20210227221412.552759-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210227221412.552759-1-raj.khem@gmail.com>
References: <20210227221412.552759-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t_edid-Allocate-raw-8-bytes-for-VSDB.patch | 42 +++++++++++++++++++
 .../igt-gpu-tools/igt-gpu-tools_git.bb        |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_edid-Allocate-raw-8-bytes-for-VSDB.patch

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_edid-Allocate-raw-8-bytes-for-VSDB.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_edid-Allocate-raw-8-bytes-for-VSDB.patch
new file mode 100644
index 0000000000..38bd4550a3
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_edid-Allocate-raw-8-bytes-for-VSDB.patch
@@ -0,0 +1,42 @@
+From 606349860d27492c328752dca5a3784c0e9a6d24 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Feb 2021 11:05:45 -0800
+Subject: [PATCH i-g-t] lib/igt_edid: Allocate raw 8-bytes for VSDB
+
+hdmi_vsdb is an element of cea_vsdb which makes the size of cea_vsdb to
+be 8 ( 3bytes ieee_oui ) + ( 5bytes hdmi_vsdb struct), its true that we
+only use 7 bytes technically we can only allocate 7byte array but since
+we are writing to elements of hdmi_vsdb struct which is sitting at offet
+4-8 in cea_vsdb, compiler thinks we have an element which is out of
+array bounds since out allocated size is 7bytes
+
+This errors out
+../git/lib/igt_edid.c:365:13: error: array subscript 'struct hdmi_vsdb[0]' is partly outside array bounds of 'char[7]' [-Werror=array-bounds]
+  365 |         hdmi->src_phy_addr[0] = 0x10;
+      |             ^~
+
+allocating one extra byte matches with size of cea_vsdb and compiler is
+happy
+
+Upstream-Status: Submitted [https://lists.freedesktop.org/archives/igt-dev/2021-February/029446.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/igt_edid.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/igt_edid.c b/lib/igt_edid.c
+index 1c85486d..ce09cc47 100644
+--- a/lib/igt_edid.c
++++ b/lib/igt_edid.c
+@@ -351,7 +351,7 @@ void cea_sad_init_pcm(struct cea_sad *sad, int channels,
+ const struct cea_vsdb *cea_vsdb_get_hdmi_default(size_t *size)
+ {
+ 	/* We'll generate a VSDB with 2 extension fields. */
+-	static char raw[CEA_VSDB_HDMI_MIN_SIZE + 2] = {0};
++	static char raw[CEA_VSDB_HDMI_MIN_SIZE + 3] = {0};
+ 	struct cea_vsdb *vsdb;
+ 	struct hdmi_vsdb *hdmi;
+ 
+-- 
+2.30.1
+
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index f25cbc0603..098594cf2c 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -11,6 +11,7 @@ SRCREV = "d16ad07e7f2a028e14d61f570931c87fa5ce404c"
 PV = "1.25+git${SRCPV}"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https \
+           file://0001-lib-igt_edid-Allocate-raw-8-bytes-for-VSDB.patch \
            file://reproducibility.patch"
 
 S = "${WORKDIR}/git"
-- 
2.30.1

