Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E45C4167B
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 00:38:40 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.1256.1668559118956463199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 16:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DrZN6lOa;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id cg5so9835031qtb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 16:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhP8nEEoSZ59hKqgA1ByxU+Lj8+B6HBVShyl+S+Lfv0=;
        b=DrZN6lOaoQEeSftHCUetql4T5Xm16to5opx3M8q7srZF9bJiM/y2+mOEbVL+ZB0J/Z
         hkzXA6OuJ5WFderJ9YblmCb1ZxO3eay7yAcEeoAv7To3XxlTY+govtHLRTANC/X1le+q
         GO3JU591DO35fZFLIpyHWu6mWj5/Cn5XO6uxYSA4VLRDDxhzHMzYn7PNVqo17Q49wQr9
         tpm1rusMtehgMtJVriNajfOGh9VMWbIgq6m8GEkqVngkQzVUiM9JD3yJEG6gB6tjB6hX
         CteEzGdIFMGeRwdot+t9rW2CDM0AtzjpYgGSJafu9s7KY2okrUVjdsvEDb8v7BlXg9gj
         tE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhP8nEEoSZ59hKqgA1ByxU+Lj8+B6HBVShyl+S+Lfv0=;
        b=i9LW+YxLrG9QkkWav7ojg3wCvRVoCnXGhBZoZEYXrF1A+hAs7AKvG4uAg2cgTKN7NO
         ip/cj5jhP8bhTHMdOhhlhh4W7n1VJjUnjniYnp9hXeNsZIX0MgV9Sgr7XWezRHRWwKO+
         pHSPHR0PIiXaw3fjq+4hPH8UhHLkjBmeV0MF8L7YgTbkNycmDhFFDgn1+c1UkKVlqDeH
         y2UWKaIlmgyY0cRelKxOgVbkagcN8U0KmYd86zEbTwTk6yDHt38T9Hy4DsHQauw2aESM
         /TPTirC7qI2pMt844jOWPLv1puWPwQkqol3lr5S8hupW70S6PaUx3iSAzrNGEnvT/gAw
         ZmHw==
X-Gm-Message-State: ANoB5pkqierX+LqbBlUzKut/TAa0XQEcwI7TcT7izq0Nf4/crZYowwZS
	rOT9UnFJ/ODbd3lKQRqsdteI2SSN8e+DJA==
X-Google-Smtp-Source: AA0mqf5Ape59hp6swhib92sp0CEGHia2OnHYgP2z4dbW+2IZ5L+yU8xMHhit5eittoU6VVL7jHzM6A==
X-Received: by 2002:ac8:7588:0:b0:3a5:6652:4414 with SMTP id s8-20020ac87588000000b003a566524414mr18843458qtq.645.1668559117934;
        Tue, 15 Nov 2022 16:38:37 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id z17-20020ac86b91000000b0038d9555b580sm7926243qts.44.2022.11.15.16.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 16:38:37 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] linux-yocto/5.19: cfg: intel and vesa updates
Date: Tue, 15 Nov 2022 19:38:24 -0500
Message-Id: <01cc7cae53fd1eeb58d2615b20ede18f5f893b5a.1668558954.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668558954.git.bruce.ashfield@gmail.com>
References: <cover.1668558954.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 00:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173369

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    399055aee2f vesafb.cfg: rename FB_BOOT_VESA_SUPPORT -> BOOT_VESA_SUPPORT
    fe0fe0945fb media-radio.cfg: switch RADIO_ADAPTERS from y to m
    9724cfa270c bsp/common-pc-64 : add igc driver
    39431755e59 bsp/intel-common: add igc driver for meta-intel bsp machines

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index f55be51b64..f78ade3e10 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "59a2ffca6673305b3b9e3186294feb5437698d18"
-SRCREV_meta ?= "200c6fddf19c4a54c86dbfbe3d0f64597f5bc0c2"
+SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 41e37dbab1..f34ec707ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_meta ?= "200c6fddf19c4a54c86dbfbe3d0f64597f5bc0c2"
+SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 76d9d4b4ad..0447d500d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
 SRCREV_machine:qemux86-64 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
 SRCREV_machine:qemumips64 ?= "4e9603752156d3a0b9fe53309f4bc78d3f4f7df5"
 SRCREV_machine ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
-SRCREV_meta ?= "200c6fddf19c4a54c86dbfbe3d0f64597f5bc0c2"
+SRCREV_meta ?= "399055aee2fe59fbde5f7f9aadcc953bf49222f4"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


