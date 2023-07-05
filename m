Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B389EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 08:53:15 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.12517.1688547186871398787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 01:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=l6MioDe2;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-262ff3a4659so4837480a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 01:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688547186; x=1691139186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXayYcCWYH8BnmDgs1n162HIMvXsfYXVP3xtPu+cxHY=;
        b=l6MioDe2aBrgy+S+xf3J87xOLOjpoD6RMOmnO26ql1JyDZ7mkUwVUuQyhG58XYYS48
         JOV0kZ3pYt8bbbUssSSpG2e1HS/T6AtMtUzzhHewK9zsgUUnrDTz/XMf/eH3dDvm7w3G
         b8qOZLZaiYi+kh7k69fUXcMxBvpH/vTd7cyabGfbfa5OabVtGV44n6/ATK2nDmA1r2bA
         iBLYwHvCmuBZFj/lvDUPxq7uFdu6MY8Y10HQBIRsEKZAem1dBKS/4G3nedvRMmbXC1qU
         1RaKnJDfN28uGnRL/+Xep+q+dAohJJcvag5ZDmraONm6uKm5xfeFousu54YJDL3PHdSt
         kQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688547186; x=1691139186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXayYcCWYH8BnmDgs1n162HIMvXsfYXVP3xtPu+cxHY=;
        b=LYW+ZnWYucYTc5ykGtbV3IKXoIqlBfg6Ocf3wgHJCe1yV0wWP1aLu+DhxpshDgfbp2
         e8o7IyYGSZxiMlYh1xqFWTRXe6hUeXfHrPHGbUJFBZdG9aTVqKRFzvdSwfZgczCVzpFB
         vz9s5eZCcTm9rnpbhNcJpTgOHQ4TCeHhraaPzKG0Vrudy5q3/IUkysxo2EQEhtP+t3S5
         1SzFnqItJrqUy7aq7esTsgldXDM0xP1vdY6YDaj832H76o2nnvE+S1pww/tSdMfcX86N
         yqCVXl+KYqYn0Uo5RUzUJy0TG4vGO9xeC3kinu99DZQBy8gY309VNbiNcZhw9yP/09j4
         6opA==
X-Gm-Message-State: ABy/qLZVZsjjetRFrxlhdLz/IM7aJGHPOsYpaTx7gKl13mSRLm1OdXnN
	AgU9AdnU4AAwDc3I47K5fBKXoZwUqFdrog==
X-Google-Smtp-Source: APBJJlHwnSP7u8uDutelG1ZamqmWI4XQaMu+0gOXx+1Z8mIrk3IuEKhfJQd8xJXiMSlHvAbO5bGoRg==
X-Received: by 2002:a17:90a:d085:b0:259:b065:da4f with SMTP id k5-20020a17090ad08500b00259b065da4fmr16207497pju.36.1688547185767;
        Wed, 05 Jul 2023 01:53:05 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:322:a6e2:db10:abb4])
        by smtp.gmail.com with ESMTPSA id mg20-20020a17090b371400b00262d9b4b527sm917400pjb.52.2023.07.05.01.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 01:53:05 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-pygments: upgrade 2.14.0 -> 2.15.1
Date: Wed,  5 Jul 2023 01:53:01 -0700
Message-Id: <20230705085301.3458999-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 08:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183877

* Upstream has dropped setup.py
* Inherit python_setuptools_build_meta instead of setuptools3
* Add self as maintainer, as this is a dependency for python3-sphinx

Adds some new lexers, updates a few others. A handful of bug fixes.

https://github.com/pygments/pygments/blob/2.15.1/CHANGES#L6
https://github.com/pygments/pygments/blob/2.15.1/CHANGES#L18

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc                      | 2 +-
 ...{python3-pygments_2.14.0.bb => python3-pygments_2.15.1.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.14.0.bb => python3-pygments_2.15.1.bb} (76%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 232107cd242..fafa8eeb2ca 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -663,7 +663,7 @@ RECIPE_MAINTAINER:pn-python3-pyasn1 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pycairo = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pycparser = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-pygments = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-pygments = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pygments_2.14.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.15.1.bb
index 16769e92635..e0e477100eb 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://pygments.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
-inherit setuptools3
-SRC_URI[sha256sum] = "b3ed06a9e8ac9a9aae5a6f5dbe78a8a58655d17b43b93c078f094ddc476ae297"
+inherit python_setuptools_build_meta
+SRC_URI[sha256sum] = "8ace4d3c1dd481894b2005f560ead0f9f19ee64fe983366be1a21e171d12775c"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.30.2


