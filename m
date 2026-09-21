Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6622EC982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:08 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43670.1789974427092005262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=av0tUCeo;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so12932025e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974425; x=1790579225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mbhTwTpkPFF4+AKLADXt5Mk4xLgGssIZ8Q7I2Bec0og=;
        b=av0tUCeoGiV25px6OA9oUSv0Z66FLdgSkTcj3hlOPEo0FG1R9UtvVG/yRpdC2zZ4hn
         XVUIFdy6fDh8ZDZYA/E2/DxIVUdKi8FIuCVjYBhO1xhTkkbSAhKWTM06EAPzFfIeatoq
         qxHGvl+N2H5PbvAOxRjBP+tHdx3nUaN2QXOtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974425; x=1790579225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mbhTwTpkPFF4+AKLADXt5Mk4xLgGssIZ8Q7I2Bec0og=;
        b=BipHI9nR9Q9J3QMrBVtUhweS2f+ypAWZIZci88NGM4oG18tPzx6Cu7IEw0hD0YsoGx
         j0P8CdAfv/a85+4Ej3BSgkZk1d6k/0w1BhkqfyoLNOQhVY+mN8cOFUm28zAuBsy/49BT
         z3MmeXx5sz8QaRFEqn4O0crIBgu2TcDPIQWfAhhblrND7nNWB4yWqlBltH1hzdDR+Ob5
         vCgpwQeXaQKikst19jWinjR7NaEMcZvbYJfN83n9+q3Pq/EClkSxR4xOrxry173CLpew
         PpB2gGqeU7t5cwCcHtR1KMmO/fj7vHp9SEA4PPaNqUF8sFxmU6bDpeNh1NOTMgG6Ez9k
         A36w==
X-Gm-Message-State: AFuF++mgc7BIasJl79cJkOfD7RnNL2ebqZCdlUFHz9oPBcEY/iw/PTc4
	gX2r8DC/Z2u3CvMpwnUE2X3g5j3zIwCn3nu3fciXZ4DgWaeNHyTB57iFsoMoHQ9muIdOHr1vJBb
	Fmg6F1rk=
X-Gm-Gg: AYBFou1UtABRRr9Auyjw87bz6gW8IpPZiqyQzKXI/5Au/LgABnwkKcp6Z17pjd9/DjT
	a5IEgNtXtMFXOCBj2ilLl2uiU1ByIkrPtfBCxCZz1tEnGTr4unTcB9iKI6biNehkKNOTGxtgSAx
	gI/cU+lWJtTtsvQP0xvZd7Ecf5FovdymsVFCyDDWUUsZxWqoj58CEdSUI89tYr3yfX/sz2beMNU
	/u14dBBRtW4NuiEPm9nEN6rlcwHcdUT8Om5lH5g2KNQTTlorQTQztNzPZg80g32p0nOvoXgxqnl
	BDhqyEteDmhS551+cXOUXuMl8XripQrwva1U/KlR/kKsgr+VJuEmz8TG+RGwtB2dhGQS52IbsWk
	f/BreM/9XGDIHDYNvBE38LJPlPORJACpllxSRdb14QO/TXGLshcYo3VdYJPXdpZx9bBrr6n5FIF
	p8e4J0D9+a/Rm9JtlJoe2QAEY5MkmnDHerzjNGit+gzWoXkqtUdm4LTzgxspzKSO3C9ptktfVSu
	osePSLHCvhn7RFEF7/XIH9QDb3K
X-Received: by 2002:a05:600c:3510:b0:49e:6836:5386 with SMTP id 5b1f17b1804b1-49fc4eef2dfmr148586155e9.0.1789974425290;
        Mon, 21 Sep 2026 00:07:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/20] python3-hatchling: upgrade 1.32.0 -> 1.32.3
Date: Mon, 21 Sep 2026 08:06:42 +0100
Message-ID: <20260921070656.521680-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246293

1.32.4 - 2026-09-20 ## {: #hatchling-v1.32.4 }

Fixed:

    Revert the extra type parameter added to BuildHookInterface in 1.32.3, which broke
    plugins that subscripted the interface with a single argument (e.g. BuildHookInterface[MyConfig])
    by raising TypeError at import time. BuilderConfig is likewise no longer generic, restoring
    the pre-1.32.3 plugin interface.
    Strip spaces around version metadata when using original input for CalVer to keep leading zeroes.

1.32.3 - 2026-09-17 ## {: #hatchling-v1.32.3 }

Fixed:

    Preserve the version string exactly as written in core metadata, so stylized versions such as C
    alVer 2026.08.10 are no longer stripped of leading zeros. Distribution file names and
    .dist-info directories continue to use the PEP 440 normalized form.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-hatchling_1.32.0.bb => python3-hatchling_1.32.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.32.0.bb => python3-hatchling_1.32.3.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.32.3.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hatchling_1.32.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.32.3.bb
index e0c82ff3677..a6e683c1009 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.32.3.bb
@@ -7,6 +7,6 @@ inherit pypi python_hatchling
 
 DEPENDS += "python3-packaging-native python3-pathspec-native python3-pluggy-native python3-tomlkit-native python3-trove-classifiers-native"
 
-SRC_URI[sha256sum] = "0bdbde4a52b06c37e3eca395f85a762bf0ef06fe374fd8ae429dc6be10230f5f"
+SRC_URI[sha256sum] = "acdd4436d84d829c6e7ae6df723241d8f0bca9c5bad5a6148bd41f2ea6b8a792"
 
 BBCLASSEXTEND = "native nativesdk"

