Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE84C4321E
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:38 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.11475.1634657677307007675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J5Hmbnex;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so3321871wmd.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CCLQyxzYD9iVgOL0IMbKzbv9z9Z7xFZrOu1YhOi2zQw=;
        b=J5HmbnexGRXibUoI5QbUPOxFQzHYpXVDa7FJAhCSHO2+EuGB0nydSFi/4mHXYwZSAZ
         17x5eeH62elLaz3mqPfE4JwLkvDIe3U+7JTsTAtshntxj2X+snlkRoZsHBEXyOK6sWNf
         N+Ct4M5jNmmi5J+XoKDZVq/5QLMA/pF8E6+ZUcYyW1E3Bv/KYsNH9o/NDqQYJj5x//yb
         RoYfwGOZ1DCiRzexFtu6iVYbaLtJvrZEq/f7CTnE7OxVJ15tBior8M4ZtkKyELW9in9p
         SbKxLqIOHjeTa5dcJpeJWDh+rxziM1nbzJ1U3wnXlF/F/5QHabu0+55C65VMmky8NuHl
         VNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CCLQyxzYD9iVgOL0IMbKzbv9z9Z7xFZrOu1YhOi2zQw=;
        b=Yrxy3YAx7vT47ETwViGO6kswsyoCD4jNq/5IMC3wEHt59UMshNuv6Q+Fl/G+3yRedN
         tPVPh3prkv9twEQouFQ8f6PpHl3FPhcTC5rFLPuB/M4mBJn6XDH+oPOtaEt+rx6LExoA
         JPp8s8frssmNMvJ6rp+Mo07017PkGVyWJut/6TQYJoonkxshWlBSMXlofOGBlAdCF4oR
         lI47cNBWojkEWDQP3j+X84O/wEALDlhaLDG6v19XlNJvvurUx34u+hAXcq98KJNR1+K/
         WSTNH7lUD1OiOaOMxE5CTFsmx6Qv7VMXKkTtgAtDyc3NLEFXO1YLki5C77kZZ7wfxUc7
         YAuQ==
X-Gm-Message-State: AOAM532wp0GOJ6JezJtZ31y2JBJcDKc810EgKoR5PODb2w9LHMMDSU8o
	AQjLArsxiwKn9rNz+nZjtcCWqg8FPUc=
X-Google-Smtp-Source: 
 ABdhPJwFvxpwsrSauHovFiBvjTukpRWwPWVIUeTcUCAPIk+MKEob0tSFE63hpQ6yS0IqkWx6pto/OA==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr6850990wmh.188.1634657675970;
        Tue, 19 Oct 2021 08:34:35 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/65] libgit2: update 1.2.0 -> 1.3.0
Date: Tue, 19 Oct 2021 17:33:31 +0200
Message-Id: <20211019153419.3319802-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157136

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgit2/{libgit2_1.2.0.bb => libgit2_1.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.2.0.bb => libgit2_1.3.0.bb} (91%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.2.0.bb b/meta/recipes-support/libgit2/libgit2_1.3.0.bb
similarity index 91%
rename from meta/recipes-support/libgit2/libgit2_1.2.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.3.0.bb
index 6df42e473f..bf625c325d 100644
--- a/meta/recipes-support/libgit2/libgit2_1.2.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73fa96e40ce64f79bab087c7e1deeacd"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main"
-SRCREV = "4fd32be01c79a5c003bb47674ac1d76d948518b7"
+SRCREV = "b7bad55e4bb0a285b073ba5e02b01d3f522fc95d"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


