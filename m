Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99642C7EE36
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 18:11:10 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.30520.1677694264073653987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 10:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LcoC0h4+;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id y11so10768790plg.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 10:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxJCVjeF/SlAxBuk4B3UzXhN1/7ARptyeaubRhicUaI=;
        b=LcoC0h4+gtE+dijLl4EShY/nYKi+6Of+aA7EFHZWxfFcH78vgjVSbjD9Q4crxZXeEA
         zv13kvlQ3eQsIJayqB+80xK7cV+eQKq1ZPlhogisk5on6oWyD/Rn5K8EdItqDL8iq5P4
         +0G7QRzZk9APJorgxyWA+I/WYYuKmjlh3xeMGbH4FnirR/x3inRbj++FA5Tr0h4j/bBS
         XogI5B1nVROAzt9GoSG/1Pf5r+x4vnx8dJC0ewKvm4ruLNfJaZYut8+WDr2SE7jLBv7Y
         BW8eJvJY36kKcqzu+9taRLwtsakHucjCcl11EN7BVhgdedHQiQkgQJEMlpM99onoGR7l
         Q11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxJCVjeF/SlAxBuk4B3UzXhN1/7ARptyeaubRhicUaI=;
        b=Zz3SVHYqsx3TMyTxOCbVGvzMREwuirX5z3PsJ2gQvtInZkYGTDklqoyQCGAwDwPV5p
         iTbH1ZtToVHD56jwsf358dPvNA1GtwiDKVT8S1eeJSDWay7t9dj7Jp39a5xPJNYX0iop
         2g/JtNuchVeWKsYgS8tjYaPiUacXOUQBFCrM5jxTqJG1AfIFjdVpbIww2vQWZIJE/yRA
         A1A6fNvbFoLHC34P0/dWXsPZ07HR1hqjMDOVGvk2aGpuS3PTydaQ0ubVfR1rv/tEUdpS
         KV3Sid2Vu1eRVFG2rSqLahgyX9lBaEBD6+abYe/Fb9rk2MfJ2UJTDIQ+u9c0kKc4kZld
         JPeg==
X-Gm-Message-State: AO0yUKVmepvFfCRcbFi2hDN9dZr7F8I7Tkk4h8+hEJk50Ewrl66wWRt2
	SNjee+1BJcF6UNeRfiTgsGYyWX3TxH/XIA==
X-Google-Smtp-Source: AK7set/9BPduBx7sUUXIaUWRkShxDxzxbKMRPris7TvJ+/y+6VtYJkqEO5LpETth9GeCBDSZZ/rVfQ==
X-Received: by 2002:a17:902:ec91:b0:19a:a80e:a6d5 with SMTP id x17-20020a170902ec9100b0019aa80ea6d5mr8965650plg.23.1677694263108;
        Wed, 01 Mar 2023 10:11:03 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:8ecb:2eaa:9ab3:bdee])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902780500b0019928ce257dsm8715614pll.99.2023.03.01.10.11.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 10:11:02 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3-babel: upgrade 2.11.0 -> 2.12.1
Date: Wed,  1 Mar 2023 10:10:41 -0800
Message-Id: <10c24dc1245aa19a9de51a2f020952fbbad8f2f0.1677693991.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1677693991.git.tim.orling@konsulko.com>
References: <cover.1677693991.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 18:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177949

https://babel.pocoo.org/en/latest/changelog.html#version-2-12-1

Version 2.12.1
* Fixes
  - Version 2.12.0 was missing the py.typed marker file. Thanks to Alex
    Waygood for the fix! #975
  - The copyright year in all files was bumped to 2023.

License-Update: copyright years

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-babel_2.11.0.bb => python3-babel_2.12.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-babel_2.11.0.bb => python3-babel_2.12.1.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.11.0.bb b/meta/recipes-devtools/python/python3-babel_2.12.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-babel_2.11.0.bb
rename to meta/recipes-devtools/python/python3-babel_2.12.1.bb
index f6eae88b804..dfa45fbdf6e 100644
--- a/meta/recipes-devtools/python/python3-babel_2.11.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.12.1.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "A collection of tools for internationalizing Python applications"
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fb98e9f202b978d6569807b9525cc691"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0f97d9a63e91407b4c0d01efde91cfc0"
 
-SRC_URI[sha256sum] = "5ef4b3226b0180dedded4229651c8b0e1a3a6a2837d45a073272f313e4cf97f6"
+SRC_URI[sha256sum] = "cc2d99999cd01d44420ae725a21c9e3711b3aadc7976d6147f622d8581963455"
 
 PYPI_PACKAGE = "Babel"
 
-- 
2.30.2


