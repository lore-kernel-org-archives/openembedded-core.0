Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 893A87639E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:44:00 +0000 (UTC)
Received: by lbbud7 with SMTP id ud7so24652250lbb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=XNKQDv8q7+t1mTM+urey7pCcd0InyHe2Td/yls/kEiM=;
	b=tuk7K0jH2bYZVos9mAoRqzkEqvzvsu/kAq/MmE4JXDcmBgh6v6bHKoPzOhnywMk8+k
	oN8nvTm+cC8gllo0u3zSkVhbVYEmL5tQKVAvEy84k6HwMtI9Kxp4Y7F8STkgEsNIqXt5
	tZ9Z+8hwQ1BF9IZwT3u8c+eHxvERT37iHBuJF40Hc3wnTyNzsrgEqcUR7B62F3bPlVwd
	IuzoiqjURNWc4uFEtiGvmY0eatb0C/ddZbM/5fwdXnd6WMpihIft1r5dzWO8jad7sJbS
	W+ZzpEW07LCJsaNvIKY8zSWwZJiTJx+t6c2GjRNUpkHWhLiyAX8wpW6iX89U+1PcaQDN
	IuyQ==
X-Received: by 10.112.166.2 with SMTP id zc2mr44561579lbb.29.1438267440377;
	Thu, 30 Jul 2015 07:44:00 -0700 (PDT)
Received: from umbar.auriga.ru (cl-1614.mbx-01.si.sixxs.net.
	[2001:15c0:65ff:64d::2])
	by smtp.gmail.com with ESMTPSA id uf7sm294428lbb.29.2015.07.30.07.43.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 07:43:59 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 17:43:55 +0300
Message-Id: <1438267435-8992-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.4.6
Subject: [PATCH] adt-installer: use DEPLOY_DIR in ANT_DEPLOY expansion
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
X-List-Received-Date: Thu, 30 Jul 2015 14:44:06 -0000

Currently adt-installer uses "${TMPDIR}/deploy/sdk/" as a deployment dir.
This doesn't interact well with DEPLOY_DIR reassignment. So let's use
"${DEPLOY_DIR}/sdk/" instead.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-devtools/installer/adt-installer_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 07070b5..8d31ae5 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -33,7 +33,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 PR = "r11"
 
-ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
+ADT_DEPLOY = "${DEPLOY_DIR}/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
 S = "${WORKDIR}/opkg-${PV}"
 
-- 
2.4.6


