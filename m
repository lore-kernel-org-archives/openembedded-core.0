Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id D3AA4605A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:04:07 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id p9so3697889wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=t66v0jHJ9ULn8PW8d+iGk1Thk03+mbtmaKi+CchNcAU=;
	b=XweetsV+FTr+4JnEjJnKua/g5kiCd6jBwdvEw3QeqccLn4VdCTyi8WNSpg0d2ynbuV
	OuCi1QR8nl0k/bjaQN1u1eLQgjXI7TM84LaBQw6bf7VPDSqvq27d0zVcQOXu3pX2qdzy
	pBEcYNgYaminkLfUbpkjoSqIKBBotaSKl5yAo/Vi8woe2zhirw45fZp/h3VpX/QczpwW
	pcPpFcVH6GNhH9bHe7hMjM+3d6zP0IEerOWTZxIKcENqXTLn+pfeVpFvTocsSWKw4kNN
	x43XAGm2Oe6E0MmNLnX8ANsEHwCr+CkGXQ9//dgRZVbmHznzpWu+L+g8f0e+1TclnsbE
	Jmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=t66v0jHJ9ULn8PW8d+iGk1Thk03+mbtmaKi+CchNcAU=;
	b=TF6mt6CkVmcGAWLqWAM8VojHvlAgdoIHZcvqDSmEjbwQnWW9mgskP+cH71O/PuJaL3
	7FiActytyb3AMaIo0+kqukepqpenrGd/i4hnp1sVE7lLXqNLsoYZYQj2LO9kMgf0rXOZ
	KUPkHPqlWktONoytak0ay/AAk8h1UoqReglaVJ+TuQ5PJvXXkqu3ir+En1E0FS1nPbev
	wIijjekH1HNdK9sK8A//dYAiptRMQmfHs9wZoiikqsqBXLBCgjS9a3bc8e2zPFwzegG9
	jb6rMJnfFGX+A+dusb3KadaQ7hK84nuuCDafswMnPRtU8JPoQrvy+9SZqxUsDLQ2MT1Y
	JnNw==
X-Gm-Message-State: APjAAAW4suryOKQqrU0ecoQnxQcXXM7HljZ1BzNeYdSw/rofY6q6WcpZ
	4wvE5pWN7o0/Y+fIXXHWQ1alyggu
X-Google-Smtp-Source: APXvYqxK+4a3my9RFCUTwxhDoJtcxkdf6AZ/CAA/9CLQRAaLE75AGYEFtL2kZL+QnmYsGmVIsydr7w==
X-Received: by 2002:a7b:c1d0:: with SMTP id a16mr10183132wmj.175.1580288900023;
	Wed, 29 Jan 2020 01:08:20 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:31 +0100
Message-Id: <20200129090738.1398-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 17/24] python3-setuptools: upgrade 42.0.2 -> 45.0.0
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:18 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...01-conditionally-do-not-fetch-code-by-easy_install.patch | 6 +++---
 meta/recipes-devtools/python/python-setuptools.inc          | 4 ++--
 ...n3-setuptools_42.0.2.bb => python3-setuptools_45.0.0.bb} | 0
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_42.0.2.bb => python3-setuptools_45.0.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 169d1b155bd..b1a6813b2e3 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 5bba4f57f048016aa92ce5909e9e372db619554e Mon Sep 17 00:00:00 2001
+From 50e4ebce9f711391e2fa9f43906259e19ac00e63 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 05508ce..945e118 100755
+index 09066f8..d3039a5 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -640,6 +640,11 @@ class easy_install(Command):
+@@ -649,6 +649,11 @@ class easy_install(Command):
              os.path.exists(tmpdir) and rmtree(rmtree_safe(tmpdir))
  
      def easy_install(self, spec, deps=False):
diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index d8bce7145eb..c697937887b 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,8 +10,8 @@ inherit pypi
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI[md5sum] = "5ac69b66a6f7d4785517017f37df28e9"
-SRC_URI[sha256sum] = "c5b372090d7c8709ce79a6a66872a91e518f7d65af97fca78135e1cb10d4b940"
+SRC_URI[md5sum] = "14898abd6f436eee58a5a2ba291fcbeb"
+SRC_URI[sha256sum] = "c46d9c8f2289535457d36c676b541ca78f7dcb736b97d02f50d17f7f15b583cc"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python3-setuptools_42.0.2.bb b/meta/recipes-devtools/python/python3-setuptools_45.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_42.0.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_45.0.0.bb
-- 
2.25.0


