Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C100C4321E
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:45 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.9124.1635325664194183781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bijtuz+i;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id u18so2879685wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KqZ4ORHE5/NrPJWjg4N3ZNFj8Moat2MxeObZ/O9022A=;
        b=Bijtuz+iE05qsz6DFi03DG8xmNuIvjKohZRztk1ILDckcB4ASnN1E0z3hG063UNyE9
         OH8q5+PY/8YPEVZQk53FtiXdNwqlOZCbIPODIm4lZepbecKrBcyYM9P0dxSSkgnpHgy8
         /xTjfyIfXGf92ZQSFf7IgXYulLHbvhT8gVUME3CX4J1BUpvv79WJnoydC0X+7eP4YILO
         oLZPWzu0HW69pKs4LDpVhi0iNhLWbAQxIGq6DQxM2Vun4+dwd25d0H3HLATsr66yNpps
         5eDSK4VV57d+op6KP34fZT83aBVcngqITBvj/EKao+VMNRyS8U3OF7n4QxWUo5AB2QaB
         /XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KqZ4ORHE5/NrPJWjg4N3ZNFj8Moat2MxeObZ/O9022A=;
        b=4ZJ6LTba4cdYkIn2vIHyjK5z6jr+Zy4tnx+ikoYzdxHngUSmm3z8gIUJppaJrZhLOC
         ymGXgJxLufaVeAIm4XWn/q9dhL96/p7cHBBfirHvREM+HHHO9B6khMzc35B46V4MChTH
         WHr9XIIKm0gk1loZl8ZFjk0CcC+CI2mwT7v05MPGty1YuF6914KH1VT76c1Hh/Nii00s
         xlzq/KDc12tWp9CaiEiXQCuPjo+LUN/gKCms+FLuYtyrRoNgXmWpcync1kfUUhG8/fPj
         K7WWfpEuoDAnmknF6ON2lOk0PV0T1t4PsdwGORrVIJiWL4S73/VZ4PUVWfMdYKX5orBN
         AWGQ==
X-Gm-Message-State: AOAM531xMojD7LAR7LOijLP61On5FXv0WqaDaGt95uHr/8BzMzP4hvBt
	JdmzEX5Oj/r/cv1aA3NanP2SCLXZqGI=
X-Google-Smtp-Source: 
 ABdhPJyj+cp1KImA4B9cnzBdgGzDN70o/lV0gnB+atyEr1VBvLghSDfcgNwTbFgdhO1zP3VNOf4vqA==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr38314106wrs.110.1635325662846;
        Wed, 27 Oct 2021 02:07:42 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/30] python3-setuptools: upgrade 58.2.0 -> 58.3.0
Date: Wed, 27 Oct 2021 11:07:13 +0200
Message-Id: <20211027090736.2546759-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157483

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...01-conditionally-do-not-fetch-code-by-easy_install.patch | 6 +++---
 ...n3-setuptools_58.2.0.bb => python3-setuptools_58.3.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_58.2.0.bb => python3-setuptools_58.3.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index d1c77a971c..46546ebba6 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 543f12f43e10b242802009ac1d03ded800526934 Mon Sep 17 00:00:00 2001
+From 58b614411867a31cf5f9684a45fe519b8e4f3e7b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index b88c3e9..dcd2898 100644
+index 1aed0e8..f491c0a 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -636,6 +636,11 @@ class easy_install(Command):
+@@ -642,6 +642,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and rmtree(tmpdir)
  
      def easy_install(self, spec, deps=False):
diff --git a/meta/recipes-devtools/python/python3-setuptools_58.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_58.3.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_58.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_58.3.0.bb
index b37c44854c..47107ba61d 100644
--- a/meta/recipes-devtools/python/python3-setuptools_58.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_58.3.0.bb
@@ -13,7 +13,7 @@ SRC_URI += "\
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
 "
 
-SRC_URI[sha256sum] = "2c55bdb85d5bb460bd2e3b12052b677879cffcf46c0c688f2e5bf51d36001145"
+SRC_URI[sha256sum] = "b0c2461641b58fe30e11d4c3dfba316c513bdf9ec85f9fed0c871c678447205e"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.20.1


