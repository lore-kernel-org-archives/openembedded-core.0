Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CECF364C0
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 21:52:55 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.143647.1775771567194421466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 14:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GbOwt9I0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso15378315e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 14:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775771565; x=1776376365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2IMy+xER5+BQvUOQK1oHet6DGNCq2HD0wn2xA/jrwh4=;
        b=GbOwt9I0x5pE3Hpel6y+ijz5lnBISBws+Cxv4dYnbPAWcAS+pSPbwb5+QNbDzyI1/v
         h1Y0Z8/gLoYg7R0HWRpS/Ax4Db+jYYwphWCmPW/SorAGTIuSkcF4+3YRNKrLTD/fpKbc
         NVHclo/Ntu8NISksFPEB39NvYcJb/RtF/kjp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775771565; x=1776376365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2IMy+xER5+BQvUOQK1oHet6DGNCq2HD0wn2xA/jrwh4=;
        b=jjtBFUljBeMPRuRgd3kyJMtPyITBD3kdx+KPMKj20PbtGabmXvgz3Y1jyesQ7QYPnn
         bs1aitX1aFjDaCC6lgd8XGy2lTaANg9/CS20XxJr8GRVlBFcukHpHIdXdlAk4uufaaT2
         rCdEvs1v3tVdml2jMIJEhHnTmtUTmdn8983vrvdEKhNq25Kqd1ydFoUFvywG5YX1hH41
         y9u8moUmdrzC+CFEdNIhEOQ3GUEG2ZxT5RpZhqxALAfyp96S65jNPpWgwz1nizhqLJRe
         TwfV/zDYZSti5+elTwHFOrDv9eWdWfX/JXZtvoUDqtVqMaEz8JKUXc6yhTpUv9+CIRjh
         Yr9w==
X-Gm-Message-State: AOJu0Yxf2TJdD6CG6wCm2r+cGdbF0lXJ75rtYLNxqW4u35jiyXjMiad8
	Txhd4NzF5SpCHfrMlEHZo1UXg1Oxbjs/ys3kr4qPp1Rc7z4yBs4oDr8ID0V1sCZVMrceNHDV9Wu
	rc++rwd8=
X-Gm-Gg: AeBDietzceNSfLXgyWF9m1JSXb9C5m7sgqxiz5b0WTe2MmsCdWPTOnEvZI6Q8JEClLh
	YTFEk2huFHj7Y2W8SQUXQKs9FfpYo2jdIiIHT/L4GX8nQmlxeBAXY/PtDZ0eY1VxQROZlkRB8dO
	xHLIOsQX0BNgMk6bzO1TYJm7q5aNAh4fToaFhJyqqOwuE0DFYGyTcQO6Xurh3enO37Ak+XqmPzy
	ld2R7V023wpU6gAnRgVHP0o2CMoX5ooLWk1y45xT1vsJ7ZWdH6ptUL0a3eDwudHN+kQanH9N+ZM
	4XfIRNgf0GHe1olGzdn2elJEgDU+xI/afni7kedGUMfTZXhH+8Rj/RO6wzN8obWJZHDBEVRVlmI
	xnEwj1kCiZXzsMif84wkYHeQg9KZvaC/ZdXqV8s+QeRMa8pjXy/D8E6p/46G9A1zpWCHtzSwvfL
	0ph14RNj2Bwp5qHxMX2PduMxVdUrtJSpOl//W0x6Gj6y7uNblkZHcTbwsVLWO96tE=
X-Received: by 2002:a05:600c:8207:b0:488:a4d6:69ad with SMTP id 5b1f17b1804b1-488d688dd1bmr5134505e9.27.1775771564814;
        Thu, 09 Apr 2026 14:52:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c642:6c74:9bb7:e65d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e7e45sm5153165e9.9.2026.04.09.14.52.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:52:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libgcc: Bump PR/HASHEQUIV_HASH_VERSION after reproducibility issues
Date: Thu,  9 Apr 2026 22:52:43 +0100
Message-ID: <20260409215243.3809177-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 21:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234950

Simulate a PR bump by changing DESCRIPTION which will force and output
change. PR isn't a good candidate here due to the shared workdir.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/libgcc_15.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc_15.2.bb b/meta/recipes-devtools/gcc/libgcc_15.2.bb
index fdcd6cc0da1..d04178f12a5 100644
--- a/meta/recipes-devtools/gcc/libgcc_15.2.bb
+++ b/meta/recipes-devtools/gcc/libgcc_15.2.bb
@@ -5,3 +5,7 @@ LDFLAGS += "-fuse-ld=bfd"
 
 # Building with thumb enabled on armv6t fails
 ARM_INSTRUCTION_SET:armv6 = "arm"
+
+# remove at next version upgrade or when output changes
+DESCRIPTION += " (libgcc)"
+HASHEQUIV_HASH_VERSION .= ".1"

