Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B15BC433F5
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 09:44:55 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.13431.1653731092992223889
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 02:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ETbo/c3U;
 spf=none, err=permanent DNS error (domain: linuxfoundation.org,
 ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id e2so8713081wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 02:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4llCqCAGzhJn3r1wx70u+XnBP69B78oLB7NWBUWt4dA=;
        b=ETbo/c3Ur+OCiZ3y03DOhr3p/L4YmKdbMF7kqVPTfhAPRL0VyGCuHepNy0YyBh6RGV
         BQYk/lVWWoHwcQOr7mT1ZbkHwGqay2DMZ7XRhmjhDF0IXRcNY6QjyMZl/LGH4fzKlAIj
         z9IeJxhUxErvUY6u6r2XfhmiyJpcFB7MhDOPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4llCqCAGzhJn3r1wx70u+XnBP69B78oLB7NWBUWt4dA=;
        b=t8Gc8qaoy85ENcpRR4dn3rs1thA95lve2RZipyNJuJyRdEiEiZLOXTJ5Lz0DIs/+oD
         UiivibZVHDidA34dKSr2gYLI1k0GuPgwgU+Oh9i7rA1DeyJ26+hUZsGcx+mSUElB8q8a
         PCbdSOfbyXS3Hz84e3OMpZdpM3+kpgm98tZQ5pkb2fiOyIh6ML+8iVGFNSSW65aV0snJ
         Che8AXxFu85KeOScK8nfAjJLjdjybS7Sa+fAyJ4gGlHUa7IN/SnfHrs2vInvUtMKNk6r
         tgqprqzizoz4PDGqmfoR6z73IygPRXngLyMclsep/2SiKXqEVrZnoTfCbTGX5FZnwyVH
         wLbQ==
X-Gm-Message-State: AOAM530ZvCZ+YAbd9Kpu7Q0JDM5yB53Mp9ePoyEMpkZv2QwZ6WLhvmjr
	cYJMEGuzQWvkBBSnC/wHZlkMaVUt/TPEhpLk
X-Google-Smtp-Source: 
 ABdhPJz3yoGt1Xph7V0dB2sEW01zBRyaLlP8oEltwif+4wuDj+Xr7ze7koAMZ63fZu/qUOXq3qfgYQ==
X-Received: by 2002:a05:6000:2a2:b0:20f:d7ca:476 with SMTP id
 l2-20020a05600002a200b0020fd7ca0476mr24939543wry.501.1653731090524;
        Sat, 28 May 2022 02:44:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41b6:b722:6b4c:6704])
        by smtp.gmail.com with ESMTPSA id
 s5-20020a05600c384500b0039750c29cf7sm4535159wmr.40.2022.05.28.02.44.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 02:44:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: Upgrade 8.2.4912 -> 8.2.5034 to fix 9 CVEs
Date: Sat, 28 May 2022 10:44:49 +0100
Message-Id: <20220528094449.504831-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 May 2022 09:44:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166223

Address CVE-2022-1621, CVE-2022-1629, CVE-2022-1674, CVE-2022-1733, CVE-2022-1735
CVE-2022-1769, CVE-2022-1771, CVE-2022-1785, CVE-2022-1796

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c5922b7fcd7..b22e8016abb 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4912"
-SRCREV = "a7583c42cd6b64fd276a5d7bb0db5ce7bfafa730"
+PV .= ".5034"
+SRCREV = "5a6ec10cc80ab02eeff644ab19b82312630ea855"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


