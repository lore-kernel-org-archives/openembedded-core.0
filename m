Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FA2EEB593
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 12:55:38 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.15956.1694264137277341741
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Sep 2023 05:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: otavio.salvador@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-57361de8878so1843613eaf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Sep 2023 05:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694264136; x=1694868936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INOEtVVrZGt1h7MA+bBJ1/xW3lIg3O21x8xrRNeCLVQ=;
        b=YX26YFHqsZQwanf0sJU0U8QK8iyAiF6ncP3Oo1rbclwbtHPBIcgxff5Xnp01PSZDsR
         QUH4hprzgPU/SaIydQ9uzx1ZIlAgV0eCXgC7vhkLHDslqpgs9kDoUQVqwf+r+O03F/lx
         Ue7f0UzqNcLXdn14nIqgpUh7prddVRnzCfB/oVzccxFhdA3VykUFkR4yw4g0n19lsoZy
         m44vjoz3bxmmHDgQIvCkfiiaSxul9irhkrNVU0vVYoSMcU2ECpDq+beVKpfmiVCKsQsf
         wFSJaV4V8d2pG0cWAp6yBVZjFC6qMEec78gTm1Pk1GvsW/D+FPXDpFGk+sYOdVmIWkWG
         lAAA==
X-Gm-Message-State: AOJu0Yw5IETa3G6JKkJ6/SsvT3axT/30cldu1I59BBFwuBN40qcUZ9n5
	jwKg+Sgj+VEmna1yJgsQuCezfdyRDuzdzw==
X-Google-Smtp-Source: AGHT+IGyRR8n9iHikPnDbjjd+DuWlX2adBk5MAF5KwSZbW4WDfx7I6BzCfG4Dlnd2lJ4AyZAMBUilA==
X-Received: by 2002:a4a:d1de:0:b0:570:c8fa:4ad7 with SMTP id a30-20020a4ad1de000000b00570c8fa4ad7mr5120580oos.1.1694264136321;
        Sat, 09 Sep 2023 05:55:36 -0700 (PDT)
Received: from localhost ([2804:d51:5956:ac00:e7a2:489a:8055:28a8])
        by smtp.gmail.com with ESMTPSA id 123-20020a4a1d81000000b00569c240e398sm1617538oog.30.2023.09.09.05.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 05:55:35 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Luan Rafael Carneiro <luan.rafael@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/4] weston: Add sysconfdir to FILES:${PN}
Date: Sat,  9 Sep 2023 09:55:01 -0300
Message-ID: <20230909125514.214512-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230909125514.214512-1-otavio@ossystems.com.br>
References: <20230909125514.214512-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Sep 2023 12:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187450

From: Luan Rafael Carneiro <luan.rafael@ossystems.com.br>

When enabling the vnc feature as backend, the weston-remote-access is
installed from meson inside the /etc/pam.d directory.

Signed-off-by: Luan Rafael Carneiro <luan.rafael@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/wayland/weston_12.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_12.0.2.bb b/meta/recipes-graphics/wayland/weston_12.0.2.bb
index cc7f95eea8..5a179e6770 100644
--- a/meta/recipes-graphics/wayland/weston_12.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_12.0.2.bb
@@ -132,7 +132,7 @@ PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-xwayland',
              libweston-${WESTON_MAJOR_VERSION} ${PN}-examples"
 
 FILES:${PN}-dev += "${libdir}/${BPN}/libexec_weston.so"
-FILES:${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so* ${datadir}"
+FILES:${PN} = "${sysconfdir} ${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so* ${datadir}"
 
 FILES:libweston-${WESTON_MAJOR_VERSION} = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-${WESTON_MAJOR_VERSION}/*.so"
 SUMMARY:libweston-${WESTON_MAJOR_VERSION} = "Helper library for implementing 'wayland window managers'."
-- 
2.41.0


