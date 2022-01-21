Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D53C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 18:30:11 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.643.1642789809955366544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 10:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g6oyfo+/;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so9838618pjp.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 10:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SI8mWK0iAJPHNhyLQ5nFRhQLAScotvygMJc7bRy5yKE=;
        b=g6oyfo+/lQL2rLbKXGc7FcPWJV4n9i7jpThQPR+VlNSTNZUHOurXnVihl6nxqZreRc
         Gsn6RlxE0E/oR5HVT4y7xQ46vyau9yhcVX/Eyj1ur9BlJdk7Tl7LgTyvV4MO1nckupOX
         lTf29raOSJwIQlxA7ZAx/jX1gk1g+jttkO5584aRsp8uudLiqm064jLHNwmQOd5qaO0w
         sR8pS1KR+JBmJEfqnXRfB4EysaRsm4aclUFxVmuP8tfaNgZ3WcCY+ebNsIR8wJXKOlCo
         ec5Ga1GIHjCVijTF3Ap46yumkINia6c6+i4mwpwe7utbOrbyK7v+D5+s6buzzloiI4d1
         Hk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SI8mWK0iAJPHNhyLQ5nFRhQLAScotvygMJc7bRy5yKE=;
        b=FLxsjfTKfGwV7UyLM2P1y6PetsuNcStm8C+o6JsV+lhhXwwyDMyayZohkEfVRMPQ4R
         dKT+NDdCQnO2vMDz3NlFw8n+pua8QvJpxtBjd5Ctra8C28y+lsc4DyzRO8GcLCXdJDuJ
         znyAvmiqfsCP7bhHFGN26Q/NVWTG1cCcY9R1eW7gVqgvpvl3GcCuoG4tkHvFHaojx0N4
         39Fv4ci6HmYNpKhYMG4ngHXADZD+k46Z7rtnOjeMELFUhMy2Wz70TD0jFOQvOamvRUN7
         Ki/3TWKoX0YtIBNDxfuM6O6PzzkufF6scGYrZcqZntoVx7WHlDweSh/MXUUGdm3pJJSB
         vniQ==
X-Gm-Message-State: AOAM5313C3kI0Y5WN272m433O8b3bBLA9DnPwsZROy2kiP/H6n2qBYWB
	/4dchZiwd/C6OQn50ZKOKufvj1OuR835hQ==
X-Google-Smtp-Source: 
 ABdhPJwOBmvLYSCm42m4oDUU3e1MvrfRKEmaZYthzQNATDWzAMdIXkg6s3wAmtfYlAkZt7g7wcPeGQ==
X-Received: by 2002:a17:903:22c6:b0:14a:8c12:8d12 with SMTP id
 y6-20020a17090322c600b0014a8c128d12mr5217518plg.54.1642789809202;
        Fri, 21 Jan 2022 10:30:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 g8sm7625267pfc.57.2022.01.21.10.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 10:30:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] qemuppc64.conf: Remove commented prelink use
Date: Fri, 21 Jan 2022 10:30:02 -0800
Message-Id: <20220121183002.3820051-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121183002.3820051-1-raj.khem@gmail.com>
References: <20220121183002.3820051-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 18:30:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160849

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemuppc64.conf | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
index 2902d541ad6..a35c40b5927 100644
--- a/meta/conf/machine/qemuppc64.conf
+++ b/meta/conf/machine/qemuppc64.conf
@@ -17,8 +17,4 @@ QB_KERNEL_CMDLINE_APPEND = "console=hvc0"
 #QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_OPT_APPEND = "-usb -device usb-tablet"
 
-#prelink broken on ppc64
-#USER_CLASSES:remove = "image-prelink"
-#IMAGE_PREPROCESS_COMMAND:remove = "prelink_image;"
-
 MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
-- 
2.34.1


