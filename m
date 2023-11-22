Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB39DC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 16:38:20 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.24248.1700671099975205310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 08:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZGiIoYrC;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cf7a1546c0so6413095ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700671099; x=1701275899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXtOzTTvI+Gk2JK2lioC6zop1m/GlcRcGimaRBhfjdA=;
        b=ZGiIoYrC/7v6B+mWs6nlxLAhyyRrfV+U6X3mZE+kyxsWGn+kpnezrwb9MAnuxdaW9b
         PB0YYTELfeLeykdwgl8BAOqmUBJixvy6wK0QzWURco8DpmIEHPqlKYDBfK0uq7bY/WIX
         tcFhTzfyfO6tutOOx9XnDQulm2UG3RaOL8Q6J4HdkYYu7GqV+jTNZbMeNnRcBxM8a5nG
         Ah/apXiT4qF7dxXLYcNxRi4vg5TgGz72wEcjLZZPYrPjNILyixYSbyfoqSvMZ2ySDcEB
         vXxYxWHNRTVP9EjJwYu6XCFEtMr/+qog5xV33X1HcJj7Y0ISQr50FCK3jC2jp18NuNiC
         1tZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700671099; x=1701275899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXtOzTTvI+Gk2JK2lioC6zop1m/GlcRcGimaRBhfjdA=;
        b=A7XEkKkfcDb0ZuFH9Hoqy11eHNessSb5wiHBVHiXv0A3joRYts714tqmlaY94tyZ4h
         CT7K9ZRCPGRYGDwvLKFMUPlvpBs0jZMan3xuBbHtTEQ1Gy1PxUZGLG+6EAQ2d7vDO2Vn
         RCCffRwD+i03SuqbYZFrB0uw3R9Y2q0ZMaskQmk4IzCg8QD9FtG7rgKu9LGdAOR+nBx/
         ypBjXTYVSkp5FUIvZqc98HAU/FfYnZLS55rw4eBmh8uWSSnhplY6q0Su3/hFMauLoyPt
         wM16rosWjCLxJdYSJmVer7mIAIJoyBssmo5vsWzXgrHhVtRP6aMjto18hYhmrP4M61kT
         Y+9A==
X-Gm-Message-State: AOJu0YzYEeBIcxIhw+LI7loFIK7c/kavr8hlwu88NqT7KoiBTuKxNwl6
	U0T8xW1XlEukPqtQ7NML5U/qhACUYGbKbg==
X-Google-Smtp-Source: AGHT+IHL42bmhDLSonVSLu/dtpNC250EjDWrHABx6oUT1s2B7VmFV86sqUW3QXypP7sOx8oE9otzgQ==
X-Received: by 2002:a17:903:187:b0:1cf:68a3:d901 with SMTP id z7-20020a170903018700b001cf68a3d901mr2987246plg.19.1700671099079;
        Wed, 22 Nov 2023 08:38:19 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0::b328])
        by smtp.gmail.com with ESMTPSA id i1-20020a17090332c100b001cf5d1c85cdsm6154138plr.218.2023.11.22.08.38.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 08:38:18 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] python3-sphinxcontrib-htmlhelp: 2.0.1 -> 2.0.4
Date: Wed, 22 Nov 2023 08:37:52 -0800
Message-Id: <7d622de573af3410da8a935242376f3d021a44d3.1700670471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700670471.git.tim.orling@konsulko.com>
References: <cover.1700670471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 16:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191120

* Upstream download filename changed from sphinxcontrib-htmlhelp*
  to sphinxcontrib_htmlhelp*
* build-backend is now flit (inherit python_flit_core)

Release 2.0.4 (2023-08-14)
==========================

* Use ``os.PathLike`` over ``pathlib.Path``

Release 2.0.3 (2023-08-09)
==========================

* Fix tests for Sphinx 7.1 and below

Release 2.0.2 (2023-08-07)
==========================

* Drop support for Python 3.8
* Raise minimum required Sphinx version to 5.0

https://github.com/sphinx-doc/sphinxcontrib-htmlhelp/compare/2.0.1...2.0.4

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...lp_2.0.1.bb => python3-sphinxcontrib-htmlhelp_2.0.4.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-htmlhelp_2.0.1.bb => python3-sphinxcontrib-htmlhelp_2.0.4.bb} (56%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.4.bb
similarity index 56%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.4.bb
index bf034fb6849..a0a4b4496f2 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.4.bb
@@ -3,10 +3,13 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24dce5ef6a13563241c24bc366f48886"
 
-SRC_URI[sha256sum] = "0cbdd302815330058422b98a113195c9249825d681e18f11e8b1f78a2f11efff"
+SRC_URI[sha256sum] = "6c26a118a05b76000738429b724a0568dbde5b72391a688577da08f11891092a"
 
 PYPI_PACKAGE = "sphinxcontrib-htmlhelp"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
+
+PYPI_ARCHIVE_NAME = "sphinxcontrib_htmlhelp-${PV}.${PYPI_PACKAGE_EXT}"
+S = "${WORKDIR}/sphinxcontrib_htmlhelp-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


