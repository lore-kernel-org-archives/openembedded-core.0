Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.22757.1617396406794778969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Apr 2021 13:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hv4P0TDO;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id h10so6484963edt.13
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Apr 2021 13:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W/yhZWRVWInvEQAXOkCPuFNLfglhOJNP9pqez8TkREc=;
        b=hv4P0TDOmY/hAYukEjQbg0+nNjwZ7OHQW7eNCuSQrQCxQ1bVoYqy+WAzmYedQXXmKq
         o9ce41eQqLxOXSkzi/UvsDMRLAI+Z3qFA/gqxtTBJj/Ta76LBKxY/enkTVh8IMCv33/q
         HlkdG9v2mG/NNf5LLfvlZVmkOn79fOFoEb8KpROUKI7hIeoc5ewyDyTdsz10+XnSXIvg
         wJkGYHDadbQTlnPCBR6i4z0xWis5nPR1v8qMb/asxgM7wTiWoveZHOIervSL+Dm6er11
         JkfyYA41saTbrVx4jxYES180lJPtYyisO1JN9TxjNIeFH7OK73yJtJYLVqPrt58jsRQm
         uQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W/yhZWRVWInvEQAXOkCPuFNLfglhOJNP9pqez8TkREc=;
        b=I+Kh9o0drKxycY1flyPn1UPHS8EBV5aAcweRdZbGElcJpVo35S8f4A8n/CiiMLoCjf
         KAY8NONdUUssgHzIq9Zsk347lz37sTofB/klobNK1HUBM42Mue38AhCDuWY+ZxdNDOAX
         r/k47NTqrxnqayWSKgyqW1dNx1mnyMAgxVsRnCvHnkPvngOCo6F05RjJxSnlgTwOzna3
         G54ZxArGepIG6TVkbyM3lpI0PlcQPyLjPRTh2nC837zlSYesmXo3NSo+4a2oe8hSPRtv
         wQdjX+VY4wuWYt5sy/FEmMqb2KqpBelTygNPP2NjWX9yNY8olVi+7ePbN2vdSUFXYJmr
         oj1Q==
X-Gm-Message-State: AOAM531MeAkWKutGoxLvkIiUt5SYiUP9NjPOSUwEhdEoO9XshuLqLojB
	0sPwqBiya6C3gkpMPK5RVlXqoHNP9vk=
X-Google-Smtp-Source: ABdhPJxMrDeQ4RyLS/pNcWlZKk/bltzJaO2SOB/I7yaFZlQA/O+8jOSHbJwEN9bsst3eYafuzMnogQ==
X-Received: by 2002:a05:6402:3493:: with SMTP id v19mr17885332edc.355.1617396405436;
        Fri, 02 Apr 2021 13:46:45 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id a22sm5845623edu.14.2021.04.02.13.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:46:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/6] ptest-runner: correct version check
Date: Fri,  2 Apr 2021 22:46:24 +0200
Message-Id: <20210402204627.207068-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210402204627.207068-1-alex.kanavin@gmail.com>
References: <20210402204627.207068-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
index 8b9938f572..0d23a3ee89 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
@@ -12,7 +12,6 @@ PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
 "
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

