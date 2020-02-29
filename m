Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0C655605AE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 14:37:46 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id b22so2399915pls.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 06:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=r0RgtFXHNGiR/9LL4MjsayOh4qZhmebpW3FO1TnN6uU=;
	b=cnKKTYVfzqVGQm4C6WZcKB1QDlS0Ty6ET8lqdqkRqZ6T7VQRZi3Jy+GHWGAFQE6qvh
	rGYQJI70S2vEJaK/BiRqYl9d032Kbr0ZThsyCml096iC7Lc/Yf0GQ13gsBZ07gYm7TjJ
	C7V0cl3QVAbbUY2XtGkH8wGPVUaV6DSVF0j257aJO7vpL8Ku+LuhtYCIkqSuDnVHVal7
	kMIgH3c36d3jmW7iU3shAGPC8jsi0wmsFuUlDyirPLExF7TmHSguqSIJf8e5dVF8XnX8
	Z6oyfzOpdunrNuKqS46ResalseMZ0JX9D/QmDsE4MAZn+2TG4E8g/Jd4dAvCuH0Pap2n
	Vr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=r0RgtFXHNGiR/9LL4MjsayOh4qZhmebpW3FO1TnN6uU=;
	b=K+PxgWZJucb8n+SaCBDx0u2uXPrGuN0uy/63OwTAjU2ClpJ5Br5GpwQDsMGmniB6IM
	u/VHc1oyVgydkF2JF/VzOs/VutWi8yL55CYESGxkdAWK4DJvLAZkzW5UkgrOuuNjOXhP
	pSlIXg3lm5d7bkNJIUfyrvHwuQerEibaKARr3708wEI9P68Ljr++C0EqGwv5lS+qgdir
	FvD1IP0ekIi4/3lkHMbF8aoA6S5tVSUbWS9F0k0GePYN24VQDAsG9Rs6O/nd10xZQF7O
	ZJP5LtfM2LlJv9T9R/u1sgPj3SZlZAmQfkpHk4VADR+cGklnbBC8SF2rTuqxn8Z86cj3
	VAYQ==
X-Gm-Message-State: APjAAAVNyS4d/hIZWUMzyVpIusFCWvm1OKgi4or0F6dhsqT8Ec8kj2UO
	sl+TF8xW2xHNWYPnztns8Z/hkQzQ7P8=
X-Google-Smtp-Source: APXvYqxqQi6A1JgdWiDkO/fBMXhoo3Pxm/5mdm8apxJAef54BmX2ypQR71P4kp1/gEfPpoitsb39gg==
X-Received: by 2002:a17:902:a58a:: with SMTP id
	az10mr9105854plb.20.1582987067489; 
	Sat, 29 Feb 2020 06:37:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1634])
	by smtp.gmail.com with ESMTPSA id i2sm5868429pjs.21.2020.02.29.06.37.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 06:37:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 06:37:56 -0800
Message-Id: <20200229143756.1653266-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] systemd: Add missing leading space for CFLAGS append
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
X-List-Received-Date: Sat, 29 Feb 2020 14:37:47 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_244.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index dfb7ad59c0..c5c0ce4bad 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -102,7 +102,7 @@ PACKAGECONFIG_remove_libc-musl = " \
     utmp \
 "
 
-CFLAGS_append_libc-musl = "-D__UAPI_DEF_ETHHDR=0 "
+CFLAGS_append_libc-musl = " -D__UAPI_DEF_ETHHDR=0 "
 
 # Use the upstream systemd serial-getty@.service and rely on
 # systemd-getty-generator instead of using the OE-core specific
-- 
2.25.1


