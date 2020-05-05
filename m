Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.7164.1588683726794774650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Edp+V1Xg;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id v8so2456663wma.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lByorvlEDjuwJY/z1f3dw+6oOROlDnV08xAjcpARKtc=;
        b=Edp+V1XgF5xtRZozFY8ApSnYCkHWVci709yH7YdDFIt0FU7s6edZ70gA7mDd1fPnkZ
         ie8d9UWLMVVXNaA8XqfYHtIm7JpbMB70Ym1pYYkbFKSh2uKvGFAC84wuFWxmp/3GI+1s
         2LyZae3dLfQ0szqjRwkFZfWo3qnCpYgr4+wEMNukqUm+HFT9Y8jL1nY97dDwQxnNAnPz
         nsVdi9v3DP0PA3g/4yE82+5gPzjxV10ppf9W/9EgGEa+MSNmjsKUtw9OLR2apTOWe8/i
         sinz7QqhhqcQb9UkiNmZE4+Q13Uy3LjwkxBOuxv5fs6GIc/vST/2zGFP75fJNrNzA9Em
         JR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lByorvlEDjuwJY/z1f3dw+6oOROlDnV08xAjcpARKtc=;
        b=Oc9l3R14i5eBRsRajvVmp0uiXChvkUq9WHs00tMLeTn+kgq0iTRhDHwRJA9s+MHC+X
         EiGCPO6J0C1ogmTRnE9+IqxQOaCHOyVGB2n/tH4pz8PhdEbAMBTCmC0Llnq/hUwYEhaP
         5XgUyKMRSGkxCwly7RE4s7wDQL449KqSUxJid3A/XY5lhUekBgrMt5cfwiWJWthwV544
         nrOYLJziLRjyT7kIXfxoM9On3tEXdVbfkXchDEKWxAfUJXGYoBw8KkRM0lqje4yjE4BO
         Uwmqy1+Eq9edEdtf8pQSLlapKfTZieu/6x1ZAEM5NjTcCVt7588Fy/BjP3aSdqNjNJO7
         0TLw==
X-Gm-Message-State: AGi0PuYzettkZlqy7DkREwOfe26+YBNgKEv7xHHZPPBF/SJVVV7yGPup
	bVaKwf3cZDhY7y9e4S5nEylq+ecE
X-Google-Smtp-Source: APiQypL3TDY6Ij3ImHNz2DQVdt0f/HoSM7OhpjiEZfnUA3i1JSI0wPo6ALBY8phomcNUI/AVCvGTvg==
X-Received: by 2002:a1c:68d7:: with SMTP id d206mr3021136wmc.29.1588683725032;
        Tue, 05 May 2020 06:02:05 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/24] avahi: update to 0.8
Date: Tue,  5 May 2020 15:01:13 +0200
Message-Id: <20200505130133.24930-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../avahi/{avahi_0.7.bb => avahi_0.8.bb}      | 20 ++++----
 .../avahi/files/fix-CVE-2017-6519.patch       | 48 -------------------
 2 files changed, 9 insertions(+), 59 deletions(-)
 rename meta/recipes-connectivity/avahi/{avahi_0.7.bb => avahi_0.8.bb} (95%)
 delete mode 100644 meta/recipes-connectivity/avahi/files/fix-CVE-2017-6519.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
similarity index 95%
rename from meta/recipes-connectivity/avahi/avahi_0.7.bb
rename to meta/recipes-connectivity/avahi/avahi_0.8.bb
index b25cffa3cd..f4924fa1cb 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.7.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -20,12 +20,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
 SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz \
-           file://fix-CVE-2017-6519.patch \
+           file://00avahi-autoipd \
+           file://99avahi-autoipd \
+           file://initscript.patch \
+           file://0001-Fix-opening-etc-resolv.conf-error.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
-SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
-SRC_URI[sha256sum] = "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
+SRC_URI[md5sum] = "229c6aa30674fc43c202b22c5f8c2be7"
+SRC_URI[sha256sum] = "060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de798fedda"
 
 DEPENDS = "expat libcap libdaemon glib-2.0 intltool-native"
 
