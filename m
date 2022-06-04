Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B864CC43334
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:49 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.8698.1654338403867829136
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IF2Q0K9e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id q7so13301117wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=d/HhkkxpGN9cHxqFllthxtIcSUJmoY8PE5kk+2H+tzU=;
        b=IF2Q0K9exgbT9eyhfgo994lBf00EnMBBeqteUhnzspGDxrn0Batiul1YXCEOGF98UH
         /3xI7rq9TD9S8vc4BBhiJnw/gix4CHYggwor/cdWHswDoV1DsAgVmnkRXtQ+ZBZ20iPK
         eU5E33X+TtiYGsOjJvmRqfwZS2Ti8ziI4Z3+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d/HhkkxpGN9cHxqFllthxtIcSUJmoY8PE5kk+2H+tzU=;
        b=sru0xvsFX6Zsn706c8wSpedMXo5q3rIzUVtUp4MiTMS3Ly4HcPf0wCAVOpielbkQ6C
         p/Ttk4ODgN9gdW1shrZK7hgtB1Bq/5GL/0tpcDeCDvqD2iZSdC+HbUDRDx7F3iUsv+QJ
         eS2Ughde7PK+Oz4Agqt8LDqbElK8ZW8EuxCBEjke16UVbTTEp9eFjFyUhhVygnDDPVaf
         oLKycWmkmMtMWOaIUU+pcnCLQ3/tE0qKaX85Nb4r1vRbPQl1efeYzT7vcvDpZQHVxzip
         IHsJp0/qgHKhqcRpQkXqIb8+1lOA1DbeMc+8mhwBdfENfryKC44PmCEXZvim/6pWqdK8
         dGWw==
X-Gm-Message-State: AOAM531IDVUCzeSANbY0eZV+oJFMJqTegFK0UgeYkuSqNcM8zD2rlTRS
	MA+7FmpvkrX8dMXNwfo5h1xhR5eIsMhSdmcH
X-Google-Smtp-Source: 
 ABdhPJzxSMOvgNXharySnmN1YeSQtO9JZ+EojykTAATYoPxzE3J02Uzrewhwj9cVyD4WbSvtivSfUQ==
X-Received: by 2002:a5d:6da6:0:b0:20f:bc8a:9400 with SMTP id
 u6-20020a5d6da6000000b0020fbc8a9400mr11986579wrs.274.1654338402137;
        Sat, 04 Jun 2022 03:26:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/17] webkitgtk: upgrade 2.36.1 -> 2.36.3
Date: Sat,  4 Jun 2022 11:26:24 +0100
Message-Id: <20220604102625.199845-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
References: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166562

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../webkit/{webkitgtk_2.36.1.bb => webkitgtk_2.36.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.1.bb => webkitgtk_2.36.3.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.3.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.3.bb
index 65757c36a73..83b6f8a6ee6 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
 
-SRC_URI[sha256sum] = "0149ea5fb1d20f2a9981677d45c952a047330001ea24a8dc29035239f12c0c8f"
+SRC_URI[sha256sum] = "732fcf8c4ec644b8ed28b46ebbd7c1ebab9d9e0afea9bdf5e5d12786afc478d1"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.34.1


