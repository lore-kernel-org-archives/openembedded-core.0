Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0E116D138
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 12:48:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rATCm1jQ027934
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 04:48:01 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 29 Nov 2013 04:48:01 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 20:48:16 +0800
Message-ID: <9a6dd06876eb44f3ce758f4fe95b5d39f79ec7a0.1385728901.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385728901.git.Qi.Chen@windriver.com>
References: <cover.1385728901.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/18] lsbtest: de-bash script to remove bash dependency
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
X-List-Received-Date: Fri, 29 Nov 2013 12:48:02 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

De-bash scripts in lsbtest to make it not dependent on bash.

[YOCTO #5555]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
index af1d61c..3901199 100644
--- a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
+++ b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 # Copyright (C) 2012 Wind River Systems, Inc.
 #
@@ -272,7 +272,7 @@ then
 fi
 
 if ! `grep -F -q "noarch-suse" ${PLATFORM_FILE}`; then
-	if [ ${ARCH} == i686 ];then
+	if [ ${ARCH} = i686 ];then
 		echo "i486-suse" >> ${PLATFORM_FILE}
 		echo "i486-noarch" >> ${PLATFORM_FILE}
 		echo "i486-pc" >> ${PLATFORM_FILE}
-- 
1.7.9.5


