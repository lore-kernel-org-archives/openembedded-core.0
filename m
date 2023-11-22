Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B84C61D99
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 16:38:30 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.24392.1700671108166203051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 08:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dEJEeRUA;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cf74ad87e0so12962895ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700671107; x=1701275907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYLK9H8jShj0d5Bnwa/XVojcdWad+QiVazbz984Y96c=;
        b=dEJEeRUAKPHLhU+jyjtuih26nxcv7cyG+prkD1w4lu8uNjNF6wCYqIMSn5Tk7Trm7F
         fKjy/1s9buf5ga0lF60laTyJmwrandPkO+CPCPGnH8pcg0zPDC4eZxvCxgvG9HQ2+USW
         C644EInP22TeyV3TAFU4PESkE+/ZJEhe+Nu7VWojuF5MLZ1U3quvt1SS+A8nl0zjsiu0
         8mNzBUORNpYxkPjBGRVdf69hcIsqv/IgMNdrtwWeuhe4fjjBuxTaDhjnWxY+pfjNClXQ
         TFiqZwMXwHEYw+1q80deKL/Bvxz2VMch2Ph4lr3S4tC+OX8IBdbZsiqQUH9vA+eQNP0B
         efGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700671107; x=1701275907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYLK9H8jShj0d5Bnwa/XVojcdWad+QiVazbz984Y96c=;
        b=iWiegDLyVS7vGmb9FGON0WSLNtKZhM8EcKcz3+OYchpzTsaagDW+2/THRGIBYx4ivJ
         6iUAHlB9ZIAU4V3oBE7NDtacj7cRTfz6EowdaiAUqMJBivZszVUj489lNSQSONFCisSq
         51a0w8ogxPYO2+cPDC6Vv98d/BY+0D9v21szAVhUiisVXRo/L3u5QkJJpTaTYvZ5uEmh
         1IGdGSrXxGOWw6Pqv1GDz3MaRcq7jbROF1108515lrE0ejj3JMnk1mmcUuEcM3pKhkUL
         2ZNhp/wTyvaBc5h1xTS2bxZn+nbsuyxIZfDNQvINSdzR+zM3iB2YhiQQ8jTcIWpWjHr3
         6B4Q==
X-Gm-Message-State: AOJu0YyXb/o+ToCYowAVD05CpcdzNDrMSsndeVIi0qpPA3AHmhULncC6
	eSmVRnmT1OmlqzzeqJxxHjGpBfMBpSdhfQ==
X-Google-Smtp-Source: AGHT+IF3TGQ1t/5zq3+ZrEEkM9tVFQ0cPKXb0+0rdSC5B69wCBaIM/JxIi/80UyihMcJ6fI/r3uYKw==
X-Received: by 2002:a17:902:fe01:b0:1cf:73ff:b1a6 with SMTP id g1-20020a170902fe0100b001cf73ffb1a6mr3351883plj.10.1700671107236;
        Wed, 22 Nov 2023 08:38:27 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0::b328])
        by smtp.gmail.com with ESMTPSA id i1-20020a17090332c100b001cf5d1c85cdsm6154138plr.218.2023.11.22.08.38.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 08:38:26 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] python3-sphinxcontrib-serializinghtml: 1.1.5 -> 1.1.9
Date: Wed, 22 Nov 2023 08:37:54 -0800
Message-Id: <d7cde0f2fe2b261016393b111d11219c6c5099fe.1700670471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700670471.git.tim.orling@konsulko.com>
References: <cover.1700670471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 16:38:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191121

* Upstream download filename changed from sphinxcontrib-serializinghtml*
  to sphinxcontrib_serializinghtml*
* build-backend is now flit (inherit python_flit_core)

Release 1.1.9 (2023-08-20)
==========================

* Serialise context["script_files"] and context["css_files"] as their filenames
  on Sphinx 7.2.0.

  Release 1.1.8 (2023-08-14)
  ==========================

  * Use ``os.PathLike`` over ``pathlib.Path``

  Release 1.1.7 (2023-08-09)
  ==========================

  * Fix tests for Sphinx 7.1 and below

  Release 1.1.6 (2023-08-07)
  ==========================

  * Drop support for Python 3.5, 3.6, 3.7, and 3.8
  * Raise minimum required Sphinx version to 5.0

https://github.com/sphinx-doc/sphinxcontrib-serializinghtml/compare/1.1.5...1.1.9

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...5.bb => python3-sphinxcontrib-serializinghtml_1.1.9.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-serializinghtml_1.1.5.bb => python3-sphinxcontrib-serializinghtml_1.1.9.bb} (57%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.9.bb
similarity index 57%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.9.bb
index 7fa6d8aeb7a..fbf0c3c9b28 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.9.bb
@@ -3,10 +3,13 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=32a84ac5cd3bbd10c4d479233ad588b6"
 
-SRC_URI[sha256sum] = "aa5f6de5dfdf809ef505c4895e51ef5c9eac17d0f287933eb49ec495280b6952"
+SRC_URI[sha256sum] = "0c64ff898339e1fac29abd2bf5f11078f3ec413cfe9c046d3120d7ca65530b54"
 
 PYPI_PACKAGE = "sphinxcontrib-serializinghtml"
 
-inherit pypi setuptools3
+inherit pypi python_flit_core
+
+PYPI_ARCHIVE_NAME = "sphinxcontrib_serializinghtml-${PV}.${PYPI_PACKAGE_EXT}"
+S = "${WORKDIR}/sphinxcontrib_serializinghtml-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


