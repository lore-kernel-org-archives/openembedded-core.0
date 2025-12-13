Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000EFD5AE4B
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 09:59:58 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2853.1765619991335834946
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 01:59:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q9p/9PDD;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a099233e8dso2057245ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 01:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765619990; x=1766224790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvR4YJbw0iXZ5tVtRl1dhnylD7Yqd0oJTbFpEVBRo1A=;
        b=Q9p/9PDDPRAMnXqufisgBFftBkLPJvPVghhj9oUe9/ZLNup5ERwtIUrUjXgpjiBvWZ
         JlUsTC8kX+8ziI5O/Q/oFboLe0GVFO2NMiMd2TkE/QVNQme4gBCu4g+094X4tfYu9OnV
         nZtcXStHrrsnndRErVNXBKTsvv0+ykSXQ4SfeAbrWGyb1M/h1kcoijXiirmwks/LWe3h
         C9zvfWSgoXWpOrkOn7vs3bwhT+HAQe4lAgk5vIkTBRKqfytLZ2OnrMbbqoGApkB3GAwn
         1vM17SCNx0UdxD9sfLsLH5gPBwXn8EwUnudsdJxUNlOmvp5aGtId7RxYvO6YvknJ1qPN
         gqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765619990; x=1766224790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VvR4YJbw0iXZ5tVtRl1dhnylD7Yqd0oJTbFpEVBRo1A=;
        b=WNCM/Rlkrl5udpJpwsis99hz1eYtsmR3eMWHIfnDB4VUh1/Mmqfm0Y5TLYHSNMQTIQ
         +/CtfRPBtZV0h7jIBu35/1JHJq1ktkSSK6n9yW+3Ie1/hKdyo7TWfp0ohnw2bQbER5ua
         IXRskb+DzPSJyIU/akH8n9vjDdz7WOXAR/U1G8F8zfUawdZr5KU8H4OpWcvp7evHe+PR
         dJQza/Ja93UZQEz+4BZTrUzIzwsyekJkiwatzGai5+e8V3JWKSwzGmTUKdltN1T+V3Ck
         2kv7x9w5QKYv0bqxmA+RtkoeTJFrAus+HS30TeetzHMJE9I5i1hXLaOpmaaQ9TOGRk/8
         zawg==
X-Gm-Message-State: AOJu0Yw7fRulNoz+wy3X+HuelH2JiWtgrpo7vu29aMUHYroMPAlN507W
	0lCc2udWue3fCP1QeQyKyIh4ZNf4g3zDqB0le1G8zmEXrgFagGNXkWopC9R7Bg==
X-Gm-Gg: AY/fxX6rPN3Roe8bZHMXMXBUhCbXWkxrnEE0M/2LPcNFaRnvFjZBsLGKCv8+Ru5/G7Y
	Z67yKo4DHifDbzWio2l0nXXoTOtIJWJsFmDul/JsK+0pGI0JaFTNcj8tgKPPhnuSS9ZKOhJW03F
	RLczjVYqxgDQKX3r5eKhy+spmj2hVenQBQ7zxUjTB9+iPEaqrH2POsQd0n3fVwhWgynNI8uO4Ag
	ifeXIE1qeeSWBnYH/uwcq9YzqQ9NkMiZMmu2ZBo6S6550yB2pJqiesjWfVcsr2G8YntA/SCjljO
	yZ9KqXd7W6uMSVO0tg6UUOhe29bBg8k1IxGnORbb5fA0su117aBFdGfYRTkv0RishgnyWP2sJpu
	i20y48UBW4LXDmaEFaPoWq6Bk+5Kb5n7DiMVmQ0r9fPYSzaomP0jdjuHOd6epv1ZF0Ir17a5z65
	eNw1T9Ag3FTEjq5XpaLB8OciVv
X-Google-Smtp-Source: AGHT+IGBTmNEYK2IgaXl9URgCgooMPVUbymuZQ3n8ze4wtk5Ay3mPtbQ7wFrX0SGBOaWHL34VLWnlQ==
X-Received: by 2002:a17:903:2cc:b0:29f:1fad:8e56 with SMTP id d9443c01a7336-29f23dd5368mr48185145ad.6.1765619990505;
        Sat, 13 Dec 2025 01:59:50 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.01.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:59:49 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Veeresh Kadasani <veereshkadasani88@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 05/67] weston: Add PipeWire as runtime dependency
Date: Sat, 13 Dec 2025 15:28:29 +0530
Message-ID: <20251213095931.2571498-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 09:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227623

From: Veeresh Kadasani <veereshkadasani88@gmail.com>

- Add pipewire as a runtime dependency in PACKAGECONFIG[pipewire].
  This ensures the PipeWire backend is properly enabled and the
  runtime dependency is present when selected.

Signed-off-by: Veeresh Kadasani <veereshkadasani88@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 9f5286725ad4c3ab241ce7992f992d4e81acc81e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-graphics/wayland/weston_14.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_14.0.2.bb b/meta/recipes-graphics/wayland/weston_14.0.2.bb
index 451fb961a1..73c9ce38bf 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.2.bb
@@ -90,7 +90,7 @@ PACKAGECONFIG[shell-kiosk] = "-Dshell-kiosk=true,-Dshell-kiosk=false"
 # JPEG image loading support
 PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
 # screencasting via PipeWire
-PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipewire"
+PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipewire,pipewire"
 # VNC remote screensharing
 PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc libpam"
 

