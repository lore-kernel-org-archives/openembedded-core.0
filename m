Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA85C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 15:09:39 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.58282.1722265771558621132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 08:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eHfYongy;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: marc.ferland@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef2ed592f6so40586381fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722265769; x=1722870569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Dp+Sac21wVgKeyQaZgxJHvcbzAiY8v0pzh7luPHt90=;
        b=eHfYongy9q+mz+dNPzm4zoQ8m87c916cQxSBXrN8UbgrOKdGlJ2uWefIAzn17M8n5B
         MC9BKj5sHPrQsQ1ld5P6YPuQsh3IKQL/0dRt21rtiTWx9x96H34nlysIYvqhUU0IlnP0
         +RRN+soZulQYfX9NsaxZ48mV0m77wAOl9EWj/Qapbs+SVdnB5DFbAtwx8gXBOcsmYpFO
         EmuF7WyC1WVTsx/0VzC1DRFiZrbiT1RbLI31XeGTApKBhZRTlSRfC9wfcqRVz+ylH2ZQ
         wO7YDlsXh5JFd4GLdP4Ynkg4emZVZ35L1yR+npuG/FSCVxGyMg9PkGiuodV6Zjh+EhgS
         tIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722265769; x=1722870569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Dp+Sac21wVgKeyQaZgxJHvcbzAiY8v0pzh7luPHt90=;
        b=kLU1shYLlys48Tix/C8M2ddxHBaRc+u8Xt6s/kX8xhiZ+/J33oMClGi5334oNgizas
         gJX5U6I9q/mkGrCNWUIGKJ5BSg7NcaGfvEyabSJcszIlDOlhWHHQHgA5mWvASKP5S2d3
         KVVTuXk51RuiPn6wQlsqKu++RteymIlYuZlXtphsHzLbav5NMop3gq4GIh802nQ5BqXF
         rhIrPZwlXF3Ez3axt3fqRUCHESqKe/wqMDKzaA9LgmBETQ5rfr6M5crG2q2MT4Obn/xZ
         T8Vf3T5g62lqQuInuj9sQciGsynlUdzyKDabRsdkPs9TOuxWGRoyNXla+NHbbOpXRDvE
         4X6A==
X-Gm-Message-State: AOJu0YxxyrEb8JnI3Y1OWWehqoJ/VPXAXFRslsAm6ApNazc14kOtxMu1
	7kE64CR9n/e6L/sEySeGukLeWQHi328qwK4FiBGSvYgP1pQKaAgn8RWDNQ==
X-Google-Smtp-Source: AGHT+IGan2ocKNUHW5qjfQUToJtGjtwxZQxb9vrYQ1KtSK1tNr6lDW6+NNfb9ogfVolmdRUGrWAaSg==
X-Received: by 2002:a2e:2e17:0:b0:2ef:2504:22d8 with SMTP id 38308e7fff4ca-2f12ee6337bmr49382681fa.48.1722265768442;
        Mon, 29 Jul 2024 08:09:28 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42820af1df0sm13626155e9.42.2024.07.29.08.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 08:09:27 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-core@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH 1/2] appstream: refresh patch
Date: Mon, 29 Jul 2024 11:09:06 -0400
Message-Id: <20240729150907.1552685-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 15:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202656

From: Marc Ferland <marc.ferland@sonatest.com>

Refresh patch for 1.0.3 release.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 .../appstream/appstream/0001-remove-hardcoded-path.patch    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index bc811d67b0..d4d5517ab1 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From fe9ebb8c0fa7b84a9c5c667386b8fbb3baea2fad Mon Sep 17 00:00:00 2001
+From 03f00252c2fc948c0bce1fc0a6ee87adef71d1bb Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index fa171d5..79d5168 100644
+index 5f2eaa22..4a2483a1 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -185,10 +185,10 @@ endif
+@@ -191,10 +191,10 @@ endif
  stemmer_inc_dirs = include_directories()
  if get_option('stemming')
      stemmer_lib = cc.find_library('stemmer', required: true)
-- 
2.34.1


