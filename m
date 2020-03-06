Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id ED22561B19
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 09:35:16 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a5so1597658wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 01:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9ydeIHkd4pMJPNaqAcRcosv2KgrVDSGfEOp2D5z4jXI=;
	b=Kkh7SKSZbfCyoftdylRPdQVKVQqwIqBbXxVjHYoKmNPEoodIkHQ/iC1EvW9j/A7PIc
	docuRXaYFMolMjvM4eMxcAY6af2N8s1q92fp3KvOVtX4M4D60KUgPWop5K6x38YbnKoS
	aC21x5/kbpNpBEU6FZwH2qrf4+X8AjVlmKNWiIJhHu5Ufu8fvlaiPrytc6gGeD5mRXfp
	E9W7wu74phiqa7RTmyvSH0C/ydDkJDclxigDT1kIaUqhDXefnETbF+Tdz3kbpl6Y8X7V
	LNsTnv7ROl9/xe7E92F+o6M9vmIe5FInFBr/CCLbi3q8N751UKedkMQLNh4LhHcTx8x3
	RdJA==
X-Gm-Message-State: ANhLgQ28YkO/SF+JcRNqwlFvw1cPSHMBqXR5NSsvgmthBAIFfR3pZ7qk
	r+naAp0UPko3EBuTiFlk1KN2QGOp
X-Google-Smtp-Source: ADFU+vti9tZ5trtk593/XX/jTyHmkHWXkK6l6ubBNCNBe9Azx+ghSfodNBWshi7DDwvQ0qCgIZLDtA==
X-Received: by 2002:a05:600c:24b:: with SMTP id 11mr3037848wmj.1.1583487316703;
	Fri, 06 Mar 2020 01:35:16 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	12sm12921480wmo.30.2020.03.06.01.35.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Mar 2020 01:35:16 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Mar 2020 09:35:14 +0000
Message-Id: <20200306093515.25244-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH 1/2] linux-firmware: drop remnants of pre-2.6.37 support (TI)
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
X-List-Received-Date: Fri, 06 Mar 2020 09:35:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that this recipe uses make install, we don't manually
create symlinks for firmware files for older kernel in
do_install(). As such, the FILES statement can be updated
as well.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
index 6039dc9d71..798e2b5c7c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
@@ -512,15 +512,12 @@ LICENSE_${PN}-ti-connectivity-license = "Firmware-ti-connectivity"
 
 FILES_${PN}-ti-connectivity-license = "${nonarch_base_libdir}/firmware/LICENCE.ti-connectivity"
 FILES_${PN}-wlcommon = " \
-  ${nonarch_base_libdir}/firmware/TI* \
   ${nonarch_base_libdir}/firmware/ti-connectivity/TI* \
 "
 FILES_${PN}-wl12xx = " \
-  ${nonarch_base_libdir}/firmware/wl12* \
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl12* \
 "
 FILES_${PN}-wl18xx = " \
-  ${nonarch_base_libdir}/firmware/wl18* \
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl18* \
 "
 
-- 
2.23.0.rc1


