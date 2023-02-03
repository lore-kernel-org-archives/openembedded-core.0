Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405A5C05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:51:31 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.17968.1675446685625205322
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ow4xDrkp;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id m2so6009375plg.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYCmJUawUBs0MgJAqISZsqPmSjuSWjwToKmfZPFe6Q0=;
        b=ow4xDrkpxiMHXWRBvMLH5s/UQLxcIPz23RcEEEZ/F+KUK8/e4t8rLXYlp0Uj5AzeNp
         twgdC7Xraqlul3VS+PHGffelPD0/gXYdmGhYeb9s3L9OoJVKORlwDhKxcXmfH25Zd2Cc
         DgzoZv7Bvn9yM5uWPig0bvUzj9VVB0CpCr7RZJK2FQmVN5TCRqO6FQODQolCLTf2s6/P
         edRVEA3XUhbjBIdoTiKHP5WxfLPHLZedZ6PX2VU7kmqY8id7f/yXLbSKOg6YvR47rMwW
         JGQWkN3qGkp317vY55LAycitQZ6crQSiLZXr5NkMa3cIgxNY3cCinjUtpql+CXjcfS1O
         1hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYCmJUawUBs0MgJAqISZsqPmSjuSWjwToKmfZPFe6Q0=;
        b=jfQ57VgiRhUy9Kc07jzkw9HYv5XIumBGqrU3AmNWv3CxBfMoB+9iJrw2OFyCXng+Ir
         xDpSgQXLahWDee/a9tX2W5mxLnzm/lo2akmFfuEWFLXsV1y+9KeY8UDOYAA/qmVaA4A1
         SitsS6/BWXgoz8vMxJ8IN9+ME8P825I2s3nhhHma4iX4xiCDQDkd4Cu3e0jvU3S3TJBP
         Lu6/LoRf0JonPEr8U69Bs0CelkcPmuFuYXpyHXgI8JLpvbdYj9Bj8OB1ogpi5wTKCZyc
         47hjGduSTriTPpN87Gn8lZrJJmkujtRUlZtpbh4OMkTfkoO/yag1LCxFIZHZFNn8JVj/
         X8Ww==
X-Gm-Message-State: AO0yUKU/bfx3ibNOyu7sQiigaM1stWqC2MnsJW5R/QTJr2fXzUlpYXUZ
	scwuJr7WsaO0vIKFc6RlFrfP6WsNKTM=
X-Google-Smtp-Source: AK7set8a3PWBhIc5zm/CUxhEKhwCeRaCRdLgGxbN5mVerbAaMjvsX9D3w4ynxaSeR3PUom7RVZvwlA==
X-Received: by 2002:a05:6a20:c1a2:b0:be:9e43:82be with SMTP id bg34-20020a056a20c1a200b000be9e4382bemr12513058pzb.16.1675446684609;
        Fri, 03 Feb 2023 09:51:24 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.51.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:51:24 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/14] python3-sphinx: upgrade 6.0.0 -> 6.1.3
Date: Fri,  3 Feb 2023 09:50:35 -0800
Message-Id: <8a230841f0fb99c8a40943862b49dd899bc52b99.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176748

https://www.sphinx-doc.org/en/master/changes.html#release-6-1-3-released-jan-10-2023
https://www.sphinx-doc.org/en/master/changes.html#release-6-1-2-released-jan-07-2023
https://www.sphinx-doc.org/en/master/changes.html#release-6-1-1-released-jan-05-2023
https://www.sphinx-doc.org/en/master/changes.html#release-6-1-0-released-jan-05-2023
https://www.sphinx-doc.org/en/master/changes.html#release-6-0-1-released-jan-05-2023

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...phinx_6.0.0.bb => python3-sphinx_6.1.3.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_6.0.0.bb => python3-sphinx_6.1.3.bb} (49%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_6.0.0.bb b/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
similarity index 49%
rename from meta/recipes-devtools/python/python3-sphinx_6.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
index 5e565e745d6..d77ad0a6fe1 100644
--- a/meta/recipes-devtools/python/python3-sphinx_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
@@ -1,12 +1,34 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -4,7 +4,7 @@
+#  Unless otherwise indicated, all code in the Sphinx project is licenced under the
+#  two clause BSD licence below.
+#  
+# -Copyright (c) 2007-2022 by the Sphinx team (see AUTHORS file).
+# +Copyright (c) 2007-2023 by the Sphinx team (see AUTHORS file).
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 DESCRIPTION = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2214a89317448c7f792f5b75dd6726e4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=066da51ab732319a06beae4f10788577"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "58c140ecd9aa0abbc8ff6da48a266648eac9e5bfc8e49576efd2979bf46f5961"
+SRC_URI[sha256sum] = "0dac3b698538ffef41716cf97ba26c1c7788dba73ce6f150c1ff5b4720786dd2"
 
 inherit python_flit_core pypi
 
-- 
2.30.2


