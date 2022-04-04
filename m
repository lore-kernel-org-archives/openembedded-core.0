Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532B5C41535
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:41 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.36628.1649085567427315150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 08:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mh82YIEV;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id i15so1762770qvh.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 08:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sND6mzqZd31cuncIfzHhkrh9Ruhc+O7rVpK0xgDMBdw=;
        b=Mh82YIEV/FL3vjjtBB/eWKpALgyNnlyKaNV9hIdEwx0VnzlRqMpTwW6GklyD8pR/Sz
         Fhsw6f3h8G8bPmzv/IE6bxyti/m5qMA4Ev7ht540QiOyZRcEn/J/UhXFarWsA20M85bI
         c3ioJ0sWOtWkpM27nK3XiagCxEDmIJaiPviqFuEXHFh+CgS+xa4ewIJ77/qJ8Oh0pkjO
         Ogqrk8VaLHDuuPeuz57DLmPtGMKOtDeLt2Ww/d78VU3Mi72Ofm210eJy/BnQJC2LrXL9
         N3/o+oIzPAr7NyjNF6TUrLEus7QhoO4A661lbCexBatRiLnbq4MXPmtaDPnb5YuN/SWo
         zNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sND6mzqZd31cuncIfzHhkrh9Ruhc+O7rVpK0xgDMBdw=;
        b=vJ8PSfVpqGVDTMvjuxtD5ZXIb6rHgatnqsMvQaOodI39n4DCzTOmE6AeyVc3HY/JsW
         XTwjiNiHzImcBnTSYPBusUnUjeKwhyxvribqae0PJDAbxxF5looNZuS2eayRg+ku75TU
         j0548DcAlhPKuXOYiB11WO/J/EMyF0PFPoPPEe4/lFYd0dfYxMTCRRalN+xFi8W+rz7O
         Mtp9psYg7AwiqobcsYXOudSAF9i1d3NxQaJwz8TeaoUL5cIhEVq8yNcrL1EnC0Yk5YpD
         YremqnaZjH3R6cOmPVoCjyoJFFK+hST/RBPmL5dyuXYr7HSF0G7lazlOeMp7SGCAhXHx
         oy5A==
X-Gm-Message-State: AOAM531nITiveds9QQkgMaBsxTjIBel5ZxP57GLGCHgQf2hmi6l8Gbi6
	+BOChlqwEP4hGuJLheZwL5c=
X-Google-Smtp-Source: 
 ABdhPJzsYhvafVfXBaAKKu4AKrSi3QZt0cLrgAI6d4KuEaSHrIZpWyXTZ6GXUTCwdrsH2c8bGlAyHA==
X-Received: by 2002:a05:6214:21e2:b0:441:a5d:59fa with SMTP id
 p2-20020a05621421e200b004410a5d59famr69562qvj.5.1649085566385;
        Mon, 04 Apr 2022 08:19:26 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c3-20020ac87d83000000b002e1d1b3df15sm8969772qtd.44.2022.04.04.08.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 08:19:25 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/5.10: features/security: Move x86_64 configs
 to separate file
Date: Mon,  4 Apr 2022 11:19:16 -0400
Message-Id: 
 <74fa76a12afe0d530d662708f73bf1d606c5d4dc.1649085436.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1649085436.git.bruce.ashfield@gmail.com>
References: <cover.1649085436.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164001

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    2278ed571c1 features/security: Move x86_64 configs to separate file

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 9b125a92ef..3ff54b9ebb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "40a6731993d406d6c9fed43cb20c6a4f178ff2cc"
-SRCREV_meta ?= "1ae63728667964edf845b4f85bb6c06a55b81793"
+SRCREV_meta ?= "2278ed571c14df6e87d8e01ac26f649d98020623"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 98ac869e79..bbaa0ebc00 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "9524d0ca0feeeb4cb698e3c984f4391ccb4b8e19"
 SRCREV_machine ?= "bccf3a5f14511fb8ce6a9dd990216508d2c2ec6e"
-SRCREV_meta ?= "1ae63728667964edf845b4f85bb6c06a55b81793"
+SRCREV_meta ?= "2278ed571c14df6e87d8e01ac26f649d98020623"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 74fd0ad21c..0cf14b748f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "d2f7a595bf0b752275d503046494b668549cb151"
 SRCREV_machine:qemux86-64 ?= "d2f7a595bf0b752275d503046494b668549cb151"
 SRCREV_machine:qemumips64 ?= "279f142932679a8ba212ebae4b9db851636a1fab"
 SRCREV_machine ?= "d2f7a595bf0b752275d503046494b668549cb151"
-SRCREV_meta ?= "1ae63728667964edf845b4f85bb6c06a55b81793"
+SRCREV_meta ?= "2278ed571c14df6e87d8e01ac26f649d98020623"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.19.1


