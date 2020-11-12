Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web08.7906.1605202099081804991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 09:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=aMbdu0Zj;
 spf=pass (domain: blade-group.com, ip: 209.85.128.66, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f66.google.com with SMTP id a3so6205383wmb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 09:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W04akIU4mCujYA33S1d/G79kGXDasXMWDq3ZKZ89O9s=;
        b=aMbdu0ZjyHiXQ6/7F+0P6uCz51cVrXqflpwmScdO3uG2frd0pWG8N7FoX7vhA8SY/R
         Dxksrtn37VJ4e9hQ1aMdLKpgr6qWvB0mLaUwjnTZ9bFSpjVGFUujFJLlL3ucfZU8Odbl
         mHKZIl1qnQS1z1lthxAO8rnPYOsv6k0d8liLFaCg5VlbkTwUqdjQV9GyvvTsN0SOfpRu
         TzIywmYYp7dOQsNcsidU+3HPJyFHBS6W1qtZmuUcA7aRF6VFPXEj6qHerm5FU/Nj+B0n
         qFNK3qgwOwB33YLK9g27oHcUEUdh/CW3aVl8+Ze+i//wiYD7mb3iLQM/q3t1zKz6drIX
         lu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W04akIU4mCujYA33S1d/G79kGXDasXMWDq3ZKZ89O9s=;
        b=tsp1rDyUeoVdTiEyHIUXN9JCfQoS9gelj0YuyI2HRa76M+OftV0mAyDiLam2p8ZOu5
         R3m7apgBDxk1CibHs4Vr35/Df1Dib9Mq5zwTDTBqJv2bG0iZMGimnhx9PYrj3KKFWxRV
         hIWf6O64okT53461YXVTeC+DnMrI3zAAqCSModbMmasR4YzzUwq845/XjEKdTK2tfdIZ
         6YfqfqqLlR/EQedwqPm3cPo5b9AuiRtLvq9ZMeVB3e7FOX9450XvrHiqpOqK6ASh+PpV
         fzlfiAUYuvc8nj37uFLqHY8NCbwz9FOI8s0TVxWgWPOHSNKOOnympTtYIbeporWKCeTj
         a90Q==
X-Gm-Message-State: AOAM530VuzuxbOtH0boOnf2VKEG3yu/t+/ZU6eexrQ+cMXb8ISaOh0dx
	rVhaIBUWvi2MScr3nH1sitizThZNWTDBpA==
X-Google-Smtp-Source: ABdhPJxxx2Br0bRCIr7MSBFzuch+sT5PvFu2XAZBhvs3xq7zb1TK1ejcAgRhF0bG2mCBWerct6zO7w==
X-Received: by 2002:a1c:1f08:: with SMTP id f8mr748163wmf.30.1605202097331;
        Thu, 12 Nov 2020 09:28:17 -0800 (PST)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id j15sm8198906wrm.62.2020.11.12.09.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 09:28:16 -0800 (PST)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2 2/5] systemtap: remove extra dependencies
Date: Thu, 12 Nov 2020 18:26:13 +0100
Message-Id: <20201112172616.784945-3-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201112172616.784945-1-yann@blade-group.com>
References: <20201112172616.784945-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Most of the RDEPENDS part of PACKAGECONFIG[translator] appears to be related to
examples only.
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index e98aff1851..375e570454 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -19,7 +19,7 @@ STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
 EXTRA_OECONF += "${STAP_DOCS} "
 
 PACKAGECONFIG ??= "translator sqlite monitor python3-probes"
-PACKAGECONFIG[translator] = "--enable-translator,--disable-translator,boost,python3-core bash perl"
+PACKAGECONFIG[translator] = "--enable-translator,--disable-translator,boost,bash"
 PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
 PACKAGECONFIG[sqlite] = "--enable-sqlite,--disable-sqlite,sqlite3"
 PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor,ncurses json-c"
-- 
2.28.0

