Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3382FA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 14:17:01 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.9603.1667225819688691033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 07:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QpN7p9Da;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id b11so10507195pjp.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 07:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SdsrzQlizJ0o4rbaqwb4mFcl4i05jc5OUHvCPXOQphk=;
        b=QpN7p9DaCavY6nUuO42LCgTPdbbTndLHbn/SKtN+0zjvCm7ox9rW/pNgEXiWtfANVD
         brfIoX/1m1wsJhwu5IDcph2AEGnQJmvR490mgERJvmlLgiq1FnrfwX35OYvdu8fViyVT
         hzgSFk041a9v3NBACzetUW+Eh5dGfCRNzpOCKYjC3v8Dd1dM9OM5lgyA+f+Xqt3fmHSl
         7HwEdjcbCGeSX8cQsViQhrphkMR2uRpmfk238z8Iwm2cUUK2/0UeOEC3BZfwftSn8MZf
         aPIGryumAKtNDhV2hXRKhfyI5/SV6kPMe6BJ5kPh+2Tv1PKG/uSMnzR54Qo+N2hFNzPE
         xb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdsrzQlizJ0o4rbaqwb4mFcl4i05jc5OUHvCPXOQphk=;
        b=O++qbfLMpIrbXFc4X1IEM3jLzdq2Zk+BBn3t5hymaXwmHPuHLCIw9Ti0LyXmUrDroo
         Mz5UTViO/RL25q2T9xPZAJvcgBqN21X7rwCKakNKHsNV6EynWEKF8UnuWbQl7iz9zlph
         6orAr5/u0cWQ9L3bunx6b6I1MKULBsi0fEGUBBskon5Fpjeg6TX0RHzUoTqfPBqmk7hz
         sBWz8u1JHsFIVs2yFGEtJB5qx8oLRFfxtnAt7HsjzSLvtfkOQ2IfYWV6cZI9mrwAYsHC
         SBxCJp0ZHxJVRXzLZwetdUnKGc9fg+ILEQYmoU2JYHZdcih7v5MlKctPUQt84rlZEfK2
         7igg==
X-Gm-Message-State: ACrzQf1OEUTa/DwhoPu3neZIsIAJN55aAb1PbOnMKZGKdR9felRV997u
	ELl7MHwljdvzydyj12miW5cVeqL4M/R9cg==
X-Google-Smtp-Source: AMsMyM5U6K8C/tp1X9ROh8JVdRasTiVClLR/R3CO4ICZiKkI7s5j6YXyeBuzEsqdXyuU4QKcXwQJQQ==
X-Received: by 2002:a17:90a:2b47:b0:213:a42a:13e5 with SMTP id y7-20020a17090a2b4700b00213a42a13e5mr15464143pjc.31.1667225818470;
        Mon, 31 Oct 2022 07:16:58 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:83f0:8b49:3bf9:3f41])
        by smtp.gmail.com with ESMTPSA id 65-20020a621644000000b0056bbcf88b93sm4660733pfw.42.2022.10.31.07.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 07:16:57 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] vim: upgrade 9.0.0614 -> 9.0.0820
Date: Mon, 31 Oct 2022 07:16:43 -0700
Message-Id: <20221031141643.3665904-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 14:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172317

Includes fixes for CVE-2022-3705
https://nvd.nist.gov/vuln/detail/CVE-2022-3705

For a short list of important changes, see:
https://www.arp242.net/vimlog/

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 0710f6afbf2..298a111853a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0614"
-SRCREV = "ef976323e770315b5fca544efb6b2faa25674d15"
+PV .= ".0820"
+SRCREV = "03d6e6f42b0deeb02d52c8a48c14abe431370c1c"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.30.2


