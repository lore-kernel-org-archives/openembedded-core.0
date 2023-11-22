Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A88C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 16:38:30 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.24394.1700671108843574214
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 08:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=flcGitRo;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1cf80a7be0aso1723205ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700671103; x=1701275903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXQrKbyQWfDoKPpa0fdhNA/8LF3bPg6p9sF/zY12j64=;
        b=flcGitRoR4LPZNhVWhCpZLEFuu6A1HiLjxT5K8b87qchSnplfwFTuE+SX4SaUeBgf+
         tT7Z4Cy6yKGhOI42SnLzOeEbPQceo9DE3op1hxkhy1MN47TCyaYeYWyIzIaiCrirSeg3
         oYXHHQmBbSzF1t/boOzmgqIP7deAlN1SvC766oH4dP/iB1UoF95DwuTkmenwYEnjRgz9
         Jv8Lzs9+LWOkBqHEY26ClYDLWIri9bVXuYiKo71dM6nAeqflh2Kymn4HUeLYEHspGHxy
         B+gt4Zoi8xrLxXe/vY1n49HCPSOmaKJni7TaM0iFi4Ra+mTSnAgSwbTk/g4YqyekUqBE
         feSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700671103; x=1701275903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXQrKbyQWfDoKPpa0fdhNA/8LF3bPg6p9sF/zY12j64=;
        b=nyOUyDtiX9JIAM1fre1+o/lZ5pCkTZo5cNMm9ExxKv3mV4G6YUPQTX6RuY2G5c4qkI
         gGl2irQLZlX+LKoVJgVsJlgMSkzG8s6397sbt3/iE8yGVMuEgUVDuP9ZOTLn5gMHlZxT
         LYfEJx+cdpaih8v/Fm1tD1KVtEaOTqxCPwJRnbXX9/gFIKQbn+R47GGoZdca8VmmkpiM
         atjLOkuhrvXXrwuLiBZQ+IZEQypF/Pe+H7S1j+kDEc7fkAn2woGOxgXK6FtsE6kNZpsc
         6ZbFIZg0X4DGKBgXvK7dJgjhTp/+++HrcGAajNc4x2kXYk1YAPwMwGJKrNTH9hRJTGfe
         94ag==
X-Gm-Message-State: AOJu0YwLlhtZ3QqrD88KP9w8KefKWHaRAInsBTG65cfw/K8W7d/nuJ9a
	w7SRiqBmqOB8p20y6osBtAy1SFK3rPchBw==
X-Google-Smtp-Source: AGHT+IHa4+DK1xNrBjCVFD4sO1BDweuh05sKJ/HBSmu6XKxyFZ3nsM+X5k9WVYW6OPIsNduqtkTH/A==
X-Received: by 2002:a17:902:ed4c:b0:1c7:5f03:8562 with SMTP id y12-20020a170902ed4c00b001c75f038562mr3044377plb.30.1700671103351;
        Wed, 22 Nov 2023 08:38:23 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0::b328])
        by smtp.gmail.com with ESMTPSA id i1-20020a17090332c100b001cf5d1c85cdsm6154138plr.218.2023.11.22.08.38.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 08:38:23 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] python3-sphinxcontrib-qthelp: 1.0.3 -> 1.0.6
Date: Wed, 22 Nov 2023 08:37:53 -0800
Message-Id: <f5b14940b111674648e451301027f628c5988a17.1700670471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700670471.git.tim.orling@konsulko.com>
References: <cover.1700670471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 16:38:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191122

* Upstream download filename changed from sphinxcontrib-qthelp*
  to sphinxcontrib_qthelp*
* build-backend changed to flit (inherit python_flit_core)

Release 1.0.6 (2023-08-14)
==========================

* Use ``os.PathLike`` over ``pathlib.Path``

Release 1.0.5 (2023-08-09)
==========================

* Fix tests for Sphinx 7.1 and below

Release 1.0.4 (2023-08-07)
==========================

* Drop support for Python 3.5, 3.6, 3.7, and 3.8
* Raise minimum required Sphinx version to 5.0

https://github.com/sphinx-doc/sphinxcontrib-qthelp/compare/1.0.3...1.0.6

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...help_1.0.3.bb => python3-sphinxcontrib-qthelp_1.0.6.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-qthelp_1.0.3.bb => python3-sphinxcontrib-qthelp_1.0.6.bb} (54%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.6.bb
similarity index 54%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.6.bb
index 41d2b6187b7..3538b063d6c 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.6.bb
@@ -3,10 +3,13 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f7a83b72ea86d04827575ec0b63430eb"
 
-SRC_URI[sha256sum] = "4c33767ee058b70dba89a6fc5c1892c0d57a54be67ddd3e7875a18d14cba5a72"
+SRC_URI[sha256sum] = "62b9d1a186ab7f5ee3356d906f648cacb7a6bdb94d201ee7adf26db55092982d"
 
 PYPI_PACKAGE = "sphinxcontrib-qthelp"
 
-inherit pypi setuptools3
+inherit pypi python_flit_core
+
+PYPI_ARCHIVE_NAME = "sphinxcontrib_qthelp-${PV}.${PYPI_PACKAGE_EXT}"
+S = "${WORKDIR}/sphinxcontrib_qthelp-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


