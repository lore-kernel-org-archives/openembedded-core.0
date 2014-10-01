Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 014C065F77
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 14:23:42 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id i138so306135oig.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Oct 2014 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=9HQVfgtfi2OBuoZcCJQUQnQTQpRW8HfTLrqMRyfaeY4=;
	b=OJEwmrLxwZzsl4wMU7DQgA8JeWGT9Rglc8WNw/BZduZTvAwRitWwDV8vLHu0yM8NvN
	4eHHfkWfMj6Si+xs2j3rn2Vb2dMaUJ0S1MuT00nLN87ckHg44A4l0HeX700OJvi8snlM
	QCJvNdz2BXtT/3PchLEWBzQdTLwHVYB/7DCTj+u0qHZ4FXA7EwkoomMHTdGaDdioL1nt
	ZuJxKpu+NZ+KjsMHjXKp6W/tb8oEiZwRIUVhwuLxwbHpEpOaI1F21JtsNEJW7PbxkY91
	H+h89nxwR+0Sgj2uWM+QKdQ78+/MAEYbC7cG3YOjiJSco3bWMr5v92IVt7OiSf6byCnG
	J+8A==
X-Received: by 10.60.134.237 with SMTP id pn13mr22215286oeb.46.1412173422702; 
	Wed, 01 Oct 2014 07:23:42 -0700 (PDT)
Received: from localhost.localdomain (75-163-154-89.clsp.qwest.net.
	[75.163.154.89])
	by mx.google.com with ESMTPSA id ix8sm515610obc.11.2014.10.01.07.23.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Oct 2014 07:23:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Oct 2014 07:23:38 -0700
Message-Id: <1412173418-32141-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] lz4: update to version r123
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
X-List-Received-Date: Wed, 01 Oct 2014 14:23:46 -0000

Makefile md5sum changed since version is hardcode in it.

Added : experimental lz4frame API; special thanks to Takayuki Matsuoka and
Christopher Jackson for testings and suggestions
Fix : s390x support, thanks to Nobuhiro Iwamatsu

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/lz4/lz4_svn.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4_svn.bb
index bbd5d93..3a74200 100644
--- a/meta/recipes-support/lz4/lz4_svn.bb
+++ b/meta/recipes-support/lz4/lz4_svn.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing comp
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd \
-                    file://Makefile;md5=68938168b5cee826476a13e1b8d1f480"
+                    file://Makefile;md5=7551cc5d31ca66e003ab06e83486524a"
 
 # Upstream names releases after SVN revs
-SRCREV = "122"
+SRCREV = "123"
 PV = "r${SRCREV}"
 
 SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
-- 
1.9.1


