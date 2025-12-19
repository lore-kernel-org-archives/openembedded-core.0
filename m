Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D47CD7494B
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:16 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9334.1766114587472836321
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SLKRXevb;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so1181562b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114587; x=1766719387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syRGD1ZA/ybRI+Ciyc7+8izAHDf6oFFXF+FvmNyaZNo=;
        b=SLKRXevbkrhYeiTHJY9bZ3si2c/UFec7e9912gBecL/Kx7qyFg08AfAYcAmT6MDAXI
         oLdSCajnYNPlkPvR91Bd0xfzE0Bwtk7jxTohRqbZOwwWimg6qy5nLO3S4JYAs83fCIKv
         IrndncKfT6Gjqeijg6DbewhwO6T6mqindmk4GXsY38vIbWfGzO+UHsiHUX+C+OuD3tT5
         m3swZO7FmMjhCwzxuOfvFAnFoxyxEHX+blS1s38V5ikgZtqGT7M6zi8aGCJxXSWGDLtz
         Ep/wEx7meqWNdPPgZCUb8kBlep17xrzRcpumc7OQtdfjgm7zmztmZ8SuccWFl4xCfuiQ
         CjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114587; x=1766719387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=syRGD1ZA/ybRI+Ciyc7+8izAHDf6oFFXF+FvmNyaZNo=;
        b=E7o1Y6xZ5GVyUuRZwqgrZjE4Bcu4LCNxEooL9TVTA5Xm+PojsY9OGOAnG5J4OXeVIF
         aTy4p2Y5TYvNtTHbRj1QsAayHfi4Y4wJnUGTMv3rSxRBzqsRRFa+1Trj6z5Vz/3TVWCK
         M3f5i4m97YT/sV31QPKewUQPGMaIXgWVgZHdErzR4oOW5+SfCcLT5x5mWxSfeaO+1tKE
         SHlGPeDSIBjB3zod7kMAyJqhpebp1iNu1yFsoFwS3ZhltzTw7PlbJm7nWCsi2Imcb1R0
         FeDRtTiuUYSpL7zwn32wvuap0hT/CDvtJWuMgqBtQPn+XjTz+gzXk2wEpfHLIRM0+wkn
         tPKw==
X-Gm-Message-State: AOJu0Yx3EU+W17F03+X7zP/frVLEYxg4KstqaXoi5QyTvPTf5UjBgloq
	A1ESCznJTq1jjBjsWemmKEzVe0xUpffahOorNMxy9luih2xSbOj+RxX4hDub+w==
X-Gm-Gg: AY/fxX40tFupaB0ZMJcg04/QQWeofaAXuh5yw/53S9Eh8QmCKwBO6kflWRNkM/IVmJo
	Buthcb5qRP/uhYVzkmzUOHQi8wLWiQ8Y2mJV1EEbJ00sbsXYBXXF21Uw8cmhNYISQfuRcrvd1Nq
	pMX039CuSJvmftjJtn2YS215pAXi4CZ134NFdpYml4W9DiqkMAB4wQEsFpsFdEfXGqOwNotljm6
	eq0/Jpf0bHAWbE0/hj5bprKdsJpPCA/mAhj1DLDN+xBzrrFkg6UwiQnJSdXViRWyoAPY+4fs+jy
	EwUi7vxefxe429zqofAEaSI4kkqhzX+YXDN9uG84bDS6BT6OkmtnR8y4JaE4unBECMOmjZJPzw+
	hUrB9gbPW2K9KX5wdp91Hge25s5tVGcim6m6+USQQHSOEIUd3A5p/4m+3NtZTWUWNUo57yfjAYW
	rka+LSHOouJco8z6AvA1cja3yl
X-Google-Smtp-Source: AGHT+IGuFgi95IiDRFO4DghXSUwQodYM+1hXo9l4bcuoAc1lc2fpdtb5lXMAm005NWRjtZizPeOiig==
X-Received: by 2002:a05:6a00:4ac7:b0:7b9:ef46:ec61 with SMTP id d2e1a72fcca58-7ff648e6755mr1444428b3a.26.1766114586640;
        Thu, 18 Dec 2025 19:23:06 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:23:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Zhang Peng <peng.zhang1.cn@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 19/29] libpng: upgrade 1.6.50 -> 1.6.51
Date: Fri, 19 Dec 2025 08:51:58 +0530
Message-ID: <20251219032209.960840-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228187

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changes from version 1.6.50 to version 1.6.51
- Fixed CVE-2025-64505 (moderate severity): Heap buffer overflow in `png_do_quantize`
  via malformed palette index. (Reported by Samsung; analyzed by Fabio Gritti.)
- Fixed CVE-2025-64506 (moderate severity): Heap buffer over-read in `png_write_image_8bit`
  with 8-bit input and `convert_to_8bit` enabled.
  (Reported by Samsung and weijinjinnihao@users.noreply.github.com; analyzed by Fabio Gritti.)
- Fixed CVE-2025-64720 (high severity): Buffer overflow in `png_image_read_composite` via
  incorrect palette premultiplication. (Reported by Samsung; analyzed by John Bowler.)
- Fixed CVE-2025-65018 (high severity): Heap buffer overflow in `png_combine_row` triggered
  via `png_image_finish_read`. (Reported by yosiimich@users.noreply.github.com.)
- Fixed a memory leak in `png_set_quantize`. (Reported by Samsung; analyzed by Fabio Gritti.)
- Removed the experimental and incomplete ERROR_NUMBERS code. (Contributed by Tobias Stoeckmann.)
- Improved the RISC-V vector extension support; required RVV 1.0 or newer. (Contributed by Filip Wasil.)
- Added GitHub Actions workflows for automated testing.
- Performed various refactorings and cleanups.

Ptest successfully passed:
============================================================================
Testsuite summary for libpng 1.6.51
============================================================================
 # TOTAL: 32
 # PASS:  32
 # SKIP:  0
 # XFAIL: 0
 # FAIL:  0
 # XPASS: 0
 # ERROR: 0
============================================================================

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df0121211dca11df8a495d23ff5ac6d3d820a0a6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libpng/{libpng_1.6.50.bb => libpng_1.6.51.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.50.bb => libpng_1.6.51.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb b/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.50.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.51.bb
index aa2dc99f10..e499f61ff4 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "4df396518620a7aa3651443e87d1b2862e4e88cad135a8b93423e01706232307"
+SRC_URI[sha256sum] = "a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

