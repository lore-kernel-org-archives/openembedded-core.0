Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C84F6FAD2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 07:17:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s567H3PQ023872
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jun 2014 00:17:03 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.200) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 6 Jun 2014 00:17:03 -0700
From: <rongqing.li@windriver.com>
To: <yanjun.zhu@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 15:17:08 +0800
Message-ID: <1402039028-17192-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] relocate_sdk.py: fix lib path error
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
X-List-Received-Date: Fri, 06 Jun 2014 07:17:12 -0000
Content-Type: text/plain

From: yzhu1 <yanjun.zhu@windriver.com>

In centos 5.9 32bit, ld lib does not contain some flags, so ld
lib is not parsed. So correct lib path is not got from ld lib.

Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
---
 scripts/relocate_sdk.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 05d9fd6..a05a7fa 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -201,7 +201,7 @@ else:
     new_prefix = sys.argv[1].encode()
     new_dl_path = sys.argv[2].encode()
 
-executables_list = sys.argv[3:]
+executables_list = sys.argv[2:]
 
 for e in executables_list:
     perms = os.stat(e)[stat.ST_MODE]
-- 
1.7.10.4


