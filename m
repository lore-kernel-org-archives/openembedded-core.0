Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4803EE9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 09:07:50 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8263.1771405668939500684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 01:07:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lDikgPhh;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-354c19bf64bso309580a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 01:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771405668; x=1772010468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1ItCFaLRvVYoaMAmLlHdt0L+Hzm4hoInY1jq02AAes=;
        b=lDikgPhhWvx29jTtxeM9PeWaFLwN3WCw5BQFOUni63wCLXYG5LYVRy5wzv6B/WcQ3o
         XJxCtxzWUmu6hwQ04HJMwURTS395Y0ccishui3Jt2vYj3wV7kuykaaxOc+NcLxglH+pQ
         lb1wrlbZbsYQWBZkb1y0Ur4lOlddAOapEinxtGzy3dV2Y5VrUFD+YAItApYZwcbdnm2R
         BjquiVrQwbkyj5FCG+/FAud3vVG26W6oQPsqagRQVgfcYBInhSxo5Q5S8xOpAhlQqQjU
         gQl4wPiS+Eza5gXn50oKqv3wBWQ95hKNX3THHDjI6+yzHgjwcElv06MoTtdmVpi/XPh2
         naEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771405668; x=1772010468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z1ItCFaLRvVYoaMAmLlHdt0L+Hzm4hoInY1jq02AAes=;
        b=M0EMzFaEskn4FDIuUa/5IzSKCTjPZrXmpNjk/6coH3pBD3FXcpDzSGwq9fEoTQwj7n
         VOUpoYJAHhRcxzTUbg8dtbqkokocFzuojjrFEjLvaSexHphhmkg1KT+unM4cD+yP4OMG
         GXTMLCE6EA9urXb5o5rQTqWYwP6/dcs+6sg4XVnfQXQR3oP5SHD97yTU17FnmqFax9Lt
         grKMBzfV9L253WIkdbUvwP9OtCJQ8rhrkJaS5DeU1FDyp69PiKc4MASXfIUDUaePYlVJ
         F6pHy6VWneM/RQ5+/9KD+7iAz2ECWXTkJvYj4HKgaQYQqqvXDPNTN5LM4B+WfdYETMOx
         lQZg==
X-Gm-Message-State: AOJu0YwaRBOo1wwkJzSHy4xQVesy6yjoCJvGlDgwwUP8AQ+2zBZAzBoM
	pSg9ZqahRKQbFuV95n7m+rYd4ywNspO1o80Oae7r0lggUDMScIeCDJRqt22K1w==
X-Gm-Gg: AZuq6aJbT4Cz/CJHU1iw+KNEBg/eJXh9vDRxY0Xv+bf5LYHANBgoCuPXLEGsFqdJQBC
	51HCsBRk67+/k+SbtI+VFbjOTyvoN+b68jQR+VV01Y6MvEeLmpRC4GJwRRDZs9ggX9rtAcsnO6/
	+k61bTZfj7fWk/heN60zAT74LfVefkFEv85QE4e9yi/K4xs9Lb5Yn7mg2ALdSiiO9svACdURAkq
	EykaCCPJwKrwOrLMfwJqZlTJ4gVUrz/YNlfCv0HVKgK0MrHEM6U1mbD35rpoCWT8o3584V7x1qF
	wYFG6PCCcyflnAGK2urtQ1C/OA276rF76FIcJ2nHM90TrZADlPK6Ykp1z128kPZMpfSUva95RZD
	KemdkNMBGHddZS5DaNqir21kurPrbxX6XRrq18QLLSJje8ioDGwNrq2NOjcloXlrAWKG34M0wpx
	N1e9VOQggktIcrVXlO07RRpf61cr8Qdr9Ve94=
X-Received: by 2002:a17:90b:1f89:b0:343:3898:e7c7 with SMTP id 98e67ed59e1d1-35888cef398mr939383a91.12.1771405668069;
        Wed, 18 Feb 2026 01:07:48 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35887899158sm957461a91.5.2026.02.18.01.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 01:07:46 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH v3 2/2] mdadm: catch sed substitution failure during install
Date: Wed, 18 Feb 2026 22:06:06 +1300
Message-ID: <20260218090606.3693584-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218090606.3693584-1-ankur.tyagi85@gmail.com>
References: <20260218090606.3693584-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 09:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231288

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

This patch is to validate a possible race condition theory during install.
Also fail the build if sed substitution still fails for further investigation.

Details: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16166

[YOCTO #16166]

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-extended/mdadm/mdadm_4.5.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.5.bb b/meta/recipes-extended/mdadm/mdadm_4.5.bb
index b30d3d776e..fec29828c1 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.5.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.5.bb
@@ -40,11 +40,21 @@ EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CWFLAGS="" CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${sys
 DEBUG_OPTIMIZATION:append = " -Wno-error"
 
 do_install() {
-        oe_runmake 'DESTDIR=${D}' install install-systemd
+        install -d ${D}/${datadir}/
+
+        oe_runmake -j 1 'DESTDIR=${D}' install install-systemd
+
         install -d ${D}/${sysconfdir}/
         install -m 644 ${S}/documentation/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${UNPACKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
+        # temp change
+        install -m 644 ${S}/udev-md-raid-safe-timeouts.rules ${D}/${sysconfdir}/tmp-file
+
+        if grep -q "BINDIR" ${D}${datadir}/${BPN}/mdcheck; then
+            bberror "Build failed: 'BINDIR' placeholder found in mdcheck."
+            bbfatal_log "sed command in Makefile failed to execute correctly."
+        fi
 }
 
 do_compile_ptest() {

