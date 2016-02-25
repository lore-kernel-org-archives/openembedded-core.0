Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 429D77731D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 02:30:28 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id gc3so36253928obb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 18:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UcUdCkFPcu4ePu5rEQ90r/v1sILUGRfGJNfyYTv+xQ0=;
	b=O8ZzL4/X9dLPqHH9UTVqF2yZPFp0NZStHd3xKa/mejfENtg12SNqPAB2BjYXzMuJTW
	7EE7IczbkIdyO7fVbR3TEuEMLF/Dyxff3vVMdpOaBw2XNv8ijsR/0LDVTwOy5YepdLF9
	l8P7YyHlE+PxBBBqpupHXPwEngWAGr6KGuSmjMjqRfijn26USPPpJ09SEuh5GOaEJluX
	H+7kz9xYi15mJoCoYVqWBSaC/3SxCJeTzOstmCb8UbQfPS9gjtbCaHf0KpQ9T/kgihb1
	FBlDgHSInPP6cvpbAuW+4Cv7yo0+W+AP9exOUDgJZMm0ERcO4HQxUDfsW2UJk+Mqf0hF
	peRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UcUdCkFPcu4ePu5rEQ90r/v1sILUGRfGJNfyYTv+xQ0=;
	b=c8y5d9REXByaygGHBhI/zU+WUQzEiN3s3ykdIZQkVp6K56M7XWtpKMKA6DimhL8wY4
	GPfT+WxQGF7qgC1YbccgiZTPFBgV7VlLia5p0rxX6ZMBjS2o/CwncdGo5jBqXbOFH147
	HSb9awGjEJLiCPRLaRc3QX1VKLBk1N5Kf7xeCYFlDO2u3Y9bHFvFhRHfkmUL9fKP6Uyd
	Xg7OfifFHvMfuKcZumNrupNDGTZMmRdt+kOYvM4u7AjuB8wioB3wtE4bZG5Arn4AOIxi
	LPjmT48e19si/C53yVl4kuZNePcv0oM6mrKnjdYypQ/B74i8TTUUvZ+3s9Nqxf4yXIQ0
	xZOg==
X-Gm-Message-State: AG10YOT8XDiCUORFcifdhXO5H/hKqq0odLVbTRnYtkoXoBKGQyBwgLfQYoweAjRKziXlJg==
X-Received: by 10.60.232.163 with SMTP id tp3mr36195443oec.42.1456367429574;
	Wed, 24 Feb 2016 18:30:29 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w127sm3811312oiw.17.2016.02.24.18.30.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 18:30:28 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:30:21 -0800
Message-Id: <1456367421-7634-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] boost.inc: enable more verbose build logs
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
X-List-Received-Date: Thu, 25 Feb 2016 02:30:29 -0000

The default build output is very terse. Add -d+2 (ie "Show commands
as they are executed") to BJAM_OPTS to make the do_compile logs more
informative.

Also add -q (ie "Stop at first error") to BJAM_OPTS and fix typo in
comments.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 79c4e63..c55221f 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -115,7 +115,7 @@ BJAM_TOOLS   = "--ignore-site-config \
 		'--layout=system' \
 		"
 
-# use PARALLEL_MAKE to speed up the build, but limit it by -j 64, greater paralelism causes bjam to segfault or to ignore -j
+# use PARALLEL_MAKE to speed up the build, but limit it by -j 64, greater parallelism causes bjam to segfault or to ignore -j
 # https://svn.boost.org/trac/boost/ticket/7634
 def get_boost_parallel_make(d):
     pm = d.getVar('PARALLEL_MAKE', True)
@@ -140,7 +140,7 @@ def get_boost_parallel_make(d):
     return ""
 
 BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(d)}"
-BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} \
+BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
 		${BJAM_TOOLS} \
 		-sBOOST_BUILD_USER_CONFIG=${S}/tools/build/example/user-config.jam \
 		--builddir=${S}/${TARGET_SYS} \
-- 
1.9.1


