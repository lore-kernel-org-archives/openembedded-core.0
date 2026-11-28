Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1211.1795890563048957023
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 10:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=B24wqvIT;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385c497bf94so10447613eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 10:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795890562; x=1796495362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPEDJzd93rfVvSUdyxAzD+k6e9Qu7pZgZLN8Z/WAQHM=;
        b=B24wqvIThDp8hYvuq+SO1NJEnDNjnXprHQIxwQhpUDzPxaID8bJkYYXCooT7SyU3/v
         J6M08YQmwrqCERfG0/H6FlrGAT3dFr2Uc2IrN5nu7addSZmXrxiYSRhb9xZwdfG3oZlt
         cu22ik2+/o2UVI5jLPQE/3zEI34uwHl9PRbrKU4cB8lHT+I+wIFrpmv8+GbeC/Z740Nb
         8SvyOwecvLAtAmxPau0E9slAoOhey1fCXeTAMoZGpF2bVHfM6XwgBc1FiGFsiLAbfIei
         uRxwWbOLIFSh73P9jQiu0Owp+4nkbO4US0DuQ0vExR6gN5pXQvOrU2DmvYHoE6BokuuB
         Luug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890562; x=1796495362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPEDJzd93rfVvSUdyxAzD+k6e9Qu7pZgZLN8Z/WAQHM=;
        b=xq10gHg2j1rUXcm+eABBspc4agboZsewL8XDWpLDgzSIao0qNlOwxzJiVq7theFi8o
         +I/Hd6VP8w5UgBKxv33Lup4ll71B+3rZ6r8zh1ew1Lfq8aLkRfEnzxyOvkLOFpXCrXjm
         a2hdX0NwyAWbrvWV8UPrbOUJmkjFSpOs+qCBf4/UeAByQYlyCwsjr3ZVrahA+qPHZ0R8
         vVPW2HBVyLvRnRhgAEu8P9LjAA/nf7jDtJNPyS5bcojMKAFp1TyR6chut8qXAMMkvdUd
         HEAP9slr/gmMjwxvk0pL6mnOktcjIpafsCJJlnWqaSBn1hnGFxUqKQ7OQZtJUqG5Bfhe
         0fLQ==
X-Gm-Message-State: APuU4Z94/R8suxbfyZZTOuR2uxzAse30kJCYcy57MBOSa3+KBi8+WKsi
	MzBdFoqZ8+8YQei6l/5kk0aS9nXFbAy/P/1YdoKSERWyC6uKIvLCmb79mPt+LWxG
X-Gm-Gg: AZFdTZefees7DeIDhZ9/4ALFPsR+6iHJkH5R6ikx669hI2xTti0DD6JYfkwVUbeOpec
	RSGjvuyfLkilRLxyZy/fXQkhopL/F+NuJSD8Mr4haekbq2reQw2uTKCqScQ5gWK3F7fRQKONF+5
	MMkJUUG/jIpyf0BXY/UqloD4bSs4A6gPMBlpKQmqCeXM4P5GWnRWJNZXiwAkv+rrJrYJA3i9Hgw
	coHuvmKjXYx92WEfVoa6x/o2GRKkY6YuDjioqiwfykNhiT7oPNBg/Iu/fBOpG85quDSdUDcUDbA
	Zyi6XaxYTQcGwGJ1fEmYJfjjo9xqn8hwTVIXRX6FxzvcPLdIyVd4GM9cs0HEX9SE9Myp4j6xrrk
	UH+wubGqlTk0hvNW52EE32Z5cT4M11iwaYPggho2Gjht131FoJMq3EDqlVrmah3oFZpHJY3vJfk
	GBSc45+sEJgF0s2AS6DdYGhXS/wUxuOszuPq2/O5VjINlgXmxvHIzQpSlMhjO3AvEqBnkVxgY6h
	lvybklheqCNy7UiDJP2IGeASZjIEO3tVGDPAhdzVGjprpv2LbcwaxXc/wo3gu/IdbS++P3ISFpD
	Pi8222CpVaNT5wmlR1x1IQn3ESElrJevANU0ptItpYYx2uTZcne4YBvcmendiE0jdjgUC1MC34T
	he+g9pZbrHIgTVDzTZmbY1XG45gBWpd5OiOB7yEhOgO9i6+zipBdzKOgth+LhPGgwR1bdxTXCPL
	o5+U+9W154UYPDrF7+xubKB3RpsItIXWAtUyeSocV/865Rcrt9vgHvAi3tAvPupiMgQdJVsOlgZ
	cli9W2c5tEB5STNDC7ALXMIO95dsZLQzikrzxx6p9YZHj7CTYivYI878/6lgceZJ6keUV2nU2LK
	/q8t
X-Received: by 2002:a05:7301:1a08:b0:386:9f4c:e07f with SMTP id 5a478bee46e88-3869f4ce1d9mr24316227eec.14.1795890562180;
        Sat, 28 Nov 2026 10:29:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm70403164eec.25.2026.11.28.10.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:29:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 2/2] picolibc: Restrict the upstream check to release tags
Date: Sat, 28 Nov 2026 10:29:18 -0800
Message-ID: <20261128182918.1484961-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128182918.1484961-1-khem.raj@oss.qualcomm.com>
References: <20261128182918.1484961-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 18:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251507
Content-Type: text/plain; charset="utf-8"

The repository also carries the newlib history and esp-rom-build tags,
and the default check picks esp-rom-build-20220125 as the newest
version. Only consider the X.Y.Z release tags, which gives 1.8.12.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-core/picolibc/picolibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/picolibc/picolibc.inc b/meta/recipes-core/picolibc/picolibc.inc
index 750098ca60..c2d5ad568b 100644
--- a/meta/recipes-core/picolibc/picolibc.inc
+++ b/meta/recipes-core/picolibc/picolibc.inc
@@ -14,5 +14,6 @@ BASEVER = "1.8.11"
 PV = "${BASEVER}+git"
 SRC_URI = "git://github.com/picolibc/picolibc.git;protocol=https;branch=main"
 SRCREV = "f7edb0869e64b9d687f46961adeef7154921fe92"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 B = "${WORKDIR}/build"
