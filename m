Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C115C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 13:20:05 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.9153.1634217603873762870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Tlem7C5X;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.43, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f43.google.com with SMTP id n8so26771631lfk.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IxekXEUYpa1UZM6olbXHU2LGNWPYCvxS4dvqpisAF08=;
        b=Tlem7C5XUuAAXgwlYdmsft3lAQ501WpuAvz6mZzici3vIh9xkh2gSTGpTCla82Yom8
         dOLhB24swrAsmE+ML6d5geaVMdMCdTBl4iaYrwpKNL1kAGbTvWl+u9IEh4GBda3L3djK
         YMtPXCyHo9ueuhby4oBU8FskrQY4wc+soK/RZY19JD4KLt2/5Ub+jMZtpxvilcoJGKpO
         OhliVBb7ZIDT1qeWuoQQRkJ6x/qjNE+lwIqqDPW5puD9ODbu9IrAtmbzFVchB4IgBLTG
         vsC37o0UOgKlctrjNDq32mKPCy/wdeZZPilhEYX9vGEXGZb77qHqku54HaJHdStbGNXk
         zQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IxekXEUYpa1UZM6olbXHU2LGNWPYCvxS4dvqpisAF08=;
        b=eNbdYwEOuqKxGCf+ggbJZO4mEwpA0g6jcL3wsFS7prKmOCdoHII28FJCt4Pu7g8KDG
         +g45CCEhWugUFW+TlsMxGD6tdQfA12hqxzpv9JjDvvAqTmUvu3Qwb9c2YcYGBWmS+DRd
         5ptDSzsmGqTqvuCezRl1hFQJZbcnpvMMybrpMn9KV1q5cJPac8gKCsKwEU2TDhWzd0pc
         OWocD5mXtwRe7IaFjXxK8biZX/k1H2SQVrl21C0J3PIXlmKcyENW1MQzLF+uack40z2J
         zPrj3DZDNihy+IKEHDYo3hNhKWBCscBsuSnRKWdsvOvoDqNaDQNNZ5sfINuQliMiMJsr
         IO3Q==
X-Gm-Message-State: AOAM532JjjkWKuV/FSFUWcfDduiO4yDLj2lOgFQJPkegan+mp7VEhgJ4
	L3A4iiuxvLAoIKh296ZhygfyDrgRTJ481AYH
X-Google-Smtp-Source: 
 ABdhPJwsW1RcfTORx4Thwo6x/JtUxkkoie1zqy0so4+2s6KZZcDHDrp3deGuTHHcjj79iG9g71mbwA==
X-Received: by 2002:a05:651c:1025:: with SMTP id
 w5mr6009901ljm.282.1634217600612;
        Thu, 14 Oct 2021 06:20:00 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 c16sm245651lfi.180.2021.10.14.06.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 06:20:00 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] xorgproto: update to 2021.5
Date: Thu, 14 Oct 2021 15:19:55 +0200
Message-Id: <20211014131955.2388202-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 13:20:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156952

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{xorgproto_2021.4.99.2.bb => xorgproto_2021.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2021.4.99.2.bb => xorgproto_2021.5.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb
index 1780e78c56..8edb4596ad 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=dfc4bd2b0568b31725b85b0604e69b56"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "c38878053179c6f8bc2daeeeeb4710b5fbf0e46db5b3134aee4a1977ffb06e7a"
+SRC_URI[sha256sum] = "aa2f663b8dbd632960b24f7477aa07d901210057f6ab1a1db5158732569ca015"
 
 inherit meson
 
-- 
2.25.1


