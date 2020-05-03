Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.25495.1588523203553201504
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JBe66eZ1;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id v4so13693049wme.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hqFykO1wrhZ76/mslNomz5BNg63ByDLUp0wtgY3vFdE=;
        b=JBe66eZ1j17e++7AwCgzggbbi2/Zeb50U2u3fXsqCs99Jg66iN5Kk5+n+saFP2P9JT
         LmyrF6F5keXSjOcbGBlleX4JJiL7C2M63Xc6ybffwkBZlsqjIXvaUGkPcOfl1tp0NSV4
         u35KffsiJ3DQsbBcD7depwDEeeUYMtlCbiRPx2U2BzjJit9yrj4V0Y976blIsxpuXW2O
         7LV2/IH8GD+UdBvFkZ/fvnhajCWeREjKkvC/+5wjYaZDEdjuxbIFnyxWZWJJehG3isRu
         SAQbsTwPbXPq1+2la+XS7t/jpxKB4QUY/SxQbO9xp32GaCrNIKgkFLic0eaVjSomreGV
         RUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hqFykO1wrhZ76/mslNomz5BNg63ByDLUp0wtgY3vFdE=;
        b=bCtx5pwmRDVI4/7/oA3lqVvg6JVOSaHZY7PBc7LnnnqgdhhPEt+zyvkgD4j7bFJezZ
         VgAfpK5+BnnXcmWb3a6e1qdWaNct0IGCVWuMCnSsQZdozWhAlvyxym86K5NzpsTZQHHn
         Mx6C/5eftY/UCL+XD3DIB00LLAickUEP5n9X50299Cnpbt/qYqyBtxvw+PPdkFQ1r9J5
         S+mBsdIEV9HOM/apeHsZVItmWBLe1oSLVnPGP5c3/N7KHYcjjCj3EOL1pVGLSo08qIJf
         KFeVuOaxMoQCdACKz36g67htdmiqxv6uwR/nZ8E/Vg4huJTWWXns4TDB+RezkmhuxXfp
         ebOg==
X-Gm-Message-State: AGi0PuakLw69vAJE8YXYK3jNYKxAv8CRJgFwKaTx0JVJNiWZ4aobZYeX
	zrdQn+DgO5UzF/tIaia0OZvTkrBO
X-Google-Smtp-Source: APiQypKCUwfi3b9741OUqjmc35yH0TIhIz4u3IJnHPJ3g7cUrnDteBE/e8eoes5hTOp9tnLsCTgrpg==
X-Received: by 2002:a7b:cc88:: with SMTP id p8mr9684814wma.108.1588523201786;
        Sun, 03 May 2020 09:26:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:41 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/17] connman: update to 1.38
Date: Sun,  3 May 2020 18:25:56 +0200
Message-Id: <20200503162559.946-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop a patch merged upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/connman/connman.inc |  1 +
 ...-gweb-fix-segfault-with-musl-v1.1.21.patch | 34 -------------------
 ...ve-musl-does-not-implement-res_ninit.patch | 20 +++++------
 .../connman/connman_1.37.bb                   | 17 ----------
 .../connman/connman_1.38.bb                   | 16 +++++++++
 5 files changed, 26 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman_1.37.bb
 create mode 100644 meta/recipes-connectivity/connman/connman_1.38.bb

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index d3eeb3be1c..b60178cefc 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -53,6 +53,7 @@ PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,kernel-mo
 PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"
 PACKAGECONFIG[nfc] = "--enable-neard, --disable-neard, neard, neard"
 PACKAGECONFIG[client] = "--enable-client,--disable-client,readline"
