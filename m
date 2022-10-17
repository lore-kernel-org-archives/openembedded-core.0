Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FC7C43219
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 23:09:06 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.657.1666048142297886719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 16:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4/egzNI5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 128so11787010pga.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 16:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHlM6YvB6UREnT7oLEk46s2vVBG6fviBQUvddikA8hQ=;
        b=4/egzNI5YdE00wca61QK6Lrid1Qmj0NmmLhw5dJSL2Xjl2PZ30uiWAK7HUKrbx+OXS
         dUsz292rYA2oeXMjpwgMAUN0G9F/8Bmp/vPZVMbZ2Wq1wZogLkliMutmg2QxaLHvBn9z
         ScvMPkz65ckAlXRRTrKsNShgE7CVV1nMW8HlRAETnOSzL5fYAqJcugCn34MAMWU/qqdV
         Lddi8Y8+/omjPimIUNYQGG9NrdV6ErhdaP7564zOY8y0pHs2qjvPK5oAyBdzRxkNHxE7
         k4IQqKsQAJMD+HOo/DJKeNV3DL4bkfRC2ED1ltIAQwyBsKJZJMPQyAGGaDmXLx9PLH+4
         OfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHlM6YvB6UREnT7oLEk46s2vVBG6fviBQUvddikA8hQ=;
        b=2cg+GDhllUFesIEKwkiGuk78WtuC6hcEalfiS7IP/wrAf7+4m9rN7Hxtf06Cnrs7n5
         J4+wEb67j1Py/XJEg6TyCp/7lF/PuTj4M44xSGQ1QYG9GBFoOxwQ0wJoX4+wLZ/e2OVi
         Z3EBp4P5SqIot99FBIXW+9nbsNLvrOmnYSIFwIFaU9XIXvcUqFTnfzH5PyMjTFqkXeDh
         WhlrLc4GBRR76AE1Xyvgy3T1Cm0XWGG8NhFZCydoaYR2puhTRhFi5xzwn15KBdt50HpX
         RBvMCMzZv3hPgQ5iYgGb2gZOSsYSPgo/d0SAofpooDLFHFJR5clt9tQ7Wf8OVnKX1dD3
         QlGQ==
X-Gm-Message-State: ACrzQf0/OKwpgSNAlvjyS3XTG8ShjEphmt0VS7dWmsRZFVb0BR1/AsE4
	ip/EVUslw09KRfOvEUpGp6WcdFOzPnpsv25F
X-Google-Smtp-Source: AMsMyM56qs2fWdoZgJHuPN3hXkHbeW+YCBumkSECbfZgrOg4pCZhUFlEU3C8IG3jgrMj/H2jk6Vu7g==
X-Received: by 2002:a05:6a00:1304:b0:555:6d3f:1223 with SMTP id j4-20020a056a00130400b005556d3f1223mr154338pfu.60.1666048141270;
        Mon, 17 Oct 2022 16:09:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a694600b0020aacde1964sm10119479pjm.32.2022.10.17.16.09.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:09:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/13] lttng-tools: Upgrade 2.13.4 -> 2.13.8
Date: Mon, 17 Oct 2022 13:08:24 -1000
Message-Id: <17d18936d201a61b16bbc24c9f10af6ef54620fc.1666047986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666047986.git.steve@sakoman.com>
References: <cover.1666047986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 23:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171926

From: He Zhe <zhe.he@windriver.com>

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
index 0ea4da05ce..0b6dfa48a4 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            "
 
-SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
+SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.25.1


