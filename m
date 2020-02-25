Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2FAFE6168E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 18:54:12 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id a6so298603wme.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cfHg+Vw653LA6zl/7A6vptIutFA/TgPMrqjPTWyogMk=;
	b=pMdtglRrvq0vpAYEXMx1XFZCgU8wNRBBaKVwjdNG/CXM7S6GFPusLM+A6oXL7aci3m
	TD2ZBHr//Ku7IbJ4rsw0cBqFjO3bg1n7iCCWYjg+Z0Ruo4NxDRxq7Etzu3a5ochjcnwz
	+pnLux6jcxEny7JtsvxA8A/EJhI6zjv+aYX5hOHBbKpRr0EABep5wHkO9m5bvp+RWxWf
	h8Ml0nUSoRwJKX+525OeTHF2nBV0IA8+7nC/VMO3FslHn83hW/WYDLX1mUMQNL8h4ZWz
	8NpwGQbst/qcc0SglC6T/TlPPy4cEVvPU4fk+GtFSEFYnRNwB4meHT8OsKejvVhUf8OL
	ZO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cfHg+Vw653LA6zl/7A6vptIutFA/TgPMrqjPTWyogMk=;
	b=T5phRsV1WiHKDLg8ljasdjYATz41FYXra7MGkSQqn0A+OGaSHwMBSW6IGVjSRqUGDw
	jkSFjYC7WIXshxteFXmy+FzD+6NZWL1dnf32DK1gOh68mlypDhO/DA9P0W9W4S2TK9g7
	pUVlN/NxsqJtoznplQqM/qYZ7OUbBhsjE/bcSUWw0WyZc1QaIYAoYbSh/bJx2A/HYV3Z
	13Fe3zc6cbgfEWlQofcMX6XDPOg5xJnGeI5m718Ho6PWbDwGr7X+tmjk2JgS8JG5i42/
	YhwPO59Q0/xCSrjy5zO4L/C2fytX5PFkrazVg+zhsRfHgQyfwkLZ7zyzbbp91g++qDfS
	9rTQ==
X-Gm-Message-State: APjAAAW6SXVI25wv4YZllS4eCM1hajq5i5YYnFcpHXzwJ2CTGwOM7kOP
	UB7OtLQn8l12nMB13nECLW0NgcBm
X-Google-Smtp-Source: APXvYqwThpilioedXqNnkOosDImqoszg11zgxBdPa3YD0bniGt8GMzDMgu3kV6uhGLUhQRaSiIDX+w==
X-Received: by 2002:a1c:b457:: with SMTP id d84mr607695wmf.172.1582656853476; 
	Tue, 25 Feb 2020 10:54:13 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g7sm25730756wrq.21.2020.02.25.10.54.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 10:54:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 19:53:32 +0100
Message-Id: <20200225185335.19326-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225185335.19326-1-alex.kanavin@gmail.com>
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/12] python3-setuptools: upgrade 45.0.0 -> 45.2.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2020 18:54:13 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 meta/recipes-devtools/python/python-setuptools.inc            | 4 ++--
 ...hon3-setuptools_45.0.0.bb => python3-setuptools_45.2.0.bb} | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_45.0.0.bb => python3-setuptools_45.2.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index b1a6813b2e..5f99cd2512 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 50e4ebce9f711391e2fa9f43906259e19ac00e63 Mon Sep 17 00:00:00 2001
+From a8f871c9ebc4fcb99d4163b226aabeef26567099 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 09066f8..d3039a5 100644
+index 426301d..55c8062 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -649,6 +649,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index c697937887..f7c3202fde 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,8 +10,8 @@ inherit pypi
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI[md5sum] = "14898abd6f436eee58a5a2ba291fcbeb"
-SRC_URI[sha256sum] = "c46d9c8f2289535457d36c676b541ca78f7dcb736b97d02f50d17f7f15b583cc"
+SRC_URI[md5sum] = "0c956eea142af9c2b02d72e3c042af30"
+SRC_URI[sha256sum] = "89c6e6011ec2f6d57d43a3f9296c4ef022c2cbf49bab26b407fe67992ae3397f"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python3-setuptools_45.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_45.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_45.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_45.2.0.bb
-- 
2.25.0


