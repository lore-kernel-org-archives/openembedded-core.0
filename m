Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A99497FFA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:23 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j42so2520486wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lblRdSqBFh55WeMufalNMo9UTBF0q35i4CqY9CvKHE8=;
	b=IliMEBYSr0W52G7hqe2w4KYpTxSc6R2e/sPpSCDwNTazKHyTw47v5N9yFCQuG5VFq5
	YVzvFdmbhMpr9S15Sou74JKaM73iIUlAOfEeM7YFyuu3fYgd+QyGIxaWB2DMAwT9Kl9p
	nGnFUE4b0yQJm+VoLMdnRRykrutSAL9sOinAMwf+dXU1IjhTAv5FN0FsLVVzaCndpkKd
	tSZkxN679uhxvD7zKjSUpAYhyGxNQYTqvWQX+B3IVMZRRwK8C9eaRTUsKibkz5B27ZM8
	Uzkm+PLNZFtSFxhVUBjUVhNYnb6NEGkZc/6NNVq2wWCqtXgSllD0GSb09Y8Pli+1NLaY
	p0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lblRdSqBFh55WeMufalNMo9UTBF0q35i4CqY9CvKHE8=;
	b=ToqSuNQ1rn98JQ9f30ZfP+JCYUgxpFBfbPeyOJCDGLgiRL1Hi8LjMBtMUdY+fovKdB
	Hq8YdAE6WckvZpkNrkzShZC7UmBALIodMFQyZ2gHDThfPIxpcQCUSTwxWYciu6TQrBQR
	j6Srug1VA9anbkUzydbrb3wq1fWHW1HWZYUrjOn1GkEpdeuYcId6+PStCK4cySYtGRg6
	nwYszcdoG6sEAGb1eNYXDuU8wimab/rTNhSkTBK+aN/Ki2XLYJt37v/grnpr9idMo09I
	Y7cP9aPlR5dCM3ImaPtwJoZG89LmFSPKjASH+XRpoQN++wIIkKm7vRAtdxWYKTQI/4lf
	yocw==
X-Gm-Message-State: APjAAAUyW2yj7s2Ry0dn1/9roypaDG1LNipH7KTztlpvZXqrEGjRhg2m
	eSBGltRSB3UpZac2SUXJlXvGGG357tM=
X-Google-Smtp-Source: APXvYqyjDAreDuuG86/QoIp7ANir/9yie8Or3KtYu+MBD/hGddoofIrM1oQzUjNcyRAAspK0xbswOQ==
X-Received: by 2002:adf:82f3:: with SMTP id 106mr3372524wrc.69.1576679904105; 
	Wed, 18 Dec 2019 06:38:24 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:57 +0100
Message-Id: <20191218143758.129308-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 24/25] libnss-dns: update to 0.14.1
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:24 -0000

Change SRC_URI to the new location, drop no longer
supported/unneeded options.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...nss-mdns_0.10.bb => libnss-mdns_0.14.1.bb} | 20 ++++++-------------
 1 file changed, 6 insertions(+), 14 deletions(-)
 rename meta/recipes-connectivity/libnss-mdns/{libnss-mdns_0.10.bb => libnss-mdns_0.14.1.bb} (54%)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
similarity index 54%
rename from meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
rename to meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
index 953505971a7..5e4460045b9 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
@@ -1,32 +1,24 @@
 SUMMARY = "Name Service Switch module for Multicast DNS (zeroconf) name resolution"
-HOMEPAGE = "http://0pointer.de/lennart/projects/nss-mdns/"
+HOMEPAGE = "https://github.com/lathiat/nss-mdns"
 SECTION = "libs"
 
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "avahi"
-PR = "r7"
 
-SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz \
+SRC_URI = "git://github.com/lathiat/nss-mdns \
            "
 
-SRC_URI[md5sum] = "03938f17646efbb50aa70ba5f99f51d7"
-SRC_URI[sha256sum] = "1e683c2e7c3921814706d62fbbd3e9cbf493a75fa00255e0e715508d8134fa6d"
+SRCREV = "41c9c5e78f287ed4b41ac438c1873fa71bfa70ae"
 
-S = "${WORKDIR}/nss-mdns-${PV}"
+S = "${WORKDIR}/git"
 
-localstatedir = "/"
-
-inherit autotools
+inherit autotools pkgconfig
 
 COMPATIBLE_HOST_libc-musl = 'null'
 
-EXTRA_OECONF = "--libdir=${base_libdir} --disable-lynx --enable-avahi"
-
-# suppress warning, but don't bother with autonamer
-LEAD_SONAME = "libnss_mdns.so"
-DEBIANNAME_${PN} = "libnss-mdns"
+EXTRA_OECONF = "--libdir=${base_libdir}"
 
 RDEPENDS_${PN} = "avahi-daemon"
 
-- 
2.17.1


