Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B490AC6379F
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:12 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.24060.1675260851500066052
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=U7ROM8bq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id q9so12578363pgq.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnbQdfrESWwY7o54aYa5n8vqgpCCIpuY7XGRXt6J5uI=;
        b=U7ROM8bqF3YvkytJvmuDMQIXjOp0DfAZOxX87Duw3tjnBIaX2G19s5V3raHQlT5ibU
         YLJCgwk9DFJ96qJY8CH7wSS6jaxi2QdgOZo10ja1+shjoIRJMuTbrnaYlcAdO4uKxhnq
         Ei6aEiMrq/5wp7wo8CgPMeuQSuJa8OQ9RieDq8vWhz0M/dSZb8KBBhWFaR350g2DRCcS
         kQZL5vPS8fgeoEr850NpNrI3ud+UfxwJcX3m9bW6XMBIPQrra5qOsKPH8i5SFSMWgyA4
         uwj+WOwYouo6g5ziTFsr5PbCX1XXqwbe5TicJWlPhoQcBvBNFSMAHc9qdvU4KStDPjXV
         nl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnbQdfrESWwY7o54aYa5n8vqgpCCIpuY7XGRXt6J5uI=;
        b=SJ1RdC8A9FYNPyMUFUi3WARsWHcddRZNqS3yJ0ojDIRKqCF8b00RnFhOezziu8jFgk
         WfIiWcFC0QouFZm33+UCA+vEXVR2SsAI2eN8domUBOd7ThQk0aux6RpHnEkmylVzN4RB
         +dhlq/Dl+yVINJR2SdgRbczO/n5lugL9Mm24LHk0Y0s1T57mv+lgrRUSdnsdpinOkIY5
         7YnmCL2aVV6BVJ2SfZRxE0yX8yssE4tdjzLz6pANR06VSFHhj1pmZM31nTs0ebPUqoY2
         GDzgkzHw4qHIBEUK8PBfbG8KfZGzMjrsj4nIEXEfoWM9tx8wyTSQ5EWMkCfOMtwJOs21
         KNaA==
X-Gm-Message-State: AO0yUKVGLisZKU6N99N0cMo52wX9atLfwn86zuFSifwBuTr7S+BU74TP
	TYEVReqVyFr9hzyKiAeg4Ebgyf13R0+7HT49ovs=
X-Google-Smtp-Source: AK7set+HeSHpSjQJW17i+NLI29h6xNqfZIDMdeVud7B0rxpQJ9yANt0QgwVDdAefym6jOkhyHvnc9A==
X-Received: by 2002:a62:7b0e:0:b0:593:a131:3692 with SMTP id w14-20020a627b0e000000b00593a1313692mr2551057pfc.13.1675260850506;
        Wed, 01 Feb 2023 06:14:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/17] lttng-modules: update 2.13.7 -> 2.13.8
Date: Wed,  1 Feb 2023 04:13:42 -1000
Message-Id: <da386f40a8207654dbc9886e56b7b6cc065b701d.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176539

From: He Zhe <zhe.he@windriver.com>

2023-01-13 (National Sticker Day) LTTng modules 2.13.8
	* fix: jbd2: use the correct print format
	* Fix: in_x32_syscall was introduced in v4.7.0
	* Explicitly skip tracing x32 system calls
	* fix: kallsyms wrapper on ppc64el
	* fix: Adjust ranges for RHEL 8.6 kernels
	* fix: kvm-x86 requires CONFIG_KALLSYMS_ALL
	* fix: mm/slab_common: drop kmem_alloc & avoid dereferencing fields when not using (v6.1)

Drop backported 0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch
0009-Rename-genhd-wrapper-to-blkdev.patch is present only on the master branch
and not on 2.13 branch, so keep it in the recipe.

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b04d4cea291b8d816a3a8d880004506fbf2b390)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{lttng-modules_2.13.7.bb => lttng-modules_2.13.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.7.bb => lttng-modules_2.13.8.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
index 49c584dff4..542f42ae19 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "5a99679df7903160cbde3918fee5af90ffafc90fc96ccdefaa57cf230492b234"
+SRC_URI[sha256sum] = "f525d3d48ea3a475cb535339c201666d0e4c75ec8c46d29837bcf381ea02cb19"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.25.1


