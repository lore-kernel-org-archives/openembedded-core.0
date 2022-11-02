Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2215DC4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 09:27:04 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.4148.1667381215088980544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 02:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=di3EtDlh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id i5-20020a1c3b05000000b003cf47dcd316so859230wma.4
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sP6MpUNFU4FXlyYe6ydFx5RJmK89YNDJzEDmYSAy6g=;
        b=di3EtDlhYzcLFOSveRcFHSw20h6uaNFbKmuhR0K1r0x2Ign9kYkAB3rgFk3CSDUDfg
         AYXrmYaXwY5luBFk0taIhViFx2U3TRA9SeFPsVJ2iBeiq27jY2tN+mHKtSQ20VCLs+3h
         Hq4PJk8+91F8ugXeP8lgh2kuJMjvpQfAjcN/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sP6MpUNFU4FXlyYe6ydFx5RJmK89YNDJzEDmYSAy6g=;
        b=488UwzX9Rj0FB/A7dcO1QsRHttrzuC0IVtswaDn7h+gLgOpKcH/LzhxUnahSzcAJLw
         3d8Sawn67XMSagsp8rxTCfpBzCzUmkGeV5hgEa29bMJ/jlGfTN3k/T9a172jMT6gfoww
         S+ZTMZM+bJaZYJ9pYZJcNwqBOq1YsESNrXL8dAVn4/nZ8ucR9fn7R4VBjuYdjTvo/WL5
         OGh6mLA/wyYgHaXgRlbvLzqnhIncnP+1i4OFqIynLzUYRp4E8MIN5clWxnyZ0FbSSL1D
         qRYDfipl3WTrozn5iEtl1GtIbM6FmYRS/vbSto6GSbFsLVYRbpZyTqzMu67DCFdmdNhG
         0eKw==
X-Gm-Message-State: ACrzQf3WxSJgwOMT37gGG90HoUX/F/jH0r5Ea4KojMEO195U7+l6AUkt
	mkGqV+KoVdOek27uAaqf4H6/Iggwo75ZdQ==
X-Google-Smtp-Source: AMsMyM6mqdGRrODI8JPrEfc75WzUaauWKvXB29BokmBl401WcSZZNU9aHD7pwcODN9KC9EC1SfdLbA==
X-Received: by 2002:a05:600c:1f17:b0:3ce:1f81:d9fa with SMTP id bd23-20020a05600c1f1700b003ce1f81d9famr15008289wmb.138.1667381213166;
        Wed, 02 Nov 2022 02:26:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b8b1:19d6:e9d8:a61a])
        by smtp.gmail.com with ESMTPSA id p16-20020adff210000000b0022ac672654dsm12371431wro.58.2022.11.02.02.26.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 02:26:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] lttng-modules: upgrade 2.13.5 -> 2.13.7
Date: Wed,  2 Nov 2022 09:26:49 +0000
Message-Id: <20221102092649.631136-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102092649.631136-1-richard.purdie@linuxfoundation.org>
References: <20221102092649.631136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 09:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172578

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-modules_2.13.5.bb => lttng-modules_2.13.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.5.bb => lttng-modules_2.13.7.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
index 00095d6ab7b..49c584dff4d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "eceb3428d80e85a9f008425beb9526195c9f7f02b302f28add56df53aef3e708"
+SRC_URI[sha256sum] = "5a99679df7903160cbde3918fee5af90ffafc90fc96ccdefaa57cf230492b234"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.34.1


