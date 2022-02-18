Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC52C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 21:27:34 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.3130.1645219653635098914
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 13:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pZrJEKbp;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d187so3317525pfa.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 13:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1J0OxR5byuyb62uwpjLGncxDbvWI+0mzFLCm2dHnwO4=;
        b=pZrJEKbpNbBFd4zNMhpMQsbhficlBE98ThHi2nWN4fVKih53tAT7CuLZ/Qc1zRhGjQ
         wGooZ6Worax8zp5WBIcmnX0VGgKYqiEu+/EknmYiLP5uPxpIjb12xVkuNL8A3x0wjbEV
         Lh+LnfIJXkeHwtwNju0vUkNGCNb3MGFGPOkW1R8xBc63e4DPQKKPfKOALzENAyg9Fu7n
         99JviDW+6EDGaZBw3M6y7XR6qi+Uu+d6UvZwkMLXpAwdSsCXoJhnMTHjzK8iRlj6hMi/
         pOCD8zt7pg/V2rLZeU9Lf+VMa01XkvlJkXw6RomzFZSQnJKNNlKK+2U13P1C1jRQJ9p0
         dnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1J0OxR5byuyb62uwpjLGncxDbvWI+0mzFLCm2dHnwO4=;
        b=oE7eBMAX3ta1iL2M6xEM2RjcTyk60HtS84q2qg7ji1gsl+rUtZN0zTjeSVVKAGm1Vh
         brfPr1i6zwZuaAyzfyi34RU1wRRJV45k4iowkTx9M9GsA4MSB3I20NwmnI8hxg3UNpmh
         Y7izxFEkm6aJo+boi+XcHiFXyrM9u+NDWu0CVnT+eHgvBP3E9X5NRrYCuoIBNnht/4Jw
         zJ6+Yx+85oHg/JByBu8Gmr0kbCTdsAeIFcLDIA8Pl7zzjmCSpe2f+d16ae8npNWbZISo
         Kj327yT2yCls2p5uSNjSjy0HJcjyAqyCsb+ozhkrXvI5Row52v55+XF5er6zTFkooe/P
         2Vcw==
X-Gm-Message-State: AOAM531+CP9RIM0mPpIYb5BcdgXLCMpg9tmGhIfleUYPplH7W/dc/CaR
	vA0WR4UQgws+45czusdQRxZ9udhUI5nckQ==
X-Google-Smtp-Source: 
 ABdhPJzBWFo9Ngef81x2D7rih4zYeBizdDqDjVUBbpQPsfO5K+RTpdAIPDrhKNWtXtqQfucram6fzg==
X-Received: by 2002:a63:f357:0:b0:373:9242:6b95 with SMTP id
 t23-20020a63f357000000b0037392426b95mr7756418pgj.536.1645219652955;
        Fri, 18 Feb 2022 13:27:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 y8sm3760213pfi.194.2022.02.18.13.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 13:27:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libgit2: Upgrade to 1.4.1
Date: Fri, 18 Feb 2022 13:24:24 -0800
Message-Id: <20220218212424.1629228-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 21:27:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161952

this is bugfix release
https://github.com/libgit2/libgit2/releases/tag/v1.4.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgit2/{libgit2_1.4.0.bb => libgit2_1.4.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.4.0.bb => libgit2_1.4.1.bb} (78%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.4.0.bb b/meta/recipes-support/libgit2/libgit2_1.4.1.bb
similarity index 78%
rename from meta/recipes-support/libgit2/libgit2_1.4.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.4.1.bb
index 23a195b43b3..da33893b97d 100644
--- a/meta/recipes-support/libgit2/libgit2_1.4.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.4.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e5a9227de4cb6afb5d35ed7b0fdf480d"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https"
-SRCREV = "1d5b9bd86dccc7347aaadf5e3ab122eed9413404"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.4;protocol=https"
+SRCREV = "fdd15bcfca6b2ec4b7ecad1aa11a396cb15bd064"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.1


