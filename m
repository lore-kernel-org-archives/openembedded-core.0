Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.7093.1592919714976839890
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 06:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LUfcbMnF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id 22so2172321wmg.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 06:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fXpwVOxbbVrmRtf6kjbxMTr/0Z2ifFhFozUeaKgUuFw=;
        b=LUfcbMnF6x02LdEBu+S/UPFOY2MiWBt6S5v2J4q00iODKDCuk17NbkfRx1JoIyH61d
         i4fayHF63lJKdjiJXtR9uDK63J4py+uGyMOc7+V5EVtvfH+NYJd6bpSTpb8cEhbYhaBI
         Uxgn30ImFAR3LQzFCF5s2rLpeKI7BWbGid4JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fXpwVOxbbVrmRtf6kjbxMTr/0Z2ifFhFozUeaKgUuFw=;
        b=CGRaQoEMrQJsbi1kl4DekADEOC4rDS5ofatk8av9GLq7+9Be8NqOea3i/PSjmG3QNQ
         5zUiFLoz42qTukds0bBDyZ5MApX2U56BdDmKTMcl/0uZa5yRjtgmboaqMWbUBI7t3tsN
         IhAUd3qGuDzMgBcVPiVq7Q0jUZci2pBLqb+k/8km6p2esy0bi2Xr8foKmQUAfeQkGcc6
         8rE793NjYkHbT1tQ40mJyR9yfAkU88BeeMbM/a/OKtLswqk5xi4ydSUSy4qzLU4LNc+K
         /E5itkdE4GeJCxkI88Fx4NxlASx9oDh9qHEtWPz/TBqjQT/RLXV6RFyoxIADcZPWl2v2
         ylew==
X-Gm-Message-State: AOAM531P7OgH+QbeCSwBx9pz/l65izBIC5ks3YOEsmq5qxr6/RX4TnHL
	9nHFrXEZsJ+pgGp4gA+/zaQ/ixd6cs31Mg==
X-Google-Smtp-Source: ABdhPJzMOOlVO0rkkXPGkYClSto5aqoInX6ZREto8df6oQdKJWjOAfTRVtx1VeqV0n79Amwxg4cM4A==
X-Received: by 2002:a7b:ce15:: with SMTP id m21mr24643764wmc.117.1592919712705;
        Tue, 23 Jun 2020 06:41:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id x13sm23493844wre.83.2020.06.23.06.41.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 06:41:51 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vulkan-headers: Fix upstream branch deletion issue
Date: Tue, 23 Jun 2020 14:41:50 +0100
Message-Id: <20200623134150.603584-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The upstream branch was deleted but the commit is in master so reference
that instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
index 54cee96cce0..d21c3d62b90 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
@@ -5,7 +5,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.2.135"
+# was sdk-1.2.135 branch but it was removed upstream, commit is in master branch though
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
 
 SRCREV = "fb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90"
 
-- 
2.25.1

