Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6FFC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 00:12:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.21047.1646611906134822814
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 16:11:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cfIXAf5a;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id j26so10386178wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 16:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zaIpOxAg+jNr2zrFXwH6IzRu9xNsrlOq4UwXp3n2CDA=;
        b=cfIXAf5aKW0pEnus4PVmo3UJhPGauq9mqceQ0Vq2CHEKdVJ0dmPF1bwc4W2j5kHGpJ
         s5syJBu3sEMj1P8K1PNx7XnaGxZ7FN/rUTFkg9XaDxbPbfagtrKcMgJ1Afq3CG5ECCnt
         NP6fERWsDW09m/2Kq++Jh+FSzhK6aSYAXUVrFBhA90meiMtPLFUzJHTtnq23rXvqQTBL
         CUOdOxx69jeMZoOdpMXNJM60XSE7IMJZ4NSTk+j/mr2VW14xy+WOHiy87uHnbRFoZLOA
         +s4vbbGYGq5xV6/zkHusY8du0lTMlycoXGCr2mnL/DntFvRjAVypkOz+5AqN9NFQZafW
         uG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zaIpOxAg+jNr2zrFXwH6IzRu9xNsrlOq4UwXp3n2CDA=;
        b=Wv89TcqKQOJnsIedZoqETc3mTeP6ammL4o3jiNWI556Il2n3M4ub/Cwx/Ds8AW6I7f
         gtWRrZUoathcRHXVCKVr3fjhfN7vEt3QJOYsKov56kbe7MjvN4Xc98T0SNig9gxvgTwR
         p+bZ8SpZLdCB8PDHMwq8E4Blc6Du/WvD1D9Q1aNZvlJUGyzeo+Dq3OH1lLadeA5W7dET
         XQpTgPoLFQi5nY4aRBdtn2dPyQvPL6EA+6kZNOZ0cd72ZAipOU7UykWQitoX6HaFuPgO
         UTfT0IfyqrrC8nbTXEgCmnlTZ/v+H0K1qWHHtTiYKWS8hn9rxhFwEhmVwWmFsFowwses
         jIyg==
X-Gm-Message-State: AOAM530qIqRZaFUQ+Sy2+EfxdX9SBNWmKCZ4Bw+ZrxosE1yegb8Q+Apj
	mKDzB5RRhISkyDWogc2b3TwYgTXT6tM=
X-Google-Smtp-Source: 
 ABdhPJybpACUQoej4q9IXfJpRcNoPZWWrGCYu5z8HmbJpmGbssnqcyB74q8AmXu0hRNkfI0BUMXWvw==
X-Received: by 2002:a5d:6712:0:b0:1f0:2486:2fff with SMTP id
 o18-20020a5d6712000000b001f024862fffmr6407108wru.200.1646611904348;
        Sun, 06 Mar 2022 16:11:44 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o12-20020adfa10c000000b001efb97fae48sm10195049wro.80.2022.03.06.16.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 16:11:43 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/2] gstreamer1.0-plugins-packaging: rename variables
Date: Mon,  7 Mar 2022 00:11:15 +0000
Message-Id: <20220307001115.197103-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307001115.197103-1-quaresma.jose@gmail.com>
References: <20220307001115.197103-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 00:12:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162793

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-packaging.inc              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
index e906053ac0..afc7be40c8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
@@ -38,11 +38,11 @@ python set_gstreamer10_metapkg_rdepends () {
     metapkg =  pn + '-meta'
     d.setVar('ALLOW_EMPTY:' + metapkg, "1")
     d.setVar('FILES:' + metapkg, "")
-    blacklist = [ pn, pn + '-meta' ]
+    exclude = [ pn, pn + '-meta' ]
     metapkg_rdepends = []
     pkgdest = d.getVar('PKGDEST')
     for pkg in oe.utils.packages_filter_out_system(d):
-        if pkg not in blacklist and pkg not in metapkg_rdepends:
+        if pkg not in exclude and pkg not in metapkg_rdepends:
             # See if the package is empty by looking at the contents of its PKGDEST subdirectory.
             # If this subdirectory is empty, then the package is.
             # Empty packages do not get added to the meta package's RDEPENDS
-- 
2.35.1


