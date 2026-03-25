Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2F1103A993
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:19:49 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13726.1774405188076245123
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=A5WdpKnC;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82a67ce6969so1389634b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405187; x=1775009987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIVlfFh56fqMqm2vD+8JES+hSTdrw3XCZfJkF9Nfjdo=;
        b=A5WdpKnCPFPd5zXjMurhkl3Cd7fScL47LkM02BvSrNqiEJ+8x9nadWLJ0X5kGY7fwS
         Ql/AR7sGL9ikkdxTzXi2LZc+2EP/MTe+ulckKOgEkcR3uoNnbO6BR4VoTdk0FcPnJnIj
         YKHMAjvKp4EdyWJ/Lt1TAH9pFaT+ektgTq76+51avehYBcz4fnD1b01MAekCcEbo9O99
         cZvatLtZ1OgFX7NV5tzbm2Sddtqxr1WxfmXnKqhrAD88i3vEn1vK0H+oYNLMz8RNr5Bw
         QL3fVo3NrrpgH6Xm98NDkXxa15LkBwNJjNo6TM97SLUAmw+BXQmAiAtjoA7Fmour4Tbn
         cqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405187; x=1775009987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EIVlfFh56fqMqm2vD+8JES+hSTdrw3XCZfJkF9Nfjdo=;
        b=jQloNQxDnBh/sQdhZmZMTswgcsLz+1D5cmrzDo/2ZolT/tNa3xirmY3FwhGY2W6xuN
         eDc19gX+T5OQ6W3y+Tjw+FH3qhNE2sZnM4I10dTKg6q9cba6BmyLcOq8eg2MAmo5GlHY
         04eOD6s3xhL1Gf1h2Oya3i9NBzVYGPeYZgcHABM77YaDneOmzAbMP5TK9z14j2+6QHdD
         dx/N80bhC8Qnlq3Un8uCdQp8PUndUyKgYMgcDSkq9J+Z+62flzDJLUnP1ybJ+6B5AnP1
         poDtIPkRT5/9vtHN9QHiwKoWt/TRNovZGCc/fyyppl/X2TlyWqHfoN4janQVakAXgLRp
         WUBg==
X-Gm-Message-State: AOJu0YyAimsicb8IB7pENY29IborAUBAdAqJikKA+DDqk0sUuw2vY7Vp
	ZgZgo8WxwE6MUMQxNy5ih+9yz5m1m6TmvTMbrT4iKPa/kee9H3ylrRfhfo/Oe6Za
X-Gm-Gg: ATEYQzxOxedVoVnQb9xAfKKsoAzuesQj8PQHhQTkbtiUkmZpZA2F3SqpwTuMBuVJzVu
	c+Blngey6z3u615HTejcKQeJ4boKKmTyHRyA+7DggpePxL/3+wtUB4tlb5p1z5WS2GuhIoddWZF
	Sg8LNymOFZm6lJdqpvPAWKAX5nO/BdBtv20/E85LUAPQEOxhpFhw6qqUfUKbK5wKmSrUUuZ2Gz0
	E3SGe/x0WJ14xWoeuwcTaScFbRAqjIqFzFCbr8nvJtVULrHrsH9bmzrTytxcunwJcM6v5cgfPkQ
	PNc9ThbkasVQAi8hotq4FK1lpSXbO+eujUT8H3twEtJdpsjnC2Ge4U3LsXNo16jw2oV7X7Mdxw6
	cpU2qP/smN8GTmaazn4CugVDmPcAXV2Fy3GOXfPe98jtqnamJTJ1VDCP9By6vi61dWgqCuShlZO
	8v/OxdqrJHxD834vNPA3aWu6CFJ3d3fqzy9L0=
X-Received: by 2002:a05:6a00:428e:b0:82c:2480:4e8e with SMTP id d2e1a72fcca58-82c6e0eaeb2mr1680089b3a.59.1774405187366;
        Tue, 24 Mar 2026 19:19:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm13581235b3a.31.2026.03.24.19.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:19:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 07/12] seatd: Create seat user and package systemd service
Date: Wed, 25 Mar 2026 15:18:51 +1300
Message-ID: <20260325021856.4053666-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233845

From: Khem Raj <raj.khem@gmail.com>

With latest version seatd does not work properly if
user access permissions are not correctly set, therefore
create 'seat' group and package the seatd.service file
and enable it by default with systemd distro feature

set logind to systemd when using systemd as default init system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 26746a02fc94b569f633d581b27a8634cfba38f5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-core/seatd/seatd_0.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core/seatd/seatd_0.9.1.bb
index 3be27dda9d..f9f72c9e82 100644
--- a/meta/recipes-core/seatd/seatd_0.9.1.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
@@ -34,6 +34,8 @@ PACKAGECONFIG[systemd] = "-Dlibseat-logind=systemd,,systemd"
 do_install:append() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
                 install -Dm755 ${UNPACKDIR}/init ${D}/${sysconfdir}/init.d/seatd
+        else
+                install -Dm644 ${S}/contrib/systemd/seatd.service ${D}${systemd_unitdir}/system/seatd.service
         fi
         install -Dm644 ${S}/contrib/systemd/seatd.service ${D}${systemd_unitdir}/system/seatd.service
 }

