Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEEDC2D0CF
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:12 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.16258.1718787608222823290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dfpuO6s3;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebf961e504so68896851fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787606; x=1719392406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KisLzFZPwbbxP/V2Ei7GdrhWItt/0PjVqiXm6W0B5HE=;
        b=dfpuO6s3/MIJFHPw8lTA+knLrvNxtW7ZBw/V/e5zBuFxTL2wh6z97gwC4gW6m9Hd6B
         ZQ+T8woVgpTzc0XmuCxmjmngNiuJ0ATcCMYlQs5IwsmPUOrQmLBMiBahO13ZQFDX5S5s
         arQKEoLSd46bDARrieEpYTgK3w2aPxSSrj0lX47qAJAkBJp8J+2OHjte6jh0urGowWAt
         y8C+jWuZDuTXKA/p3/RKia8ZLPAWTMwA4T9tsjq+sX7Rc7jKw9ldrjLh4/L7cdoRph2k
         hQAzkrOtTE9g9TqqXB4FPTEMvgiXFk1LynVz2bZL08Hl7PYI7wpVTHhgqRR+MJLsO+9O
         vlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787606; x=1719392406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KisLzFZPwbbxP/V2Ei7GdrhWItt/0PjVqiXm6W0B5HE=;
        b=JkOW4TB8kZ5FhqfkihQDb+pVdlfm+rHaFMYz7aGhiYqfdPkhObzDrRFzH1TwnF+IQq
         2yeVCR44As5yyBb3sZFRmjCUGUY5gvYhNC9lknw1t3dcITrsVqoc38eiaVo0m9MFzGmN
         1TIx8cG3VSI3NWrdtl0RSHiuywZlOuJ/InhDhECsbE60QuagnQS4dhcA9Zu9Ck708lhx
         uLIGIHVokHEMqRKHM+XBAimI6V6MNkMOfU0WedvyiOkn6fTtTVTt9tL40uEelk00dLol
         3IMRAuZqKX7OoaOn+8eqmibRKmrjdKQbkdLDGSc8YzNb1JbkeWVTnmQIUHJbvYYc2cd3
         3v1A==
X-Gm-Message-State: AOJu0YwHqY50UbtAHD35it0QE/Jph0qxOkk3cxMp/3Pi1FwVae6N66W8
	w9he7MUVeuyNWoPVL2sRGgJuCpOU83XQx8qEqzr+I6rD3HqKF1Xw6q1CqQ==
X-Google-Smtp-Source: AGHT+IE/v6flK5I4/jauF14R82JK/Wa2Sc9qL47rPcVb6LBCiOXLU9HmOigJ4VyMEo6/ESqrwaGEsg==
X-Received: by 2002:a2e:9604:0:b0:2ec:3cdf:6401 with SMTP id 38308e7fff4ca-2ec3ceb7ceamr13968861fa.17.1718787606207;
        Wed, 19 Jun 2024 02:00:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/15] libfm-extra: drop unneeded 0001-nls.m4-Take-it-from-gettext-0.15.patch
Date: Wed, 19 Jun 2024 10:59:51 +0200
Message-Id: <20240619085957.2787700-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200895

From: Alexander Kanavin <alex@linutronix.de>

nls.m4 is always provided with gettext or gettext-minimal if gettext
class is inherited (and it is).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-nls.m4-Take-it-from-gettext-0.15.patch | 54 -------------------
 .../libfm/libfm-extra_1.3.2.bb                |  1 -
 2 files changed, 55 deletions(-)
 delete mode 100644 meta/recipes-support/libfm/libfm-extra/0001-nls.m4-Take-it-from-gettext-0.15.patch

diff --git a/meta/recipes-support/libfm/libfm-extra/0001-nls.m4-Take-it-from-gettext-0.15.patch b/meta/recipes-support/libfm/libfm-extra/0001-nls.m4-Take-it-from-gettext-0.15.patch
deleted file mode 100644
index 69a51d56628..00000000000
--- a/meta/recipes-support/libfm/libfm-extra/0001-nls.m4-Take-it-from-gettext-0.15.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From c320799c941d42a9b7e351805359694ea3b36d2d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 5 Apr 2015 09:08:38 -0700
-Subject: [PATCH] nls.m4: Take it from gettext-0.15
-
-It otherwise expects gettext to provide it. Lets go independent
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- m4/nls.m4 | 30 ++++++++++++++++++++++++++++++
- 1 file changed, 30 insertions(+)
- create mode 100644 m4/nls.m4
-
-diff --git a/m4/nls.m4 b/m4/nls.m4
-new file mode 100644
-index 0000000..2c8fe69
---- /dev/null
-+++ b/m4/nls.m4
-@@ -0,0 +1,30 @@
-+dnl Copyright (C) 1995-2003, 2005-2006 Free Software Foundation, Inc.
-+dnl This file is free software; the Free Software Foundation
-+dnl gives unlimited permission to copy and/or distribute it,
-+dnl with or without modifications, as long as this notice is preserved.
-+dnl
-+dnl This file can can be used in projects which are not available under
-+dnl the GNU General Public License or the GNU Library General Public
-+dnl License but which still want to provide support for the GNU gettext
-+dnl functionality.
-+dnl Please note that the actual code of the GNU gettext library is covered
-+dnl by the GNU Library General Public License, and the rest of the GNU
-+dnl gettext package package is covered by the GNU General Public License.
-+dnl They are not in the public domain.
-+
-+dnl Authors:
-+dnl Ulrich Drepper drepper@cygnus.com, 1995-2000.
-+dnl Bruno Haible haible@clisp.cons.org, 2000-2003.
-+
-+AC_PREREQ(2.50)
-+
-+AC_DEFUN([AM_NLS],
-+[
-+AC_MSG_CHECKING([whether NLS is requested])
-+dnl Default is enabled NLS
-+AC_ARG_ENABLE(nls,
-+[ --disable-nls do not use Native Language Support],
-+USE_NLS=$enableval, USE_NLS=yes)
-+AC_MSG_RESULT($USE_NLS)
-+AC_SUBST(USE_NLS)
-+])
--- 
-2.1.4
-
diff --git a/meta/recipes-support/libfm/libfm-extra_1.3.2.bb b/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
index 79dd1d92dce..eff1b54f734 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
@@ -9,7 +9,6 @@ SECTION = "x11/libs"
 DEPENDS = "glib-2.0-native glib-2.0 intltool-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
-           file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
           "
 
 SRC_URI[sha256sum] = "a5042630304cf8e5d8cff9d565c6bd546f228b48c960153ed366a34e87cad1e5"
-- 
2.39.2