+PACKAGECONFIG[wireguard] = "--enable-wireguard,--disable-wireguard,libmnl"
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
diff --git a/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch b/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
deleted file mode 100644
index 30f1432cd3..0000000000
--- a/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f0a8c69971b30ea7ca255bb885fdd1179fa5d298 Mon Sep 17 00:00:00 2001
-From: Nicola Lunghi <nick83ola@gmail.com>
-Date: Thu, 23 May 2019 07:55:25 +0100
-Subject: [PATCH] gweb: fix segfault with musl v1.1.21
-
-In musl > v1.1.21 freeaddrinfo() implementation changed and
-was causing a segmentation fault on recent Yocto using musl.
-
-See this commit:
-
- https://git.musl-libc.org/cgit/musl/commit/src/network/freeaddrinfo.c?id=d1395c43c019aec6b855cf3c656bf47c8a719e7f
-
-Upstream-Status: Submitted
----
- gweb/gweb.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gweb/gweb.c b/gweb/gweb.c
-index 393afe0a..12fcb1d8 100644
---- a/gweb/gweb.c
-+++ b/gweb/gweb.c
-@@ -1274,7 +1274,8 @@ static bool is_ip_address(const char *host)
- 	addr = NULL;
- 
- 	result = getaddrinfo(host, NULL, &hints, &addr);
--	freeaddrinfo(addr);
-+	if(!result)
-+		freeaddrinfo(addr);
- 
- 	return result == 0;
- }
--- 
-2.19.1
-
diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
index 639ccfa2a2..942b9c97b6 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -1,7 +1,7 @@
-From 10b0d16d04b811b1ccd1f9b0cfe757bce8d876a1 Mon Sep 17 00:00:00 2001
+From c7734e1547db967eccf242fe4b9e8a30b9ff141c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Apr 2015 23:02:21 -0700
-Subject: [PATCH 2/3] resolve: musl does not implement res_ninit
+Subject: [PATCH] resolve: musl does not implement res_ninit
 
 ported from
 http://git.alpinelinux.org/cgit/aports/plain/testing/connman/libresolv.patch
@@ -9,12 +9,13 @@ http://git.alpinelinux.org/cgit/aports/plain/testing/connman/libresolv.patch
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- gweb/gresolv.c | 33 ++++++++++++---------------------
- 1 file changed, 12 insertions(+), 21 deletions(-)
+ gweb/gresolv.c | 34 +++++++++++++---------------------
+ 1 file changed, 13 insertions(+), 21 deletions(-)
 
 diff --git a/gweb/gresolv.c b/gweb/gresolv.c
-index 5cf7a9a..3ad8e70 100644
+index 38a554e..a9e8740 100644
 --- a/gweb/gresolv.c
 +++ b/gweb/gresolv.c
 @@ -36,6 +36,7 @@
@@ -25,7 +26,7 @@ index 5cf7a9a..3ad8e70 100644
  
  #include "gresolv.h"
  
-@@ -875,8 +875,6 @@ GResolv *g_resolv_new(int index)
+@@ -877,8 +878,6 @@ GResolv *g_resolv_new(int index)
  	resolv->index = index;
  	resolv->nameserver_list = NULL;
  
@@ -34,7 +35,7 @@ index 5cf7a9a..3ad8e70 100644
  	return resolv;
  }
  
-@@ -916,8 +914,6 @@ void g_resolv_unref(GResolv *resolv)
+@@ -918,8 +917,6 @@ void g_resolv_unref(GResolv *resolv)
  
  	flush_nameservers(resolv);
  
@@ -43,7 +44,7 @@ index 5cf7a9a..3ad8e70 100644
  	g_free(resolv);
  }
  
-@@ -1020,24 +1016,19 @@ guint g_resolv_lookup_hostname(GResolv *resolv, const char *hostname,
+@@ -1022,24 +1019,19 @@ guint g_resolv_lookup_hostname(GResolv *resolv, const char *hostname,
  	debug(resolv, "hostname %s", hostname);
  
  	if (!resolv->nameserver_list) {
@@ -80,6 +81,3 @@ index 5cf7a9a..3ad8e70 100644
  		}
  
  		if (!resolv->nameserver_list)
--- 
-2.5.1
-
diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
deleted file mode 100644
index 00852bf0d6..0000000000
--- a/meta/recipes-connectivity/connman/connman_1.37.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require connman.inc
-
-SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-            file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
-            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
-            file://0001-gweb-fix-segfault-with-musl-v1.1.21.patch \
-            file://connman \
-            file://no-version-scripts.patch \
-"
-
-SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-
-SRC_URI[md5sum] = "75012084f14fb63a84b116e66c6e94fb"
-SRC_URI[sha256sum] = "6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16"
-
-RRECOMMENDS_${PN} = "connman-conf"
-RCONFLICTS_${PN} = "networkmanager"
diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/recipes-connectivity/connman/connman_1.38.bb
new file mode 100644
index 0000000000..027c41e9af
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman_1.38.bb
@@ -0,0 +1,16 @@
+require connman.inc
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+           file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
+           file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
+           file://connman \
+           file://no-version-scripts.patch \
+           "
+
+SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
+
+SRC_URI[md5sum] = "1ed8745354c7254bdfd4def54833ee94"
+SRC_URI[sha256sum] = "cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b"
+
+RRECOMMENDS_${PN} = "connman-conf"
+RCONFLICTS_${PN} = "networkmanager"
-- 
2.26.1

