Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A249AC61CE5
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 12:30:18 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.10041.1748953816636634588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 05:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vPA8w+In;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55324e35f49so6485887e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 05:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748953814; x=1749558614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gkr+tGW7ZfeQx8AeOHM/avYF6+GS0kp8o4oq6mlKgPc=;
        b=vPA8w+InTYYd1dVbEgS0sAleUP0WevFSz5Qii+ABagX2jlDRBLwREJir0YNAy+qOYk
         x35w2MbwcWV1vrjYe7WjAuqM88HExr0h0RVS94yuIF5FLEDfhZ7idqmy+0R1BfPXZViZ
         C7uJAM72jRal1dAxYheRlrsyii0LuXcKvLDArUE4fsDas9/nPV5QC3AHgEyYPo0BWeMb
         giwh98Cq+5QCwBBbA0eJkRqT1ZjzVV8OrM43tgpNVByP+mQD+z7zLfGgVolHB3O35gmk
         SuD4/v+9oCZc060cJDrVVb7NG+yHay7fVLX/8iPoITa0KP5HW/zXq+6FDanQCVObcnlp
         2Y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748953814; x=1749558614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gkr+tGW7ZfeQx8AeOHM/avYF6+GS0kp8o4oq6mlKgPc=;
        b=GZqqHddNjwGyhMAg6D3K9H1T0Rk3EBQycjfgJ4m0NakdDbSSfh4RmQC7Cu3hQwt9+9
         7g2ZD6fQ7rdC7IeWnc/57+72Rd7ysbMNfj5MMq+Jke4Wfz/pU0totQHxV4o6l9k9xTSc
         m3u9q7TDLP0urcKTWxMaeygQ54yMdsHgZmHlLojMb3HMklmGDxxTjmOuvGwgZc3Drh24
         Yn1zmyT92/gGhEuXF0xoAoHs5SIv//35AuQLwA9wi6pLWxRZ4E20kMyn8AYAOtmvQhgh
         UhVcqllb7//ewLsbWpmIczi3hOsRQcKd7aW3WGwv9USYcJowTAYPR+QPAFh94fiCyz9s
         msgg==
X-Gm-Message-State: AOJu0YxI8xAqr1XMfY+rbPv/lkpyqIjjgIbbrySADU4vRq1KL9TPt/Zn
	Hh50/47+Ff+TtQMchRYN6ck5q3fGXyT/Qcoe5zb9ZFmP11unQNFtCDBfN00+jF6Mlh5oFoOuSXP
	vfzDyJRk=
X-Gm-Gg: ASbGncvSF8Z0d1Vd2n0mJ86XwuTCLtTzfosXbGuI/4nRhpZJedMbGLcnfL6hM060MUe
	ZlWbyAC/VJIEBR+nBYhh42/BhV0F33sR7TxX9pcny7vOwe1TT+ZyQq6zREkjMSyy9fDgdHQzm0x
	j+kNLZFGjB5mzkFqXEEK1UmOx4QLnSH5QAfrXxZfv5T2H4VSM1mrRclAV4lOuI7dFGgLJPm0PGp
	NxfNZeRvqPOytMYxZPFwgQFXE/6Zub4lV1kGI8lijXW5wnEsciHN/4KxFhFwXht7wEit8wIiYAH
	T6RysxaV2qHUGjnuZ5qAnEc8oNPpty0dAtd+pUzfB2aSAxYLYBXecDUOYE2saQ7b9si2MV7X0Px
	kd4apMbHg4/Snuqut+72K6WfKJyQe
X-Google-Smtp-Source: AGHT+IGpC2brikUgs3qq8n9ILVQNAHaxENR2YiQppByrTcAnVCgKZpWx+2mUChCNbJQjZ0mQZbNWgQ==
X-Received: by 2002:a05:6512:ea5:b0:54f:bce1:4a25 with SMTP id 2adb3069b0e04-5533b93b8d7mr4890329e87.53.1748953814378;
        Tue, 03 Jun 2025 05:30:14 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791d0bcsm1920295e87.208.2025.06.03.05.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 05:30:14 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 3/4] oeqa decorator/data.py: add skipIfNotBuildArch decorator
Date: Tue,  3 Jun 2025 15:29:38 +0300
Message-ID: <20250603122939.1027947-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603122939.1027947-1-mikko.rapeli@linaro.org>
References: <20250603122939.1027947-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 12:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217812

To limit tests to specific build host architectures.
For example KVM testing will only work if target and
build architectures are the same.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/core/decorator/data.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

v6: no changes

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index 5444b2cb7518..0daf46334f62 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -228,3 +228,15 @@ class skipIfNotArch(OETestDecorator):
         arch = self.case.td['HOST_ARCH']
         if arch not in self.archs:
              self.case.skipTest('Test skipped on %s' % arch)
+
+@registerDecorator
+class skipIfNotBuildArch(OETestDecorator):
+    """
+    Skip test if BUILD_ARCH is not present in the tuple specified.
+    """
+
+    attrs = ('archs',)
+    def setUpDecorator(self):
+        arch = self.case.td['BUILD_ARCH']
+        if arch not in self.archs:
+             self.case.skipTest('Test skipped on %s' % arch)
-- 
2.43.0


