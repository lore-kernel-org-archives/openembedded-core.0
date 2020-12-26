Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.19484.1608974872548774011
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qTnBoBBd;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id lt17so8324977ejb.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0eCMcM43pSnMY3th87V37fxLBJlC0JOXhVevdsJj0wg=;
        b=qTnBoBBdFH+eU4xMWprWsiq3v3Yayzt/5BE1VvBSKaYxtwggdtSoWAhnOXvgvx1RUm
         +eLEJOHG7R9dIZN1Zk+FKN+XqTbWQh6K23MATbNjbYUlNe4iIWaZ/oEf1LnGj5T6/Ps+
         bMhvio3usIXucOATNIHXC5qfion5aMhnB2KJflzqoan7A3ma8rDaa2fDzafUvJprMwxY
         ArG3IHcclQKt9qyteqx0H+qpgQJnrnPezCLqZFr5b3/ynQ9drt95NN95JL1KKKP1YqMS
         9PeTZ2jAMnagRI2hm0gXrj9nbPy/QpsVROIL4Bn/S9cZiLgFSIVCUqqOqLmNEesQEbEb
         WpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0eCMcM43pSnMY3th87V37fxLBJlC0JOXhVevdsJj0wg=;
        b=PpirNimIlQp79xXbb0XlPJxZymp+V16cRg2Gcff0S5nkLhQ/egKq6VORHU7/MYnBn7
         puIE8NwzIU0pjKJrpw1dVqIjhRw41mlmzkk7Ar8AnwXY3R2EUEuqDRVbOXtA7iOYq1e2
         4b1g4pyFbAGd6BlLkT+U/vW0F0jhrvQgCpDHSBN0huYlsgz0uvvm/94etFK1uUkDORcG
         mF49nvoW73hur+WCu93/xcPe6OriQUwAYIMeiuj741ex6Utlc+hclIlCSPhWnvU954J8
         L1WInRMNQlidpW616BeJs5hg6cSF4hIGMQqJpKDEwEWy7amv3u3+MWoZNCBQUaQrvN6S
         H+6g==
X-Gm-Message-State: AOAM531tUSWk5fGdafd/SFkSLcv2xFa7uY9vSyuamw6D7fNGpCo2s+j1
	rnBzVmCIRxulyrkgkTrAJscLOeUImKo=
X-Google-Smtp-Source: ABdhPJzDrlc3c53yBFvAx6hcWKlVR4KtKgika2I+LqHH/dMWV/tDWBqqCaGq9TxaCdPbcY6FnLyOFg==
X-Received: by 2002:a17:907:2131:: with SMTP id qo17mr33698977ejb.546.1608974871227;
        Sat, 26 Dec 2020 01:27:51 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:50 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/48] kbd: upgrade 2.3.0 -> 2.4.0
Date: Sat, 26 Dec 2020 10:26:55 +0100
Message-Id: <20201226092732.52323-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/kbd/{kbd_2.3.0.bb => kbd_2.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.3.0.bb => kbd_2.4.0.bb} (92%)

diff --git a/meta/recipes-core/kbd/kbd_2.3.0.bb b/meta/recipes-core/kbd/kbd_2.4.0.bb
similarity index 92%
rename from meta/recipes-core/kbd/kbd_2.3.0.bb
rename to meta/recipes-core/kbd/kbd_2.4.0.bb
index 529f49bef4..4d32263e84 100644
--- a/meta/recipes-core/kbd/kbd_2.3.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.4.0.bb
@@ -15,7 +15,7 @@ RCONFLICTS_${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "685056143cb8effd0a1d44b5c391eb50d80dcfd014b1a4d6e2650a28d61cb82a"
+SRC_URI[sha256sum] = "55f0740458cfd3a84e775e50d7e8b92dc01846db1edad8e2411ccc293ece9b9f"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                   "
-- 
2.29.2

