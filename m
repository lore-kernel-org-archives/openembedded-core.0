Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30995.1795560772654116771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=odwDWqXG;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e47347279so3033858f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560771; x=1796165571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TquP3LS4C9Y+uC3J8C+p63AmpZstWe8gvcKOq5CzlPI=;
        b=odwDWqXGwRGDbodDbKtyTuHnfFDpfuZdQgpWYQiC/aMvgnm8iXt/Izvr0qmoTu7UTh
         eLwafk28IA4cOuUvaMK7f5vfYC77StvWzdcTxil/POR6pxnVotHvAPo703oKr/jx1zWm
         6Nk3GJzImObJZ/aZnnBkpzZPxmk9RrbI9iTfVC3cDTk3KeUGfXQ13QyDFTqP+Uw0+PHK
         mO5yopBHpiD8AmwgGatQn5HybN9bFD7EDvG+V60iMwosGAHIJRzkUvfcmQcwFxsNl/tw
         1c6r2Oeifzp8CXsZzOaon2IAWAtpCB+cwpuVpIYYQNK4GApr/WKeAqgIOHp4iJhNDLUb
         m7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560771; x=1796165571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TquP3LS4C9Y+uC3J8C+p63AmpZstWe8gvcKOq5CzlPI=;
        b=okiu8/C+dDQGLX/Mau9jaw2BdUb1VGnRbbXUTgNF7egbC+/zFcwILclBJk0v0wbdNo
         e2JvyVA0V9bs5S5TbWWRwcMjheNk37dGZjJlLmaFTZ6UMDh/5JnHJRkBxV/alo0fpljy
         URq0AX25h6u3mHB3fAU/IQTUNXWJBxHtP5g9aWsnUIsFWHbhL6OkZ/nrS1JCPHFJ9G8m
         zHopHR45BjumVm+RAeYweHIoJhs7fMfsh2f7ABH2bC2/vN5vnz8dg7lYrAJsShtB/+2x
         Oy3a7IBMzqibnBud8gm7mfCeqc/dBF3kYojx/uzhyMIGmGqy4X04x1qPxsUaWosSSwgl
         qvUg==
X-Gm-Message-State: APuU4Z/Jadtaqe2FfJI0aUORsganOHNHKOmrf8UYN8Lq/kHN/r3SwUTf
	DSGVeKyrvze0gKtUs6LiqfGpAF0d+fauF7GrxltH7xheXS6Ure7KMZN9iS+Y/ZmUTKZxMiale95
	ubwFgDuc=
X-Gm-Gg: AZFdTZe1iqm2/3cqsrN8ZgCEezbn/ojb4dveJYK/A+WFU0XUi8LjS0i9AbYWijn6kFR
	xop6aHljBCjQGVOpj17uEdmXojY4riwpTwfgLZdOAnH0iGd9HoXpfYRgAkmHuQxiYLNuqD92JN9
	k0bxGSzAl1WmR/wVD86d9rtjA/XavN8fgtJZ0ka37hQxQgQdxqX5XMwyD9oPdN+andIFsGQo/PE
	xaNaiILxnAcQolBv3gKg3jUCyQQ+wlLN4Omz0OgSO4tb0AuM5bwxL8jhRK6Xft5p7h1yh3IMFsT
	JbnGIYHhYcr+JDJ+dV4Qg4H+ID7gOhOHGINq/VdOKdqM6n1h4s6aCTrxX8tsE9DB+Xm/skR4ENO
	rvMK/cmPBjkO/mtxObJrw4FbrAXhbt+2LJkJG6WJ60lRGkbHEgj4SJtTelZb+IT/XfogWo8cc5v
	rkTqP0Do3YN4MHj9jlKvT7ieIeBCVLNadX4Ma8uQe0pc+HzIW8qCOsqZP/4jhtIQ9P3NgTyQ4a1
	iQ4mPmk0gC/ZoaaVzYagwJ0Z7R0PYF2OrboU2EPPPsiVV1zfAvdblhZCaWp2n+wTVgaFK/UFVq2
	FHej1SBQOEgXur97tIIFJt4DyV8q2Et7bo+1m53z8iYvg5sJO4y3IBnAwd1cTXnLvUk7v8Taw5v
	thYv1n+1rBc3LNx+nrigAoqhut6nF
X-Received: by 2002:adf:e197:0:b0:4a4:14db:233b with SMTP id ffacd0b85a97d-4abb3678774mr27463519f8f.12.1795560770962;
        Tue, 24 Nov 2026 14:52:50 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:50 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/21] aspell: upgrade 0.60.8.2 -> 0.60.8.3
Date: Tue, 24 Nov 2026 23:52:32 +0100
Message-ID: <f3b8991cdaf33bfb1e94ab697aa5a5fa455dd140.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251117
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Fix CVE-2026-75818, CVE-2026-75819, CVE-2026-75820 and CVE-2026-103658.
- Fix various other memory problems.
- Fix various typos in documentation.
- Remove unused MySpell example code.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 05baab915b146a19776cd292962e2cf4edfc6f20)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb} (93%)

diff --git a/meta/recipes-support/aspell/aspell_0.60.8.2.bb b/meta/recipes-support/aspell/aspell_0.60.8.3.bb
similarity index 93%
rename from meta/recipes-support/aspell/aspell_0.60.8.2.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.3.bb
index 5b4fab7c354..6ac547887b0 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.2.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.3.bb
@@ -14,7 +14,7 @@ LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
-SRC_URI[sha256sum] = "57fe4863eae6048f72245a8575b44b718fb85ca14b9f8c0afc41b254dfd76919"
+SRC_URI[sha256sum] = "0534eae11132405120d11e46bf595bd5dd189bc124ba77a5dd6aae861b48a162"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
