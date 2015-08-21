Return-Path: <coldnew.tw@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id D0DD760557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 05:55:42 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so36589688pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 22:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mM50Uad77ZJtXF1syOpfqUnh+h6MU5SlM0LN9WpB/wI=;
	b=FVQjbPse0si4R29/mbyrePw1PrRWaXohzsgoIiGw4G0d2jo5238RwoJ/cAu5BhIrAS
	nMUHxliwpGtjDHeWLOB3/5mwX1TnscOsgocXFyzX9VA503j66xeGGSOMJ8OtpEvrYspp
	5oKNtQosCS3xOtYJysnfjq3tqC/xiOdc5DSJ0MIVEnBEuXfrAHrWVopxgo48I8mRz1qT
	1JCW4ZAtG3FvYN4hQgSH5I9rZA+LRWjvgKpFRp0ZfXsi4j+4WzB1F2c6phMTH9Gzvnly
	v99h3nUpU8SESc+dgl+Ml/IHhrXtj8CGaqlAUP5D+1GAYwn0MNBtYFNOglADK6qIncvm
	JD0w==
X-Received: by 10.66.164.130 with SMTP id yq2mr14256409pab.67.1440136542669;
	Thu, 20 Aug 2015 22:55:42 -0700 (PDT)
Received: from localhost.localdomain ([203.70.194.104])
	by smtp.gmail.com with ESMTPSA id d4sm6297223pdc.93.2015.08.20.22.55.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Aug 2015 22:55:41 -0700 (PDT)
From: Yen-Chin Lee <coldnew.tw@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Aug 2015 05:55:29 +0000
Message-Id: <1440136529-4762-1-git-send-email-coldnew.tw@gmail.com>
X-Mailer: git-send-email 2.3.6
Subject: [PATCHv2] Use BRANCH to control git branch
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
X-List-Received-Date: Fri, 21 Aug 2015 05:55:43 -0000

Signed-off-by: Yen-Chin Lee <coldnew.tw@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 14a577f..32076cc 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -4,7 +4,9 @@ PV = "0.9.33+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
 
-SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
+BRANCH ??= "master"
+
+SRC_URI = "git://uclibc.org/uClibc.git;branch=${BRANCH} \
         file://uClibc.machine \
         file://uClibc.distro \
         file://obstack.cfg \
-- 
2.3.6


