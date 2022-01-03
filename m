Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CFCC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:20:08 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.30368.1641226807820046375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id w27so25632957qkj.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=4naQq0D0yLMJyZo0Bhlyxbb6sxkxDFACoLTG3K0XnoA=;
        b=2nnlTHOd8wxIdXTV4obFDCquiIYYxnAYayrKkiftnPB+R5ji5yJxjl3MmxAkrP5MEt
         oGnLxsWcxBtmnJNwUSSDG2efoB6Of2MRhQy24cLwro/ipTsc9tX6eBczMutj+2f4AkfU
         w97bkWRw7VyQbrH6t00ypjRamcdIo+iiSc8uxzqGU2SOQmw5V8FmT5Ccg3AlJTejN+6l
         Cs+R1ESelTtNmY3X44CK1LuI+f6xK0hpmmabsAtDHQqrxDVC1JmuxUE/vRokOrqwSL80
         OzobpDpsMaKVsW6knZ/yWub10gIudAi1zCeczFlaS6yFKHZeVImTf+D1qI+3ww59WERW
         COzA==
X-Gm-Message-State: AOAM531jsh2JgN4ShZA4Rhq1iKkRJ+Hc0OTbAIBPeAqrvBaMIDeJiR1A
	Tb8kJAd1kty3mRWmAykuq/Jrw8h+k058xOqD
X-Google-Smtp-Source: 
 ABdhPJyK0bsDrtpOh3C5iT+cRVWYnj2z/bN9TrNAQRJipGrzBEVqStYHs/KvMBfPpYxcOLKM7j32HA==
X-Received: by 2002:a05:620a:21c5:: with SMTP id
 h5mr31048883qka.102.1641226806734;
        Mon, 03 Jan 2022 08:20:06 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 o4sm26622139qkh.107.2022.01.03.08.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:20:06 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 20/24] python3-setuptools: upgrade 59.5.0 -> 60.2.0
Date: Mon,  3 Jan 2022 13:18:50 -0300
Message-Id: <20220103161854.301148-20-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:20:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160137

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...1-conditionally-do-not-fetch-code-by-easy_install.patch | 7 ++++---
 ...3-setuptools_59.5.0.bb => python3-setuptools_60.2.0.bb} | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_59.5.0.bb => python3-setuptools_60.2.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 5e2ee454da..290188ebae 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,7 +1,8 @@
-From da88c57fe03e4474ba20325edacf519e80c1d7a8 Mon Sep 17 00:00:00 2001
+From 74abf3fae060c87b04e5fb8c382ecc835afc3a50 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
+Organization: O.S. Systems Software LTDA.
 
 If var-NO_FETCH_BUILD is set, do not allow to fetch code from
 internet by easy_install.
@@ -15,10 +16,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index fc848d0..c04a5de 100644
+index fb34d10..217fce1 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -642,6 +642,11 @@ class easy_install(Command):
+@@ -649,6 +649,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and rmtree(tmpdir)
  
      def easy_install(self, spec, deps=False):
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_60.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_60.2.0.bb
index 878fa08404..8748f91388 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_60.2.0.bb
@@ -13,7 +13,7 @@ SRC_URI += "\
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
 "
 
-SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
+SRC_URI[sha256sum] = "675fcebecb43c32eb930481abf907619137547f4336206e4d673180242e1a278"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.34.0


