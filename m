Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC025C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 00:27:55 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.4586.1647476875251132914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 17:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L39h0oms;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id bc27so1401083pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 17:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iMPLLouy6WfHWbbQsAucPThxjBBJUzXHGg6cQAbanF8=;
        b=L39h0oms5wdqQnLgv7mkVniBkWmCCuVyvPVlnqK7VbN07OpzPSW7zIL9+zXcKNxYvu
         /FqxqqHPfqIsw0CxgaoKTyjaj2YeGygM9KnFbEfQuGWwXuRRvvQFMte+FlAuGs4/CZ1p
         Qt4vd/t8FMwMFuRYpzhBjmuR9iIZFo2s0g1p5r7/vM2Gp4RC8A58lp6GHqsZ8RV9rgk+
         NRhj7ZWau4bkDC1nNwBVbwAQ/Wf1ao6mOkYxIE7KdvqzGRwQeznic4NbQTtuBS0GO0pF
         fmjluIQk5A1y11oXAqHbSYwi/H9a26AetzJsRNl9w1YcvJjaEczQr0sjY5P1En6ws/gg
         q2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iMPLLouy6WfHWbbQsAucPThxjBBJUzXHGg6cQAbanF8=;
        b=TdnG4e7n0pkkfvy7YwnoQFiP6rz8zCjBJX8JJ0QPOca8f3ktSpr2SZzyMaFy6kt28D
         qJmLEEbdLrPI/F7xemhUM3pNUP+G/4Djrl/Fa1E0wvth3KCE6FWq0wkpFqerjIXqVqBi
         MQQvfe7HY44wHYdj4J/h5I/gLPnMNsN7rA70dmkH//GFoqrNnCJfD8rUEWWE86E0WUBP
         LNBfkCzUX6IpNr1hJ9CuxWZgAKfO6dHuFZqLkf5RhlfmyfYOxgE0orcSk8QCDC7aln+F
         F91IGpaDfGSP735dhbwXFe0opr7UWDdeL63BhoXpbL5NCGDYieBafepSq2gxPSIOIBRZ
         vKXA==
X-Gm-Message-State: AOAM533v2/7dYugvQM8nOQXpn9IqZaUnzvTbar7gOxHdey4hSEFakd/x
	S0kslPDkYw7JyJ9EaAZL/xehgxVHy4E=
X-Google-Smtp-Source: 
 ABdhPJzaYOrMK3BjWOt9fX52heZrAx/qZe3/tWNhWZUF1XLhLnoPo9wzSNG3bfVJdjlhQQLnm+Rkkg==
X-Received: by 2002:a65:4b85:0:b0:380:db02:2fb5 with SMTP id
 t5-20020a654b85000000b00380db022fb5mr1538448pgq.377.1647476874261;
        Wed, 16 Mar 2022 17:27:54 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1b20:96ed:2179:adc5:9d0f])
        by smtp.gmail.com with ESMTPSA id
 e4-20020a17090ab38400b001bf9519fe8bsm7808542pjr.38.2022.03.16.17.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 17:27:53 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-sphinxcontrib-applehelp: LIC_FILES_CHKSUM
Date: Wed, 16 Mar 2022 17:27:46 -0700
Message-Id: <20220317002746.669941-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 00:27:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163364

Fix the LIC_FILES_CHKSUM

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-sphinxcontrib-applehelp_1.0.2.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb
index c63d093a9f5..04b2ca97e5c 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "sphinxcontrib-applehelp is a sphinx extension which outputs Apple help books"
 HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=942469df9305abb1c59e95f778310384"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7715857042d4c8c0105999ca0c072c5"
 
 SRC_URI[sha256sum] = "a072735ec80e7675e3f432fcae8610ecf509c5f1869d17e2eecff44389cdbc58"
 
-- 
2.30.2


