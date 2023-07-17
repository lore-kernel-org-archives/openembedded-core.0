Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD24EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 08:18:25 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.3646.1689581895955097361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 01:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XuILAdr5;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b9c368f4b5so33640425ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 01:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689581895; x=1692173895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lshiUnV8oIyn6duNkHgLj4vzX6MkOXI6Xk0xnPhXB0I=;
        b=XuILAdr5SXQuwrjT31Ij2++BZZn0L6SshZIYpgkmGuaCONIKwbWOf52CchQ/7eFISI
         3Bx25xQJGYt/Q7IUcJgrVuXR481roV6EQvDTn6MtGJGmYaybrL7rgxci/0aSwqSbPuYy
         hFviCS2+ojX6GpjNdWxOKgkYb+VjgLDJZ+/uK6JgxnWlfMG4UMl8+Z7lWjk7JL6jqzD7
         wFDCXCLBZCXKASxr/fnvdUsnEkXpybWaF/3RXIhi5SdcqDNXyC7nQYXEZSA9G99aeYsT
         1ri5MT0vKmEaUU003WfQBHObYSa0yq+zkK7oKe9iZhu3uHlCHrsV7rzF1ENb+s00HFXO
         w09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689581895; x=1692173895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lshiUnV8oIyn6duNkHgLj4vzX6MkOXI6Xk0xnPhXB0I=;
        b=V+bOXZBCbCOU1xjakH+/NyoHPkmIb0H8D1SUnl7dk4YRGCwyjGKt0g1UErLUGGSZ4H
         paaKdQYzahTcJBvw2t+tIdcTPwTDxH3aOwyElLCydH+oOgxADp6asgYfGDJ2AOvAOyNk
         TwZyUJI5EBEAKmSCgbeV1mvImlc8UEKhszQz+Ghg9uskFCKo8GtHptDFovdpIpXdHuTF
         x9LvDpPyiH/EMGoGTCGsS5cQF9nT4MTx4KBPK9rRtG8BLptr9stQtx01i2LmGf/wCiNU
         uOhZWg+5LVaP0UnR+1rAsaGTmXL6Q/uFKOpZTOXiPS/YIBOrYhn6ddqUOXYLhyAKhsXL
         9vpw==
X-Gm-Message-State: ABy/qLZ63AV5SROgB55CrioCb33STVwV6TMiv9ggDLKF4e2q7adssTCD
	p36UqXS93cd0laUcXw0QdoJxQy1V6sFpqA==
X-Google-Smtp-Source: APBJJlG0qiQ7PRI0ECq63OF7CH0WwCIe3CHFpn3HySizHimipGkDlcy5ZkJDhVJrwxzrdD546YDeVQ==
X-Received: by 2002:a17:902:b211:b0:1b0:3ab6:5140 with SMTP id t17-20020a170902b21100b001b03ab65140mr9453836plr.4.1689581894646;
        Mon, 17 Jul 2023 01:18:14 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:148a:d9eb:c4a2:7201])
        by smtp.gmail.com with ESMTPSA id x21-20020a170902b41500b001b3bf8001a9sm12160996plr.48.2023.07.17.01.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 01:18:14 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-zipp: upgrade 3.15.0 -> 3.16.2
Date: Mon, 17 Jul 2023 01:18:11 -0700
Message-Id: <20230717081811.1026060-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 08:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184434

https://github.com/jaraco/zipp/blob/v3.16.2/NEWS.rst

v3.16.2
* Bugfixes:
  - In Path.match, Windows path separators are no longer honored. The fact
    that they were was incidental and never supported. (#92)
  - Fixed name/suffix/suffixes/stem operations when no filename is present
    and the Path is not at the root of the zipfile. (#96)
  - Reworked glob utilizing the namelist directly. (#101)
v3.16.1
* Bugfixes:
  - Replaced the fnmatch.translate with a fresh glob-to-regex translator
    for more correct matching behavior. (#98)
v3.16.0
* Features:
  - Require Python 3.8 or later.

License-Update: removed Copyright (see https://github.com/jaraco/skeleton/issues/78)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-zipp_3.15.0.bb => python3-zipp_3.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.15.0.bb => python3-zipp_3.16.2.bb} (72%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.15.0.bb b/meta/recipes-devtools/python/python3-zipp_3.16.2.bb
similarity index 72%
rename from meta/recipes-devtools/python/python3-zipp_3.15.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.16.2.bb
index 45654ff6f1..9dff59ffaf 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.15.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.16.2.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Backport of pathlib-compatible object wrapper for zip files"
 HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "112929ad649da941c23de50f356a2b5570c954b65150642bccdd66bf194d224b"
+SRC_URI[sha256sum] = "ebc15946aa78bd63458992fc81ec3b6f7b1e92d51c35e6de1c3804e73b799147"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.34.1


