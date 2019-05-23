Return-Path: <dpfrey@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4729E7DE82
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 16:41:53 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id r22so675911pfh.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 09:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x0de4xt0Fr5fb+WCGC5QL00acksUmsrktBWluxd3TbM=;
	b=rZJyQqX1aRsbmiQutEHt8pCUs+XCztrCzX3yeT+MjdpTwL/KTpxrrKlAp7+vn6k7LP
	Beg0Nq/qDTdE3ZiSsvrmZERtG8dKOZAHJaJFoWbqDSZAC2igDQt358CxRNl5SbZUoqKN
	cEafpCzPhbMd0E1pDYBGClgF548vWm01+N6As2zazH7A27xhGGjaAP23dpWzuEDo3nEw
	fn9KvTVHVNPnn6fRAjfdtGGLXGA3LefVcbLFYG9E5I9+sc/0dVXegbWaXNaD5uRuM6oN
	llLN/u2+SIACMotaHE/3NrhFAvlRKOH7Kwse8CLoRDn3ZT2gmUC8LW+Iy/OnYKL9FZUg
	XFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x0de4xt0Fr5fb+WCGC5QL00acksUmsrktBWluxd3TbM=;
	b=jHnUM8jf2KjasYTesU6aIxOzal+LbT4M942Tg8QiMpDlglyT8unMplBDHO8blQOWE0
	NTjcbuOWihqBaDYJyXp8gYDCA/TS490FZTrcgBtG9uvZl81ZfaFO4dSFx4M983hLI9/S
	0xvTGTwIpcidhh2rrRyIgetNulA6yQ7QHq7De/lauKtk/Wc8VohCzAbicfPCfAn0W9Dy
	OHaiCKXtcIe0eHasjqT2yjZ1KIMScIuZmiibMwCoaG/m4jGtX0wnu64POW9K3bPQAou6
	bwPfMDjzX4o3bEPTY/GA4X4yprjFiJkjRxRFp9SIr2XcWY5WTvlxjS3mngj3I74ut79S
	quOQ==
X-Gm-Message-State: APjAAAUaOi0+tlKtBJ7r2JQV0WmANmDNdx+dHFUTXXhGvP+qkaVj2FPa
	a2WNiq91oPWZjA99NNNH3Qx5Jp4e
X-Google-Smtp-Source: APXvYqw0AVGmGHILahntO0jvZQNyFiPPo1WtaoLx4zNAW41BwdwswbSPBiPUASI0PuTYmDm1hlpAJQ==
X-Received: by 2002:a65:63c8:: with SMTP id n8mr238452pgv.96.1558629714062;
	Thu, 23 May 2019 09:41:54 -0700 (PDT)
Received: from dfrey-arch-linux.local (carmd-fwm01.sierrawireless.com.
	[208.81.120.1]) by smtp.gmail.com with ESMTPSA id
	q4sm32364467pgb.39.2019.05.23.09.41.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 09:41:53 -0700 (PDT)
From: David Frey <dpfrey@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 09:41:21 -0700
Message-Id: <20190523164121.20983-1-dpfrey@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2] bluez5: remove udev dependency
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
X-List-Received-Date: Thu, 23 May 2019 16:41:53 -0000
Content-Transfer-Encoding: 8bit

udev is an optional dependency of bluez5, so use PACKAGECONFIG to allow
users to decide if they want udev support.

Signed-off-by: David Frey <dpfrey@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index aaf2af975d..93d1b4d8b0 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
-DEPENDS = "udev dbus-glib glib-2.0"
+DEPENDS = "dbus-glib glib-2.0"
 PROVIDES += "bluez-hcidump"
 RPROVIDES_${PN} += "bluez-hcidump"
 
@@ -22,6 +22,7 @@ PACKAGECONFIG ??= "obex-profiles \
     hog-profiles \
     tools \
     deprecated \
+    udev \
 "
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
 PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
@@ -43,6 +44,7 @@ PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
 PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
 PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
 PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
+PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
-- 
2.21.0


