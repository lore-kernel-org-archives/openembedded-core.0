Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C48BEB64DA
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.7497.1686734993172977762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LcxFURfo;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-977d0288fd2so85555766b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734991; x=1689326991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEWSGI1UZTXZpZ/FN9szrDL3sLQ3OmV9ZQOV7AxG2B4=;
        b=LcxFURfoe1Rh6TxNzgtILY+t1iD2n0x1z4cajJKvqE0TRZ/EYJ2DQuvbsSBj0u2KNd
         6b1Nm9w2x/Pvt5Jv/xN0Zepychg9i7YglA97YE49UxSdSofQhR8mX9Sx2G5kRw+FOkQ9
         BR2IOJNxmWGvXYSlIqEIn6B67Q6fQxFoEP/6qrMSOQns6FcMs9bXmyWkr0x62YDsHTda
         vvjj3FkuCkHMBLumAkrzC9FgRYVmKwxoDWadn3K6H+KkAbqMewq3tMiTC/3PM92PpyTN
         62614g3NJa+wQlScCq7Ib8M2W7LaCnLUeOdcfNpIZQV4NR7+j4sm5vhMx0ivt/p9r7Xr
         ktdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734991; x=1689326991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEWSGI1UZTXZpZ/FN9szrDL3sLQ3OmV9ZQOV7AxG2B4=;
        b=fm7DcIpaOXdHg46ziigsklnKQ1HvEfJkXiSoqeU5n7OfBwiZLWIojaGEqaZ3wt4lyI
         awDeE/44mGJFhVilSFihPe1FuHKLs9mi4BaHBn3VB8KwnU8Sl0R6NlqAo2CBiYe7vC+R
         zuQTt8zM8eH8Uqg0j1bwlXy4u4MVEh2aK/B5+jREZtWjevkixVViwjl5j03f6X7AjhfI
         4OPAXRz9L+cyK6hbBQz8UAPgdArUyQMlIR0REvA1QM/kixX84vjDiv6ze934TX7+bqIe
         OCI08hF8TFdiHWGMhOsl01XR/WIfZU0ck2MsKOsXX5E9QtqgrTqT+t8qSqKo/9cAQi+F
         UB9A==
X-Gm-Message-State: AC+VfDz2RDwOz84OpPhxhU7jAc4Q3JErEzaFd19Gva2DNFyV6TCjt6O1
	dU42kMWB0IyL/9FVeqxmkqZ6whUu22s=
X-Google-Smtp-Source: ACHHUZ5ckTWpnCXa8TvGzh5EwbZ74D9gQLQoEgRPO1KRwPv5qVFwbx31pWbV5cZmjGjBqI8qytA2mQ==
X-Received: by 2002:a17:907:a01:b0:978:8ecd:fa6c with SMTP id bb1-20020a1709070a0100b009788ecdfa6cmr14817541ejc.34.1686734991613;
        Wed, 14 Jun 2023 02:29:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 44/55] python3-sphinx: remove BSD-3-Clause from LICENSE
Date: Wed, 14 Jun 2023 11:29:07 +0200
Message-Id: <20230614092918.4065570-44-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182789

License-Update: BSD-3-Clause code removed in
https://github.com/sphinx-doc/sphinx/commit/a7f5d91c29d6f377b9fe7e926965c6f9d3e7b802
which was a part of 7.0.1 update

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-sphinx_7.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb b/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb
index 7af45828612..10e01a2d7ae 100644
--- a/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
-LICENSE = "BSD-2-Clause & MIT & BSD-3-Clause"
+LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb6ac1b115a1ed24a12d9f15b633993"
 
 PYPI_PACKAGE = "Sphinx"
-- 
2.30.2


