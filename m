Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.10034.1614349541395803662
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sduCbTP9;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.54, mailfrom: steve@sakoman.com)
Received: by mail-io1-f54.google.com with SMTP id f20so9767458ioo.10
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Aos4az4NylEyZaD3LGhcKzrqL3SnnKDicmFrt2I2FRI=;
        b=sduCbTP9GfSPucXIj7PkGs8G2JOnLWAqylErmcg/zxF7+oJmC6t2HHQsu1uhQBtgaY
         XPa4t5GcN5foYbmFM7nrklv/fPmJ4Xh7uVo7hDrJu9HX7OACl9rrevi8Cl3dRzU/KLRX
         LDs0o9YqPvryMf5yXNQDog4W/EGpyuVyflXb9t6wPNr68/WwwYRIoXlNwGLT5Oh/CzkD
         aLjk2ios+Iiky28GVUb3VJljv5Z4fAQkhSchh1UouNisw+LKm3YfKNhUqpN9vJpI4PYv
         OlzLERFWm0FyVix12gPn7t4CbQLNG+IYpFZ4jnSErrxcu9+yrp469j2DKkryxW4HfOsY
         mWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aos4az4NylEyZaD3LGhcKzrqL3SnnKDicmFrt2I2FRI=;
        b=pSMzC0hfHAgGZjicE6n/dToJyz7pg1he3W1S9IIA0IYmmvhicd3Dk0ybfvUOu0iXqa
         6slBC2REjcB9DElkyONuzE30w/O5vN+Uw5PgGF3rzobAmR4imNOTZ/ZAjyAa9xAHP0W8
         u/joK5HRnyp3BE80Rl6SYEOctmmX8DppfSaroFJRLYRgsW7MarlMzNDZUvNbGE6+gmbi
         /NGcbZJ1zm27L2VCymeVw1TqAkeTd9IEoIPWzf+GSprBFNWH5Kdw1xu7CK4yn8BKVdOA
         m09idmO6jCXiAueS+C64/B4b75EehZI4H3eCRfCAcZxD93f9SQa81yUfByODrXd/LU/V
         gC9g==
X-Gm-Message-State: AOAM5321lu/maPUK8ziNliLKfhv96tym9tJrD0yx+rz1KOcA6xSQtDmO
	gGsvZmWXBASHRLXyIDThVH9k29u3zIz07pko
X-Google-Smtp-Source: ABdhPJwRAZf0w/EmRGb5JUzfJf9SFgPIIyIJ3I5+2m03ZhhCwTZxZTG6hZ4T7GFAMvVOGJzm2Qm2tA==
X-Received: by 2002:a05:6602:81c:: with SMTP id z28mr2479122iow.66.1614349540134;
        Fri, 26 Feb 2021 06:25:40 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.25.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:25:39 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/40] connman: update to 1.38
Date: Fri, 26 Feb 2021 04:23:51 -1000
Message-Id: <34fc02967491450208fa7ae509532d2883a87adb.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

