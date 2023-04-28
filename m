Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56683C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 13:51:59 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.20348.1682689917136773692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 06:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=C+4qbcQf;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f001a2f3aeso4956444e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 06:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682689915; x=1685281915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wCuXlGZbfICSOoULkWmVhlzjVa6aijZcg3Rt4eeE3fg=;
        b=C+4qbcQfklFjamg0nGWiXT+F0+oFRFzXb3/axOFh1fIgAuJmpIpBP4zJ0X2rY2i4ZW
         gpJmoxrSOYGIteIZTqMkalpa3mSpflhfdZ9+vNDB5jzfl3czgsywyAahiRUg09l56oIS
         wqixmyCaCcW10xIp4E4GW2al86pmkkV4Xvux5hCBL/6ZntgTMW793MYqUBZO+EsJSgAg
         DJGdkAbDbAkZ7S/BBuCOdbfOfD4N4zTnGRh5kqAVnZ0owlV9ZMqa6TQCk7HF5sLY2IyZ
         DprxcCGycJx+D0+gqHH/BnliW85nXJq4g/dvdUvFSgD0cMCMcbcfQlhN8h846avMxBwO
         oQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682689915; x=1685281915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCuXlGZbfICSOoULkWmVhlzjVa6aijZcg3Rt4eeE3fg=;
        b=fz6y8UrAXXAMp1eCyO7bCF78DP8NByZlySjk8ZYUCMAUyUiJv76R7bsRgiXQBb97oT
         qmK8PX+OWmYRoOtliCU3TavfxGuWhAYEOFlOritbShEQzkONnIggs0O6Hbl49MvNEq3q
         blDQLieHD82OeVFI9gwMPs+WPPpziqwG1kV3NVaWWkmLTcPLdQYP2wp2Y8lNVg3X9+Ys
         zhzUsorK+K+SveHTnZOuVULfva6oCcEuTVh1KcMgdcLmIWpTuwYrOAbwl6Q59/xYUw5y
         BjcMCC3PqhRRvYymzGM+4/T1HaOvtLW1Kcje5QffbixoKgp8ozC2pHcBGbiW4qvaAkon
         BiQw==
X-Gm-Message-State: AC+VfDxIqY80tpXseTDMLUSWkczofQ+YsIXe93dvY5xqufQsjeCxrJEk
	jxCgAHbsbQ4w35IA4BPKjYFH+uQ6WCw=
X-Google-Smtp-Source: ACHHUZ5gelzfmuESn4uETiYswMApvYmMDdltjA3QJxZAKJHpWtVYsmylE9CswDHbEwwcRbVwL5oJdw==
X-Received: by 2002:ac2:53b5:0:b0:4e8:485c:6a13 with SMTP id j21-20020ac253b5000000b004e8485c6a13mr1445098lfh.21.1682689914951;
        Fri, 28 Apr 2023 06:51:54 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com ([2a00:801:7ae:5c56:35f2:d880:89d9:46f])
        by smtp.gmail.com with ESMTPSA id n21-20020a195515000000b004f002961a96sm1282559lfe.230.2023.04.28.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 06:51:54 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] weston: add xwayland to DEPENDS for PACKAGECONFIG xwayland
Date: Fri, 28 Apr 2023 15:51:45 +0200
Message-Id: <20230428135145.5499-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 13:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180529

From: Ming Liu <liu.ming50@gmail.com>

Otherwise xwayland.pc would not be present in sysroot, this leads to
some xwayland configs missing like have_listenfd, have_glamor.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-graphics/wayland/weston_11.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_11.0.1.bb b/meta/recipes-graphics/wayland/weston_11.0.1.bb
index 2daecc9856..4f6ce19915 100644
--- a/meta/recipes-graphics/wayland/weston_11.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_11.0.1.bb
@@ -73,7 +73,7 @@ PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
 # Weston with systemd-login support
 PACKAGECONFIG[systemd] = "-Dsystemd=true -Dlauncher-logind=true,-Dsystemd=false -Dlauncher-logind=false,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
-PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false"
+PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,xwayland"
 # colord CMS support
 PACKAGECONFIG[colord] = "-Ddeprecated-color-management-colord=true,-Ddeprecated-color-management-colord=false,colord"
 # Clients support
-- 
2.25.1


