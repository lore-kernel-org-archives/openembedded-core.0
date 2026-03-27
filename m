Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0145010BA443
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67447.1774600271356544369
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=olk2aeOW;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48374014a77so22089195e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774600269; x=1775205069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKhmyj1KneBmHNCmULMEtW8hAQf5p2uEA4vuUTVqOcA=;
        b=olk2aeOW1onx7OHySpEAByj91IPg0hP98VLsRy9ruRYld7JX/VsttdsPF1DBuTHPsP
         UTcmH1uOg1i+i5FlLlUlfamnqg0KTd4NZHQZkojs/CzI4uWM9Yx+gZB9SopU6vaVUtVu
         7uiEWfYbpupivXvausWy38dWNBgmUpYjUw9DQPJcpFoyS1o4ZUa7HB+uQs5h3IIyhbGk
         zzngwcLBM3zlf6jJ9aAOv4jNTCpn8KpSbAzDEHZlropfv+IqV5B2FIUM7U2ZKwaUG/nL
         StdxVvakl+T18rNNWXDWr7plDJs4AlhkmfsXel/GJopdUy+YWCHp09F+VZwOs4Mzxs22
         RybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600269; x=1775205069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iKhmyj1KneBmHNCmULMEtW8hAQf5p2uEA4vuUTVqOcA=;
        b=gsQrKBtM1PKUliCpMzDFTUhlVkzS8TGNNRvRSbqilZ7zCqKV84OqcZAgO//uEfJMY1
         vlry8zr7txaFHHboj3uKhaxYWukCH3phtNvwUOQXErPBC1Mqq5rb5ECS/FNZC3b2TOP5
         qdvTUs67Gf8sA0n9UHnVd5AsQK+j0bEaE1uHbuY1gOdq+we2zqyOkb7hu7wjzgu39IkB
         yS7ALoWAlaR+fA2CES37toHOkAEUtGD2npZREyQMpeNPvzJiiyLfBRTlIGgrF3ORwvNS
         yxUjulWURPBwCS0OJIXAlA09m6FS9pEtU0umfoebWPzg04Ah60bVBSFoiZ1SY22xcpD9
         FD5g==
X-Gm-Message-State: AOJu0YzcyBIMJF+czonlodE8O95eCsmZnTx828bSzZ72c1jR4AZYvs7N
	GnfI7SzvbSfSl5dqzZyhNrMqtVjZd1oQmlBzsymbMVU5srWbCd9EjzK8LyUshA==
X-Gm-Gg: ATEYQzzAfqywWk5D825ZVa2hoyY6Chk+xCUy/OvV1FAAXrv8UF+nrDgY9o7mbD6pcp4
	izs39jazinpE+gQuCyZwgyIfjZ628Tz59TGzPomVOg24BWnuEeJ+Mk6ngdP0Fml6BaM9IxvDSU3
	fCAoZ485i39zOKz+BYDmGCrAZdOoXoDJ62WpD5PjX/u/m4odBg890qGBlHFsW9RMiyzXma4/uvM
	WC1CNJI3Fi6gRVPChywGZQxBsE1b4Fms7DgrDU/sHibinmwrh20mKXyR16JS62/N2Uy/McS9q0a
	q4gUBX/X+VBSsPUzdEsRe+e810KIjnd/e72v7YrOOs1R6hBBRTt+Ng61ZsQJJ+mXQf+SGEViI+4
	6fuSoK1ccH9GjCKy/f4fKYwMfqzotvIDpGvuu58bX4e/TNZAYqZsLuf72ZeCZriLP+MVQv9iApw
	qubKp+Ccv1aN5RcQ==
X-Received: by 2002:a05:600c:c113:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-48727eb8153mr19190685e9.18.1774600269334;
        Fri, 27 Mar 2026 01:31:09 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm76411485e9.6.2026.03.27.01.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:09 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 04/12] python3native.bbclass: Stop using PYTHON_ABI
Date: Fri, 27 Mar 2026 09:30:47 +0100
Message-ID: <20260327083055.12571-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327083055.12571-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260327083055.12571-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234058

PYTHON_DIR now contains PYTHON_ABI.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python3native.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/python3native.bbclass b/meta/classes-recipe/python3native.bbclass
index da1283d6b3..755a6c156c 100644
--- a/meta/classes-recipe/python3native.bbclass
+++ b/meta/classes-recipe/python3native.bbclass
@@ -20,8 +20,8 @@ export STAGING_LIBDIR
 # find_package(PythonLibs REQUIRED)
 # which ends up using libs/includes from build host
 # Therefore pre-empt that effort
-export PYTHON_LIBRARY = "${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
-export PYTHON_INCLUDE_DIR = "${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+export PYTHON_LIBRARY = "${STAGING_LIBDIR}/lib${PYTHON_DIR}.so"
+export PYTHON_INCLUDE_DIR = "${STAGING_INCDIR}/${PYTHON_DIR}"
 
 # suppress host user's site-packages dirs.
 export PYTHONNOUSERSITE = "1"
-- 
2.53.0


