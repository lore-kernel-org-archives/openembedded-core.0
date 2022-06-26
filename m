Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EC8C433EF
	for <webhook@archiver.kernel.org>; Sun, 26 Jun 2022 09:45:20 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.28864.1656236713100267396
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 02:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E8e5gpRB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id q9so8978256wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eU6Uo4AKLVOpWWxfA4CkeEVHsUmSUXq2thl2LkV8pJg=;
        b=E8e5gpRBJAdXLGX8h0Pi57jBVmELuBS6VuYes+Wk5ikiFiYEt9X8l4nezy+tyB/ZNR
         W2hbRo1gdo/ac9nTRt4HncaPyWpm2Eci8u53Ku9SSy4R3qJqcvzqs33Z6sAiMX6V2dIP
         Ttke+WZ13xnUgGpyRHk22byLUb1TvhyOXRjrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eU6Uo4AKLVOpWWxfA4CkeEVHsUmSUXq2thl2LkV8pJg=;
        b=xjvRiz924vsdVt6jw7BGL+bpSuCVLrBpwqdbVGZHbIx9ZaofjGCJ3PppDsbTDZTH49
         YUuOYxY/JskA0p/ZTiDQWSriAHz+5iyzpMxbABD76Rgb0itmLhkeQA6zs0T+996s5coS
         Xn9PWSjQvvIDM9z4FWBGowMbhG+CmvhEK2CgElg5uyEhCrxO+gvJ2ZzzbSH/yJ/SA2pG
         8J2OnGLAox2jlgYyZAyUQhAFOYKXkXnwKhiBkWHx4PSGlNd/NMeh1tWVRZZeg110uPU3
         Y0uJkK0GCWgnO/z+la0W1p4E9WbeTCbxOutzrE49yv+bVQ2g4wUHpvFLbZRJC+TU+5i+
         LVHA==
X-Gm-Message-State: AJIora8tVyNnB6CnxxfFXRmnvRBQQl4paclrUTGsGoUp9/D4bxkGR9rp
	jPdxAEmlDAYCBDd6O9UhJ4SZZ8W5SHfXfg==
X-Google-Smtp-Source: 
 AGRyM1uJPL+d98vz9t5EuhyRBh+kaspt2JmgC2IeyJTc5/GcSir/fUUFLjoPDfNgwtTaD5t7ZNhxTw==
X-Received: by 2002:a5d:64c1:0:b0:21b:981a:594e with SMTP id
 f1-20020a5d64c1000000b0021b981a594emr7046935wri.171.1656236711243;
        Sun, 26 Jun 2022 02:45:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2873:558:fe47:ee6f])
        by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm7305018wru.47.2022.06.26.02.45.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 02:45:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] coreutils: Tweak packaging variable names for
 coreutils-dev
Date: Sun, 26 Jun 2022 10:45:06 +0100
Message-Id: <20220626094506.352336-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220626094506.352336-1-richard.purdie@linuxfoundation.org>
References: <20220626094506.352336-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jun 2022 09:45:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167306

PACKAGES uses ${PN}-dev so be consistent with the addition to the
variable to avoid weird variable conflicts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/coreutils/coreutils_9.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.1.bb b/meta/recipes-core/coreutils/coreutils_9.1.bb
index d57e147a7e0..0f57372369d 100644
--- a/meta/recipes-core/coreutils/coreutils_9.1.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.1.bb
@@ -171,8 +171,8 @@ RDEPENDS:${PN}-ptest += "bash findutils gawk liberror-perl make perl perl-module
 
 # -dev automatic dependencies fails as we don't want libmodule-build-perl-dev, its too heavy
 # may need tweaking if DEPENDS changes
-RRECOMMENDS:coreutils-dev[nodeprrecs] = "1"
-RRECOMMENDS:coreutils-dev = "acl-dev attr-dev gmp-dev libcap-dev bash-dev findutils-dev gawk-dev shadow-dev"
+RRECOMMENDS:${PN}-dev[nodeprrecs] = "1"
+RRECOMMENDS:${PN}-dev += "acl-dev attr-dev gmp-dev libcap-dev bash-dev findutils-dev gawk-dev shadow-dev"
 
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
-- 
2.34.1


