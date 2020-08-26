Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.576.1598464148626868320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 10:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vo5eqfKV;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id t14so2666607wmi.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 10:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YPODlchRd4mSO+i+93fUm5W4SlXchpjsSY5OXJaasfI=;
        b=Vo5eqfKVpwk0wbEypOeDv8DSMo2FkRf/fCeSRsMwYfPOujNemkiWw1m7Owfiwhk0hv
         F6gsfKKBJH8dFDNW/Iv3Zmb4U/6Gwnjq/XcAqN3qUCo43XZl6ThCC39x8Ln16fAEA+uF
         layhybVhtkhGCt8jsHOkfX0XgpdA66XPAToNETsSQwb2OTOzHTedb21hL3l2jtldhv9L
         lHzCOueKXJKIllbK3ffJxlXhLYIVOzjR0nz2DC2RHJ3Fi5qTL2mNz4RvVPiPsJhQZp+k
         uanZaFVFEdM/T21lpNZp7tgbFvxBZ9nk0/1tiDaiiCHs+PiDspbH4FOCfF6C5ZWwLa8N
         NLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YPODlchRd4mSO+i+93fUm5W4SlXchpjsSY5OXJaasfI=;
        b=lKGxz1jwTAiSKWHTaXDRMDJl9jQ/OV2Lw66Dy0P+9F6qJvROLqqUBO/aLnEV3/wmBg
         TMKm1ZiFWxli2UOxji+nlyAnVgFF9uiEyUGJ6mcoei+S1J/UY0L9axpmEXhqBQlXi+6l
         odXX5pYah0KirMWi3AZvJ+lTHUUWPzyn+AmCzT171FC+OIx4euwwTQF9GXSoPNfTgIR4
         CgB03SPuHdtHxTZIYqZKTAhsyYUx3p211QECpndJscby9fWDFCw4GIGsepUe7FKCZdyV
         Exxivk464sketRU0uP4+EyMaHWxhiVzjW6igPt7x32jZs8w4jiN8z9V/j9axQ1JqO2KZ
         iJFg==
X-Gm-Message-State: AOAM53175oL5ZOkrODDB4vdQlHEHsGRQeeXRk827+4N2FIfd9CyOLT/p
	GDEZJX9HLeU50CZQcSCwkO2HM7KCBkE+8g==
X-Google-Smtp-Source: ABdhPJwgwju8H4p+7LiVIfcHVTsEpXC97kl0EcO+ra2/7+LX80ejlDnBkvwFdKsZv0E7rxkVgsyxjg==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr8127169wmi.95.1598464146226;
        Wed, 26 Aug 2020 10:49:06 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id u17sm9168529wrp.81.2020.08.26.10.49.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2020 10:49:05 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	anuj.mittal@intel.com,
	Ming Liu <liu.ming50@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [dunfell] [PATCH V2 2/4] multilib.conf: add u-boot to NON_MULTILIB_RECIPES
Date: Wed, 26 Aug 2020 19:48:51 +0200
Message-Id: <20200826174853.8838-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826174853.8838-1-liu.ming50@gmail.com>
References: <20200826174853.8838-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

u-boot should be a non multilib recipe, add it in NON_MULTILIB_RECIPES.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5e7dc0d68efb2d43bbd5b1be9e6d555fc4456fb6)
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 58f2ac5c86..d231107f8b 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -30,4 +30,4 @@ PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkg
 
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf"
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
-- 
2.28.0

