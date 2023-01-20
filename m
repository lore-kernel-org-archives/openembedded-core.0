Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF3EC38A23
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:40 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.82168.1674238298447382727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NpOZ3cO5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id i1so4590017pfk.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h20WBHZBRVmUQ33hdkh3xKKWedDLPonrG+B5mP1xWD8=;
        b=NpOZ3cO5FrgmTW5+Q4DqT3JlA+SxPyIxob5AY080MZImyUD1dc1l6yzZFyrVTYIe6k
         H+K6LLPebgmmLFF70UJbyHd4bDMpvCTRwjM7BpQlX6nX8HgfflRnPmRAyD/R/sw99g//
         U3Q5iy8JhwFDyOFcyBK770A2jdd4VE4NHSbeZ9CDuqErdHbDlSga4Rxabs41GX10aJfS
         i4XxsNFaakEMNPxFUydAEnthdt+8ejFvHjGjOba7/YJStVZl11lxIWn6dtgMm2UmvHqd
         FWgLrju295urOHLUm0a/GaMQg4siju6zVSJGoL6+nnXil1q9WoFGDp6yQ6w1kKfGdf+x
         07LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h20WBHZBRVmUQ33hdkh3xKKWedDLPonrG+B5mP1xWD8=;
        b=XtXngQhkJXUoj23DNqM02DK8C1J7FiAb/cFnYDVr0veEdmnnTL6MfdkTSYieX76H1O
         VipoH+Q58aGWr2bz1PUgG6sUIvGs73NLsW7ZPbzcZiSJrPiDuLArfnXCFxoC08Jxq4eB
         NsSVQz4R+WHHcXJAdF3JYKiQVzOwu8WdYVH0RopRWgyxtkfqrVdN8ExY6fx65epKcjuk
         cftnAiw9xCncaM0bYsVeJgIZksA+ymGWPCPXhURPE0UL87UULIdRCWBs97UCjTOEzF3c
         6qXwaC3iLEMCLA42BCWWL1EKfEoQcpek8cGDfDkWMQrXXlKGPNBYWCNpC5JeW8U92Zwi
         DlZQ==
X-Gm-Message-State: AFqh2krRDmDg30Gxe97lbzbPUHxNzCiiD5HDKHCWVbY0rN6ir0qnFLfi
	svlegn9C0n00kaH8iZGEYopw/gyevH4q350FaAI=
X-Google-Smtp-Source: AMrXdXtCmAaP8yNOiXG1tLtUry+wGoYrqGBZxoUzPFSK1/x+ccVe/i3inINBsxP9Dm8s9j6pxzkFXQ==
X-Received: by 2002:a62:6441:0:b0:585:f9c5:6e91 with SMTP id y62-20020a626441000000b00585f9c56e91mr16726102pfb.29.1674238297530;
        Fri, 20 Jan 2023 10:11:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/41] git: Upgrade to 2.37.4
Date: Fri, 20 Jan 2023 08:10:35 -1000
Message-Id: <44449a519fd157dab26eeb47dff84e16dc78d43d.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176224

From: Lee Chee Yang <chee.yang.lee@intel.com>

upgrade include fixes for CVE-2022-39253 CVE-2022-39260

Release notes:
https://github.com/git/git/blob/master/Documentation/RelNotes/2.37.4.txt

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.37.3.bb => git_2.37.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.37.3.bb => git_2.37.4.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.37.3.bb b/meta/recipes-devtools/git/git_2.37.4.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.37.3.bb
rename to meta/recipes-devtools/git/git_2.37.4.bb
index 2eed85e807..2205a50d16 100644
--- a/meta/recipes-devtools/git/git_2.37.3.bb
+++ b/meta/recipes-devtools/git/git_2.37.4.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "181f65587155ea48c682f63135678ec53055adf1532428752912d356e46b64a8"
+SRC_URI[tarball.sha256sum] = "a638c9bf9e45e8d48592076266adaa9b7aa272a99ee2aee2e166a649a9ba8a03"
-- 
2.25.1


