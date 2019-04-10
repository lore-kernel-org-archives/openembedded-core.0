Return-Path: <Lei.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 740EB7D886
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:04:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3A6498m016905
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Apr 2019 23:04:31 -0700
Received: from pek-lyang0-u17.wrs.com (128.224.162.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 9 Apr 2019 23:04:11 -0700
From: Lei Yang <Lei.Yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Apr 2019 14:04:09 +0800
Message-ID: <20190410060409.26643-1-Lei.Yang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] recipetool: add missed module
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
X-List-Received-Date: Wed, 10 Apr 2019 06:04:40 -0000
Content-Type: text/plain

When I use recipetool to add a new recipe, it says:

[snip]
sys.exit(14)
NameError: name 'sys' is not defined
[snip]

Signed-off-by: Lei Yang <Lei.Yang@windriver.com>
---
 scripts/lib/recipetool/create_npm.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 03667887fc..0b09ed0b04 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -16,6 +16,7 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import os
+import sys
 import logging
 import subprocess
 import tempfile
-- 
2.17.1


