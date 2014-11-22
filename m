Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14B2D60030
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Nov 2014 04:35:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAM4Zw71008970
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 20:35:58 -0800 (PST)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 21 Nov 2014 20:35:57 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 22 Nov 2014 12:35:52 +0800
Message-ID: <1416630954-13871-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH 1/3] binconfig.bbclass: introduce BINCONFIG_FILES variable
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
X-List-Received-Date: Sat, 22 Nov 2014 04:36:02 -0000
Content-Type: text/plain

This allows binary configs being able to be overridden in recipes.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/binconfig.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index cbc4173..db25b77 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -1,4 +1,5 @@
-FILES_${PN}-dev += "${bindir}/*-config"
+BINCONFIG_FILES ?= "${bindir}/*-config"
+FILES_${PN}-dev += "${BINCONFIG_FILES}"
  
 # The namespaces can clash here hence the two step replace
 def get_binconfig_mangle(d):
-- 
1.8.4.1


