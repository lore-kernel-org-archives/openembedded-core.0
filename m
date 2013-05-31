Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id CCB8660959
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 11:20:10 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id hr14so574030wib.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 04:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=namtxTWHPeoo7+EKIoLZPBeIZpHzYQYaCZAvAPqup6I=;
	b=MWyBWS51h3ZKypkZkycwAouUl80sgHC8pCz2MSQSEtR/zKG55uOih23aNwMW2LtGPc
	bPTkAxXsZOxY8mWIU7g5Fg4P+FqG8Gq9s6bHk/bokTaEioITx1SF8mSkkg/6YuiPg1bH
	+5RQqDjD3kCE9WqQuSGIE4cFQO7LyCs5VBuasEX8T0QMSGAknunmhttaCMBwBUOOFhXu
	V+/+lgvuYrD57ZOpkOn+2Ypyf85zqJp5rtEKP4IiuolsHzM7tTSyEOwhHlkimVmsSwE8
	pXYEjxnW8YOtyQf/HTV+8c5P1QGVzNQrGXBnUV04a8bNNRyXOCBgbUzZ6ZF4r2oCzEwf
	Wu1w==
X-Received: by 10.180.109.48 with SMTP id hp16mr2861968wib.24.1369999210916;
	Fri, 31 May 2013 04:20:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ca19sm3264273wib.3.2013.05.31.04.20.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 04:20:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 12:16:53 +0100
Message-Id: <1369999013-28500-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmMRpkLXW7jLkcEg7uGb0vNp3QNHLv+hvGOb+Y0F/FEgrkE7mHWqxq6nn2tFjNGRUKDg4in
Subject: [PATCH][V2] mesa: update git recipe to 9.1.3 release
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
X-List-Received-Date: Fri, 31 May 2013 11:20:11 -0000

It's not bleeding edge but it's better than the previous pre-9.1 commit.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-git.inc |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index ee9a552..c5507ce 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -1,11 +1,12 @@
-# Current pre-9.1 commit
-SRCREV = "1665af3066f3d58c42e9d5b13098f13615a7672c"
-PV = "9.1~git${SRCPV}"
+# 9.1.3 commit
+SRCREV = "f32ec82a8cfcabc5b7596796f36afe7986651f02"
+PV = "9.1.3+git${SRCPV}"
 
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=42d77d95cba529a3637129be87d6555d"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
-           file://0002-cross-compile.patch \
+           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
+           file://fix-glsl-cross.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.7.10.4


