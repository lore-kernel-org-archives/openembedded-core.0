Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5433C4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 13:24:17 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.9749.1666358651078154437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 06:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GNQjCCk+;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id r18so2518784pgr.12
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IQ2FguOK0vTTkvERC3n3LTD5cAxY2pWdh1LiiXU0nzI=;
        b=GNQjCCk+O6ndg6vB/Pnm1EUClGWXjGijmCNPy17uTJ8XGRhN2T8LBM2QWytN/rrbQ+
         j7b8nKm95+kHBsY8pMghEj7jVdpXTovTViXJQyBW5GTfjXN+r6Tgb9Y+wNaqeRu2gGXA
         3zMMMvXQjbV4izOPRjQlWgYU9k8Zr6FefXsYDgTzK37aXvRrNqKwCFBF2ZSswn5wtFrX
         CE4WrXm79VmcS0KIT/hMej/t8268tRPM6ujMIORuGkwlP+Zwf48Y+26auaZzoqfMG0Xk
         WPXoZ+4OQ+Lk3AFccVJpTHmWqcd85Gzd3iYTHhETpE7/D1y0IfPH6C+SMT60ZHJjSVI1
         VuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IQ2FguOK0vTTkvERC3n3LTD5cAxY2pWdh1LiiXU0nzI=;
        b=yzSG6AaMWwUNKYxrg6oudoudF9+FIP/3abfAvVHHtYkQoqXKsOauUw0uFPUMJT2U7i
         o3HmrN5Pt4G0q3+5zHw+sQgZDnl4i7RSEJPCaLdkPXqrEFsIDeRLn71tiDBC3E915gdB
         qyRUUOFCc1XblyxRXxmPH5fq8iOqIEGZ8W1cv9t18Xtr5G4ciOhXP8/uwRe5JtXqnEcw
         cI5cAkR/WFFWd3fWr2ukTURrohcf1r5gWryrVbed9r8iOtNe8JhpdJxjXe1dHX/VSU15
         eVaEjWjS2ZfCSI9QwIfyO4cpqMhK98stLSS78aHy72s9cSKSLBDl0Gn85kM6HlBMz96M
         rMhw==
X-Gm-Message-State: ACrzQf3I1tnnX2oOj5tJG3LrbfSQP0pN/0S813hEYypa40MR3PXbf7L9
	Zawq/a7UBQ5HKhJt69J7yApGkJqIxMty4g==
X-Google-Smtp-Source: AMsMyM4/+5/qBLW9y6lfkhwHpXMawRMscqRmvvfMTWMXDFD5+vRD3kwJfcsAAeBSxTIYctHjaNnJxQ==
X-Received: by 2002:a63:2b53:0:b0:439:34d9:5d47 with SMTP id r80-20020a632b53000000b0043934d95d47mr16021989pgr.283.1666358650298;
        Fri, 21 Oct 2022 06:24:10 -0700 (PDT)
Received: from localhost.localdomain ([2409:4042:e1d:9e6c:89c4:b832:6284:e218])
        by smtp.gmail.com with ESMTPSA id y16-20020a1709027c9000b0017e9b820a1asm14758340pll.100.2022.10.21.06.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:24:10 -0700 (PDT)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-core@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Omkar Patil <omkarpatil10.93@gmail.com>
Subject: [OE-core][dunfell][PATCH 2/2] dbus: upgrade 1.12.22 -> 1.12.24
Date: Fri, 21 Oct 2022 18:53:56 +0530
Message-Id: <20221021132356.29507-2-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021132356.29507-1-omkarpatil10.93@gmail.com>
References: <20221021132356.29507-1-omkarpatil10.93@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 13:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172019

From: Omkar <omkar.patil@kpit.com>

Upgrade dbus from 1.12.22 to 1.12.24

Fix Below CVE's:
2022-42010
2022-42011
2022-42012

Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 .../dbus/{dbus-test_1.12.22.bb => dbus-test_1.12.24.bb}         | 0
 meta/recipes-core/dbus/dbus.inc                                 | 2 +-
 meta/recipes-core/dbus/{dbus_1.12.22.bb => dbus_1.12.24.bb}     | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.22.bb => dbus-test_1.12.24.bb} (100%)
 rename meta/recipes-core/dbus/{dbus_1.12.22.bb => dbus_1.12.24.bb} (100%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.22.bb b/meta/recipes-core/dbus/dbus-test_1.12.24.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus-test_1.12.22.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.24.bb
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 8219f0875e..82e91c7b13 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,7 +10,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[sha256sum] = "8d25785c798ec4f892e6f9d177fb0ceeb8b29867b119798f9d5228561d3ad474"
+SRC_URI[sha256sum] = "bc42d196c1756ac520d61bf3ccd6f42013617def45dd1e591a6091abf51dca38"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
diff --git a/meta/recipes-core/dbus/dbus_1.12.22.bb b/meta/recipes-core/dbus/dbus_1.12.24.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus_1.12.22.bb
rename to meta/recipes-core/dbus/dbus_1.12.24.bb
-- 
2.17.1


