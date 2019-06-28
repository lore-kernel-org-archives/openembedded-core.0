Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE4F07EA07
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 12:00:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5SC0Jt2023849
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:00:40 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Fri, 28 Jun 2019 05:00:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2019 20:23:39 +0800
Message-ID: <64e980f69ca3259e1181d8943f67be7847760885.1561724553.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561724553.git.liezhi.yang@windriver.com>
References: <cover.1561724553.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] ext-sdk-prepare.py: python2 -> python3
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
X-List-Received-Date: Fri, 28 Jun 2019 12:00:49 -0000
Content-Type: text/plain

This script is python3 indeed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/files/ext-sdk-prepare.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index 96c5212..163d5e9 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Prepare the build system within the extensible SDK
 
-- 
2.7.4


