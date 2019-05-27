Return-Path: <dpfrey@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 792647E1F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 18:57:32 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id v11so9512915pgl.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 11:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MhZAepkUtTyej0/P+I9ZXP3YEdXSpu8eh0HJ/O8wL/4=;
	b=hdFb/M2+RnHb+Sow8ejYppmgFsHH2pixujlKvbqIS7tHWk5Hnm9/HYRJLxIhYzqEVV
	XSluC04r8Ir6mb2EP6POLWxj7bKgSwpnQHgnlpH+B0V3fOYlDlnyqHHAQYCp6CrHxcPa
	a89WKBXUc/tSTRGn9Zo1Kn0/bYrdiYW5aVjK9VVKJ0Ly4QP7s85Ba5pG7yBudWkpHjtW
	Z/P1OnoqQnVhEgqm2eyiQWgNAgXGw8MD8rhczLkX5h+wNjhQlBZHSO4ue6MnXND1DDG5
	h+u5CvKqzu+9MJ6W2GYzl0vYWQGAr/9JCA6voI5Y2Ppi9rI5pR81SfKJWDfXgn/PAnNI
	9r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MhZAepkUtTyej0/P+I9ZXP3YEdXSpu8eh0HJ/O8wL/4=;
	b=s7U+SPguPCrxv2Jh3bY6GUJicgDAUhhXyNTAm8fcF4TXSQggqBcrO6JXYViL3poRHv
	TcdN+jviOFDKR+26wcipArU/Rir1Qe8LuWD6XJtDtmHyEj9eeRbuxB8g+uUywD909Ib1
	bCKj+39RfaYBAMGkJU6pMDjQrQbIWYcS5la/raQoVdfIrPn3n723SUEM4kl8DdbMcpjT
	UBOLgl01R6buNLrf4mmsz/lHyKWD9ENXzZ5RPKMrH7gpPEzNsEiNMHmz31e3SwHO2yu2
	//zGVyMrS2VFljsAD6qEKO3yiM99LoXHw0J7YJqmTxh3PPD2nUDHUi5hQY2NQjOwZMi8
	FZQw==
X-Gm-Message-State: APjAAAX51VTXiT8EXcvuFF4rBnctXJdrf1Y9ISm+KxzxrN6KF+dDb/hI
	qkEN4r2YBqNEfDpibcWakXS5yECt9PM=
X-Google-Smtp-Source: APXvYqyzEADy/3o27r7tQCIfBRVOINC6/QZc3ip4e1obMA4s7466OTXk4KNE0wWIV6u+7ca/+AOK1A==
X-Received: by 2002:aa7:8495:: with SMTP id
	u21mr127479669pfn.125.1558983453394; 
	Mon, 27 May 2019 11:57:33 -0700 (PDT)
Received: from dfrey-arch-linux.local (carmd-fwm01.sierrawireless.com.
	[208.81.120.1])
	by smtp.gmail.com with ESMTPSA id j72sm198512pje.12.2019.05.27.11.57.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 11:57:32 -0700 (PDT)
From: David Frey <dpfrey@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2019 11:56:51 -0700
Message-Id: <20190527185651.24490-1-dpfrey@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v3] bluez5: manage udev dependency with PACKAGECONFIG
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
X-List-Received-Date: Mon, 27 May 2019 18:57:32 -0000
Content-Transfer-Encoding: 8bit

udev is an optional dependency of bluez5, so use PACKAGECONFIG to give
users the ability to build bluez5 without udev support.

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


