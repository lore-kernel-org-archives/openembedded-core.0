Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B11FC433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 14:57:42 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web08.24103.1634482661075422153
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 07:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=TEJSthuZ;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.174, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f174.google.com with SMTP id d13so3982775ljg.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 07:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JmvvxrqAXOeS7RDgrk3KQqS6pm9EYGPbqHIj0RzlwZM=;
        b=TEJSthuZgP67akvNKIxYHXWPnpb7XH7qPidmMEeSz7KCFbeGwn7E58rD32aEAtXsZ7
         9w7Kfo/z6JrHFZnSUxcmQoH0GyFEHtASJzd2MRfb3XNEE0j0aj9a9aw6PUk3NocpVXhF
         TlAbEBwUO5aSzMMAPdyYvtTvVKU7lZTx4aaaqlJkBlwCaGmF4FI6RDC6fU1Vr9zieI0M
         w8W8UqOtt5eKcjbP7Ar44W51l2gCP4zbbRBIz11fSoGxny/D4q/L2ZiXqTg+B0rUVdlM
         useQTxnC1wkgPE0uo7cxTLt9t5zvKSGwf0XfdvbNYsUCwHMxCf+9A7OJMLI973p81+AZ
         j8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JmvvxrqAXOeS7RDgrk3KQqS6pm9EYGPbqHIj0RzlwZM=;
        b=ihbZxvDnGk63qMu8phB/oek+BcfNuRBlWl3ziu4u/ZCzxGPmzhB5gJsv8Ql6l3WMfM
         4R8tKr/IEPDtGBa7z4ywGceWIfCaOnaM9hA8dntP84HWoEjQkK0DTe4Kng1YChvENLix
         BoduQ+Qfh6ZItSIi/GfYlhAKz639UJ8fSJK9CNg/r9EChQK3dnk75VhzAL5kaV/XNbRy
         ZQv8w8oauTwMT3Am3S39Mx3Ou5419QvDhCEwFu2XEIm5nswcUh/V/j3vysg6ltv1vggV
         NXijjtR5QeD4y6VqMS9Pbur1j8/OrfKgncfbzUPgV0rOQjdpiy9YPM5gi0a/Q/cX7mVu
         x0Dw==
X-Gm-Message-State: AOAM530Mc1gLabKS8s+ZAOnYJABfcWQ5iYBouAn9QnPu2gv7Ki+TjZIC
	JqZQURc9qKaoTLZ+E9L75vi3TXM5FKEl4STr
X-Google-Smtp-Source: 
 ABdhPJxCGddZ4hLIk0btN19mPlBeXsesNLm7z9jGAqvhQpDTUfHPCWQvcmvxfhOPWfFX44YDr3wV/g==
X-Received: by 2002:a05:651c:10b2:: with SMTP id
 k18mr26419196ljn.203.1634482658788;
        Sun, 17 Oct 2021 07:57:38 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 o12sm1172069lfl.33.2021.10.17.07.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 07:57:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-smmap: update to 5.0.0
Date: Sun, 17 Oct 2021 16:57:34 +0200
Message-Id: <20211017145734.636060-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 14:57:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157043

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python3-smmap_4.0.0.bb           | 3 ---
 .../python/{python-smmap.inc => python3-smmap_5.0.0.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-smmap_4.0.0.bb
 rename meta/recipes-devtools/python/{python-smmap.inc => python3-smmap_5.0.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-smmap_4.0.0.bb b/meta/recipes-devtools/python/python3-smmap_4.0.0.bb
deleted file mode 100644
index 5f0f341d6a..0000000000
--- a/meta/recipes-devtools/python/python3-smmap_4.0.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools3
-require python-smmap.inc
-
diff --git a/meta/recipes-devtools/python/python-smmap.inc b/meta/recipes-devtools/python/python3-smmap_5.0.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python-smmap.inc
rename to meta/recipes-devtools/python/python3-smmap_5.0.0.bb
index 7d0cff5fa6..ea131ef793 100644
--- a/meta/recipes-devtools/python/python-smmap.inc
+++ b/meta/recipes-devtools/python/python3-smmap_5.0.0.bb
@@ -7,11 +7,11 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
 
-inherit pypi
+inherit pypi setuptools3
 
 PYPI_PACKAGE = "smmap"
 
-SRC_URI[sha256sum] = "7e65386bd122d45405ddf795637b7f7d2b532e7e401d46bbe3fb49b9986d5182"
+SRC_URI[sha256sum] = "c840e62059cd3be204b0c9c9f74be2c09d5648eddd4580d9314c3ecde0b30936"
 
 RDEPENDS:${PN} += "${PYTHON_PN}-codecs \
                    ${PYTHON_PN}-mmap \
-- 
2.25.1


