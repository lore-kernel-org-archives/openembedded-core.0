Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9B6C5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 15:19:53 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.81124.1724771989042012649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 08:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HNK0nZse;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: sdoshi@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71423273c62so4077796b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 08:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1724771988; x=1725376788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kT+tnvLobgL+HCz8OfIwEKg/UyVYp+sDyNMVkqrE9gQ=;
        b=HNK0nZseIUi4tG0OMj87pimlb26gnU5YwryA7bBY3c1WTU4Rcs92HdBSjrJ3USwTJT
         AYk/i3RPLyyPy3mrMUIzFOb2eZModaOzH3ZOSM649ScH7N9NNkGd9C84cN0lMi9L7JGe
         guMHAhxNmkjQkbxwf4MKm0vSSwtlwVHYszVHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724771988; x=1725376788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kT+tnvLobgL+HCz8OfIwEKg/UyVYp+sDyNMVkqrE9gQ=;
        b=iAgzv2pv2wLq8Q1AlO7/nTU0kBPhUP8daoe1T919HoyEdXgAe5+1DvHaL64CkRCAkr
         SJOcc3VdfSCRgQCJlqIzLGpEL8/ua8DFEB3YPW/x9HxWw17OeN0oJyYWE2wNZDsehNiV
         H/wddvTqoQWotKiAOUrEs0QaJptE6aIkAfTqxcrHH7RWFBkpghQYKF8pD3QLS9QOJv2j
         EpDUfGs61oaDmdzA5aw/AdeLqi9xcmL6Qhk1dOA4L4iTjFmM0Voqg1fMZQVKgjGae9vK
         b0G2rT6HPpcMN4Q8cTU6mPMmMpCXnK3qU82c+pPL47j/vcslkfIxexee4K+z6CssDb8h
         j7Gw==
X-Gm-Message-State: AOJu0Yy8RAaPQgBJfoCpVEz7A03YSyrtJh9B69D/Z87F3YtegtnQ3Hhf
	XwizHgQnywz4e1SSbteEfCvgfkLFT4V6neJyCLnvzEIpjH81IMJ7ziKknTVIlI5XM4Cgtj/HiNa
	w
X-Google-Smtp-Source: AGHT+IHUJQhW/hn6Wb9l7gzZVj8QsF4MYpcZbi432MZzTLc/IfRjDTpsDkiHvRw2J/2TBCTarijodA==
X-Received: by 2002:a05:6a21:38f:b0:1c4:c879:b770 with SMTP id adf61e73a8af0-1cc8b49a8bamr13680860637.23.1724771987905;
        Tue, 27 Aug 2024 08:19:47 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.47.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9acab541sm8119239a12.22.2024.08.27.08.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:19:47 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][scarthgap][PATCH] vim: Upgrade 9.1.0682 -> 9.1.0698
Date: Tue, 27 Aug 2024 20:49:31 +0530
Message-Id: <20240827151931.55648-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 15:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203849

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE-fix for CVE-2024-43790 and CVE-2024-43802

Changes between 9.1.0682 -> 9.1.0698
====================================
https://github.com/vim/vim/compare/v9.1.0682...v9.1.0698

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5225513d9d..f87f4dcbfa 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0682"
-SRCREV = "cb90ea9cba6f033fe141db0e466fb4117f28402b"
+PV .= ".0698"
+SRCREV = "d56c451e1c05310562c5282352d7bb287c16323c"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


