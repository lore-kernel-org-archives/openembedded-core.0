Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5873775A64
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:50:54 +0000 (UTC)
Received: by igh16 with SMTP id 16so35609442igh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o9nKHv5f8oWqscZJbzeY5vunPA4M6kkM5Z4tjuLaEjQ=;
	b=AOIVhWc02VssX9d4ppnMOT1wUHH6phPjHZ9fsAbx5bubtOpjFPhlY4PrZxXRgGc/pS
	T0bDgdFOHV7T+vu9Z8atUKRTizv6gkRq5+NF7cT0zmnZy1MTaifb3xPfU28gy23V39Xv
	JVYFD+1ObOPX8pvgzRg7jKMvZoa6BcEN4jN5pupTZNyloPpcuU7bbVNfZmiO3XteKCKC
	kwDUClKMiRWyQtojKhZmb5CpfKK5tmd1Ak+mHKGZ0Oih875g0fPZgI9g/o6fi1hVnIgm
	mcn0AiCvUjVEa6TVOwrwoEaxXV8amcnis6QyzustowcxkIinoaaaVXWX9HLAm9aQQ0AQ
	hKRg==
X-Received: by 10.42.249.147 with SMTP id mk19mr37926719icb.26.1436215854414; 
	Mon, 06 Jul 2015 13:50:54 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.50.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:50:53 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:50:05 -0700
Message-Id: <1436215810-23722-9-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
References: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 08/13] python-numpy: fix typo in no-host-paths.patch
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
X-List-Received-Date: Mon, 06 Jul 2015 20:50:54 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/python/python-numpy/no-host-paths.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-numpy/no-host-paths.patch b/meta/recipes-devtools/python/python-numpy/no-host-paths.patch
index 0efb01a..d745036 100644
--- a/meta/recipes-devtools/python/python-numpy/no-host-paths.patch
+++ b/meta/recipes-devtools/python/python-numpy/no-host-paths.patch
@@ -1,6 +1,6 @@
 Don't search /usr and so on for libraries by default to avoid host contamination.
 
-Upstream-Status: Inapproprite (As the code stands, this is a hack)
+Upstream-Status: Inappropriate (As the code stands, this is a hack)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-- 
1.9.1


