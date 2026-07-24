Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C375FC531FC
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:02:17 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15483.1784883730607822831
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P0F9OStn;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5276d598b96so1286801cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883729; x=1785488529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O8EzNSpOqM2FmVVnwe3PUfKapgHThuKUK0fzLdAJSDo=;
        b=P0F9OStnWE5qK/GlKnhe3sal6XkGPcV5DfQbG/EuGOn7eIUO8tOnV0+Rrh4zGFq1Mb
         LIfMZAa3TWkVt4whgq78p6T4rl3OHU+AA4rx3EngWHg2Zr+0WAwRK7W7Q6dR7F2zWdnD
         S2Tt5IldOK9Terp9oIAsRnfUAgTduGeZuNnYV6p65devKsgX8Li01IDn0MmvoQXja9ei
         7TXeXxAe2ExssxRokCNOZ31EqGHdC61o0mQvBBmIlFkz3MlX5utNGN7DKxn8jXoJDk3s
         RcBGZaRbjkbYv3RxBerhIUd1iQMd3hhCNHk302UXzo9d6Ram6MNEJ3eoItLD7/4JTihD
         72hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883729; x=1785488529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=O8EzNSpOqM2FmVVnwe3PUfKapgHThuKUK0fzLdAJSDo=;
        b=FwE4rDx0NKfPYaqzEgbvfc4Xa5P7T0x+EsN20odkT92Ryi+M1dDKH+8fnDpOTJXJQ3
         Q141XvlbseX0koy/Fh0A2HSNtUnDARGXtZ1hlgl38A/JvdiqEUFW3bw/9dlcP7woeQRt
         qEqXbzfAXOYwIXrOaXGalNUGDKqU99YI8blyNRHfF5KyDr84/HyWm+xeNIVdXR+ySQxB
         2pIrXTvD9WGX9u/po60WSRqGtuJ6Yd/xaA32WoBFl/bhSB8XGWJ2xpq36xfe5XS9xi5d
         ESPQ9cN00zvs36EUPXtK2o3Kl997bs4QRGxprF9WnSDkv9E0btjasiXE+5b6vMXeqTmC
         396g==
X-Gm-Message-State: AOJu0Yw4RbApizhwLTAtq0vhEpbwzAMEeYjsnLynH/imhoZbTrOwEpMM
	fAMx9Al1Iky9HCJ7Z+JQUY9kofiT4ozIFvPK1bj3ukf6k7DHAHYrbnrvyWMPDA==
X-Gm-Gg: AR+sD10i/JJrfY7VHQv/A7Eb3TNyIZZ718hnupEBMUcmpZtEbjGg1dofb5gBm1/cq5H
	w9nF4/QKFXVWsXuMsybaPHINCCo9UooMPphJ+auX6Ue9TpiMx8OfAcqVJUcjbeEqWwYDGa8Txli
	gR5PW0+7n7hWKXpMPvjD8VTq7Uuu+5+H9YdYIp+fhgTSANpg09VUgM17eB5HzG4v/PpkqJ8Sywa
	m6ubDxHiosHI6/ZoGK27hODCVajLauQagoh+RMHy4qO+JfDdP76pLwdvedDQc+wKP9l4gY3ye89
	RIibLdCfdf4MpG/yx96Ux/5KRr4TyVJ9dQxgUmteuzd7kfdc/O1igJGerBB/hi4QgToVqkNz3Uz
	PKlz9iffbaRiWBSDZ8dx/zKMEkj7TiqSLlT6+fjHz/adJLfKZE4aa+FoDykHl4krthxpMsJ7BZ2
	8WKdOBpUxfwE8KJdm18m9Tppk4Ec20hemp4Q6eShkC0a1x
X-Received: by 2002:ac8:5894:0:b0:528:3d62:16bc with SMTP id d75a77b69052e-5283ded65f2mr62281621cf.54.1784883729378;
        Fri, 24 Jul 2026 02:02:09 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm63968326d6.46.2026.07.24.02.02.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:02:08 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 06/10] nativesdk-packagegroup-sdk-host: add wic to SDK_FEATURES
Date: Fri, 24 Jul 2026 05:01:42 -0400
Message-ID: <20260724090146.19924-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260724090146.19924-1-twoerner@gmail.com>
References: <20260724090146.19924-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241916

wic is useful from an installed SDK for assembling or inspecting a wic
image, but adding it is not free: nativesdk-wic pulls in the tools it
runs (parted, gptfdisk, dosfstools, mtools, bmaptool, grub, btrfs-tools,
squashfs-tools, e2fsprogs, util-linux, tar, erofs-utils, and syslinux on
x86). Most SDKs do not need any of that, so wic should not be in the
host packagegroup unconditionally.

Gate wic in the host packagegroup on the "wic" SDK feature, which is not
enabled by default. A configuration that wants wic in its SDK adds the
"wic" feature to SDK_FEATURES and gets a working wic, together with the
tools it invokes, in the SDK.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v4:
- split out from the v3 "add wic via a new SDK_FEATURES lever" patch:
  this patch now only wires wic to the "wic" SDK feature
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 51e48f250b19..c2974a57fe3e 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -29,6 +29,7 @@ RDEPENDS:${PN} = "\
     nativesdk-bison \
     nativesdk-flex \
     nativesdk-perl-module-integer \
+    ${@bb.utils.contains('SDK_FEATURES', 'wic', 'nativesdk-wic', '', d)} \
     "
 
 RDEPENDS:${PN}:darwin = "\
-- 
2.50.0.173.g8b6f19ccfc3a


