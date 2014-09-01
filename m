Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF55760E49
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 07:04:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8174kRJ010192
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Sep 2014 00:04:47 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 1 Sep 2014 00:04:45 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Sep 2014 03:04:44 -0400
Message-ID: <1409555084-29583-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] perl: add explicit configs for Time-HiRes
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
X-List-Received-Date: Mon, 01 Sep 2014 07:04:49 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The compilation of Time-HiRes tries to compile and run the testing
program but definitely fails since we are cross compiling:
Looking for clock_gettime()... ./tmp26733: ./tmp26733: cannot execute binary file
Looking for clock_getres()... ./tmp26733: ./tmp26733: cannot execute binary file

so add explicit configs to avoid the auto detecting.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/perl/perl-5.20.0/config.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl-5.20.0/config.sh b/meta/recipes-devtools/perl/perl-5.20.0/config.sh
index 2532c8d..1ac1355 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/config.sh
+++ b/meta/recipes-devtools/perl/perl-5.20.0/config.sh
@@ -1104,3 +1104,10 @@ usekernprocpathname='undef'
 usensgetexecutablepath='undef'
 st_ino_sign='1'
 st_ino_size='4'
+
+# for Time-HiRes
+d_clock_nanosleep='define'
+d_clock_gettime='define'
+d_clock_getres='define'
+d_clock='define'
+d_nanosleep='define'
-- 
2.0.0


