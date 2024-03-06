Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFD9C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 12:12:58 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.10351.1709727169996555342
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 04:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fEUP+DDX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33dcd8dec88so4283648f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 04:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709727168; x=1710331968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vlRx4PYuvBz7gb22hiKV5BQLSQqZECYlCzIlar7qoY=;
        b=fEUP+DDXsW0M6iwj0MZT4awV3qLiwHFmm0HQjlWJZ7NHACnug8PQ58OrQdZTh3da1Q
         4Nw29iZuDA8ipbR04U55QNXlJIQLad9BMSuzQbmMUdROZ26FL58Maw5uvCdCKn7lRtwQ
         c3Hdw/E8blxnt8gkhnn4+KjzR48tD7z0cDt9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709727168; x=1710331968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vlRx4PYuvBz7gb22hiKV5BQLSQqZECYlCzIlar7qoY=;
        b=b3Ao30bWFNf5KlQe4DzMzewCVxlyElXSGT8ptPuSZgFoc7DLLueRHaPfwKK8xjAfIR
         2pQJbbTzZ6un/Y0oqzKoY0XrWHob749QA9dG+EbL9Es7Wcq83theLgHME92QOj3+J1zx
         9zm9MGe6t6XrVbsVrL89vtXXNcJ4kmmosA0gdf8E08tKoWRXZrGgS54vc0OHZb+j7t4p
         De/zisoDA3oxJPxtROgB/5c/mDy+hqux+FRpu9ExhVSwuVBXvDAF7Wj69Ig43vraMbDW
         sODe7yJgYXzWsGLNBnHnMaF0EYrjR/XwmpWAev4rEMr3JbzAAdX22ITRmCVGlGIZ+1pi
         j2Ag==
X-Gm-Message-State: AOJu0YzlEG8fSr+R3SyB5bIAkXdcDh27KmAHk3sCudrwk2yxd8ti2DS2
	JltRjUO1zv9A9zEK2xIwNPlrBNVUrM6cSDf+VfVGzbg7XOFXLxGZ1uVZYjATO0e4h4qBSk3Fo9w
	T
X-Google-Smtp-Source: AGHT+IGRZGlka3r1apjeKDGlXSqqBqZATtceG1i5bU6jJmh9w1OA23eNuJi/VJj0SALig/BKb/F1FA==
X-Received: by 2002:a5d:6b4a:0:b0:33e:1b80:ae95 with SMTP id x10-20020a5d6b4a000000b0033e1b80ae95mr10537476wrw.11.1709727168304;
        Wed, 06 Mar 2024 04:12:48 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f9c:b564:4f14:a0ea])
        by smtp.gmail.com with ESMTPSA id h3-20020adfa4c3000000b0033dd2a7167fsm17634099wrb.29.2024.03.06.04.12.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 04:12:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] libpng: Update SRC_URI to avoid redirects
Date: Wed,  6 Mar 2024 12:12:43 +0000
Message-Id: <20240306121243.2247637-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306121243.2247637-1-richard.purdie@linuxfoundation.org>
References: <20240306121243.2247637-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 12:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196668

Currently we're hitting permanent redirects on the urls. Tweak them
to avoid that overhead/noise/inefficiency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/libpng/libpng_1.6.42.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index d84cb19151e..cadbe957db9 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -10,10 +10,10 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"
 
-MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/older-releases/"
+MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
 UPSTREAM_CHECK_URI = "http://libpng.org/pub/png/libpng.html"
 
-- 
2.40.1


