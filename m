Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870C7C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:30 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.9216.1647518249263441147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=geheUy7r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id t11so7037184wrm.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/YONmwMsPVtS3wa5LfwxmmIYrOK48NTfJ0hq2+Dx0iI=;
        b=geheUy7rXaNok1j78xg1GUvACJKG00tGCzgTkneaNXkQZBpzV5ElRGxRMFxdCrs9Jv
         8N80oErkT3dH7nasRUEWkbOdrndwl7ZAZpvlG75lX2eA8cz1fAKfQNCNAzddPsQcg2aR
         BYDCWqjnmf2XY5kLfabJD7vOlh+mkNMRLPR+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/YONmwMsPVtS3wa5LfwxmmIYrOK48NTfJ0hq2+Dx0iI=;
        b=j95zMloSM0YwutBOMThMmjFnaZcPVoRYutGP42Z7fuYtaxr47VKU7VMTBv9VGeGnSE
         SVT9rbl6HBk3fBuYWZXkgNgowMzas9pAMtA/2YCTyEpSee5mAxA+NCO8Zut9RhC9NTr8
         41JkFHEYLNCfPX5N75+jJWZAu4VvQZwjQBRN7C8NZS71Clbz/HIVeGlMt1CYLp8yuodJ
         J9idXiumyKaSaQJAff6EBHlM7QIH2k4vLI+7+GkIqaCJgnKiqVzXKlqNAE0NcoKQAnbS
         X46UbGLHYNzRgWQtOx4l/lS5CUwcFnTtPvuv1P2dBEIbnvdeO/+wkXsGy6bu97KzC3J6
         cgnA==
X-Gm-Message-State: AOAM530gJVaXuUDGhbaoF9Yyt4W5heizYo/CFXkXFoJRUYdFtLEG1DkV
	jjc336Vz/TOnulGdh/BGKYp7yvug6uacYok3
X-Google-Smtp-Source: 
 ABdhPJwViql2K8YeAkWrHrNQkJiNms1FEWF/ExKwoGUPveWblxhrEzEr6qAqOMXO1KL5mW2UbfqM2w==
X-Received: by 2002:adf:e387:0:b0:203:e33d:52f8 with SMTP id
 e7-20020adfe387000000b00203e33d52f8mr3654144wrm.304.1647518247399;
        Thu, 17 Mar 2022 04:57:27 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/26] python3-sphinx-rtd-theme: Add new recipe
Date: Thu, 17 Mar 2022 11:56:55 +0000
Message-Id: <20220317115700.993924-22-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163407

Needed for building sphinx docs

Based on a patch from Armin Kuster <akuster808@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-sphinx-rtd-theme_0.5.0.bb  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb
new file mode 100644
index 00000000000..4a43b595aa5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Sphinx Theme reader"
+HOMEPAGE = "https://github.com/readthedocs/sphinx_rtd_theme"
+SECTION = "devel/python"
+LICENSE = "MIT & OFL-1.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a1db7d4ef426c2935227264e1d4ae8f9 \
+                    file://OFL-License.txt;md5=4534c22e0147eadb6828bd9fe86d4868 \
+                    file://Apache-License-2.0.txt;md5=8a75796f0ef19c3f601d69857f5a9a5b"
+
+DEPENDS = "python3-sphinx"
+
+PYPI_PACKAGE = "sphinx_rtd_theme"
+
+SRC_URI[sha256sum] = "22c795ba2832a169ca301cd0a083f7a434e09c538c70beb42782c073651b707d"
+
+inherit setuptools3 pypi
+
+#Fake out the setup scipt
+export CI = "True"
+export TOX_ENV_NAME = "True"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


