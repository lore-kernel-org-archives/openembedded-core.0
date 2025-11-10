Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D282ACD13CF
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 19:14:50 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.695.1762792224387670472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 08:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VdHjpkW2;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: veereshkadasani88@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-9486696aafeso300068139f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 08:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792223; x=1763397023; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mlVAeJ0s4jX5Z/vfkY3v5P/DFKvbZGFe7D2oKIIp1A=;
        b=VdHjpkW2/9ioyQ39MDeDG7BMjefAOir8RmkEB/CNFHfTu/Utl3ulqmxf31tu2nE5Q4
         EUmH9Tp00/jGVmIlyFaNgcqk/Fma0wJmKKwBFCP9GMenE0k4FhJRkNl0pWEg114T6hil
         qjyAc2NafEBS77OmBXM6l5zDwnwuUBJnxvpP+/8ESlNsj7JYToODnziSgb27TPTf3ue2
         Ad+4g2K5OpdfMqn4SHKDFWOwUXZ3z0P9Ijhsue15OakjZZnLCwiiP6DYXMjovuagRKqn
         nkZqwJyn/vGJJ0sEdB5FMekrBI9vEHXREMyguTpJ4AL4pMGWFIOptu+lc/xWeKM9+as/
         mhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792223; x=1763397023;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7mlVAeJ0s4jX5Z/vfkY3v5P/DFKvbZGFe7D2oKIIp1A=;
        b=govgCabgWmcNfFr3/UVy16Q4auVrKAHZU/Aw8ex2fahBeMdAfeRYV58ZQtth0z8prz
         xjluwhdRdwZ+g4IXe0CB6mhbd0YaCVWCurT74nfrXlXkdj5GBDGnwUrnpp6yarwA1fdV
         6wLgCFqRuh9LN8rMbTM0jMzPt0oZhXb18wtVl/HPFevrcw75Cz6SYzsYWF3V1s+IHKDA
         phxvo9b/B8jQgjKPcAYgmt+u30USGlvVCE8qlLjqt+iWctDUd+S86t1xPgxySRQqQqQk
         4hP8E607SbzrLc5val3a+HOO+lT0iwaanjiMy2KfqGBSWL3L3pNu0BRK8cL9VNHwQDJX
         0Q+Q==
X-Gm-Message-State: AOJu0Yz+cGC9jHhTVrufojibvgnaHI5f1CClkrzz58v3MRcr9PzM6AKL
	oPAm02iJ0iViUAoZabG4Utq570LBtwg5ni0t21Tux8pGETZvwsGlUc1WQbuZcw==
X-Gm-Gg: ASbGnctrLIWF1o/CwIcCc3Rf8jXGQY7C6IjD4vair0fPFCveLSObiFvPwtyByJyRUeG
	QP6cI9f+M9TOKv1rPk2B2Xl01b2n0uDQiGYVRAO5XgLgEay5AmhBMsGxtg7pNFP61RJgOxsl/iL
	fMJO4Sb0iiPkH/18X4nrLjYmFWhQLSAmsAckTLS+lRLIYpL9625f+fzYvs51F6zBKUoN4ofbd6g
	NWlIg9O77rg3L6eaIbDwyhT4XG/7zyaipzxae8C86ZXQxEUhd6SZQnCVkeqUwhUDj0zce1omb/4
	/yg7olbHbOYAob9wCMJBnC94k8HYS9IHmbhyY/Lp2SagvO5N5nAtqCITZnI845pmCTCeZBkCRgN
	KAGkfqtGYDuzKpWxtaWAIsVRkQB71S/lLNg52gQD2VfSEuJHI9T1NPo6/df/HPJNo2g+wuZsRK3
	3NIpoheEJNcgTl7beVN6XOvxNNV6pnIARJpW/wxVWBWQg=
X-Google-Smtp-Source: AGHT+IFLS5yDxzEMJaV/quR0F2zyOUqldVi3UnKgNG1MVZFSe5wlG/fqTuG+m+jwhzyVUdEqAwe61w==
X-Received: by 2002:a17:903:25ce:b0:297:c889:ba35 with SMTP id d9443c01a7336-297e56be1f8mr71098745ad.31.1762791817182;
        Mon, 10 Nov 2025 08:23:37 -0800 (PST)
Received: from localhost.localdomain ([171.76.81.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096dbe4sm150609415ad.11.2025.11.10.08.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:23:36 -0800 (PST)
From: Veeresh Kadasani <veereshkadasani88@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Veeresh Kadasani <veereshkadasani88@gmail.com>
Subject: [PATCH] weston: Clean up PipeWire backend configuration and dependencies
Date: Mon, 10 Nov 2025 21:53:31 +0530
Message-Id: <20251110162331.6287-1-veereshkadasani88@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 19:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226187

- Remove redundant -Dpipewire=false from EXTRA_OEMESON.
  The -Dpipewire flag is already controlled by PACKAGECONFIG[pipewire].
  If 'pipewire' is not in PACKAGECONFIG, Meson will receive
  -Dbackend-pipewire=false automatically. Setting -Dpipewire=false
  unconditionally in EXTRA_OEMESON is redundant and may cause confusion.

- Add pipewire as a runtime dependency in PACKAGECONFIG[pipewire].
  This ensures the PipeWire backend is properly enabled and the
  runtime dependency is present when selected.

Signed-off-by: Veeresh Kadasani <veereshkadasani88@gmail.com>
---
 meta/recipes-graphics/wayland/weston_14.0.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_14.0.2.bb b/meta/recipes-graphics/wayland/weston_14.0.2.bb
index 451fb961a1..4e13a5099e 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.2.bb
@@ -31,7 +31,7 @@ LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'lto', '-Wl,-z,undefs', '',
 
 WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
 
-EXTRA_OEMESON += "-Dpipewire=false -Dtests=false"
+EXTRA_OEMESON += "-Dtests=false"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms wayland egl clients', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
@@ -90,7 +90,7 @@ PACKAGECONFIG[shell-kiosk] = "-Dshell-kiosk=true,-Dshell-kiosk=false"
 # JPEG image loading support
 PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
 # screencasting via PipeWire
-PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipewire"
+PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipewire,pipewire"
 # VNC remote screensharing
 PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc libpam"
 

