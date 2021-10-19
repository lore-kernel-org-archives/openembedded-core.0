Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EACC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:54 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.11528.1634657693037150001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R5EwZ5sr;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso3635548wms.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SWDE/BQq2klHc3Sxh8c75lWXZzGbw6c4OHJC+2f3+70=;
        b=R5EwZ5sr+OPUlyTf3bSbUpY+QoObtjS8Pq5r+T4XkNN9699vRcf0saPE5xT4Ct6J2S
         3fAvCYkhMsb/UfVoqq1wn9HN65airLC83suELI3d/mRecBDVswcnqbckA6h13n1qAzIJ
         U48tMf0/A0L3Dyjmc7Fk7As+T48ySg2QSLfbEmCrfLHPLkLU6hJoVgBx9+gFawly+npC
         vE9BCOYQNfh2ny3KYGb9nW/KAVbE6npPKKjVWQJtZzcNQR0Dea+qRy70f4md78Xk6WBh
         9sK/lGIRtST4as3BMU0Hb9mWlB97/ZqkDsA4lvku814bbZkoe2p6cqBVPKD+pcKSCuT7
         VPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SWDE/BQq2klHc3Sxh8c75lWXZzGbw6c4OHJC+2f3+70=;
        b=wkFdEQyoV2+iO3b0zn8DzAF9XuQ4aO/rT/4DfsDLNtOXc2yu79FZIyS9/ApnYKiDOM
         cWmHhX/Y23CT74P022rU8rjKStf4PiBiiren/r/iYfC6FJ5nt6ADCREzlhVxGFxVa6w+
         ziNqb7N3hjYEkbgFYrEN85gL/4Vyb3DYBUbUsV/0qrU9Ma+GMa7RmyPkJqji0rEfUjBl
         BT1i1urEdQ300+Kgj0Re9BpEa4D8BbdpZd6xJYcnHtwy6OwkkCni6brT/O6KuNHmFkei
         tTKZ30HV6e1jiX4tuIv2ekDZBeqBQ1byD3NB769GBwXzrhxT12xQ3JkoeUSOTVzrUL/U
         hA9A==
X-Gm-Message-State: AOAM530a+f7/g1L4OaybhM8SoweRs+Wco/hc6Gc5tb0LXZrYOQzI4nzk
	7p5RBJsi6X9LzcfNrHSwZt0DAFj1gmQ=
X-Google-Smtp-Source: 
 ABdhPJzpLLi4rdkwpRVh78R4AxRRP7cuZnssdIQ3MdDDHQTxBuxunk9/csOHHyR3GsxwyQnn6VY+JA==
X-Received: by 2002:adf:a38d:: with SMTP id
 l13mr44650286wrb.103.1634657691539;
        Tue, 19 Oct 2021 08:34:51 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 39/65] asciidoc: upgrade 9.1.0 -> 9.1.1
Date: Tue, 19 Oct 2021 17:33:53 +0200
Message-Id: <20211019153419.3319802-39-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157158

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../asciidoc/{asciidoc_9.1.0.bb => asciidoc_9.1.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_9.1.0.bb => asciidoc_9.1.1.bb} (95%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb b/meta/recipes-extended/asciidoc/asciidoc_9.1.1.bb
similarity index 95%
rename from meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb
rename to meta/recipes-extended/asciidoc/asciidoc_9.1.1.bb
index dd9f8e32c4..f295b80733 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_9.1.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
                     file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=9.x"
-SRCREV = "9705d428439530104ce55d0ba12e8ef9d1b57ad1"
+SRCREV = "08b430eb317c584aa6f02a3c4372035a4d8b92c4"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.20.1


