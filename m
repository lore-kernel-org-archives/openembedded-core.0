Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B67CC433F5
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 23:55:16 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.9317.1665273313057073422
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MYZAwWG1;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 n18-20020a17090ade9200b0020b0012097cso6144520pjv.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzIDWnJqptxFD3wdVQBCAb3+n2k9EDnTtLSflWZIKXA=;
        b=MYZAwWG1tPWIJDpJY97lx2Xw1zGXrKWMgDXkexMN139L+5QNuWzyfP7n8JJzz2M9oO
         MKS8H1P+ozwMK69VELGqL7LBVApAycLdwxxW3aAHBJxD2Lpe2GIHZ1vhLaGl0uO29R66
         fhM0gqSaZwE7ihDeboE+yWHu8sNe39dJmzNkn4pU85/kFTgn9VwfIXiHserqM0pKtyNj
         11r6WqJAXy1hJiBXGKE4GGPVyZGMfWLJ473Z1xmfa7iFgFmWhRHXklGEQCDw55DlyvV2
         iKzoI4aWWtP4Jl2dddHdie0w00PyMcCQWG1mPnu+5jgT8ljWt+KdPguitkFjiv5MNmz2
         x+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzIDWnJqptxFD3wdVQBCAb3+n2k9EDnTtLSflWZIKXA=;
        b=dPC+0PSLJ946Re2ekL4TekGK64dBb3cM60OFAS/nce5o9Llj5/JxTjoHD4ccgktXjQ
         rJSN2y3CdkDbwOhyjsZ/xWfyINXrvxz3WyGn8gZkJJ6LFVH/79fziIr4b9q7Y7K4+NPW
         Crp0iuTtAzyec0RE/xEnfym51HXgRex1nmT5fMatT/DTOq867/qp+FwHrvHJxlM6geJZ
         fTwwBYB6zId9keAirFvD1/Qjl6/RkWSMyUUrSIbOVL3lxaWd7e9/5Ync2e+R5TdJJeNk
         h0wzIJwqGS+OWBJFTa+9ZJnIZylu29mQ8N+JTzRNmObWmi/WPB9x48ePnRCpU5GObJeP
         g8kw==
X-Gm-Message-State: ACrzQf04X3JDRAsF01q2+3YY/zcK9x46cdcPSEhQzGS3AwBKIz668jIe
	YNx7SW4HWs3HYHYV2PB+fJUb9CteysU=
X-Google-Smtp-Source: 
 AMsMyM6LxrTIqvRCPqf7bHCJ71NKKDuv9C4V7faE4qji4ja/sbTUCIIg+IkJDyNi3M4q1ki5vo7Oug==
X-Received: by 2002:a17:90a:2fc9:b0:202:5605:65ae with SMTP id
 n9-20020a17090a2fc900b00202560565aemr13054012pjm.167.1665273312178;
        Sat, 08 Oct 2022 16:55:12 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net
 ([2601:1c0:ca00:cea0:170:23ea:e88e:bfb7])
        by smtp.gmail.com with ESMTPSA id
 k11-20020a170902ce0b00b0017f57787a4asm3814710plg.229.2022.10.08.16.55.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 16:55:11 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] python3-cryptography-vectors: upgrade 37.0.4 -> 38.0.1
Date: Sat,  8 Oct 2022 16:54:46 -0700
Message-Id: 
 <d5be88b9c10aa8faa603d02ec7a222068cc3f22c.1665270768.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665270768.git.tim.orling@konsulko.com>
References: <cover.1665270768.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 23:55:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171540

For changes, see:
https://github.com/pyca/cryptography/blob/38.0.1/CHANGELOG.rst#3800---2022-09-07
https://github.com/pyca/cryptography/blob/38.0.1/CHANGELOG.rst#3800---2022-09-06

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...vectors_37.0.4.bb => python3-cryptography-vectors_38.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_37.0.4.bb => python3-cryptography-vectors_38.0.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb
index 270d8ceca66..43e96b48448 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "5a61400510e28937a5654b40c6ea4e3e593c5aaf0c2081c5b912f0e7cf883ea8"
+SRC_URI[sha256sum] = "0431fd107c1fbad0377704a7051945b3b391169fddc4f6fa0bd4edc6b6e235dd"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.34.1


