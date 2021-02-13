Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.704.1613176137825736921
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 16:28:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C/1VIxKr;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id o63so703781pgo.6
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 16:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TvaRnaEo5ifgzVuhlcXJ/q5gbiH+Ul/qAeK47t/J22M=;
        b=C/1VIxKrAe+nzcMl0Cx1WBlKjrFf8sgl2KMl6NN5683aWxapDUMHVUN+dw8CEzjgrZ
         RnVU2v0VQqPBQYHoghn7EZUMg4cacGyfNLhqkBDiY9LIPZ2G1pNX114vHSSdDdzAJara
         llL/9nSIg4fEw20G2YxjPzQ8GShijDQIFdrJDg1i8ivK/pmnDWI0LqJE79XmXd42x6Ew
         6aLjfmIEILIRCdKolMfb93Ht5KsD2Oi/FZpQWgBxEFVJ6rpzkTDCldQeYgrEX25bl9Yo
         hQTDZnU1sXHN48xeKtb/BwXBoQ5TeaLlA7MMAU6BAG3S9rCOGfeh2ogIFdJn67Vm59k4
         BgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TvaRnaEo5ifgzVuhlcXJ/q5gbiH+Ul/qAeK47t/J22M=;
        b=o2bSgodPQBLmyfOUuB6VtfE/LYuFNumWTYw6Ah2NY+EmY+7gggJheMPxkqX0nteO1b
         sPJacrHF27rjwIv6hFU+O91/IReOw4jarHYmkujApsJuuomjll4p+SkVX1zol7kIbbkW
         1dbPt5Hz2ib2PKww3If2jiMHoylKH5n5q5RIKgeeSTLP5TjnQY4b7xgvxO20jDAM29cF
         rP86pwwqestYUR8efy0JTWDi22mOkbPbidBA60jf4bBTUL82KE5IylPjMBHP/n1ChB00
         Kj4H4ebwUZqeXhl2v7cd0kM583sQHoBUglWaLID4LAmdk/l+RxruGkFJYqpTAqc7RC2x
         gnQg==
X-Gm-Message-State: AOAM531XThYmbVmpe0sGhBafitPtcU9U23U23SR/Eb8Sbu8ZFt+Y1Pmc
	Jf5qt896EJuvLswJVgpLP0ClpmHmNlME8w==
X-Google-Smtp-Source: ABdhPJx9B03fBkU0FW4kKib/YblFq2KM/g/UUvUjoiKK7KEINwv+oJKT87TGzJuq7o9SK6X3HNMYBg==
X-Received: by 2002:a63:ce4b:: with SMTP id r11mr5534247pgi.148.1613176136889;
        Fri, 12 Feb 2021 16:28:56 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:55f8:e3c0:af8d:902c])
        by smtp.gmail.com with ESMTPSA id q18sm10875487pfg.72.2021.02.12.16.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 16:28:56 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/2] connman: update to 1.38
Date: Fri, 12 Feb 2021 16:28:54 -0800
Message-Id: <20210213002855.24536-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Alexander Kanavin <alex.kanavin@gmail.com>

Drop a patch merged upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ce2948af5293258a69a9cfefba9e883cefecac87)
[ 1.38 changelog:
 Fix issue with online check on IP address update.
 Fix issue with OpenVPN and encrypted private keys.
 Fix issue with finishing of VPN connections.
 Add support for updated stable iwd APIs.
 Add support for WireGuard networks.
 ]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 55e5bf97c7..7888bc2c1b 100644
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
2.17.1

