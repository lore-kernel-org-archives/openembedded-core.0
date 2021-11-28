Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AC3C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:28 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.53255.1638136768066949095
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nj1KwVa0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id x5so14701371pfr.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5xn8+HoaRPHFTT+LtCaXoKZc3rvJzyyTJyttvZYPhSg=;
        b=nj1KwVa0TNCphVaACNUVGGYErsUplcTMLTys4mEAwsEaXFaLqAWNbjwXyvix4CkGDf
         gKrgOvRikbPwNK0Kro/lRXNgmIGCRNYkuQgYkCuxhV8m4io49bJFLpawPHi19j6nASmE
         G10egruIV8toutwf4SU2FX02cIJ9DTJExDuzw2051Upb48OqRXl6aMNcxRcwCqh4x2hc
         ss4DbqM0FXP2B3sDuTxi6G5iTiqjpHy7XSKg+Rnu6Zib/zBODfNVpgU0BszA0QNHYeh7
         4GFVcOmbiqIWyi0RfnaRgbXVNHGZnOxau6sVYI3Uz7gTjNoxPVzeEUs1brJs+a4FjQo9
         p8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5xn8+HoaRPHFTT+LtCaXoKZc3rvJzyyTJyttvZYPhSg=;
        b=7GcyGfg1sN8OpO+G9tmbfhmsEuiD64gZWUwNespWZe0M8vf7XY9xqP3bpn8YQOA8Ss
         ACim/d3hObi2UZA9VFZezOy2hgQGSQIjxtq4UPrz+zKBJ1zHGta8IhI6tSF8vrvaCYvJ
         PakfybhUYOlyvQcTsVIyDJQGAM0bxiw7hMjOhR4X6Xzi/IeNZczg9T3lTayPaMPXSAoj
         NNw/wks1tkqmp3CcqANoQrfkgXwiUMoeLtyNB7Ixgrx6oeQ/ZoDY23j1V/CkyaOmQwMR
         auB1MAB3Rzh99owGuIZFnr7shUkKuzRWtyDuFgT8HE5at84jyX6mpIfyWePmxD38Afas
         ygcw==
X-Gm-Message-State: AOAM531g5T87yvZQamMNdaFf090BPQTkhhzU+JxtK4BrQOQgkoysXmWJ
	0hWnLfny2pfLfCO2gQKHZYn/Rzj5Aae2vq7bzME=
X-Google-Smtp-Source: 
 ABdhPJyE2JiYYJtqiVSQodkcOYS2Z3tZ0CBrplV5ecUWphXEqZD+Psox+6yHW2ga9BxNvoCofzsC9A==
X-Received: by 2002:a63:4c58:: with SMTP id
 m24mr18268365pgl.597.1638136766974;
        Sun, 28 Nov 2021 13:59:26 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/42] libxml2: mark patch as non-upstreamable
Date: Sun, 28 Nov 2021 11:57:39 -1000
Message-Id: 
 <99deface9b9ac9a0b42ee431eb12340f5c69defc.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158909

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be5be9e36dc76215f8563d87f5a6b09c1ac7190b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/libxml-m4-use-pkgconfig.patch            | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
index e6998f6e68..c8bb636a4b 100644
--- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
+++ b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
@@ -4,7 +4,11 @@ Date: Sat, 11 May 2019 20:37:12 +0800
 Subject: [PATCH] AM_PATH_XML2 uses xml-config which we disable through
 binconfig-disabled.bbclass, so port it to use pkg-config instead.
 
-Upstream-Status: Pending
+This cannot be upstreamed, as the original macro supports various
+optional arguments which cannot be supported with a direct call
+to pkg-config.
+
+Upstream-Status: Inappropriate [oe-core specific; see above]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Rebase to 2.9.9
-- 
2.25.1


