Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC92C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 00:11:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.20919.1646611905156089714
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 16:11:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MFqA+yWc;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id j17so20827797wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 16:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LV3mHJbh4qvrAThtlZXqajGLL/zf1S31RlGAW1hqCjI=;
        b=MFqA+yWcwZ7MAovrZm59bD6TCnStE534c+4n0wRY8vxq/ll2u4MFuWpKSZMpahaT4R
         Y12No3dehPrvs4Zd/Y+UHDOsD5KsgDy4tkRmy3riuhuxEenDYE07EbVYegJtQd27teX4
         GJc7coRPzUfEyPb24h15vXIADP/7uNQj41mvW2jBbXFJEmKSblzE8xbs0ZclDTgk5MA2
         lZxEKKDEN+47VydYm1GP2gjUj8bniO3Y9pRALsm6YavnesxQJnte4vikEq2ZZ1GUi0r/
         A9hdXWuJDdrQKM6QajTym3HhbTRJVoblPJj11xiCeZqmORh7qxCH/MeC++hTGjqMPhRd
         y8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LV3mHJbh4qvrAThtlZXqajGLL/zf1S31RlGAW1hqCjI=;
        b=WVuqWF+drrKbeybX4P0of364L5mewUYvkqyR4r8hm/2/Zh5v+X1aUC4L41NZk3KmOH
         /GeR9E/t98DTLFHavjlbYT4I6oDXVg2Dhi0BFaFx2cBU8zatCGM9vtSjq30ZoOPKDzfb
         dQsJnHwb9sh8jsOo4C+EFIZi90wyhx0U+nKU30fRQOYf5A9KYsKwuUd53JP+h7kimGB6
         1lcYctPvXVRfLeFBICZbgQ4e0eXq2qjaWWi2wh1G2kLIq6BEvyqQc0jTeZ/KNzMf7les
         ZRfDt93xBmGMQvhauBJKky4vLfxwZW7KYTy+fKNkKuiKtLYXE/dB+y+hlCj1NW43N8MT
         AuBQ==
X-Gm-Message-State: AOAM532w1nWqwvsllsOkXd9EBfWLFF8WMjfkv+HU0IOURpM+RrTBSFiH
	fqjy84msbOG6DuHH1hqdNLfoLCjQb6o=
X-Google-Smtp-Source: 
 ABdhPJzEG25MUe/UX9/HpMAxukYbY3zUGxwe1nNoMt4yxDo/vNWpkYxgS6BTRxSIlCDpI6EyVswiKA==
X-Received: by 2002:a5d:650d:0:b0:1f0:19c:a066 with SMTP id
 x13-20020a5d650d000000b001f0019ca066mr6180622wru.149.1646611903351;
        Sun, 06 Mar 2022 16:11:43 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o12-20020adfa10c000000b001efb97fae48sm10195049wro.80.2022.03.06.16.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 16:11:42 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/2] gstreamer1.0-plugins-base: libgst is already defined on
 PACKAGES_DYNAMIC
Date: Mon,  7 Mar 2022 00:11:14 +0000
Message-Id: <20220307001115.197103-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 00:11:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162792

PACKAGES_DYNAMIC in gstreamer1.0-plugins-packaging.inc have libgst since 768d621

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-base_1.20.0.bb               | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
index c9fbc599ae..6afd51c01d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
@@ -19,8 +19,6 @@ DEPENDS += "iso-codes util-linux zlib"
 
 inherit gobject-introspection
 
-PACKAGES_DYNAMIC =+ "^libgst.*"
-
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to choose OpenGL APIs/platforms/window systems
 PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2 egl', '', d)}"
-- 
2.35.1


