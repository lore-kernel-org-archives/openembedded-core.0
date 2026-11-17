Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13021.1794901142809206154
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 23:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UrjPCUX3;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ragaprasanth@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd69954c755so3647349a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 23:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794901142; x=1795505942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAPxlYM1TkTfY09le6vF8sVD4F/F1EvWv9QeXlxP6HY=;
        b=UrjPCUX36EGHRVeHLzVqb+2huNVo7kiyv3mSUImecPBbisVJMr48qXEPvdqG/dso6L
         v/gShum5/GRx3uSp0cMMsbsKKtiGsl9SGIBKQ9VFgnj0Yukaz3FR1WzkpoJD1nu450iM
         Aj/tMt2Cfa5CWEhTtiTMkaJwkFlXYkls0sVAVXrqX2aRJFAL3vPyvCdf+bzlJ9dH8nMR
         RjqGkR6RRLHaGRwtscYaPIEb3j2rYG/L8Vu+X0i+WdF5RnvTsymX8jEgJERCIGmwyPry
         8yug82c92oI6M675RUC+ZT1ASwMO2Y8BU4jJmz3/L9FiOolzTO3hC8rgiUwqxRQJVNs4
         7lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901142; x=1795505942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GAPxlYM1TkTfY09le6vF8sVD4F/F1EvWv9QeXlxP6HY=;
        b=D23WmLl2tVccgYlzUDh3OQyquVMVYZ3m7xeHHfPLi5JwKKvt/MkLhzYzjSHMPNOZBv
         9xq1c+Vnf4fkp8rdtRsjlJ3U7YjsK9jBCtE3MMd+1RyOsKTUZAyopfQsPaMSawvTyZEh
         B5DQdvPk1HHhsVXehuiKuWi+WKxbrNy0XqzFScoKuZdldTIoyu+9lE4oXUWRCGLRoycL
         4yK9OraedBoT4rthbgqirR5ZmbABJZ0s18YqzgIsNRnWVmO1MrHrspbJrDVXanyg6sRl
         W0l1KVXp8PofTsurURvqN2QdCKVp0mshnALsPW4h3O9NwAtDeEqp4Sion/DcFpKYdtIU
         CC/A==
X-Gm-Message-State: APuU4Z8mjlud6mhE6FFSjeZsvQPC7JXHXrHQBXiAyl+gDc0NB+pcOsTK
	VMePT6YF5ek4kq9bGQc8PRuFqmyBJigUSzKm1iGTU0+513nlHf1z/C4xwflI48eD
X-Gm-Gg: AZFdTZeoHep8GlERZzbi6Gi6vOmHOlkB5tEMLrzYdvNxoYNxkpVqKOSuBfMNIzw2sIM
	jLnPsiIJhx2sH41QCZj+jzripuqtJJeP1dTiqpB98M3oRYLQLzoqbnqJBaEUAlsr05iekVKbvoJ
	ivtEDxNGLQ28p/oD83o0b1W1GW72TAN4VN6lpojxszSRzGS6qACEMzn1ki487SoTyBdhvbiNZNd
	ulQRWyItoKl63y8zlvfGN3N/C+2gOG/ourD2jgA+mWLWHVcoiox4dbVZnXA12eyoXYFJp/zm/MI
	eU4kXxNkOWBLfy1sGilPjXNzfhgTHb84JM8cTTQN7uKhwHxPGSXJhzQXRQ6SQZ1pPLpwkSA/P9a
	5NjiMOlGa4XOM4ACJQkqeb3TrgPTaHaqSDLw2ht7dr6DELEajdK6NML+KHxY8ylYkRmwvAcpRwu
	PgJbH0r66bnamEzF6JKouPFaz65cAD0W+Fg2+hZSb1BQS3nw0XVy1mfPF3cejzJ2+79YWO7zTP3
	v4+IIG9Q/u96PNoPbjechJr6eDSXy04CsdS2qvHRXBcwT4UlHIyN/8fKlUdfk7Ln8VtQrkaoJuO
	KDEG4gpie7tvWQ3TYDdz+b6UYcotpeFspcEBS/BMjGNmxv/b8t2gjVuusFRQX/boUokxbQNqGzH
	DCgVD6/vV+Q==
X-Received: by 2002:a17:90b:1b12:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b1b09e5cb0mr13118141a91.17.1794901142054;
        Mon, 16 Nov 2026 23:39:02 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4cff6fsm2750297a91.12.2026.11.16.23.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:39:01 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [scarthgap][PATCH 2/2] u-boot-tools: ignore CVE-2026-29007, CVE-2026-29008 and CVE-2026-29009
Date: Tue, 17 Nov 2026 16:38:49 +0900
Message-Id: <20261117073849.3089566-2-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073849.3089566-1-ragaprasanth@gmail.com>
References: <20261117073849.3089566-1-ragaprasanth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 07:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250410
Content-Type: text/plain; charset="utf-8"

u-boot-tools shares CVE_PRODUCT with u-boot, but tools-only_defconfig
disables networking, so net/tcp.c and net/nfs.c are not built.
Same status as on wrynose.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
index 4b6d89ed4e..98c4954ec3 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
@@ -2,3 +2,7 @@ require u-boot-common.inc
 require u-boot-tools.inc
 
 SRC_URI += "file://CVE-2026-46728.patch"
+
+CVE_STATUS[CVE-2026-29007] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
+CVE_STATUS[CVE-2026-29008] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
+CVE_STATUS[CVE-2026-29009] = "not-applicable-config: tools-only_defconfig disables networking; net/nfs.c is not compiled into u-boot-tools."
-- 
2.34.1

