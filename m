Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACD0C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 13:23:14 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.9343.1634217793657223709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Za2+sa60;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.51, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f51.google.com with SMTP id p16so27098969lfa.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2clOg9w+aN60v0L/9Phug9EcY8xo5xbFP22viWkQ7QQ=;
        b=Za2+sa60VQDDl+Wj32BwfLQseQ9f9/NjBrM9wrexXjrQbLgTYxdE3b5uLA+XqV6Cf+
         0WpkzMkM5b9jb2Q98RJDtp6+4k2w13z0AlkXAlsGNrqZ0U3EeWK1QYaUnfK8b1wbnxdy
         RuvGxOWaeNp01LlBXtiI5NmdCTXnQU3hQgvgRM3qN0GLoppr5v08zq0QuroUqTEyyBX9
         u1sqKU82ZqQ+AZz1DmDYiejXSee7jx5zSZi1jw1VWmROsbEuuQHuelVSI5+mxezeAsgq
         BRPnGXhwRNen5M46xxwXDdRtvsZ3VvyLgI74XWA56kDihZYhdsSnW5wikH47lveqR7jH
         XRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2clOg9w+aN60v0L/9Phug9EcY8xo5xbFP22viWkQ7QQ=;
        b=g8yRlBog+2bzuJm4vdwZratXacLZP4B0msnLhOLiAfsXCyR27r9BTiOCXu2YVGo7DJ
         bxZ98xgVND1wedjIblZShHBdazZIfJQOKhOBFj/tu/tLnsIdnHkZ773V6FcT24INz/Ll
         Ghaeav4AnvM3oQQHEUYelMccLLKkC04BWDvcjsJ7lK6eO2FHNpQZhG8tOgg0h4yeCJ1D
         SAxB1t5LzHTvQm8X0v/lYLz4bJcOoBvTYWX8I97gwidtU9k2m4BnOZs7cbYtJ4FENPyS
         1PvHPv6B3qg01NvkA8gSXn+tpcZM8oi/vWh7KjnOfQ2cleMWncKEQSifwC1JUMxTU+JV
         fOYw==
X-Gm-Message-State: AOAM532o/fCP+N0+7SH3d74ZZ0yETdYfck0sJzq6dCFLfVYczN8yUuM0
	ElleQG72dDxhUYXSQAnacRGI4M2UrWoDxi0M
X-Google-Smtp-Source: 
 ABdhPJySp528SscXtgEYfVgB1vypo2GYI2sFJ/1WrgxYhr9lnMBngWFLYpHz7ZzOHyJQzXH04gBsUw==
X-Received: by 2002:a2e:97c8:: with SMTP id m8mr5861886ljj.379.1634217791292;
        Thu, 14 Oct 2021 06:23:11 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 b23sm226869lff.148.2021.10.14.06.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 06:23:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxkbcommon: update to 1.3.1
Date: Thu, 14 Oct 2021 15:23:06 +0200
Message-Id: <20211014132306.2427135-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 13:23:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156954

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/{libxkbcommon_1.3.0.bb => libxkbcommon_1.3.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.3.0.bb => libxkbcommon_1.3.1.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
index 57c318cf5e..0e75ed03dc 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "7b09e098ea69bc3054f0c57a9a25fda571c4df22398811606e32b5fffeb75e7b"
+SRC_URI[sha256sum] = "b3c710d27a2630054e1e1399c85b7f330ef03359b460f0c1b3b587fd01fe9234"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.25.1


