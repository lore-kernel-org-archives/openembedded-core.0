Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B79CC7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 18:57:38 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.2730.1685559448045087304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 11:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=WRf5hX/Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30ad458f085so1114348f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 11:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685559446; x=1688151446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=U+LEIi9q7LArTeNHysUrTzsV3wcEzmTtAGzZ1t3nAmM=;
        b=WRf5hX/Y6nFWlJHc5t7NqrWCwft16PWyfd5UB77FNIz4QinfWLHIhCc3Rq493SiHMS
         HR5Z/FtvGGmmUAWZ0ew9SAW7+bNkV0k0W2nWkHAvZ177xprhQ9nyiQjml5Z5DPWQKaXO
         6XGS2E5FAI5c+jZZQNISpUZPDRpx/WmTVgOGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685559446; x=1688151446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+LEIi9q7LArTeNHysUrTzsV3wcEzmTtAGzZ1t3nAmM=;
        b=TQPMXhHMzcFmCWB1MGsvu7IYo9Vm7nuKvG9rJADs5v4yzo/wkgHmO8e1iCjIiVXUf2
         rE+owWVxbzT42KO5tvlmhWunROH92G/ImwC3nGR4Uhl+z0EtUVxRRq+aF0ACVVQShjj6
         1tWbWjBny0IIgYpWqOTBhaT+65KZgmrc4z7lx/BXElmqk8rqSVyIqLpjOQYCjm36tqRp
         527EabUTZY34cVkqv4lroDgcPvXJRdUGw65NEYa/9zeS5kp7yx7XExeRgOC9b1Em4d6p
         WwR1iTUFTBGRzXcJMBLw1Vg42xTEjrBjWrXmkJL+4Aqnfe0DxrWlDal0UB94YON5eZ7E
         06yg==
X-Gm-Message-State: AC+VfDw9qUO3Cyph6twAq3A4ia9dLkPUkJxxPjI8n8EfkSn+5AGoXTWz
	X0xs4hpfqm2DI1hl8GImQ4AZVOsKi52AV2mhfMU=
X-Google-Smtp-Source: ACHHUZ4XuzF7q6IuibluUL6xbjWgBWHGT+2jwEyuYZkCG+ZngJyIFpkXRrG3FcJ/hU5WGtWf9E3+Ng==
X-Received: by 2002:adf:d4d0:0:b0:30a:e3bb:ba8b with SMTP id w16-20020adfd4d0000000b0030ae3bbba8bmr12609493wrk.29.1685559445760;
        Wed, 31 May 2023 11:57:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c24d:d0cb:1f56:b422])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c231100b003f31d44f0cbsm25530209wmo.29.2023.05.31.11.57.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 11:57:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/license: Exclude from world
Date: Wed, 31 May 2023 19:57:24 +0100
Message-Id: <20230531185724.78401-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 18:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182034

These test recipes shouldn't be built as part of world builds. Some recent
changes are exposing issues from this so exclude them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-test/license/incompatible-license-alias.bb          | 2 ++
 meta-selftest/recipes-test/license/incompatible-license.bb      | 2 ++
 meta-selftest/recipes-test/license/incompatible-licenses.bb     | 2 ++
 .../recipes-test/license/incompatible-nonspdx-license.bb        | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/meta-selftest/recipes-test/license/incompatible-license-alias.bb b/meta-selftest/recipes-test/license/incompatible-license-alias.bb
index e0b4e13c26a..1af99e78091 100644
--- a/meta-selftest/recipes-test/license/incompatible-license-alias.bb
+++ b/meta-selftest/recipes-test/license/incompatible-license-alias.bb
@@ -1,3 +1,5 @@
 SUMMARY = "Recipe with an alias of an SPDX license"
 DESCRIPTION = "Is licensed with an alias of an SPDX license to be used for testing"
 LICENSE = "GPLv3"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/license/incompatible-license.bb b/meta-selftest/recipes-test/license/incompatible-license.bb
index 282f5c28751..6fdc58fd300 100644
--- a/meta-selftest/recipes-test/license/incompatible-license.bb
+++ b/meta-selftest/recipes-test/license/incompatible-license.bb
@@ -1,3 +1,5 @@
 SUMMARY = "Recipe with an SPDX license"
 DESCRIPTION = "Is licensed with an SPDX license to be used for testing"
 LICENSE = "GPL-3.0-only"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/license/incompatible-licenses.bb b/meta-selftest/recipes-test/license/incompatible-licenses.bb
index 9709892644c..47bd8d7c00e 100644
--- a/meta-selftest/recipes-test/license/incompatible-licenses.bb
+++ b/meta-selftest/recipes-test/license/incompatible-licenses.bb
@@ -1,3 +1,5 @@
 SUMMARY = "Recipe with multiple SPDX licenses"
 DESCRIPTION = "Is licensed with multiple SPDX licenses to be used for testing"
 LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-3.0-only"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
index 35af0966efd..142d73158e6 100644
--- a/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
+++ b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
@@ -1,3 +1,5 @@
 SUMMARY = "Recipe with a non-SPDX license"
 DESCRIPTION = "Is licensed with a non-SPDX license to be used for testing"
 LICENSE = "FooLicense"
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.39.2


