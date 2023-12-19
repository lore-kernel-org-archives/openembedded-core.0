Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED06C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:35:48 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.8732.1702978544505259674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="145520785"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="145520785"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:35:42 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B34DCE8BE9
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:35:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F07B2C1D79
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:35:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 91BC9202C2A05
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:35:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4E1A31A006F;
	Tue, 19 Dec 2023 17:35:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] repo: upgrade 2.39 -> 2.40
Date: Tue, 19 Dec 2023 17:35:31 +0800
Message-Id: <1702978531-7827-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--4.237500-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mr3hng3KTHeTaO7PyvQAVVyqDz
	5hsiacLf0CP47K67Rnkz6w9EspHmqSSKeTIQJ1bzKsurITpSv+MXivwflisSrB8gYJm5tOzEzdl
	o26al4KEV5jzZ8JRQsz0ZAfBnk8YHEBjxbgiHN4oOWDFvyz6vQEhMRy+qNwXgxkgVOiiqs6xSgk
	le/Q26sDPWEKWfuvU5xiiH+oQX+1UBOHW58ozCWk7nLUqYrlslFIuBIWrdOePfUZT83lbkENb2e
	7N2CFQyN5at2BIGOiY4jMHxU2kK0DsE6PWVyEksngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIcSqb
	xBgG0w4oi0MTWb4DLPvFrAnw4znQzA4ceNoWlp9+6uhkKKcBo3kzEs/hn/7iQ4D8OzkL/nJCU3o
	OgaHaLQO+fqkQz32hY6sNanwFyJ+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192705

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Don't log spam 'repo sync' by default
-tox: Remove pylint timeout
-Update commit-msg hook
-sync: Fix partial sync false positive
-repo: add repo main script's directory to PYTHONPATH.
-info: Handle undefined mergeBranch
-manifest_xml: support nested submanifests
-repo_logging: Ensure error details are printed
-repo: Use the worktree when checking the repo rev.
-git_superproject: tell git that superproject is bare
-Correctly handle schema-less URIs for remote fetch URL
-main: Log ManifestParseError exception messages
-repo: Remove unreachable code.
-cleanup: Update codebase to expect Python 3.6
-sync: PersistentTransport call parent init
-sync: TeeStringIO write should return int
-Correctly handle schema-less URIs for remote fetch URL
-main: Log ManifestParseError exception messages
-repo: Remove unreachable code.
-cleanup: Update codebase to expect Python 3.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.39.bb => repo_2.40.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.39.bb => repo_2.40.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.39.bb b/meta/recipes-devtools/repo/repo_2.40.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.39.bb
rename to meta/recipes-devtools/repo/repo_2.40.bb
index a0633a5cbb..e749ee1b76 100644
--- a/meta/recipes-devtools/repo/repo_2.39.bb
+++ b/meta/recipes-devtools/repo/repo_2.40.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "b99272c601bc5f466c3cfc782bb852c2c967ad27"
+SRCREV = "4c80921d22c20a28d531c9e3e8a0ce4433c6509d"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


