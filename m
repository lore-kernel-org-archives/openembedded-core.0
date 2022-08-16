Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED5FC32772
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 16:59:09 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.18015.1660669148978940195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 09:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Noivy6/H;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id y141so9838874pfb.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 09:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Dl/0OWja+KOhyVl1zq0mOMzC7x4h7z2lqRJJSOPiTcg=;
        b=Noivy6/Hhy4JQuPAd7ReskOLxhyr6ek0kpRM3hkQdpGZfS9d+DrYt+a1WJoClQCUYr
         QVtemD8goBWeO3fWnNI8zOyt3aepM1FM0P7M/3Y9D2fkUSqt/huh8kRjwUT0yeE4jK/P
         2zSA30pTBKE3Ma8Xa0idaYdn40mOgi8+d7XkSrUuoiZ66ZcHgqSN+fJ2PpET2SxQ6e6J
         vdNGUFfYyU0CUFMPI5bRuHsELb/kpT67lenphgEWNV4Yi7pAMmnkCN7UhSLL8VDmAebb
         SQxKsP8fNkq2wnkF2q9N2n40KI14z25fjVvGLIvdXp1MwM1bdStINMbn3b0FN5lhSNBn
         QmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Dl/0OWja+KOhyVl1zq0mOMzC7x4h7z2lqRJJSOPiTcg=;
        b=zBC6NwL/4dzoC0VIJTBcX/fVJR1NsP1g1MdBl4DZPsEeB6WQF6SziIzDDbaZu+5zcI
         Fs/4TV7AGy+qMGUJ/5tPtV+JWZ4Pq4Fjgb9MR7kIsb00gt82idoVWkVnXs4mAFQOENoJ
         QEDBFX6sOoyTKLehQZtkpaJVBm8vt3NXVhwI/TmVWhbpcryX20ahKBckxuLgeGGY374O
         HGMiChrZKL3xTvikuPN8Rmx86Oy4V0cOxsfWelJpm7XAVzUiTGu1rwf0KPnViW+AwRZ5
         yRIcSZFUcPmduKKHDJ3T2/dKtuTqMeyZ8NuvFgCExtvH0CGgwvlNkMFGIas1sRElraRX
         v9lQ==
X-Gm-Message-State: ACgBeo1QP5YWgfBTR7SxQAGudv66az+l+BMPVzGQjswcVvOSi34/KPLy
	RvESYwQyTrZIWlEkh70yNYSyIMvaGcpChg==
X-Google-Smtp-Source: 
 AA6agR4cCa3ldUG7IlItTQ6Dj+T2yra+w83DveZKWXamukuqXfyEqamMopmJ8QemiWdpsCAggAP+hQ==
X-Received: by 2002:a05:6a00:1813:b0:52d:cccf:e443 with SMTP id
 y19-20020a056a00181300b0052dcccfe443mr21938594pfa.81.1660669147933;
        Tue, 16 Aug 2022 09:59:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 x21-20020a17090a531500b001f04479017fsm6562577pjh.29.2022.08.16.09.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 09:59:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 7/7] spirv-tools: Update to 1.3.224.0
Date: Tue, 16 Aug 2022 09:58:57 -0700
Message-Id: <20220816165857.2342796-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816165857.2342796-1-raj.khem@gmail.com>
References: <20220816165857.2342796-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 16:59:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169448

Fixes build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Drop uprev of vulkan-headers recipe, there was no change

 .../spir/{spirv-tools_1.3.216.0.bb => spirv-tools_1.3.224.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.216.0.bb => spirv-tools_1.3.224.0.bb} (96%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
index eb907326c43..cfea28a6efe 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
+SRCREV = "5e61ea2098220059e89523f1f47b0bcd8c33b89a"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.37.2


