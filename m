Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.5046.1614213554923405106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 16:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q/INi4gf;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id u14so3589423wri.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 16:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0wxiRYTJa0X3hPJ6CVft1/ie26YbfefQLgh9k3nzTeg=;
        b=q/INi4gf+pBbzMbArRNIlEfxlDonNNCwzFD+3PPKcf+GQl1VKpDo7/asP2e8hw2Tas
         +6IjAPkiWnZ/k57SX5CtyUfUSqEiVR0n0PEfo7i7uCJvyFe9aeT8k68mTUYHquaqaDVn
         WA3qz7JZqE8YVZu8DVgrFCAQJ4tNBHWmUjPYw+0VRHe7C3B9kgiojmmTy8XoIccOyJ1f
         WBW1UunB94+CNOEhbOwnAeoc95lhvV1e7lPCnmxJ72A9yXuv+HGvJYMwxUNfdrrQBH5R
         Hi5xgHfCsXlYQyLXrOCpbluqYtSwfN6oVPA1Y9ovgkHjIGZYjxqEMYsUi/a72lJdCMx2
         9s1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0wxiRYTJa0X3hPJ6CVft1/ie26YbfefQLgh9k3nzTeg=;
        b=DeahR3sKhbRqNGK3qRwaBzPP8f6aGzo2vWzgyTp8ruGLdf26ec6/vvr5b5voDXrr3Q
         BQTxfi9X+ZryRTmLwWKnJlQEwXmd21EpvKkl3vq4XAsF7opiUhq6+qiwQkjp+GG0yOyO
         t5ffT4jtB1sgt8EU0wHip5uprBHPDlqWFm3ctX6n8uOkTtG0cUkGAfz0gNrWsffZ/1iD
         P0SdSxnGBbOV4OlCvY/B786jVwvtFPzaXi/9KN78KMvWXr52uTBHHZgljPglseWgdemu
         yAn4DWmASml4nC3FUsQAEWFbi7S0vQUHX61Dtcve1OZbhcPNFf6+3cPlO/WoTxRf0/q/
         3YfA==
X-Gm-Message-State: AOAM533nEIJ3CdTx05d7khZ1w2z3EaLALQi8c88IpDSiNtlRZ4wojVuu
	4rPhvuNQSPJC4JFy/hOLskFdpJRBIjs=
X-Google-Smtp-Source: ABdhPJyxKb/zoWlzke+bE0GGBpV1TcqdSCjNBEpxYZepl/6hdGEQ6FAVKWsliwKdmeYjMi2Z0aTASQ==
X-Received: by 2002:adf:e802:: with SMTP id o2mr579030wrm.133.1614213552956;
        Wed, 24 Feb 2021 16:39:12 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.99.217])
        by smtp.gmail.com with ESMTPSA id a1sm5965962wrx.95.2021.02.24.16.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 16:39:12 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 2/4] meta/recipes-connectivity: Add HOMEPAGE / DESCRIPTION
Date: Thu, 25 Feb 2021 01:38:59 +0100
Message-Id: <20210225003901.18196-2-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225003901.18196-1-dorindabassey@gmail.com>
References: <20210225003901.18196-1-dorindabassey@gmail.com>

Added HOMEPAGE and DESCRIPTION for recipes with missing decriptions or homepage

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-connectivity/bind/bind_9.16.11.bb                   | 1 +
 meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb      | 1 +
 meta/recipes-connectivity/libuv/libuv_1.41.0.bb                  | 1 +
 .../mobile-broadband-provider-info_git.bb                        | 1 +
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb           | 1 +
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb   | 1 +
 6 files changed, 6 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.16.11.bb b/meta/recipes-connectivity/bind/bind_9.16.11.bb
index 3b76a1f5cd..f48cc74c2e 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.11.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.11.bb
@@ -1,5 +1,6 @@
 SUMMARY = "ISC Internet Domain Name Server"
 HOMEPAGE = "https://www.isc.org/bind/"
+DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "MPL-2.0"
diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
index 5e4460045b..9a83898e52 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Name Service Switch module for Multicast DNS (zeroconf) name resolution"
 HOMEPAGE = "https://github.com/lathiat/nss-mdns"
+DESCRIPTION = "nss-mdns is a plugin for the GNU Name Service Switch (NSS) functionality of the GNU C Library (glibc) providing host name resolution via Multicast DNS (aka Zeroconf, aka Apple Rendezvous, aka Apple Bonjour), effectively allowing name resolution by common Unix/Linux programs in the ad-hoc mDNS domain .local."
 SECTION = "libs"
 
 LICENSE = "LGPLv2.1+"
diff --git a/meta/recipes-connectivity/libuv/libuv_1.41.0.bb b/meta/recipes-connectivity/libuv/libuv_1.41.0.bb
index ab06a43d21..4987331dc8 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.41.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.41.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "A multi-platform support library with a focus on asynchronous I/O"
 HOMEPAGE = "https://github.com/libuv/libuv"
+DESCRIPTION = "libuv is a multi-platform support library with a focus on asynchronous I/O. It was primarily developed for use by Node.js, but it's also used by Luvit, Julia, pyuv, and others."
 BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 7dccc15e03..f170cf4650 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Mobile Broadband Service Provider Database"
 HOMEPAGE = "http://live.gnome.org/NetworkManager/MobileBroadband/ServiceProviders"
+DESCRIPTION = "Mobile Broadband Service Provider Database stores service provider specific information. When this Database is available the information can be fetched there"
 SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
diff --git a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
index b5f68951d7..b0097aa480 100644
--- a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
+++ b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Enables PPP dial-in through a serial connection"
 SECTION = "console/network"
+DESCRIPTION = "PPP dail-in provides a point to point protocol (PPP), so that other computers can dial up to it and access connected networks."
 DEPENDS = "ppp"
 RDEPENDS_${PN} = "ppp"
 PR = "r8"
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 7cc03fef7d..2aedafe5ca 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Client for Wi-Fi Protected Access (WPA)"
 HOMEPAGE = "http://w1.fi/wpa_supplicant/"
+DESCRIPTION = "wpa_supplicant is a WPA Supplicant for Linux, BSD, Mac OS X, and Windows with support for WPA and WPA2 (IEEE 802.11i / RSN). Supplicant is the IEEE 802.1X/WPA component that is used in the client stations. It implements key negotiation with a WPA Authenticator and it controls the roaming and IEEE 802.11 authentication/association of the wlan driver."
 BUGTRACKER = "http://w1.fi/security/"
 SECTION = "network"
 LICENSE = "BSD-3-Clause"
-- 
2.17.1

