Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F94672DAE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 19:19:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1AJJJ3R017455
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Feb 2015 11:19:19 -0800 (PST)
Received: from op3.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 10 Feb 2015 11:19:19 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Feb 2015 14:19:06 -0500
Message-ID: <1423595946-25011-4-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1423595946-25011-1-git-send-email-paul.gortmaker@windriver.com>
References: <1423595946-25011-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] scripts: delete dummy help2man script
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
X-List-Received-Date: Tue, 10 Feb 2015 19:19:21 -0000
Content-Type: text/plain

This was added to try and deal with the cross compile issue of
help2man ; one can not run an ARM binary "./chmod --help" on an
x86-64 host in order to get the help text to create a man page.
This has been primarily an issue with the coreutils package.

However, we have since fixed coreutils to have useful pre-made
manpages and we don't need this script anymore.  And if other
gnu packages are getting useless truncated "dummy" manpages,
we want the build to fail so we can fix those packages in a
similar way, vs. having the issue hidden via a help2man that is
a no-op.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 scripts/help2man | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100755 scripts/help2man

diff --git a/scripts/help2man b/scripts/help2man
deleted file mode 100755
index 2bb8d868bd0c..000000000000
--- a/scripts/help2man
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-exit 1
-- 
2.2.1