@@ -37,12 +40,15 @@ PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
 PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
 PACKAGECONFIG[libdns_sd] = "--enable-compat-libdns_sd --enable-dbus,,dbus"
+PACKAGECONFIG[libevent] = "--enable-libevent,--disable-libevent,libevent"
+PACKAGECONFIG[qt5] = "--enable-qt5,--disable-qt5,qtbase"
 
 inherit autotools pkgconfig gettext gobject-introspection
 
 EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
              --disable-stack-protector \
              --disable-gdbm \
+             --disable-dbm \
              --disable-mono \
              --disable-monodoc \
              --disable-qt3 \
@@ -59,8 +65,6 @@ EXTRA_OECONF_SYSVINIT = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--wi
 EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
 
 do_configure_prepend() {
-    sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i ${S}/configure.ac
-
     # This m4 file will get in the way of our introspection.m4 with special cross-compilation fixes
     rm "${S}/common/introspection.m4" || true
 }
@@ -85,12 +89,6 @@ FILES_libavahi-compat-libdnssd = "${libdir}/libdns_sd.so.*"
 
 RPROVIDES_libavahi-compat-libdnssd = "libdns-sd"
 
-SRC_URI += "file://00avahi-autoipd \
-           file://99avahi-autoipd \
-           file://initscript.patch \
-           file://0001-Fix-opening-etc-resolv.conf-error.patch \
-           "
-
 inherit update-rc.d systemd useradd
 
 PACKAGES =+ "libavahi-gobject avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib avahi-autoipd avahi-utils avahi-discover avahi-ui"
diff --git a/meta/recipes-connectivity/avahi/files/fix-CVE-2017-6519.patch b/meta/recipes-connectivity/avahi/files/fix-CVE-2017-6519.patch
deleted file mode 100644
index 7461fe193d..0000000000
--- a/meta/recipes-connectivity/avahi/files/fix-CVE-2017-6519.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/e111def]
-
-CVE: CVE-2017-6519
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From e111def44a7df4624a4aa3f85fe98054bffb6b4f Mon Sep 17 00:00:00 2001
-From: Trent Lloyd <trent@lloyd.id.au>
-Date: Sat, 22 Dec 2018 09:06:07 +0800
-Subject: [PATCH] Drop legacy unicast queries from address not on local link
-
-When handling legacy unicast queries, ensure that the source IP is
-inside a subnet on the local link, otherwise drop the packet.
-
-Fixes #145
-Fixes #203
-CVE-2017-6519
-CVE-2018-1000845
----
- avahi-core/server.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/avahi-core/server.c b/avahi-core/server.c
-index a2cb19a8..a2580e38 100644
---- a/avahi-core/server.c
-+++ b/avahi-core/server.c
-@@ -930,6 +930,7 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
- 
-     if (avahi_dns_packet_is_query(p)) {
-         int legacy_unicast = 0;
-+        char t[AVAHI_ADDRESS_STR_MAX];
- 
-         /* For queries EDNS0 might allow ARCOUNT != 0. We ignore the
-          * AR section completely here, so far. Until the day we add
-@@ -947,6 +948,13 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
-             legacy_unicast = 1;
-         }
- 
-+        if (!is_mdns_mcast_address(dst_address) &&
-+            !avahi_interface_address_on_link(i, src_address)) {
-+
-+            avahi_log_debug("Received non-local unicast query from host %s on interface '%s.%i'.", avahi_address_snprint(t, sizeof(t), src_address), i->hardware->name, i->protocol);
-+            return;
-+        }
-+
-         if (legacy_unicast)
-             reflect_legacy_unicast_query_packet(s, p, i, src_address, port);
- 
-- 
2.26.1

