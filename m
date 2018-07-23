Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id EBA7374BFD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 11:51:26 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q10-v6so408224wrd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 04:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=E0o7lyiVW8aOls1/ArWtGMwmaG+5AuJ9DkJNN3kROfY=;
	b=AoY/8QLcmy1tFf3af1qFUhLp4zLk+8XAcEaqg9smINAuFefMNlfO7//r0njDH3hk9n
	I7rr4XpYIdqTHHwMkMNu6enu6VRY01BN/lN2S3J2CA52wzUNRH6WpgwZXX2xXxciJC5L
	r5v3LKiKb+X69V3I5O1IsvFfv9T4q72aLTef26uYSVsnQ+oyNlbMOEcTQxUsUS+uyG68
	P9cTcurETTPT/675bvzWpwZVO7L21q06Jlk7bZ4GpBCAy4V58llswNP/U6wAR8fWbPqe
	A4dqMAg67N0gXt0v5BvkemlEbhl36LDuV+N7h2Okzl1p7PG2878SDCQD/XDGCl/xgz+3
	9DwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=E0o7lyiVW8aOls1/ArWtGMwmaG+5AuJ9DkJNN3kROfY=;
	b=FjZQzx3T9S658uEN3GtjDamWtP2pBUvFv9E/zjQ0KQ9oPq+xAzoS4Iwth8moJUnH9B
	5oM6iEgARX1HKL19rYb0ukad5GdEeSlXyFC2v6q3rNifkuyx4Th7JG74v4c7KCwI/rST
	mh5QWNRwEUYxJfNq9t38zs0Uwe8DKJzGH4Agf3iop4vW491QhpeYAqOMKmnu/u/Dxblm
	9O1D2uiqPsNHVJgJHtwi/zywl2iIAJHE8pdrd0J4JiPcadPXgUYjcmUwptuvCZHft40h
	D4uWHLAAvy0o+JKbyyxyvVvZENqj3tDrw0s3gcJRJ2C26+XzE+jE3kCg4kiRTejVt3mm
	+fTw==
X-Gm-Message-State: AOUpUlHt1tu2UosGrpFhgkriAbwMEmCIZ3kzd9F0OJrwvbQlPH6Cc9C2
	xgWTn+W+m/gaX7pHxICGNMn6sf4olhI=
X-Google-Smtp-Source: AAOMgpdowQx63OqisaTakjkp64aM3iOxK0I8bSSq8Ihp2TpBTbjOGNPf/SbEbsLZN3e8vDHpAT/0lA==
X-Received: by 2002:adf:c891:: with SMTP id k17-v6mr8842846wrh.6.1532346687340;
	Mon, 23 Jul 2018 04:51:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h12-v6sm12861055wmb.3.2018.07.23.04.51.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 04:51:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 12:51:22 +0100
Message-Id: <20180723115124.27548-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] libidn2: add new version
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
X-List-Received-Date: Mon, 23 Jul 2018 11:51:27 -0000

libidn 1.x is deprecated, add the parallel-installable libidn2.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/libidn/libidn2_2.0.5.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/recipes-extended/libidn/libidn2_2.0.5.bb

diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
new file mode 100644
index 00000000000..aaf9ecd7e78
--- /dev/null
+++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Internationalized Domain Name support library"
+DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specifications defined by the IETF Internationalized Domain Names (IDN) working group."
+HOMEPAGE = "http://www.gnu.org/software/libidn/"
+SECTION = "libs"
+LICENSE = "(GPLv2+ | LGPLv3) & GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ab90e75ef97cc6318ce4f2fbda62fe4d \
+                    file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+                    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://src/idn2.c;endline=16;md5=0283aec28e049f5bcaaeee52aa865874 \
+                    file://lib/idn2.h.in;endline=27;md5=c2cd28d3f87260f157f022eabb83714f"
+
+SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "eaf9a5b9d03b0cce3760f34b3124eb36"
+SRC_URI[sha256sum] = "53f69170886f1fa6fa5b332439c7a77a7d22626a82ef17e2c1224858bb4ca2b8"
+
+DEPENDS = "virtual/libiconv libunistring"
+
+inherit pkgconfig autotools gettext texinfo gtk-doc lib_package
+
+LICENSE_${PN} = "(GPLv2+ | LGPLv3)"
+LICENSE_${PN}-bin = "GPLv3+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


