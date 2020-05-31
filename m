Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.17661.1590940461884762524
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vOaLQFs8;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id mb16so6879902ejb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UzJNkLBJXOAtICYNUcw4/p3NCnllOd9He80sl6sqBpM=;
        b=vOaLQFs8awqlNLiu5qda85SVFUIjmhdQblc0tShzSxAQWW3fICMjbKX8Nywr6i482k
         h4hO18XXlyOujvibTmkVaYks43lwutY2eBcwRY6OXQLb+/F0CQzMTq6mNDWjyPKESyMw
         5yM43d6ccnZrE/9vJx6qWJf9vBAgoZvAtfZ57weWZgH8FWirNPD9ftUhz+wX8olgoRws
         2r4goYZkvmXpHyce138gJ9iM9Jn8/RJA9yyFeOF43uwI8vOo0Z3A+XVfcwii2/th2ko0
         iXFmt0QnNnxgwPNHTgMF0FwVoRpzZm4ualbH0T6wwiprPV2l8CYtw5wsSHC7oNkxi0w9
         viKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UzJNkLBJXOAtICYNUcw4/p3NCnllOd9He80sl6sqBpM=;
        b=BScIBsqyM/TeebuHOKnVjKQMq94IcRACzeK94J7F1npA+lokwUKF907E5kbuORA4B2
         czBs4B8S4LGOAeYxu8ZwrGehEDWTsKpwutcwxHwcehwuvirV2lisSqJSk4mFkZt69mEw
         431s/PXLAoogLveUyGNJRbYKEM3y4tsKO93EdcIj6DXTwVtTC3vxLtq68L+qdiCXCl/m
         VeRaPFLG/ISB8JTFDfvf8Xt/YRIpz2DpEECTvOVWtySreH23ErQ13s8bsyhzac+7mraP
         ED/XQ83dU4Kv8Cp/k0N+G1biJislWnL8jC0UIWtMx2amwNxk8ytpGoc9qweDs+vMWFgu
         rNTw==
X-Gm-Message-State: AOAM530UUAtSeKeOG40E/aAmJgS3MdoWqbgoS80dm6DCR7l4trgDnhsO
	DejnfHC8Bp27saHeWEZrOvmIFdX5
X-Google-Smtp-Source: ABdhPJxX2JRt/lflaxSvnu5mZLMZR1rY/hNRYOQd/KMFnpC1DAWOEVE4Ht4EMlnjm7B4jgadxZ4wAg==
X-Received: by 2002:a17:906:2e4c:: with SMTP id r12mr16656657eji.546.1590940460281;
        Sun, 31 May 2020 08:54:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:19 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 60/70] shared-mime-info: fix upstream version check
Date: Sun, 31 May 2020 17:52:44 +0200
Message-Id: <20200531155254.10283-60-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream has tagged a new 2.0 release properly,
so no special arrangements are needed to pick that up.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_git.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index 7a060b09ad..f0d5bc62e9 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -12,9 +12,6 @@ SRCREV = "829b26d85e7d89a0caee03046c3bce373f04c80a"
 PV = "1.15"
 S = "${WORKDIR}/git"
 
-UPSTREAM_CHECK_GITTAGREGEX = "Release-(?P<pver>(\d+(\-\d+)+))"
-UPSTREAM_VERSION_UNKNOWN = "1"
-
 inherit autotools pkgconfig gettext python3native mime
 
 EXTRA_OECONF = "--disable-update-mimedb"
-- 
2.26.2

