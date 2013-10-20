Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8FB1615AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 08:02:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9K82WBd022827
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 01:02:33 -0700 (PDT)
Received: from mliu3-desktop.corp.ad.wrs.com (128.224.162.145) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Sun, 20 Oct 2013 01:02:32 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 20 Oct 2013 16:02:27 +0800
Message-ID: <1382256149-14223-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH V4 1/3] base-files: remove invalid entries from /etc/shells
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
X-List-Received-Date: Sun, 20 Oct 2013 08:02:32 -0000
Content-Type: text/plain

It's more reasonable and secure to keep /etc/shells a minimal file, and
then entries for valid shells be added dynamically to the system, only if
the packages that provide them are supported.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-core/base-files/base-files/shells | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/shells b/meta/recipes-core/base-files/base-files/shells
index ce39b3d..3f63987 100644
--- a/meta/recipes-core/base-files/base-files/shells
+++ b/meta/recipes-core/base-files/base-files/shells
@@ -1,8 +1,2 @@
 # /etc/shells: valid login shells
 /bin/sh
-/bin/ash
-/bin/bash
-/bin/dash
-/bin/ksh
-/usr/bin/ksh
-/usr/bin/screen
-- 
1.8.4.1


