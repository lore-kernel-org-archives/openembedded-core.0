Return-Path: <dpfrey@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 56BDE7E3A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 21:55:50 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id w7so1703939plz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 14:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B4FDbs3Tuzn+FZOnT4uvAhUI6Atf/FQEYxT5a2nAtRc=;
	b=dFcqqwYFU9Ft1d4F5WsbDDHtNDUR4O1UYeW3hiog5Vfv1PhvvOrQna2WUo3qgVVY7v
	bQjYBjF972ECBD1G3OriTwS5vceMXlR0RbNDX17zPqt+Zq6rTfKVQDahv3uMPIIkGl8X
	WGdojzsuWKHFchz8gNN9ES5zPycqB78PnfBqUWWPnluC7LpxnwBuUa0NTl/juHcIvmT5
	qVDEUeaQpqsZdZJPeGzHeu7xsNc8sKaXYjrfLm5JoLS8EVnyE21PIQ/HoB0aZX4cCeYN
	gHm59ToXdhBv5XK8EgxuJqkzyj6KeU1hkmuTM97cuIBea8GWbZinFeTuhUxQzJ4XipyE
	irFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B4FDbs3Tuzn+FZOnT4uvAhUI6Atf/FQEYxT5a2nAtRc=;
	b=san4uireXhYXZOBGhKku4oQnCzOa1i7E2JMfpshqby1XaenpA+4rJp9e0sXC+VSGVN
	2gz3+eUuYdvGN5kH6bN45pmjS4yuHewdPm4bQ9ps0j7IpW4FHEQPqg4IpNuMnSj5c0Rp
	VAiBJCxUPm+Sx1BNaRhLUP3hlDiSUnLScQ/PYb64GGlDGnAOr4yluVfSuVwajgQGZsMJ
	xNaqaAx75uuiLt9W4K1gEEb09yruhzLje4DKX58koEI+WHTxn6o322FzJF4VSHF+8+Yf
	h5VrjRSzcpHPdl3xONlq0lzp5AFRQvOXUANDzOj+Al5wI1qmcQyvaridi8kOC0a8OPFf
	ci/w==
X-Gm-Message-State: APjAAAVl7BBDleNAIWpdqq096a6jeu+BaMRZ6RWDSdxRaS53tMfhjGtM
	FcCv69Y3z5gwYW3zZAimZZQd8qYa
X-Google-Smtp-Source: APXvYqzG7DqdpfEL2cDY45SpQ+4xuH4UQl50OeT0iXprYxdbLmnFSHEzgmwkPasUtMNde4Y5l/4nNw==
X-Received: by 2002:a17:902:1621:: with SMTP id
	g30mr51927937plg.326.1558562150908; 
	Wed, 22 May 2019 14:55:50 -0700 (PDT)
Received: from dfrey-arch-linux.local (carmd-fwm01.sierrawireless.com.
	[208.81.120.1]) by smtp.gmail.com with ESMTPSA id
	p16sm8995536pff.35.2019.05.22.14.55.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 14:55:50 -0700 (PDT)
From: David Frey <dpfrey@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 14:55:41 -0700
Message-Id: <20190522215541.9689-1-dpfrey@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] bluez5: remove udev dependency
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
X-List-Received-Date: Wed, 22 May 2019 21:55:50 -0000
Content-Transfer-Encoding: 8bit

udev is an optional dependency of bluez5, so use PACKAGECONFIG to allow
users to decide if they want udev support.

Signed-off-by: David Frey <dpfrey@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index aaf2af975d..568de86d6d 100644
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
 
@@ -43,6 +43,7 @@ PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
 PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
 PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
 PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
+PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
-- 
2.21.0


