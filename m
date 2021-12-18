Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C420CC433F5
	for <webhook@archiver.kernel.org>; Sat, 18 Dec 2021 20:52:13 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.9513.1639860732473334727
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Dec 2021 12:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=PIsr5Qqa;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.49, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f49.google.com with SMTP id b40so12278689lfv.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Dec 2021 12:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hOdXP+5d08pzG7c320WUs/K+ssIP5pV7u5+LCw6rVbw=;
        b=PIsr5QqaQAhM2q+vquhPZKxhwDSH1k70CWWdQHj8EJ8kyCzANwkT5JlnKrfhdk2tk9
         Seb4QJVA/tUjPVSQ6+P+EjsJyieCkAGSXqwN9oItTbt5U9izsNfPbmU3Jx5nV2NccAuR
         aemG6fvPZI0DIczf4Klx32Q+vQ07pMctTN8T7ZgHtRZIL9kbygbAYgKu1GPosRQhynnd
         /fZF5Uu98OhtUdmF2IRZKEBWfpLcrlRVxhXePnqOGYVHm7r2zsJYiNwiCrMVrwjVnZha
         3svcgtkO749imyW0ND2OU29+GYV3d3xBjN3sRMVOY5F9MMmXxn6dIZ9NZH6JiUnObLTu
         UqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hOdXP+5d08pzG7c320WUs/K+ssIP5pV7u5+LCw6rVbw=;
        b=AlQKJnPRv0e8yJnkXL8vLmuyOb9Od3F5ndt2R3RyLteKXqd94SitBl7CsBA1P3Lg5/
         haSEOoXEjwX4I4jIbslO5QW657U+87vx4i7D37v2A5d++uAlUpn86UXKcnr/nEUSucnN
         +1ptVGkM2NztY9qfn3OG4E+DFXzg8/wZQwyz3Q+CdspKxRgsPnoTg3UxaKvNGfM4yeEG
         ziBhxfQbHVbIRAcDrJxyFRoBNa8IDg0VyJgesPinXt3I45/dgN13tVmlZfK2L2Le1uOS
         Atsu/LzFOJjkhEHLPpMSmeGlC5rSEPJhIc+8E+9cCUkG9F+IetIly/5rJJ6qcm5iKxel
         c0Yg==
X-Gm-Message-State: AOAM531fGnN4U5TmqshrETZnBcWihOocQ32o9pYct3huxFOlV2+YL5+P
	XT8a8aWtblrtob1BOZlHiNzy1qaJnHOyZ+Ih
X-Google-Smtp-Source: 
 ABdhPJxzs5wT7Qh36eT80DN8bxGrH5DkcQ4J7amxTMkF5vDkDWf1nSYISg8wA9HyWcGkntHmOmO2ew==
X-Received: by 2002:a05:6512:e89:: with SMTP id
 bi9mr8760935lfb.465.1639860730407;
        Sat, 18 Dec 2021 12:52:10 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 x6sm1817840lfe.201.2021.12.18.12.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 12:52:10 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] xserver-xorg: update to 21.1.2
Date: Sat, 18 Dec 2021 21:52:08 +0100
Message-Id: <20211218205208.700161-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Dec 2021 20:52:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159843

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{xserver-xorg_21.1.1.bb => xserver-xorg_21.1.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.1.bb => xserver-xorg_21.1.2.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.2.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.2.bb
index 196d1edff5..60c18c0a47 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.2.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "782e7fef2ca0c7cbe60a937b8bf42dac69c904fb841950fd0363e1c2346ea755"
+SRC_URI[sha256sum] = "c20bf46a9fe8e74bf4e75430637e58d49a02d806609dc161462bceb1ef7e8db0"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.25.1


