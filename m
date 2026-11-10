Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12906.1794282760526724691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 19:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wbc07rY6;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9e53d011eso11430305ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794282760; x=1794887560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kQuyr10FM8MT11aneiTMxJ1S52al7QiFMTzga3k8GU8=;
        b=wbc07rY63dUaExk0UtaXT5XgeP7ZDuLKJeV4kHvuxVChJ8dUtVIRZhgtYtKjqfelWm
         Cxug4fKymT7VZd/kYJ0MaP/ghfJnPiiNwg7j70WleW9VLoeM+bamWdLMHp6+c+d1b+e/
         K/zer2Hlt6Kv4I7JpClMTawSvxzc0O2vpaPXGSTUXLBSUNjDu85ql/MYA0l1XyMBA/Mn
         sknPNrPyNa6Q21BJxMC6OW7plp9tyYZNuKEmjkiG2hbXIsaZPf0vL5yM6X7s9+wzGcJ2
         SFoKk7MavPdBY+wMKSghHxEyWnoegQcwAZAtvY7m1oO2B0RKwWuSStj6gKMVak5VbOOV
         LaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282760; x=1794887560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kQuyr10FM8MT11aneiTMxJ1S52al7QiFMTzga3k8GU8=;
        b=IDvm1W/6DTwCsAB92obuPbcY3+cmwjNIzDPsA2gqjDo+uUp0RHSb5yLvuylai6PtfP
         aQutZJGM3c7ABF7FJIxb3wWmac2KpJquRPbIdejrFrfpgloYE5Ldn30kZB1Wyj8i4dRa
         TDDzhW627WTf/nJ+b+sYK3+3cJAdKqt3TZUMQhSwa6piuY/PLQdE3sAPkQurALhCTBJa
         4SbP03WYbzrQhGLzjOesTNhGW/pyOOkey2liRLv+wVYvHfmKKFKUwqil6q9FamriuevX
         Tynb5dxLuE4O5J/Nk/Xp9k6VnL3jgpBfhpZRt8hQdrYEoHN9Ph3aBOkvpE1WW1p6Ozgz
         c/5g==
X-Gm-Message-State: APuU4Z+sug/zjUd8lJ4NzivcSFMpF5fN8Pd/rj/T4jf5iHdtunq3Xyh3
	WOie2GufdsjXY34Jm5RcSMWyneyTjH8BPYISoy59sxe+YPVQtEjMGBtBp8C6wina
X-Gm-Gg: AYBFou3/HPpMVfrfy6AQPAdFvynbyylr+Wr9XvjjwMxHyL2un9gH0rSNXAPns8hxM36
	y4DmsiQAXnMqZNUkIaeZSBZJVaZimvLkDQUS7ooYLOth5aISBt7pkVM3QYO8YBfiuOUpc2PN3pb
	QE8JX3g7MiLpHhOj5fKmPdPlIDp9nfFEJAIlV+dGWiAXGFrw9WJu4Xjpcl5Fp0JMqUmIgBepz8v
	/YmcAwArSLolgyevbgrzWeyfEcz9I7+hy2n7xUKRAWwKzCcAHnuYoSH9ajo4ZGea+s6YtR8KKWY
	YptWuj3Op3QYGEoaMKz/VQVK6pISTiu6OSvURUSp02YYbtLRq15HbLPezgIVOFG7kpbc2d0yBjh
	2qHMf39Zvhou4E+MJghVK9SqQI3G9F/fmQNI1+w97tFOyL23IJx+nr8/n2b7fMWz32Rkr7FDf4q
	pxcCJxLgQO1qi0kYh4wy41VywozSeEDM0+qN6amSHYkVVhT6S67G0kzfWILyztk2Ccs0ZfGD1vD
	PcCwzWkt2N0+GPIIOV9eYoRv75Cwb8YxYIfuTgMxOFJeDCZI/NlZZfW5EfmelveZI0a1CzuTY79
	ICNOEcDjz5DzayAaoIOaZNhfgeCRGHrgxpwixbL/b9QgHx5NeuAgyLrKsoLvUA==
X-Received: by 2002:a17:90b:2f87:b0:3ac:9c37:9418 with SMTP id 98e67ed59e1d1-3b166f69fe1mr1594539a91.19.1794282759701;
        Mon, 09 Nov 2026 19:52:39 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16708f963sm2077346a91.1.2026.11.09.19.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:52:38 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 2/7] ppp: upgrade 2.5.4 -> 2.5.5
Date: Tue, 10 Nov 2026 16:52:24 +1300
Message-ID: <20261110035229.2940188-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
References: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 03:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249889
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ppp-project/ppp/releases/tag/v2.5.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-connectivity/ppp/{ppp_2.5.4.bb => ppp_2.5.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ppp/{ppp_2.5.4.bb => ppp_2.5.5.bb} (98%)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.4.bb b/meta/recipes-connectivity/ppp/ppp_2.5.5.bb
similarity index 98%
rename from meta/recipes-connectivity/ppp/ppp_2.5.4.bb
rename to meta/recipes-connectivity/ppp/ppp_2.5.5.bb
index 6f7977ece37..4a21b94907b 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.4.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.5.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp@.service \
            "
 
-SRC_URI[sha256sum] = "379a630a40d858a1347f6592d671791dde12101697a743ef9900012f3765be31"
+SRC_URI[sha256sum] = "0ebbcfef906d16cfbb9cbdd19c0d92aa3df2fd8fdd29731f614c58d16a279aa5"
 
 inherit autotools pkgconfig systemd
 
