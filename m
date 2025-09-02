Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9791BCA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 06:09:35 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.70880.1756793367762892526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 23:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gIgUZkqX;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: dpmin7@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-327ceef65afso4979153a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 23:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756793366; x=1757398166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l3V+8Sj8erM3Zi1oZ2iaNBEA983YuweznBNYcqvONY8=;
        b=gIgUZkqXCxkPNlsHMracgs9xEPZfTKpGy/xah+3F9yVzo0929qJW+d19sYcbdRHByh
         WgSdSLC9Gegacw9huQLWA8j0Am2PFVQ5QuKoECnwVWohcBdQ3/gFibrQQ9S0xm/3+TGs
         XFgEB1EXAfHQUAOY1ajwKw1jE9DW1lo8hcxuywviOIymFSE9INFumRyr2ETng/JjlS4u
         gBHu49niMxkh64042Q2yalasKgqFcWrT2O3VzQZawwBfWvQMDy01haPqHkLUYFEh1vAP
         jc1gfYUUi3sxjpjR4g1bO3nLOlu123CgNaIBSdUldZtAN44d51tYZ0IamiNBLtZIOLWZ
         up+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756793366; x=1757398166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3V+8Sj8erM3Zi1oZ2iaNBEA983YuweznBNYcqvONY8=;
        b=PilelY53d7CuksxZEEKX/tHC1gIGSTQOvlfwMyNCZVW5LZg+xCSsZOktLQhResZBVO
         eGj8xmcCu0VTXLYV+rmqRC/+A+frwzhCGgtmHNfgeqAEo9MZzX+xWyJ31+HWFQ30O1D6
         0tY9LbZrccx9CB10UAcYSWr5Ru5Hay9vvX7+4jZQ6rp2etz1SEQp6V7j0Qtk8KSRSR8C
         X0LOulnlrMWGBR7zliE0E1UMUyhsKx8pggWyNPK44gio2E0ttiPXrfx7B87rMXlhF9bJ
         FLCAa66akpDRZUTJ14aUyEgdhUCS/J2OoIOf3qOsmDNF+CH6vHzW0TmkWRYpN3bGlKdV
         yt0g==
X-Gm-Message-State: AOJu0YzWMKJvLpBUxXw+HZLJs4b6VcdxIvpDCtK31dS458lvxfsVn9Uh
	Qud6vImUt+gz4wwZpSvEa+10ws+zSNE70jKEThOUu/A61GTiaEoAjWkCc9dv4Q==
X-Gm-Gg: ASbGnctyv9GfYQI27yWxJZMCLE03R4ThznvLfXK7leQPQcEpLgIaWA9m/v1bzVGpA+A
	4ZSisKUvUEi4B81vrAGeFF9x2YA1wZTh7P0t/zie3+NcRtcvUc4DY42pteGo1mGhbgB1hQ6iD8C
	ZRtywz1xSOtDxACHNSRV3q+iBQhEfH14yokgJ0qmSghs6foAnwkPCNMHPVGF0E4yCvHZhm0uvdd
	oq1mHkDWy5mzMSF2YsYp2dv+BHOjkjBROpdpRwsGnDu7wSdm22LvuPrb59KOYuFXWl/AAa5/kMP
	Ym4kDIzl8uR3CI3n0UGLIl/2Eltv/T7UkU47/ja4gou1Fa0+DCSB/HofoyBqcsg0F/25Cnmx2NP
	5DRb865bw84dhWTHed2P+5w==
X-Google-Smtp-Source: AGHT+IFldGLB1d4ZyHsZrU69FWbiROwOx3wjLVCJyLF42m4ZWpjjqYI4Nk3LzF9p7Bd+kh0ykJnEUw==
X-Received: by 2002:a17:90b:3d92:b0:327:be52:9675 with SMTP id 98e67ed59e1d1-3281531ff76mr12404905a91.0.1756793366469;
        Mon, 01 Sep 2025 23:09:26 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329a3d672fesm2299209a91.5.2025.09.01.23.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:09:25 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyungjik Min <dpmin7@gmail.com>
Subject: [scarthgap][PATCH] pulseaudio: Add audio group explicitly
Date: Tue,  2 Sep 2025 15:09:20 +0900
Message-Id: <20250902060920.1689794-1-dp.min@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 06:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222707

From: Kyungjik Min <dpmin7@gmail.com>

Since pulseaudio-server requires the audio group, we explicitly add it.

When use useradd-staticids or do not use the default group in
base-passwd, an error will occur because the audio group is not defined.

NOTE: pulseaudio: Performing useradd with [--root
TOPDIR/tmp/work/cortexa72-poky-linux/pulseaudio/17.0/recipe-sysroot
--home-dir /var/run/pulse --gid 998 --groups audio,pulse
--no-create-home --system --shell /bin/false --uid 998 pulse]
useradd: group 'audio' does not exist
ERROR: pulseaudio: useradd command did not succeed.

Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
---
 meta-selftest/files/static-group                  | 1 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index f7a66de24d..c59f9e3019 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -27,3 +27,4 @@ render:x:527:
 sgx:x:528:
 ptest:x:529:
 xuser:x:530:
+audio:x:531:
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 1ab3831519..a93ef8f338 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -146,7 +146,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server = "--system pulse"
+GROUPADD_PARAM:pulseaudio-server = "--system audio; --system pulse"
 USERADD_PARAM:pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"

