Return-Path: <marc.ferland@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id A57A9782EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 17:45:05 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id i93so13738023iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 10:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LN8bGVKBGTIax/8GiFPyQNiavebX7hXh49etnOl1Qek=;
	b=cUuPPfwOjxWB6BoKWWRMrv4Nnm/s012ZK2sW+OAXD3W3DApKoKgX9FczkAcIT3dB+c
	8rVEdKJTcjVbBe9HZebZjJNyfd/0E3Xdw7nwiOPpv/skkzNhNCzsG7pq2sIhw2AJipnl
	knaCz7fwUgOUQDOb9sUxcdlz0G9JxYxH5bsXucW/W/gFK+uTExJgqR7SeP/d46huU/EX
	jAcaBnkYhG+U9xWhYhwBd7eJRzivoMh1EVx0Qv06usTn8g22/5VFgM++bHm9vA0hdVev
	5ECBHwc1cWn2UEjvGP6bEYwdVaq60ItksPmqmLkSbD50ubVi5VhB3d3i7KloLrGYfjpS
	CRyQ==
X-Gm-Message-State: AKS2vOwdWpW27TDmFXTpTlQWd2xAsJNQHYbHTChPKXSR51fVNgozv35k
	AycuRq9vzga0xy+x
X-Received: by 10.107.181.22 with SMTP id e22mr1438231iof.85.1497375906584;
	Tue, 13 Jun 2017 10:45:06 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	b69sm2087134itb.23.2017.06.13.10.45.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Jun 2017 10:45:05 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 13:44:55 -0400
Message-Id: <1497375896-6369-1-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] bluez5: remove libusb dependency
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
X-List-Received-Date: Tue, 13 Jun 2017 17:45:05 -0000

Not a dependency since version 5.9.

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 01ade7d..5fc49f3 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
-DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck"
+DEPENDS = "udev dbus-glib glib-2.0 libcheck"
 PROVIDES += "bluez-hcidump"
 RPROVIDES_${PN} += "bluez-hcidump"
 
-- 
2.7.4


