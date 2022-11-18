Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E1DC4167E
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 22:29:12 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.7256.1668810550361349599
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 14:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B1qvixsh;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id g10so4452517qkl.6
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClMFnYTAqF7enyf/mragzM8WNkbMjfnN92tf5plBTBE=;
        b=B1qvixshm1nGF1xEmW2VIMt8kSuWqUVWNQ2IkRMgXKu9ac3UBSbYE8ApH3IZa0nkSL
         q75/dl5MC2ocYXkAwLd0ESFEKgUofuiv4touKg943aTZoDCBJgtvtQs4YANiD/yPCIiM
         lbuJmGY/5Va30Bl9QJjKrHWQlpCN3Frsx7jJGzKHjdFe/p0NaiojITVGtbQg2SjzwSju
         KuSgoW5Q9njgiy+w9EEjL/xvydAndq2EL179/89vyYWRDvxnkgeKdBUgolunayvYIJnC
         YK9onAz/2/TZ3v9n0eJK/khkvwfGYFosrxqc0QFbP4dZekmrOd38+oTHh86NCYHgy/lN
         Dgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClMFnYTAqF7enyf/mragzM8WNkbMjfnN92tf5plBTBE=;
        b=HtTNje68XHELF8KqjO75TZ/xIPq+GuaV0qMupk51fFMdDuq5bV4z2iqj8drpQDD+Aa
         tgD9kGEEgqs/fNYKvGv4JIYQOqSCfVc4G0Hv7XVP8p/NODSkNAbK5DjoeDdP5tvzJsrA
         RDXrOiEkdSTJD5ty0zN0QY6xj78WuOEtS+GZMMV8E22bGghvLdvn//cqr2AvZaRap4sf
         /jjL39qSTiLEmcBPPtlKTQCd1g3iw4nli832GgeBaQIiJcBbt4rQWdmXpmhkc1+6EYYT
         wXqMugR/8TzKn7NmYjZXYCCaUHwPr+gc634cfGToCWw6ECsxg28LyLNH1wRnOJ6ozUek
         GFTA==
X-Gm-Message-State: ANoB5pnRIhDWGo0lFjPD39YM5OXMuzurMnrNLvk5L/jE8AkSO0AH/2Jj
	Rekoe5I9T7XeD/XGBsqB3Do=
X-Google-Smtp-Source: AA0mqf6TBiZcMnhI2tuGQFaea4sS+37c9ZzAHpc01/Chlp5tVBTUPt0hV30sQg2NgX9Tx90MzCpUsw==
X-Received: by 2002:a05:620a:146b:b0:6fa:f548:7cfd with SMTP id j11-20020a05620a146b00b006faf5487cfdmr7885564qkl.103.1668810549401;
        Fri, 18 Nov 2022 14:29:09 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a284900b006f9ddaaf01esm3304068qkp.102.2022.11.18.14.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:29:09 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/15] linux-yocto-dev: bump to v6.1
Date: Fri, 18 Nov 2022 17:28:52 -0500
Message-Id: <f0ef5687c0599bf527a99da7af4fa2e880bb0228.1668810409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668810409.git.bruce.ashfield@gmail.com>
References: <cover.1668810409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 22:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173502

From: Bruce Ashfield <bruce.ashfield@gmail.com>

v6.1 is available, and could likely be the next LTS kernel, so
we bump our -dev kernel to start testing with this version.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index e85d2ab723..8671b3d30d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -16,7 +16,7 @@ inherit pkgconfig
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.0/standard/base"
+KBRANCH = "v6.1/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.0"
+LINUX_VERSION ?= "6.1"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1


