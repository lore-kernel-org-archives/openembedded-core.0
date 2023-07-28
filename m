Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8887AC41513
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 03:48:14 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.25561.1690516086202122600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 20:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JRiGntM/;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b8ad8383faso13859845ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 20:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690516085; x=1691120885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMTS8jRR6kJW+AV5QIKFYF0la6dG4SHRydRPqnnjukA=;
        b=JRiGntM/kl4WWau7PoXkQXRWwA465BVYUNikBrHcun6ImRE5Q8Trd+UC39t0lcBveq
         gbytpC2+a5WuXYxA5Vo0c2HJTcq6XGbeg7od5suNtK7s4T7ILLXg3+WpOUs0gNtGRAa+
         /Ahhp9s5kLX6oiQFixY4mWvlrh+mPXeKekRykol3Torq2grgHRxQ+gcr2MkR3ZTeKctW
         lnb6e0LHYUid+rRuUOLMVV0L6tyuiFeyLaPXzsb9u6RtuZZ5Ce3rZoa8VupjmdldMpIw
         f8s97KTxKn12vLxio1JQOO3dfJG4kc252GgLPydqYDWqiqHMJnN4uPhKPXTcL2NeMESy
         FTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690516085; x=1691120885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMTS8jRR6kJW+AV5QIKFYF0la6dG4SHRydRPqnnjukA=;
        b=cjYwZuAWwtmt1bnMDpXlwspBfwTqW82/q7eVhhYsPRXzr+NvwQDcWtBNHl0XD/PhKg
         y1n1XWjSqvI0CzICxzwX++sLUO04D484vbDZAdbbGYMQIGdhCi6thzJ41sCqLvkL9Itm
         /8BmllX2gzbiiRe9QqlEmIpM1Jj8NT6y8ObbDlc/pRE3SIF2UiPyJBqSjMtuSJ9VGAJp
         yUIes/apAs0JtXkZDKd3guUAl76BzW69dVAEDf5nUEl93x3Cuo9+cLryZWg2qRStypkZ
         fZeEjj9/uEPo5e9scB+aT/acuYZjxuCxMctQn6PI9OQxFhDt/GrFOFV4J43tE2eWlmMp
         Zn4Q==
X-Gm-Message-State: ABy/qLZR9otvGrIff5euRHTXROYn39recI2OrLopzx7Mxvsg4Oi65zv2
	CUmR1VNxPeplNpzVWZ0abo0uxE8OOPBfDw==
X-Google-Smtp-Source: APBJJlGyPYwufPklljJPjyPZ3f83oKWdkaCWgvyfJPaltyHWdnP7bmNfQf7N9Y0cpPn2r3vw2mRZPw==
X-Received: by 2002:a17:902:d381:b0:1b6:9551:e2b8 with SMTP id e1-20020a170902d38100b001b69551e2b8mr651988pld.34.1690516085195;
        Thu, 27 Jul 2023 20:48:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::6608])
        by smtp.gmail.com with ESMTPSA id ms19-20020a17090b235300b00263f446d432sm3460532pjb.43.2023.07.27.20.48.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 20:48:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] Revert "site: merged common-glibc from OE"
Date: Thu, 27 Jul 2023 20:47:57 -0700
Message-ID: <4ae43d6f13ec85484356e635e52f18f6f83d5a5d.1690515949.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1690515949.git.raj.khem@gmail.com>
References: <cover.1690515949.git.raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 03:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185009

This reverts commit a2f942c22e31fe15fef1b44a0e5cc548a60d43a6.

AC_TYPE_UID_T autoconf macro caches its result in ac_cv_type_uid_t
for defining uid_t and gid_t to suitable types if system headers do not
define them

back in 2008 autoconf did not evaluate it correctly [1] however it works
fine now with autoconf 2.72c especially after [2]

[1] https://git.openembedded.org/openembedded/commit/?id=d572f3b010ea76c5b79ecf1ae7864f7a6348220a
[2] https://git.savannah.gnu.org/cgit/autoconf.git/commit/?id=51d98495d1aac00970d791f064e83ca762bf81c7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/common-glibc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 7ba91e03c04..958699b143f 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -12,7 +12,6 @@ ac_cv_func_getgrgid_r=${ac_cv_func_getgrgid_r=yes}
 ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-ac_cv_type_uid_t={ac_cv_type_uid_t=yes}
 ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 ac_cv_func_strtod=${ac_cv_func_strtod=yes}
 
-- 
2.41.0


