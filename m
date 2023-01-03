Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB43C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 20:06:08 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.4131.1672776360100890203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 12:06:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GNlbuvPk;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id c6so575528pls.4
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 12:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UR1j1vasD0FQ2eJwHaynHwZpOOqeY1hLETlMYxN0Emc=;
        b=GNlbuvPkXO6NJYLX3riuvirTqQAPclKNbvbf2zuKhFN9QgnFPaYV56ypYUigCvugOb
         NCQendmgvHOPNwx1NB7RHeA8dh3eavDNxbUfqFe2VN5fRXaUDqw+bHeRU7t1w2t/mI5G
         9IgF9eZbx1crei0w87YWFP8pt33+IuiCqH8fedVPGOqsNILUy8ADIaf9g6axp1tgJvSr
         8qS999ZVhgNjpRIHOTexIQLrCIRN/hnXtmjfDQ+KyTXmxfvLwWfSciEIzTcusNPdaJJw
         Rx2MDZZcc+s8BJneXwA9ZyUCPg2AWD8720hruiD/O3gKoSUn3/4d5vZbRpwOYO6ewl5j
         URsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UR1j1vasD0FQ2eJwHaynHwZpOOqeY1hLETlMYxN0Emc=;
        b=1PbL3s5Nj1prjvGV84lUSL1v54Ep15DUq+wpEEvU1lhamA5ux7oBihjcwrcaiqkSaL
         TmO+6MktjlE/StK5bqS2dH/VkLfzZneH7KN5BHIAfkLZAmMuTVTvLhDPt4l0z8pO/1aC
         GmLnI8of5Q2Pra5YZoz1j0vfmBkXJ+VmL5ArbjIOdZslV0iasIf29iwitPSfuAFwK5OG
         ZdDNrBzmXINo2TaPP1/pFNR82FT3rCBKCPReOO8t6eM045WKS1hgcQFhtPpKEI/1JNXh
         tHsozNOmb2Bd2oLqkweBiQBDIkzybZM7dyLfxyH0wsgCjDs28nk3FL++o6NODmkbtFuE
         BQ9A==
X-Gm-Message-State: AFqh2kplOHmicSLXrFR1jwTf3AfeK65mujOAuVdApTdG3YnWi5LD8+RT
	z6dquUCVrxeoOjCSXkge1uOJwHvSycU=
X-Google-Smtp-Source: AMrXdXvBc/R2oxsFlzcKZjGuQj5C0b1A64MBnTv+xRb+9id1HVSSkYMt1z5KGTjgQuMd6WHn22/f6A==
X-Received: by 2002:a17:903:32ce:b0:192:8d15:350 with SMTP id i14-20020a17090332ce00b001928d150350mr36136358plr.56.1672776359231;
        Tue, 03 Jan 2023 12:05:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902b69200b001929212b478sm13779227pls.118.2023.01.03.12.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 12:05:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 4/5] time64: Remove leading whitespace from GLIBC_64BIT_TIME_FLAGS
Date: Tue,  3 Jan 2023 12:05:52 -0800
Message-Id: <20230103200553.52973-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103200553.52973-1-raj.khem@gmail.com>
References: <20230103200553.52973-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 20:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175369

This avoids adding a spurious space in TARGET_CC_ARCH when
GLIBC_64BIT_TIME_FLAGS is empty

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/time64.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 5c53356d4f..2e7278292c 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -1,12 +1,12 @@
-GLIBC_64BIT_TIME_FLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
+GLIBC_64BIT_TIME_FLAGS = " -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
 
 # Only needed for some 32-bit architectures, some relatively newer
 # architectures do not need it ( e.g. riscv32 )
-TARGET_CC_ARCH:append:arm = " ${GLIBC_64BIT_TIME_FLAGS}"
-TARGET_CC_ARCH:append:armeb = " ${GLIBC_64BIT_TIME_FLAGS}"
-TARGET_CC_ARCH:append:mipsarcho32 = " ${GLIBC_64BIT_TIME_FLAGS}"
-TARGET_CC_ARCH:append:powerpc = " ${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
-TARGET_CC_ARCH:append:x86 = " ${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
+TARGET_CC_ARCH:append:arm = "${GLIBC_64BIT_TIME_FLAGS}"
+TARGET_CC_ARCH:append:armeb = "${GLIBC_64BIT_TIME_FLAGS}"
+TARGET_CC_ARCH:append:mipsarcho32 = "${GLIBC_64BIT_TIME_FLAGS}"
+TARGET_CC_ARCH:append:powerpc = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
+TARGET_CC_ARCH:append:x86 = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
 
 GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-tests = ""
-- 
2.39.0


