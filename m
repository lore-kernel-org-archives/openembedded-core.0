Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1665EC77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 22:12:56 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.4570.1683065575126331588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 15:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=fA9HIBUp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-2fa0ce30ac2so4075919f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 15:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683065573; x=1685657573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eLswv1SrQnpM4reav3obZ3sEfe8tG9/YFlAGYho49OE=;
        b=fA9HIBUp/v2Tpc0pWp34schvYwvVbCfNDfY0qGEgi3CfnUk1jCBLWB8C1oQR1czpnS
         0+DUJYnetvPwQOpBktJL3/MexJuRRyPSn5aRtLBDkJD/ZuYYV/5bCMOUm+CeNjgFUlpI
         vceu++4nfaJF1BuEozKTE51V7Z1S3yuTLD8W0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683065573; x=1685657573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eLswv1SrQnpM4reav3obZ3sEfe8tG9/YFlAGYho49OE=;
        b=PApE9FZDHfMbwrhU16SLavxaesUYbNrvjOqvAwX6t0OmpJEp6RssDGpPkZo/HgxXhq
         7fsGlUh3Ef4IbV4F5vNcyq1+EBjBlqpeXOf5kmucTuAaNwtipiCQAWfBpoVgP/1oaaCw
         6pFElZp8qN6Sz2r7JnPdICxg2VFSiT/2IjyACy4cwUGLqQ0aAmT9SsPFTHO3MaOyVjrf
         Xmwt9FxUW6p+1VWgAAxRbjyoXtvr2dsdRjNWW6DajmfWDFwx1eT+UnJJphUs8xeRfEGa
         o9HT3te4lk9sLGj1d4FiKO4+0JxV++iVtvN3mtEKHzUQR3PVKKrJyrSKp9rl3YVMf0yf
         HNwg==
X-Gm-Message-State: AC+VfDwwG0dO8FF82V6c5u3NCD9EAPK4PGOrp5eEPoKWmb9udUJvHOjn
	414Imb5tlwVi6gi7Jo+Kk8WCSeewdjx2i+GpTpbVIw==
X-Google-Smtp-Source: ACHHUZ55arwDz8e5YejenvMT1dF+hRX3tOdfSXeae8jmen8tt1m2xHXviVYtWC5MIKfaz0S1u/jHtw==
X-Received: by 2002:a5d:6245:0:b0:306:3995:a123 with SMTP id m5-20020a5d6245000000b003063995a123mr2017499wrv.27.1683065573091;
        Tue, 02 May 2023 15:12:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id e18-20020adffc52000000b002efacde3fc7sm31863178wrs.35.2023.05.02.15.12.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 15:12:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] patchelf: Upgrade 0.17.2 -> 0.18.0
Date: Tue,  2 May 2023 23:12:51 +0100
Message-Id: <20230502221252.2931006-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 22:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180774

Add package to contain the new zsh completion files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../patchelf/{patchelf_0.17.2.bb => patchelf_0.18.0.bb}      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/patchelf/{patchelf_0.17.2.bb => patchelf_0.18.0.bb} (78%)

diff --git a/meta/recipes-devtools/patchelf/patchelf_0.17.2.bb b/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
similarity index 78%
rename from meta/recipes-devtools/patchelf/patchelf_0.17.2.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
index a9583419e80..e8bc2ff83dd 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.17.2.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master"
-SRCREV = "5908e16cd562bcb1909be4de0409c4912a8afc52"
+SRCREV = "99c24238981b7b1084313aca8f5c493bb46f302c"
 
 S = "${WORKDIR}/git"
 
@@ -13,4 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit autotools
 
+PACKAGES += "${PN}-zsh-completion"
+FILES:${PN}-zsh-completion = "${datadir}/zsh"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


