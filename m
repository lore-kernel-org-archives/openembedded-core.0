Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.40474.1600690329796763261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 05:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Padx221E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id z4so12492973wrr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 05:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dfNUGhJlUFRDX1p5zNnZ4JiVJIK2ryHlZ6RVa3JFIi4=;
        b=Padx221EHQ6B8A/LG3LW68+I2sa8wEno105CeLeP64vxJhK35e+mu1xBtJtO7WF1el
         2j1Py38WSjB9yuk0timhry0qIaF909PTyRdgnQYft9Cderz9+K80hWDECwAins0LeoRt
         /w3aH0ytnwsJttp6/hBpE5vnobeTw3EF1Flkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dfNUGhJlUFRDX1p5zNnZ4JiVJIK2ryHlZ6RVa3JFIi4=;
        b=rMuYZXra7oVw+gYyu3vFMxdWoWX8FXzfM4gkZA30sNeE7GoLdtafArlawAwoP9TyUH
         GtuwbRQRMe/X2dRVvJ73IviD2LpDCQ1dV7sN+o7TRkVLltLlegf1EttamYwqg+Rm34g5
         8VqOkcfJ2SJ7v66ACnqcbnhEBKtq4M21zcGNrxAKajkCpTF36T4eoC3LxQR8FbZ4f9k9
         UYB00jU1dg5alLJT2gmij7ge/FxaHm9RcSfz7HT9zusOfRAICmL1lgHyR7YFMABBLneb
         iIZF/uemqxfjNGzSBAVULBfUsfMTTT6/Lo9mZF7mUO+wIQ5tOcEcdtbgVLgT4mFiYRCF
         dKWQ==
X-Gm-Message-State: AOAM533g5KiODmLmDqOoOaJvAt+Sbt14AlbUWDBjD7pliV2k18RYyMUm
	d17L5nFT5TTPQYFP3DPYhUGTRsZQ6AA+LQ==
X-Google-Smtp-Source: ABdhPJzGY2F45y+Q+2/ehlELCQMbWF9GqpHCR7oDsuRmob/nLW+K+7P9oLpNZNkGoHcr6SjiC2Nk4Q==
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr50321793wrh.192.1600690327966;
        Mon, 21 Sep 2020 05:12:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.0.c.9.a.6.a.b.7.4.d.7.f.b.8.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:38bf:7d47:ba6a:9c04])
        by smtp.gmail.com with ESMTPSA id y6sm19492609wrs.7.2020.09.21.05.12.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 05:12:07 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] buildtools-tarball: Add python3-jinja2
Date: Mon, 21 Sep 2020 13:12:04 +0100
Message-Id: <20200921121204.2443466-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org>
References: <20200921121204.2443466-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is used by various pieces of the result handling code, particularly the
performance testing and we're seeing autobuilder failures that are
easiest resolved using this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 75b71f55327..ef56f76fa71 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -11,6 +11,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-python3-modules \
     nativesdk-python3-misc \
     nativesdk-python3-git \
+    nativesdk-python3-jinja2 \
     nativesdk-python3-testtools \
     nativesdk-python3-subunit \
     nativesdk-ncurses-terminfo-base \
-- 
2.25.1

