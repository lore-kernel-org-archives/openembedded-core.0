Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DF1FC731C5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:26 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n205so11551847wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=RyDsVw4a6ceiBmkhOp2/9SI6135JM6yd/6e9hg8YJq8=;
	b=rPRjtT4o+faFqSNvHu5l36W3w+hTM9dksAZ1F7mm1byAXrC3IvhAtX6MCvsHYKoh+P
	5N0xJmmlBTLf7bF/8GnbfckwdmuuWKp4huGyM45E+Jn4AY/1nEuEwJuZ2dx2pnmbFvvl
	sn360uc32ftj4HKrhFg9ynLxx3I4gbWMHmoZHJJ/j+/2WhBm3D1vlKt6eKF3SBFlTTCY
	tHMM9IA5R1u0MfHufvdfGhwiXRwPiBjjO2PFWaTIl4SvOLw/Xtgc09sHgXE516WrNxo8
	6L+NUhW/VxrTFNBQd0jg9DWtZ/yOjAqoSUnD5nBvz6jonrcopgHoah/rvlaJ7vjHLm2p
	Fgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=RyDsVw4a6ceiBmkhOp2/9SI6135JM6yd/6e9hg8YJq8=;
	b=f9UYwn4RXz/G/ttWDqLEzcHLmkvj3ExEDW78PMgwUNwzXqzKCkrwsuF7SVVojkyx20
	z+wku8epaVLi7coocJ4pTy0en7AJ+y0p/LDws5Wb/77O9C8fUbAXBEVZh6kBo/lRA+uI
	B4YU7VcO8JYKpaNqQYzYPzP3pgYAreiP8qxIV+bX0rYfckPNa5ldMc0Iv/t37MjHe6Q1
	7iT4X5IpeFPB6ja2HoJLU9WMpF86q6TjKEDd70CCq431ULMUooSucjiyChQmQNp/BN2L
	Cn4OGJwUIFsHrDlBNL340oei26CtIDoXC8a0QA3DLBZBFqUiswNgIErQoOczKbgAuRW+
	Y8Sg==
X-Gm-Message-State: AD7BkJJpqcobyBPZp9+/UKaS1zQI3S4vkHMl03R1MGjl1jGfcc6EtYcFQvdI049dnstgcw==
X-Received: by 10.28.213.66 with SMTP id m63mr14371634wmg.2.1457896527518;
	Sun, 13 Mar 2016 12:15:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:26 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:39 +0100
Message-Id: <b48f02bf19197d554b0ca52216f79c9913c60083.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 41/42] systemd: Remove usage of systemd_unitdir
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:27 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-core/systemd/systemd_229.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index fcb22a3..f422d15 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -260,7 +260,7 @@ do_install() {
 		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		echo 'f /run/resolv.conf 0644 root root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
 	fi
-	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
+	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${nonarch_base_libdir}/systemd/systemd-sysv-install
 }
 
 do_install_ptest () {
@@ -411,7 +411,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/init.d/README \
                 ${sysconfdir}/resolv.conf \
                 ${rootlibexecdir}/systemd/* \
-                ${systemd_unitdir}/* \
+                ${nonarch_base_libdir}/systemd/* \
                 ${base_libdir}/security/*.so \
                 ${libdir}/libnss_* \
                 /cgroup \
-- 
2.7.1


