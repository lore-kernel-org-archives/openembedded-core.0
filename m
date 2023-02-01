Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741B0C636D7
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:22 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.24356.1675260856996192722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rC7V9pIA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id w20so3750822pfn.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUUnu7ZhuAzrbpey2Fho8tXug+jdhGVRYwX0eLfvLCs=;
        b=rC7V9pIAs7jqrMu84Uyj/qWOuGAEBfatbsLehjGQgN5/60k/wqr7mamcvr0AxDsuvh
         S7sf/q2jW7wTH8jXxj2ZTWsVL9tLr2HSDJwaYbiGaBw46Zu7f1S/HBRhg9fSfk0nGLFw
         aBA8KjdsQHIdHGBoxt/01pG4BQZmhqiqnxi7EJQwtaOoBfmhRuLwzrg5mnrrzv1uaYBd
         w8YIkuMw6uqdRxSaQ0LMqFJlTrL1RLwDvRiKW7dDYC9+Yx0R5vUPoXgYFaNtxfjG8wQd
         2c7tnsd6rZ9LVJtqwQMlxX484bialSEfLzMK31pitQMVUZE6tw0LjpmKhM7IkqjkUubK
         kD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUUnu7ZhuAzrbpey2Fho8tXug+jdhGVRYwX0eLfvLCs=;
        b=fJs4wMw5qPZulR0l5Zuz3eK+I3LvpfvVuDvSou+9gIEPFlcNQE7FM9tdSpZB1WL3Ih
         WlaFJptR47f2VzIOmWH+kBOoDaz2sqgjIAezmJV+DTIruxW9Ed1N08Lpy204bSJqx9xJ
         t7t9uBBFgSXABS8idTnqMcMilF8ujA3DZXOtOfr14D7vSFYJMXhqSZaX8codD8Y9IABX
         SB4ZRGXwqAmMdQa0Ji429xl9eo/ZUsWaYDFyn49nflKiVjS/J+YgN4nGI4TSYDa67Hta
         HH740+ytLoxnJeCYZiMxRtr/vZoEprwJWbVQGPlcvPMVVTp9MoJG4SgwQ26BqA1zwPQs
         9PtA==
X-Gm-Message-State: AO0yUKVd3xL3DQdL0g/I93/IdHWS3IF5tzbrWodujqKPbvjSHdSq8Cjw
	N8SuGAmY6/IF0Un1s9TfT9BfadsMh93SVNJaKy0=
X-Google-Smtp-Source: AK7set/ZnTAfEiq36rtuwJzTfTNqYglOsXZ5duRS2x9BKEwfxYuaVW8JOp3Qc/8/saQhwRbiDwmNag==
X-Received: by 2002:a62:1954:0:b0:593:d2ab:fdfb with SMTP id 81-20020a621954000000b00593d2abfdfbmr2554078pfz.13.1675260855999;
        Wed, 01 Feb 2023 06:14:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/17] createrepo-c: Include missing rpm/rpmstring.h
Date: Wed,  1 Feb 2023 04:13:45 -1000
Message-Id: <0a5f5816ffde087c31e2889483fe38e8c740d300.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176542

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b122f4ab5d8750dd64814da0ae7c9035b7620e4c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-include-rpm-rpmstring.h.patch        | 27 +++++++++++++++++++
 .../createrepo-c/createrepo-c_0.20.1.bb       |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
new file mode 100644
index 0000000000..a249eaf5a1
--- /dev/null
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
@@ -0,0 +1,27 @@
+From 8defe6aaf91613c3fcb540df65a94cd56d377367 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 13 Jan 2023 13:21:51 -0800
+Subject: [PATCH 1/2] include rpm/rpmstring.h
+
+Its needed for rasprintf declaration
+
+Fixes
+src/xml_file.c:341:36: error: call to undeclared functi
+on 'rasprintf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/340]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/xml_file.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/src/xml_file.c
++++ b/src/xml_file.c
+@@ -19,6 +19,7 @@
+ 
+ #include <glib.h>
+ #include <glib/gstdio.h>
++#include <rpm/rpmstring.h>
+ #include <assert.h>
+ #include "xml_file.h"
+ #include <errno.h>
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
index d309bb895f..053198ca5e 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
+           file://0001-include-rpm-rpmstring.h.patch \
            "
 
 SRCREV = "af14e164a3e4ab9dfaef1212e852b9ecebc326a2"
-- 
2.25.1


