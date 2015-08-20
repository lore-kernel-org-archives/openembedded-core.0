Return-Path: <coldnew.tw@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id B5BBA73E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 07:33:06 +0000 (UTC)
Received: by pacrn3 with SMTP id rn3so1295693pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 00:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Aas7SIsXfDWClPS0w4bMZO4h2C+W0Uk7eJsragxYmfM=;
	b=VDUhBdyqwENfy/FXdXGxBUOKdsY3V7J//hdZF06FCszaKuIDrRJxDVid/KX+/51oDN
	7DzrKeuZVuTiyRpoyWWQMx3GNo+VLVK3YqsMQTZ1+sIhCj9zWjNq3imn49TuS0KVGhPa
	yxWr8A+8qse8vrS8SsgHXS6LydWkNdaYIli9GDddv5dqYPEzGha8ZY+F93HXvMm3oXhZ
	CnuLjX5CS0FbcL2HWTKS+IkBV7LEw5Zhkng44jsd1Otg/2m4RAQ9JY3iz+3Q5QhthxIo
	1tVyFQtbxG/p6g8h/MwtziFto7yRajjX+QljnS64B0O1PQQCpNYIK/9gPkPo2r5eYuib
	bqUQ==
X-Received: by 10.66.139.234 with SMTP id rb10mr3851008pab.118.1440055986508; 
	Thu, 20 Aug 2015 00:33:06 -0700 (PDT)
Received: from localhost.localdomain ([203.70.194.104])
	by smtp.gmail.com with ESMTPSA id mi6sm3246201pdb.1.2015.08.20.00.33.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Aug 2015 00:33:05 -0700 (PDT)
From: Yen-Chin Lee <coldnew.tw@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 07:32:47 +0000
Message-Id: <1440055967-28503-1-git-send-email-coldnew.tw@gmail.com>
X-Mailer: git-send-email 2.3.6
Subject: [PATCH] uclibc: Add SRCBRANCH for use by SRC_URI
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
X-List-Received-Date: Thu, 20 Aug 2015 07:33:06 -0000

Add SRCBRANCH to control git branch.

Signed-off-by: Yen-Chin Lee <coldnew.tw@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 14a577f..e179fc7 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -4,7 +4,9 @@ PV = "0.9.33+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
 
-SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
+SRCBRANCH ??= "master"
+
+SRC_URI = "git://uclibc.org/uClibc.git;branch=${SRCBRANCH} \
         file://uClibc.machine \
         file://uClibc.distro \
         file://obstack.cfg \
-- 
2.3.6


