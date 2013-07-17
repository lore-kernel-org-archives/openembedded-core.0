Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97EEA6B205
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 22:34:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6HMYlhH000321
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 15:34:47 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 17 Jul 2013 15:34:46 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 15:34:46 -0700
Message-ID: <1374100486-1027-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] curl: add upstream status to patch
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
X-List-Received-Date: Wed, 17 Jul 2013 22:34:46 -0000
Content-Type: text/plain

Add upstream-status to configure_ac.patch.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-support/curl/curl/configure_ac.patch |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/curl/curl/configure_ac.patch b/meta/recipes-support/curl/curl/configure_ac.patch
index 98d8387..b8bd304 100644
--- a/meta/recipes-support/curl/curl/configure_ac.patch
+++ b/meta/recipes-support/curl/curl/configure_ac.patch
@@ -1,3 +1,5 @@
+Upstream-Status:  Pending
+
 --- a/configure.ac
 +++ b/configure.ac
 @@ -281,7 +281,7 @@ dnl ************************************
-- 
1.7.3.4


