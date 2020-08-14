Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.14510.1597397368091498794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 02:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lIc/EVlk;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id d6so9234498ejr.5
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IOB7D1vAX6sebMezoqmtoj1dZtxn61iSEN9S05TZmng=;
        b=lIc/EVlkim/dN/FbKnSEpEn6fvJdita7JF8LqZqdTh2tVykxYceNXQMwJrRIofO17n
         WnkR2xKN+UKCLcyC2Ty36ZMpLTqoSNnfr+5yOWA2AuKi5plq/AmGinkIaOAKar/bxcXF
         4ZPGtE2RICvarQvWPMbkL6PDhTMlLRWkgD8uXeIWm6NHT2iWzLtE4uayPtO1wGDF72NB
         NkQ+r7DATlxmXI2ordf3RDJT9UWoG9jWFbDyL21wzMIW0XbpJPOu4heHfK5jd7OodVrg
         Dg2HbJuwhi3jgCG01CKvOrglxtxaV8MGMh0jx4qsa9dGpzZ4aqrG0ZYH3lxlifOrDLti
         Oj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IOB7D1vAX6sebMezoqmtoj1dZtxn61iSEN9S05TZmng=;
        b=UBqI6QjbRVTE42HoKhlMRjAElwilj7kR/XklT3eWhL7k+Sk1/x08rkg9QhpyzI6+vu
         NisZNHz+QGOOUz7SNZ76z3oum+XUPO5r9HpCJwhiKR6UAnLfvUTfuci8nLKAy5Al9Aj2
         OEFviPDPhBuCfa6mx/gUBRBQA3GX9ghbMtzynJxbz6lkbWo1JW5QDdiXfUWIf8PKia8p
         VWkuOKaT+oPrUtiviheC/u7SD/oCraIYov5UQ3imvcKalX0TfQsvRgl0H1BWnGcZjUgA
         Eef6qhzmXt+5y10dCdzUAW9rJaVCpYN7CGXWs8cKSQthkylP3rtrRnSl53q1MxorjRwY
         IWmQ==
X-Gm-Message-State: AOAM532TUQOgDVq0Ns4/TQhN781PeOOaA2Z3oH9vWM5Gvv2pq1VW9gb6
	0mVZNmu4Uno3lX1A3HWUGoKtPo1KpcFHKA==
X-Google-Smtp-Source: ABdhPJwexdkk2JAks+L2XnQcXKi2kPXHTLun0GlaeMIkBBmKm6aFgcwUUuzknOtJ2LGksL7jr0hY0g==
X-Received: by 2002:a17:906:f905:: with SMTP id lc5mr1467414ejb.340.1597397366551;
        Fri, 14 Aug 2020 02:29:26 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id b2sm6329962ejg.70.2020.08.14.02.29.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 02:29:26 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	bunk@stusta.de,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V3 1/2] multilib.conf: add u-boot to NON_MULTILIB_RECIPES
Date: Fri, 14 Aug 2020 11:29:13 +0200
Message-Id: <20200814092914.4160-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814092914.4160-1-liu.ming50@gmail.com>
References: <20200814092914.4160-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

u-boot should be a non multilib recipe, add it in NON_MULTILIB_RECIPES.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
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

