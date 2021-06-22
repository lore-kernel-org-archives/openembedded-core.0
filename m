Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.7513.1624360895805830957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TpKHo5pK;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id h2so9603286edt.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A3I8Oc52JDOyWKu5bjPzhkt5t73aeb6ZaB2beHxWKNw=;
        b=TpKHo5pK5aBPr9nNfrjQGXdItY7uDqUBDkAt5yczAPKs7lzQxlR5gM3FSQQJAYF6E3
         RGknxVX21iDuyi+3ZBhZRsswKS+JgigKvca/LkOtacpoyxVMgYqghhpd2Q7XIkDbigIh
         f1xiWU+kbfn4n174e4foVXBO+s1CJP3GJs6KXJDpVRl4NHxnOuAYz2w/3Usd4y/j9/Ig
         X36ArstuPWAITfykj/cBnovfUCamFLDqXbKN2YSueHusMf6PIqAzNKI1hope4aVBIf7J
         EQy/HvG4zz71ShV38G7DDb5IYkZEjIH+TQhcbe7oeIlalxCOYmLnn2nWcavbRql+wdAv
         WsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A3I8Oc52JDOyWKu5bjPzhkt5t73aeb6ZaB2beHxWKNw=;
        b=b3WESmeWzw3ZDdVWY2wNFftbmRdLot3cxB16tyYAoBbKwESuFZs2AhajUndAzZwaR2
         gQdbtdUFZ5TQz15m/2EboSc3Kv/PU+inMRPb4X21cV66GFMamMfkeAWyn0EhPsUoPOBv
         rUEhCf0CsdSQ61iAzfbJWqhF/Jer6HQedpIcB4pRucEpbkRyeCNloJ9JNCeuvrN2WdZ1
         J24YQuTYJ22jiVvi01qQCuRQptoYXqKTXodYf6AJHMBawQMkRdWg97h7lijW+dyoyTEJ
         vNkMp8sj1b3Wh/CVaWTCQBcKgyUgTjM/GRwB7ZyuASDk6fARJTPYGP5Rz6JGElL8oMOW
         FAkg==
X-Gm-Message-State: AOAM533ODYgveslgpjxeRll2xgc0yE5Ix/dsisy565saADNj87wb6HF+
	GH0aDdIPJ5+IIlo2QsYrgMqErL7ysrJiwA==
X-Google-Smtp-Source: ABdhPJyMylHHTge+5n0Uo7uc2KPY0leVn+OWFaiZ+eVDKNpvr6qpJcZLi/ZqhHQV3tXMxpr5ckTpcg==
X-Received: by 2002:a05:6402:d53:: with SMTP id ec19mr4327576edb.4.1624360894491;
        Tue, 22 Jun 2021 04:21:34 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/19] vulkan-samples: update to latest revision
Date: Tue, 22 Jun 2021 13:21:13 +0200
Message-Id: <20210622112126.2026646-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index a177d9a391..972173ef50 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "04278ed5f0f9847ae6897509eb56d7b21b4e8cde"
+SRCREV = "47c5237be21209afc945e43d03ae409fa80a0155"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.31.1

