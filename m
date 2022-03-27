Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A696AC433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 16:41:31 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.752.1648399290656998593
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JWAGarbT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id p8so10539388pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lqvgD+/GA7tTRZS5WyC4C9HU/wgws5v7zHpC2y2VKvI=;
        b=JWAGarbTkC+KO+7yISLLJoTBeO7Hav7bffmSG7z0pURwiUo72UTj0RrjV0VUJ+IO5L
         SHuvum27ps0qmR1aiTdmadDjPRt5LuRfJmZk8fZJlZfhQ+jxLc7rW/ZoqDwX6okaC16b
         45X3+Lbjom07yn0lFTp+EkOOwr7D/scnhSXPzBI4gu6Q40KInQ2tIiNAVB7Y6QbqpUF3
         5GeMXiMWYy2VsdWfKYKJWXF/Hzrwjz/NZfcDyQzJs3CA3u9pJveXn1k8yL0o/D3UsCRz
         GwTUgkDzxF1+NlSvUX3NPvjY/NjKPqwhq3uwuFsHSJO6VkAmAK13CqxobfP99JTMgHur
         Xb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lqvgD+/GA7tTRZS5WyC4C9HU/wgws5v7zHpC2y2VKvI=;
        b=0Schb0jtsyzVAasbaGDxc3wRl9y9za4UXhFLShN9PRz++rs0dRpc81Dj956t5x8nyq
         9JTwPovpPa1OerHG06261jNld4preC8s8n3+88cRjEmJEQsfRsd9t6BcLuiyRGu4mGXz
         VaNCcyywP2JunqAmwrh1vhiVU+d0BqjlVTOjFZM5vpzDnkLQdqQj4NN8vW8kTC52aNs1
         g4WlBpmj7s0esXeSTHzjXoE3/LUxrqKu3/BE6/lp18im1v+PZi683mi8SssAZRCcPw34
         gKfvasIFOIBO0Z3wQXktUIXpyHBVBj2HD1xCXw32/zWPBjDm9Mb+alwcH/PjuEDQuocc
         8YtA==
X-Gm-Message-State: AOAM5301fM1YYe8ZSggvEZJUC0vV76qqsgsV40iHJa7mbDfIJoXOmCC5
	AWp44/AC8kmmOPoUmvf7o6h8mKiD5EY4eFTeleg=
X-Google-Smtp-Source: 
 ABdhPJyMB8fitAeci4QDMhAnkBFfg919fJsS2yPz8p11I8qNuWNCy9PA2dLiUpl4YVFr/xjdKEfIRA==
X-Received: by 2002:a63:615:0:b0:382:6cc2:6983 with SMTP id
 21-20020a630615000000b003826cc26983mr7173606pgg.37.1648399289676;
        Sun, 27 Mar 2022 09:41:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm14583732pfh.143.2022.03.27.09.41.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 09:41:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/10] gnu-config: update SRC_URI
Date: Sun, 27 Mar 2022 06:40:58 -1000
Message-Id: 
 <4ee75d865b34f615bc649004e9dd0460eaf42dbf.1648399113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648399113.git.steve@sakoman.com>
References: <cover.1648399113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 16:41:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163674

From: Minjae Kim <flowergom@gmail.com>

The git repo for gnu-config was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index df8947e425..05cd6a1e63 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -12,7 +12,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRCREV = "5256817ace8493502ec88501a19e4051c2e220b0"
 PV = "20200117+git${SRCPV}"
 
-SRC_URI = "git://git.savannah.gnu.org/config.git;branch=master \
+SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
 S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.25.1


