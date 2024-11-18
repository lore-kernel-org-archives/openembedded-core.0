Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E922CD4922F
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 15:04:38 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.43441.1731942272439442746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 07:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NFxNb4ty;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso35245035e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 07:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731942270; x=1732547070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KO/zECCer51goN5ampcuY99JyOWG3pdVdrMQvAq8OUQ=;
        b=NFxNb4tyCwVJzcYvUMdpqiClDs411DpfFm9XbHErk2YfF4hmftwqqIR9tyXUUE3f/A
         2rUKlXA0wdlRX1eFgRJmzBcN3JLb//Nc9QDIUiiDBT67wrFZLqCOnstrxc0jvcVJihiU
         ft/RozPdAX4fLRXcUWmTH/CAgNqZ/eslqX06E9qRxFWKlaF2iglB9qVNraqzoabKYaOl
         ybb6ndO63zO5w58MUl0oNZtE+YGX4zV5F4bxD5EWnsCSc2ZK1PTX5KkEIVAYRueQY9OJ
         ulXmuTZuxCJrykOjcvCJP6kxS4pxFRbScxVjOt3+Wdp6LeIWklQAftXJ1exR9PanTGAO
         KS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731942270; x=1732547070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KO/zECCer51goN5ampcuY99JyOWG3pdVdrMQvAq8OUQ=;
        b=UgfgySkWfzWp1C7m2ZfvuaZEAEznWylemotQ6njRJzFI0NWukAVEoW7kP4GOvjpy/N
         YBMlJf4Npqf9/ut3BKRb3R4uaedgRV93Zz8WTfyrqemlzT/hJShNpPqcm4Zmf1RZ4Il4
         +DdoeS0jwHhmoWNI5ch7r222P481lk4iHp5LllU4TFUH1ZB5ojfKyzR/S+EnSMx4J4pH
         LNAdkqIdYUrKN+0y1lPnF0xCx8z5EJkiRZEzuBbeKWM93zkk5SjaaP9b/HPKY6B1VYuO
         EunWRxEU/5hIGsRmlO/Rtq83IM3Xv3nODtmQ+VygGWlDEk3pLkFT22vvL6G8EwvsMRR1
         pqJQ==
X-Gm-Message-State: AOJu0YyFmo5COr+kZ4aDUjcXrlsegs45tLDkZcnSmewtpE9ZIEyeZwij
	EjMtS4R4zT4CgC+uZ6D5XMx28q3zRbc1D75CaM4mRTySl520PqbbTmypug==
X-Google-Smtp-Source: AGHT+IHqQaUoIewWkCuZQeUC2a7mB0CHZz8xt9XRfEGq+xU0HzqsPQEKGhCrsClP8C+aHaLXH04lxg==
X-Received: by 2002:a05:600c:1c97:b0:431:50fa:89c4 with SMTP id 5b1f17b1804b1-432df71c02fmr122459775e9.3.1731942270124;
        Mon, 18 Nov 2024 07:04:30 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da24459bsm166043965e9.6.2024.11.18.07.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 07:04:29 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] libxml2: upgrade 2.13.4 -> 2.13.5
Date: Mon, 18 Nov 2024 15:04:13 +0000
Message-ID: <20241118150413.7855-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 15:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207219

https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.13.5

Regressions
* xmlIO: Fix reading from non-regular files like pipes
* xmlreader: Fix return value of xmlTextReaderReadString
* parser: Fix loading of parameter entities in external DTDs
* parser: Fix downstream code that swaps DTDs
* parser: Fix detection of duplicate attributes
* string: Fix va_copy fallback

Bug fixes
* xpath: Fix parsing of non-ASCII names

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-core/libxml/libxml2/install-tests.patch          | 4 ++--
 .../libxml/{libxml2_2.13.4.bb => libxml2_2.13.5.bb}           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.13.4.bb => libxml2_2.13.5.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 478eeea81b..1c8c13ab5c 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 0779511838a8cbd1e0f431c22f28f286a2a37b1b Mon Sep 17 00:00:00 2001
+From 8c1054eacb430472068f21e4840749c384e8e866 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -12,7 +12,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 0a49d37..1097c63 100644
+index 4cb9a5c..8adcd7e 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -27,6 +27,16 @@ check_PROGRAMS = \
diff --git a/meta/recipes-core/libxml/libxml2_2.13.4.bb b/meta/recipes-core/libxml/libxml2_2.13.5.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.13.4.bb
rename to meta/recipes-core/libxml/libxml2_2.13.5.bb
index 34a1d3fa46..6fbdec30ca 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.5.bb
@@ -19,7 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "65d042e1c8010243e617efb02afda20b85c2160acdbfbcb5b26b80cec6515650"
+SRC_URI[archive.sha256sum] = "74fc163217a3964257d3be39af943e08861263c4231f9ef5b496b6f6d4c7b2b6"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.43.0


