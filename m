Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC713C7EE2D
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 17:35:05 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.302.1683048901247482960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 10:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Kpaq1mjK;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: ernstp@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2a8bca69e8bso41105321fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 10:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683048899; x=1685640899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6u5yQm+XUyVvIoL++3rqx8cY7dvkYnqTC/WlmhRH6U=;
        b=Kpaq1mjKX6YZDrfACquRDUNBWMLGYx+jUDt8xR75sT9E97/Dm8s5nyLRSVXXx5DTCR
         L52tLMYL/4nhiHzHBS1PvyQpiSoDuIxxFr+4N0Eoot4mJbfStc/7EK652i58nV3Bh08W
         Eb1G6l7Yq5XwgYtAeqDHcUDAJLIN11cTpGyFtRGO7oDrHFQqvsreOsMOwNOoCYsuqOZ2
         VMGJvNgY4l7/esnjEklIkunHn2UPnpQOpQ3K49ZEh8zQW+n4N3P1JkP+pKVtTabR8sga
         9UCxODldA4/KW0T4b1T2+qLZwnAbkKUfn3JBA8YDy53ECn0WzW1nCN6pHnsnrTzTiamY
         lHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683048899; x=1685640899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6u5yQm+XUyVvIoL++3rqx8cY7dvkYnqTC/WlmhRH6U=;
        b=RiQPrDgHy0cXN6LEFHtslTf3PdBkzTXUQ8It5oQsxgjBhakAniWCKjRjAu9cPLpwKQ
         0/cp35tpnzA/WgKza7KrBtigjJZaodyaIWZpZHg7f+W4qqYI7NNEsmUmKLdeX/ug5YED
         Ddg5buoNLStQqu0jYqzE9NK+S3KMbNgWXTTauRvtoWzSt6yMXItTftix5AG9RVkVaHzy
         7IPdMM/LTeYjouGl9dbz23Ybwpb+leLjExZxOQoepd1Ud+waPTbblCwvZ4r5qelvJwqG
         gddMWWruvBPRJzK9m8vddhuDPCjdxbfm2iRpyjRStfqBjp/gFA3U351+xTOLfjW22NM4
         bcjw==
X-Gm-Message-State: AC+VfDwfuF88BoQ8nA3xiWT8SOd1OPiTKCGHLygbD2lSs9aNUmb7kIaq
	WE4yN95F019Z3aCj/rAq7UltUjvcGg2aGg==
X-Google-Smtp-Source: ACHHUZ6oEMoDdONRbL+tq8cKa7zrnflt6uX6C00RLV5yMnFUF0g4RALGXoreTY7EuRtft/o0eMOdMA==
X-Received: by 2002:ac2:4911:0:b0:4ef:ed45:3192 with SMTP id n17-20020ac24911000000b004efed453192mr192460lfi.10.1683048899379;
        Tue, 02 May 2023 10:34:59 -0700 (PDT)
Received: from localhost.localdomain (c83-254-134-100.bredband.tele2.se. [83.254.134.100])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24297000000b004edc3bd7fa4sm5507879lfh.287.2023.05.02.10.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 10:34:58 -0700 (PDT)
From: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
Subject: [PATCH 2/6] python3-fixtures: add recipe
Date: Tue,  2 May 2023 19:34:18 +0200
Message-Id: <20230502173422.1439794-2-ernstp@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502173422.1439794-1-ernstp@gmail.com>
References: <20230502173422.1439794-1-ernstp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 17:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180757

Signed-off-by: Ernst Sjöstrand <ernstp@gmail.com>
---
 .../python/python3-fixtures_4.0.1.bb          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-fixtures_4.0.1.bb

diff --git a/meta/recipes-devtools/python/python3-fixtures_4.0.1.bb b/meta/recipes-devtools/python/python3-fixtures_4.0.1.bb
new file mode 100644
index 00000000000..f71eec6497e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-fixtures_4.0.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Python fixtures for testing / resource management"
+HOMEPAGE = "https://github.com/testing-cabal/fixtures"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=239e2f4698b85aad5ed39bae5d2ef226"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "d2758826400d095b79666cf93a32a84f50ff8cd179831927efb48cd1e3ca7466"
+
+DEPENDS += " \
+    ${PYTHON_PN}-pbr-native \
+    "
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-pbr \
+    "
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.39.2


