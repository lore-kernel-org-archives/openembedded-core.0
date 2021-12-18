Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF32C433EF
	for <webhook@archiver.kernel.org>; Sat, 18 Dec 2021 20:52:06 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.9527.1639860725834984748
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Dec 2021 12:52:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=VQotQwc1;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id u13so5028340lff.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Dec 2021 12:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iNMtk3usL4bBaXe7qCyT8B7Dvs7qvgD4FPDMopYmlgQ=;
        b=VQotQwc1bTd14HM4pXN4eOdQm3KtW3NC1o6/q03uxsS+82zZw7Vaifwws4ewDdBKwV
         05vSjjZTTeTNnQqGbKASIQnxpjDq7y4kmNkot/0JR0MsF/7KBR1lN3y6M6tzKkgwx5hZ
         m2Aye0Rt5qv5cV/ljgxyNFnspED1rjnISCNaSMivn7iX0zomUnG8YFkKXWcBxvnWjaQf
         ZtNrMQpNU1gzbdaEl/eYMspGREgBImW4ozCEmzz4FIzVH7qWgXASnxXjUGx2TqCN5jtk
         EgTfAfMX1rE5FH+L+Ed7y4FtXxjhtSE/gEsbgEEF1n4y9B8iT9AktjfWPIjUNdHZXzC8
         jb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iNMtk3usL4bBaXe7qCyT8B7Dvs7qvgD4FPDMopYmlgQ=;
        b=2a8sQM9GJJD9cP6GDgQaan0kWRuaHsYD9DTdMtBj6GpzsKNHV+UfFTsfmcLlZSJ8me
         roFlLswVCb7pym0s4+vCEydQJGcJ3HwJNhj1LkenUioQqZS1XHlNhQy223ssf+cBczdt
         hKg9i006VBjq3UABXcH35WU6wDBBfLqjftcaJCEh46nl752IfucHSnGqS75gmhePMQfQ
         9dT34hSzaFO2gpwzptNEltWPLibPVpj7MHNF/FxZtByrMQTxdPydajrpunvIDe6BY1Et
         RVreUDmYltrPkKe5TiCvCAZnGjv7RihsSoo8OLVfECN6xDptY6VfqnFlQqpXxm+XhZcO
         V6PQ==
X-Gm-Message-State: AOAM531gElqmh8F4WkyeRY+DnzwpoHFybxSYMeV13I1shD11U6Wgn/4o
	4BfPoxz5wb3hGD9EkhUsPv0S6bcvXNqkDdqL
X-Google-Smtp-Source: 
 ABdhPJzByBP44W6p+rYqTNCGu/lcXtS542yIpsCFgTx5IwfZtrKZtKmnTsqYYAJZOa4UD0XpximcXA==
X-Received: by 2002:a05:6512:3d94:: with SMTP id
 k20mr8858311lfv.116.1639860723370;
        Sat, 18 Dec 2021 12:52:03 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 b10sm210717lfb.107.2021.12.18.12.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 12:52:02 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] xwayland: update to 21.1.4
Date: Sat, 18 Dec 2021 21:52:01 +0100
Message-Id: <20211218205201.700007-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Dec 2021 20:52:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159842

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xwayland/{xwayland_21.1.3.bb => xwayland_21.1.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_21.1.3.bb => xwayland_21.1.4.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.4.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
rename to meta/recipes-graphics/xwayland/xwayland_21.1.4.bb
index 5d083e8ada..029123b875 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.4.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ebc2757f39fd4c7db1654fd86591589c211aa20172d43a54f77ae567cedbf8a2"
+SRC_URI[sha256sum] = "19f6795f31cfa8eb352b1e5b3c379f22ee6020e98701ff2cc679da8c4f1159f7"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.25.1


