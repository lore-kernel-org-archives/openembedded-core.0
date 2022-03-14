Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD45C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:17:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.3728.1647299845851570715
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K0vfs83F;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id u10so26399895wra.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zg+t8MohzhY8LCiTH6YS5RF0sOQBmrCOsfKk4urpVxo=;
        b=K0vfs83FsUWgEOKbI6VH8g1NZGu2wkoQxUxjlDBiGi/p2Ask563B70kEgXso+7XE+l
         RjavMzswuKw90oRnAttfE5hkj9xSx34j+SQg+Im4AiEg547vBcxflEIvdDUdwowzBQOx
         zBCRoXbyLqhkB5S38R6DG/dIQ/xnBdXHDcbi0rMg2MC/RcMmehjmLLPTu3gDFWYvKE1Z
         aPB5cl96khkIwrlxCk48vsvReI7ew4HlIw/CbLd0/dd7jtJyjtwgEy8MBNOYIt+ZwLN5
         hq0KI/mbKMBNvld2Sq1nL5ZUdkLiFZ+NoQJW8etGlXGmKwQ+yMZPIgpbY4QAC2PvNWwb
         naBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zg+t8MohzhY8LCiTH6YS5RF0sOQBmrCOsfKk4urpVxo=;
        b=c560OY2Rtrxke1H9nTPHI9yqIGIoGfuPDA9SYv0i+nR87nG5jvuXykjIekUgENbtOl
         bUBOAM6vDKZ9ngp2750/NyH45dB8oJ4OQFfWoqhiJrjOQ6wxiJ+HSYpLULlMqzVwXuI3
         2Lh5LhsHO7m5/6rk6wj3PR8wJ/W95Rb54nEb3oY+W9ZhUTx7lczdAHsn9z9o3H5DwPXg
         ytnQ26gDF9Ni3woBv6Y5PsavJY4cCU20XOdhADg1wNO/ccHX9XDyzukV35YXT7iKN37l
         Hz2uEKh3a8pBQtZocCbs8HTRN5Q5LEfX2unxhxfGO2Vprs0mgC3NZlUPFkTKGw8P03un
         2wvA==
X-Gm-Message-State: AOAM532ptOs20j14+B8X1USGhlFsUdnZ4QFLHuI6/Elal76Y71swOMkB
	C9xYKCNB3dcY+YqRg4C155FvqbiGX/4=
X-Google-Smtp-Source: 
 ABdhPJxALUL4Z+2Yu+/FuAtGLhHuIuBoRQvGEeMZgjJXkOEkr2JekqAlOypzai+1dk6xz63bprtdqA==
X-Received: by 2002:a05:6000:1568:b0:203:72c4:bee with SMTP id
 8-20020a056000156800b0020372c40beemr18075981wrz.193.1647299844207;
        Mon, 14 Mar 2022 16:17:24 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm1122019wms.9.2022.03.14.16.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 16:17:23 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 02/11] gstreamer1.0-plugins-base: upgrade 1.20.0 -> 1.20.1
Date: Mon, 14 Mar 2022 23:17:03 +0000
Message-Id: <20220314231712.296796-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314231712.296796-1-quaresma.jose@gmail.com>
References: <20220314231712.296796-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:17:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163206

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ugins-base_1.20.0.bb => gstreamer1.0-plugins-base_1.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.0.bb => gstreamer1.0-plugins-base_1.20.1.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb
index 6afd51c01d..9b9be0d326 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "4cb66fccf730b1037e6533862c2128990912a6db4e5bbd14e0ef914450eb4c7c"
+SRC_URI[sha256sum] = "96d8a6413ba9394fbec1217aeef63741a729d476a505a797c1d5337d8fa7c204"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.35.1


