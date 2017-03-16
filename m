Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32782600EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 18:42:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2GIgQTr017813
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Mar 2017 11:42:26 -0700 (PDT)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 11:42:25 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 14:42:14 -0400
Message-ID: <1489689734-10232-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: Christos Zoulas <christos@zoulas.com>
Subject: [PATCH] file: update SRCREV for 5.30 to fix fetch fail on missing commit
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
X-List-Received-Date: Thu, 16 Mar 2017 18:42:27 -0000
Content-Type: text/plain

Machines that cloned a while ago will have the commit, but new
deployments won't because it seems the upstream changed/rebased
and the old commit ID has been garbage-collected away.  Hence
the fetch fails to check out the named commit ID.

Both the old (gone) commit, and the "new" commit show the same
dates and commit log and point at 5.30, so hopefully this is
the right thing to do.  A git diff of the two seems to only show
a blanket uprev of CVS tags and deletion of a couple autogen'd
files, and no real source changes.

Cc: Christos Zoulas <christos@zoulas.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/recipes-devtools/file/file_5.30.bb b/meta/recipes-devtools/file/file_5.30.bb
index 0998fcfa8990..112bf105781e 100644
--- a/meta/recipes-devtools/file/file_5.30.bb
+++ b/meta/recipes-devtools/file/file_5.30.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/file/file.git \
         file://0001-Add-P-prompt-into-Usage-info.patch \
         "
 
-SRCREV = "79814950aafb81ecd6a910c2a8a3b8ec12f3e4a6"
+SRCREV = "3050419355566d2a96c5be97fef0ffae097bbb96"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.11.1


