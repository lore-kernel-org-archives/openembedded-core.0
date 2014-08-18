Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CE79E70E34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 05:23:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I5Nl6Y025989
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 22:23:48 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 17 Aug 2014 22:23:43 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 13:19:21 +0800
Message-ID: <6428f634c556ba5fe72378b34a52950ef4780935.1408339065.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408339065.git.Chong.Lu@windriver.com>
References: <cover.1408339065.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] perl: fix the output format of all tests
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
X-List-Received-Date: Mon, 18 Aug 2014 05:23:50 -0000
Content-Type: text/plain

We should use "PASS:|FAIL:|SKIP: testname" to output results of ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/perl/perl-5.20.0/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-5.20.0/run-ptest b/meta/recipes-devtools/perl/perl-5.20.0/run-ptest
index ed59b4b..1e2dd1b 100644
--- a/meta/recipes-devtools/perl/perl-5.20.0/run-ptest
+++ b/meta/recipes-devtools/perl/perl-5.20.0/run-ptest
@@ -1,2 +1,2 @@
 #!/bin/sh
-cd t && ./TEST | sed -u -e 's/^\([^. \t]*\)\.\.\.\+ok/PASS: \1/' -e 's/^\([^. \t]*\)\.\.\.\+skipped/SKIP: \1/' -e 's/^\([^. \t]*\)\.\.\.\+\(.*\)/FAIL: \1\n\2/'
+cd t && ./TEST | sed -u -e 's|\(.*\) .* ok$|PASS: \1|' -e 's|\(.*\) .* skipped|SKIP: \1|' -e 's|\(.*\) \.\(.*\)|FAIL: \1|'
-- 
1.9.1


