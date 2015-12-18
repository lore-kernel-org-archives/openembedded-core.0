Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD45F6FF77
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 20:44:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBIKief2003004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 18 Dec 2015 12:44:40 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 18 Dec 2015 12:44:40 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 18 Dec 2015 15:44:33 -0500
Message-ID: <0aa694bda5500aef7d326fa880c77b726c8c2779.1450471022.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1450471022.git.bruce.ashfield@windriver.com>
References: <cover.1450471022.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] lttng-modules: fix build issue against kernel 4.4
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
X-List-Received-Date: Fri, 18 Dec 2015 20:44:41 -0000
Content-Type: text/plain

Updating to the latest 2.7 stable commit which incorporates changes
for building against the 4.4-rc kernel series.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-modules_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
index 46cc1f012909..33aa12551e2e 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=362844633a08753bd96ab322a6c7f9f6 \
 
 inherit module
 
-SRCREV = "4247236df9113aca059d79c78d85779c1ff4edb0"
+SRCREV = "f4b27072a77b43af2fea72d6700bd64eb59a39f1"
 PV = "2.7.0+git${SRCPV}"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
-- 
2.1.0


