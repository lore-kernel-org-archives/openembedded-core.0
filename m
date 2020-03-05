Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 440C661125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 20:27:39 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id a5so1728wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2020 12:27:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5pynMjU5sUUTeCyHzIzoq/J0iW6t2Mn1KhWYs3aOj08=;
	b=HvNQneKU3jgGwZSpMMjqwzHPqDLFQVStK2xvlBpu9SMq7i8V/IdqGrgjecYN4pA19f
	cEE9fZdFR0lcqc3SbWNnqrnyR/tb6DCmBNd4lkGOv0Ol4OBeOOZseWb6aVdAZTyhjptZ
	sVN66/myP1m+VNwrI0bc7m4IhmwL13lFy+q3ac2Rb1ggrdwTsnIvULWwyDguZBESJOpy
	B4BylPQwnmSZow53qX5I/6gKIQMqVBvf70hsTYpO3VadNw3h3nmVtE1pi/6RIy8OHSZ9
	vdy8NeMmV4v/NPFi5pp1HSIR9dx9lJ+H/6SxLY/+xt0df6OtISqpuCeMebCdvqHqkqvr
	R/RA==
X-Gm-Message-State: ANhLgQ3Vpb3Tal6qdrr+SQf94CCJ7+OIx6Z1TLddxtSRvpHuK9e/kDPH
	Ine9oaIk5416PnXAQZvhd84+9Yqd
X-Google-Smtp-Source: ADFU+vu9uUTHyONBxsa4Ji7buBGizCQKMLCV77OpNehZH3J/3j6iiHsbEelagqqqWwGKLEe9kOdZbQ==
X-Received: by 2002:a1c:2d88:: with SMTP id t130mr602756wmt.68.1583440060397; 
	Thu, 05 Mar 2020 12:27:40 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id x9sm4694889wrx.0.2020.03.05.12.27.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 12:27:39 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2020 20:27:39 +0000
Message-Id: <20200305202739.21127-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [master-next] linux-firmware: install / package all license files again
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
X-List-Received-Date: Thu, 05 Mar 2020 20:27:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This doesn't happen with make install, hence all the -license packages
are missing, since they'd otherwise be empty.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index f7198cb56a..6039dc9d71 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -209,6 +209,7 @@ do_compile() {
 
 do_install() {
         oe_runmake 'DESTDIR=${D}' install
+        cp GPL-2 LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
 }
 
 
-- 
2.23.0.rc1


