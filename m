Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.12826.1614955756722145943
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LnesoJuc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id o38so1521288pgm.9
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pc0uy1tAHaUEhzNcD1VcyiCNtxNeoIBh9Mq/6AtanXA=;
        b=LnesoJucK5vudm+sm0Up+wzADl+WlzIhSK8sVG09AeqRg4mUwDabLjV/YXTe7nX7U9
         9X0FAkFuz4SqENGfTmu6zseSz6VhCGwXLqZo6R0CuHW81qzr2K5kJEN7cCV9Hg607Ehu
         tHSC/RZMBUiasxrdv6wNet9TrKgWVuaaYb/Y24J0JPy7tq9gW7aeUbE91WjV1dIsORwc
         wE1FeTWp+nxJBj3t82JMUHJ6Nq8NBHXA9KFkudNoE2VCondw8fI+dueDkrEb8PREaNun
         xcTzZaTszsPqenSdWxzN6tgBDVXBvstYFMtpRipkHCSvl7mr49ehw3e0yE5mjib3WBEb
         7S4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pc0uy1tAHaUEhzNcD1VcyiCNtxNeoIBh9Mq/6AtanXA=;
        b=NZ4b2BIOq3n6/SgHtJD86UNAlpQgkJBcKrFOPltwhN7xOXnin//CDFpH9OnNk+WfQg
         UxD2h9l9+icYVUQkPvA46gckVl7th2D9Lf159OoAkBcTcYHodijnBC+1LVPy1hDC2owx
         pQ3gGYBVqmcU5rminHDuBP62yFEGKS/gfKgwslEQd4qzVg6EyDst56Z4WwFSeSBCqpWD
         7eL/c/W+po7ExQDuO4sdihg7g4q+VZnPwmBsW+Og/apYTNEjuCbXG/8+wXyRvCurbN+j
         X5uZsFpi2QO/phB+QYndqbYVIozCniueP3HI/iICmmN/8J9vEfAHhqm+feCatbVlRAxS
         3mrA==
X-Gm-Message-State: AOAM531x2gGbOODtGKiqcCRh91klksHwan3y73wWOZJaooGlepP6nD+X
	tI7AfTJiqY848ap1flOJKm3Vg6aM14Ekdc4/
X-Google-Smtp-Source: ABdhPJyAE6resSUGPDc/4vLzonqy04cY7gKnxm/3ypUf4feEhfXeeV6UCmLKbHfLhFmU6BtNKQbG3A==
X-Received: by 2002:aa7:8758:0:b029:1ed:c13f:f645 with SMTP id g24-20020aa787580000b02901edc13ff645mr9508356pfo.50.1614955755801;
        Fri, 05 Mar 2021 06:49:15 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.49.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:49:15 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/27] meta/recipes-connectivity: Add HOMEPAGE / DESCRIPTION
Date: Fri,  5 Mar 2021 04:46:34 -1000
Message-Id: <a2658937bcb987b061cd9866d726d9d66623e93c.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Added HOMEPAGE and DESCRIPTION for recipes with missing decriptions or homepage

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ecf8922e6bb12a2facc59bbe794b575101fce1dc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bind/bind_9.11.22.bb                   | 1 +
 meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb      | 1 +
 .../mobile-broadband-provider-info_git.bb                        | 1 +
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb           | 1 +
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb   | 1 +
 5 files changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.22.bb b/meta/recipes-connectivity/bind/bind_9.11.22.bb
index e3b9cacc15..5598ba976d 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.22.bb
@@ -1,5 +1,6 @@
 SUMMARY = "ISC Internet Domain Name Server"
 HOMEPAGE = "https://www.isc.org/bind/"
+DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
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
index 85ac28d881..caa6018ce8 100644
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
2.25.1

