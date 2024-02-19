Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2F2C48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 23:49:10 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.1520.1708386549531716189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 15:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GS9ZYHbc;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e47c503fb5so2865b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 15:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708386548; x=1708991348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W0RN2HBbtFWR/DjNGEw2qb/XWBLd57yud03bmj1qQD8=;
        b=GS9ZYHbcn/OwAlvkp1m/iDXEd4/wWFtIAlooSQupS87dMtDwC3I9LP5TRb22kReAnr
         ae95Z+vJMEja3SDf6mpza8Wz3XY40Pl1CUJe/cE7RG9dr9hfGuka0qD2yEh2Be/6mQbY
         CixvGQB3PyLYQcq30Uw66+BEdNu9THaAbH8KUy8OnGEXBkbkxYhEuGZCQJT4e2XEPNfs
         szsJrqvQm8ToUjk6TVGHbQDQFOxEW604CgN2HwGikKFDpMcJ6B0p3b95pkZhQ3kKz5/m
         5kwbOkyEKYamoAA57dTxVCgEvNbiBfYmb1AfxYoWrL3hIQ0hOnE8dMtnLAN5FuViNAwl
         iP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708386548; x=1708991348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0RN2HBbtFWR/DjNGEw2qb/XWBLd57yud03bmj1qQD8=;
        b=lonvv8rQSy+BQHs7cWRG/4QT/G0ysWyur9f/eBmHogpW3Uthpg2X9QPC3U2nhss2mX
         drHrRso1+e50MGUXH9qfW64lCY0gzgi5bCNLclnYrqdM6GmZrTzbvCuP40mgQ6sLWxaT
         d6NVSddu2M6TSHggx4e49YE7u94CY++++cQ3er0L7WvfJtugYxwn5MuNKL+NHGneRh17
         0+Zy/nSpIzcRyzolSH8cok92q4mlifcKqERZ9p7Btb9LW/szI+dg5O64t+fUUNlxaL/5
         3wyYifqZWkq9lIfbOSHpN13wdc4qOqkgKnSo0hmDBkTnpv2c6hvRYpfbhOFp3x92K4u/
         73jQ==
X-Gm-Message-State: AOJu0YwvjLGTrly/OjGu7aOyJ5oVuZQZtbinYB13s+y7OuLh9ZucH8D1
	1rmC71hL4E7qvJbgs5qwKXY/l/6WUnlbIzSjem6i+4i2Vkt7E5ob1xiYnibE
X-Google-Smtp-Source: AGHT+IHfw+VhKPQHvh040IhFXx/gyThcr4gn/9vcAuY9hz+to4CEEYc9G5vCW2UXdF8vG7iO2X7T8A==
X-Received: by 2002:a05:6a21:2d8f:b0:19e:b198:8241 with SMTP id ty15-20020a056a212d8f00b0019eb1988241mr12938940pzb.41.1708386548236;
        Mon, 19 Feb 2024 15:49:08 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id d9-20020a17090ad3c900b002998dbcf570sm3527591pjw.8.2024.02.19.15.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 15:49:07 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-pyproject-metadata: HOMEPAGE; DESCRIPTION
Date: Mon, 19 Feb 2024 15:49:03 -0800
Message-Id: <20240219234903.2084691-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 23:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195899

Add HOMEPAGE and DESCRIPTION that were missing in
the original recipe in meta-python

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pyproject-metadata_0.7.1.bb        | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
index e0da1d96907..8b9549f3d07 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
@@ -1,10 +1,21 @@
 SUMMARY = "PEP 621 metadata parsing"
+DESCRIPTION = "Dataclass for PEP 621 metadata with support for core \
+metadata generation \
+\
+This project does not implement the parsing of pyproject.toml containing \
+PEP 621 metadata.\
+\
+Instead, given a Python data structure representing PEP 621 metadata \
+(already parsed), it will validate this input and generate a \
+PEP 643-compliant metadata file (e.g. PKG-INFO)."
+HOMEPAGE = "https://github.com/FFY00/python-pyproject-metadata"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
 PYPI_PACKAGE = "pyproject-metadata"
 
 inherit pypi python_setuptools_build_meta
+
 SRC_URI[sha256sum] = "0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67"
 
 RDEPENDS:${PN} += " \
-- 
2.34.1


