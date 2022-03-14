Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42466C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:07 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.3256.1647298146298376714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JhpKT0+8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso413511wmz.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=N87j8zTwbm3wVjvnL6EXGeeApPR2kcKGofzdWMriHzw=;
        b=JhpKT0+8xGZ9U1HjL8BqIrqwYKf9RzOienD0EHazJsdKkW0couCnXYnjhNyTgHskax
         4KPPq0nA58HIVr4H2ZVKrVWNrHKbB8ejzdrxe7vL84s/g7mNnSUMvYFANEDZsISXlJX4
         T74VHePOMlV6inulqBuNm/r34JNIgklgxTQ8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N87j8zTwbm3wVjvnL6EXGeeApPR2kcKGofzdWMriHzw=;
        b=A0918U6tJwAa1CXrBaDZ+LVSpFISS2MOQXpEZu3r6yo2U74u+rxCgHge9O/Gw4QizP
         ZsDfKZri5OvQUPdMsxgwwzvahTTpwVZAL1FOkzMySw6ILRBOw4N19NLgB3PQ0fGiIcpd
         AI06qAOHs+VNLQmOBtWKnyv5g+o3aEFmLYrR3n1/OMV9tZRek/7jg65C4EDNckX4P6Qm
         Rc40XIEZ4mzVJrFOBwTu02H28PUiiuI/qSTI5s8Y54EUadWYAKqGx6BZftUc7uknTOFt
         7ramp6Ik8xVKppOn+M3ZC5zneGmHEqid4a93FdrLh+n/2vW2fiABrT8DS6S3uAkvMakT
         Vx5Q==
X-Gm-Message-State: AOAM531krV4gNBnVQQklCosV4Gu5gxlKkzlMgethtXYT4E0JBIJW9+sl
	Q/Jeiy6sosRjjKRaPidH/FsnJPSifHUaZiHq
X-Google-Smtp-Source: 
 ABdhPJw/Sry8x+BV4xEMG69sOrEsb0/mr7geexU3VnxglmOt8MYHBYsXeViIZR+qmf6LhfhFRboDuQ==
X-Received: by 2002:a05:600c:1d1b:b0:389:d0a5:c7c4 with SMTP id
 l27-20020a05600c1d1b00b00389d0a5c7c4mr1027709wms.88.1647298144593;
        Mon, 14 Mar 2022 15:49:04 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.49.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:49:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/33] poetry_core: Rename to python_poetry_core
Date: Mon, 14 Mar 2022 22:48:29 +0000
Message-Id: <20220314224837.834776-25-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163191

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{poetry_core.bbclass => python_poetry_core.bbclass}       | 4 ++--
 meta/recipes-devtools/python/python3-iso8601_1.0.2.bb         | 2 +-
 meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/classes/{poetry_core.bbclass => python_poetry_core.bbclass} (82%)

diff --git a/meta/classes/poetry_core.bbclass b/meta/classes/python_poetry_core.bbclass
similarity index 82%
rename from meta/classes/poetry_core.bbclass
rename to meta/classes/python_poetry_core.bbclass
index fb37c78c782..a2086b11b6c 100644
--- a/meta/classes/poetry_core.bbclass
+++ b/meta/classes/python_poetry_core.bbclass
@@ -2,12 +2,12 @@ inherit pip_install_wheel python3native setuptools3-base
 
 DEPENDS += "python3-poetry-core-native"
 
-poetry_core_do_configure () {
+python_poetry_core_do_configure () {
     :
 }
 
 # TODO: ideally this uses pypa/build
-poetry_core_do_compile () {
+python_poetry_core_do_compile () {
     nativepython3 -c "from poetry.core.masonry import api; api.build_wheel('${PIP_INSTALL_DIST_PATH}')"
 }
 do_compile[cleandirs] += "${PIP_INSTALL_DIST_PATH}"
diff --git a/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb b/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb
index aabc47d69b9..93af233d296 100644
--- a/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb
+++ b/meta/recipes-devtools/python/python3-iso8601_1.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
 
 SRC_URI[sha256sum] = "27f503220e6845d9db954fb212b95b0362d8b7e6c1b2326a87061c3de93594b1"
 
-inherit pypi poetry_core
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb b/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb
index 22d7076d01b..f3e9b055218 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=104d5c3c653aeededf4076773aa4c236 \
 
 SRC_URI[sha256sum] = "951fc7c1f8d710a94cb49019ee3742125039fc659675912ea614ac2aa405b118"
 
-inherit poetry_core pypi
+inherit python_poetry_core pypi
 
 RDEPENDS:${PN}:append:class-target = "\
     python3-compression \
-- 
2.32.0


