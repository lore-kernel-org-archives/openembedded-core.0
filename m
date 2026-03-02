Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775E6D58E45
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 00:57:40 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150544.1772413051515270330
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 16:57:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JWQcYmMB;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso17543575ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 16:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772413051; x=1773017851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVZLrhSwL7BG1NY+c6ZChX18m++ZoUBzMJb76hvX0nE=;
        b=JWQcYmMB3bfoJ6SVks1VcswFUJYxYlGRNeINHf6ZliTaEgbUc2lOFdTJETljW1IvXy
         eIE0poggMpbVQJzkPEQFC6cOpkEwJEZByR0+Bp+TBEUfHBNqXI3BS5Awr3fFiRhMwUSb
         41g59m8rvFLfNkEhfNcRskoGyS0xNbecWl4rdcztVKrngnueoSlGS44BqJ+B+vSFWBwR
         fA8TgYWpTFNyBlFuvCdlIy8h5FkIp/LYn3LthAYtH+6y+t4kSdFRAQGE/czH+mCcrOyg
         3xcoLe4n5Didx+GviSmg90u/TMGLHlq6gVz3xPqtIcklEF+Y/oeabOwVPTeCr3B0J0Am
         iMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772413051; x=1773017851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yVZLrhSwL7BG1NY+c6ZChX18m++ZoUBzMJb76hvX0nE=;
        b=kt9esUquP6hn0p2yHfc0G6CfvpsxrsiMKh/KaPkQU9k9m2xNik2OV+IOE9YEBxlALh
         CD0fplbt3E/+2xtVRidIRLHNehsSVvgdzOmZsvFOqt2Wis+vX+xADpkE3+a4Fjdxvs8J
         U3axlq6cgkRor+lfmRHgK2lvNP9le0Q91h5TOc1ohoW0FlhNJTS8Gjrb0aeBmVXnAOAo
         rQ4qZIMvH2iV7ZrN3IO6uUkl8/1LJYB6F3iG1BgB5VopxVW3RCVwze22ru9Yk6ty+3CB
         6vKhcG3p+tkwgpaCOjSNlRCMYJpR82wGvi/DJutczwlLhahfIgyh+1p5/ybritCDqOwz
         /b2w==
X-Gm-Message-State: AOJu0YzGQp0LaANHhOW5d6NRS9snKtChlzitNTnKNcXbEgsTJQUPFTri
	WNEV0tE5Ohka9FHzcUjf6nrP2DdpGTN4YOYoyKd17ZFKwowth8dXW+FAnZiXHvra
X-Gm-Gg: ATEYQzyvKSUcgrWPR7lfFAP9eyAwJ6fXXvnD9hXwQh8vVtOiOC/8ve1BaIcDEXHSJl0
	nExUVriUNpjlDpnn9w4hk5p+n3UDhZ+khddQw3917uehqsKU804aI7GBX+wDbriSAs0lqo+1OxS
	lyQwxyebEe86XbZvQxC9GFSkFl5VoARYA8ZeWK2uGGEmY8Oi+gTWcwQqf4MICWqc62v05cNeAVC
	EjeZynB2R+9lSWT/RSmkTwAVKR4cKuMKk4flZy5My3ozteK6Wn+jAdEjdXNatEqqvYp8i73LaQU
	E2vnGtOGcvDPcEY1SsWBRoD8K2p80l9jQm4u7ZD/XHsBYdzImZukHEgAYdr+5mlvB+WNGaR7n8S
	sgOI9fz1x6AIKgewT7XukdSvnZEs+atwW1RyRQ4hEU0+KqmRgr96dnIWj3H3tL105zs3am1YoUk
	39xJc/kpNyrJLZJ4P6l6IqZM/jE3W/nC5Os//2Q61NlYMU
X-Received: by 2002:a17:902:d592:b0:2ad:d0ff:2ed4 with SMTP id d9443c01a7336-2ae2e3e3c91mr95665895ad.6.1772413050694;
        Sun, 01 Mar 2026 16:57:30 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3e4e34fesm52107355ad.28.2026.03.01.16.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 16:57:30 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH v4 2/2] mdadm: catch sed substitution failure during install
Date: Mon,  2 Mar 2026 13:57:09 +1300
Message-ID: <20260302005709.2026373-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302005709.2026373-1-ankur.tyagi85@gmail.com>
References: <20260302005709.2026373-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 00:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232157

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

This patch is to validate a possible race condition theory during install.
Also fail the build if sed substitution still fails for further investigation.

Details: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16166

[YOCTO #16166]

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-extended/mdadm/mdadm_4.5.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.5.bb b/meta/recipes-extended/mdadm/mdadm_4.5.bb
index b30d3d776e..5bf58eaaf3 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.5.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.5.bb
@@ -45,6 +45,13 @@ do_install() {
         install -m 644 ${S}/documentation/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${UNPACKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
+        # temp change
+        install -m 644 ${S}/udev-md-raid-safe-timeouts.rules ${D}/${sysconfdir}/tmp-file-2
+
+        if grep -q "BINDIR" ${D}${datadir}/${BPN}/mdcheck; then
+            bberror "Build failed: 'BINDIR' placeholder found in mdcheck."
+            bbfatal_log "sed command in Makefile failed to execute correctly."
+        fi
 }
 
 do_compile_ptest() {

