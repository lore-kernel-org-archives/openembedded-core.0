Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6E9557E43A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 21:24:17 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id g16so6082191iom.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 14:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cX/PwDcu3BlBEhhf+UA09NL5ofCrtbbryJA+7sWEkJ0=;
	b=ovKL/vIKYXYqbQ8j2HwE41KvSJVfT9yLxotlALYRSqw+rcyw0m4U+lu8yGqgEdsDwF
	XvwwH63koCZl37XHFY39htv9ex02wq5379z73pK95acTZNrHwspimXBjko0+rlixwYqx
	yQ1knXbMZDrDB/ZYLWK0XEaonOWOnjNHc3SmvmmdT8vFnudT13scLZfvwYx1IljZ76Ra
	dA5jv9P0RCi7sseL6F8b7g2FHO8Dt7rYX8mx33TYl4dlGyb50efhDddaCgxDwgPQPFyx
	dw8FPTgyt6HZlFsLmPkyDMzEbK/el5dQc/1lOWSBVDBluoShsRuk5JzG2hmAWMJnTtCQ
	Dbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cX/PwDcu3BlBEhhf+UA09NL5ofCrtbbryJA+7sWEkJ0=;
	b=t1Oz1lOEwwcUC/6NZXN3r3lsviRgjqxzEgTdhrbNJagD+k8xKkkf2r1FWE8l0tqjyS
	AFIFWCK4nbeGhwfkPHIsvnNxmMZ5ztazfwXLvb/UuuEiieQiTicUUwx2YkHYVJXIV7Ot
	pp1QhOsq3sDRaHf/5K1SouxGs6lu28Ya8yKjNYgFzLt7WrClwzsS+9UHq0qXySnmVE5A
	tIXdnEz8ir9aeyYFAetp60kOuoIJAlJKbkQpRafPv1185OiTtPu2hcKgfKjd1+ZldDFd
	2pfM1sYdxe7bsI0/DmY7JdZGvJMeI6cLUXK1nlG5CRrzdSr2mLp+ynhJbHr+Hqv+GWv2
	vRmg==
X-Gm-Message-State: APjAAAV/9lDjISVVBJUcgJbOC13Ktfmkn9hIuaN0O3vq1uhQ2bIvQuNP
	2kc93lpCh/2ttQmTJCN468TMemO0
X-Google-Smtp-Source: APXvYqzdEK0oWQG1Dc4cvMJbR7pcQeyisfpte+blF7lawL0z551djbFtVbu/ynkmU2ubj9F4HiivrA==
X-Received: by 2002:a6b:3b95:: with SMTP id i143mr7544577ioa.38.1558646657983; 
	Thu, 23 May 2019 14:24:17 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id 8sm282424itd.24.2019.05.23.14.24.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 14:24:17 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 16:24:06 -0500
Message-Id: <20190523212406.1921-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] avahi: Add PACKAGECONFIG for libdns_sd
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
X-List-Received-Date: Thu, 23 May 2019 21:24:17 -0000
Content-Transfer-Encoding: 8bit

Adds a PACKAGECONFIG option to enable the libdns_sd compatibility
library.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 8339e451f5..94fe6a16b6 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -36,6 +36,7 @@ PACKAGECONFIG ??= "dbus ${AVAHI_GTK}"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
 PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
+PACKAGECONFIG[libdns_sd] = "--enable-compat-libdns_sd --enable-dbus,,dbus"
 
 inherit autotools pkgconfig gettext gobject-introspection
 
@@ -77,3 +78,9 @@ do_install() {
 	test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
 }
+
+PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "libdns_sd", "libavahi-compat-libdnssd", "", d)}"
+
+FILES_libavahi-compat-libdnssd = "${libdir}/libdns_sd.so.*"
+
+RPROVIDES_libavahi-compat-libdnssd = "libdns-sd"
-- 
2.21.0


