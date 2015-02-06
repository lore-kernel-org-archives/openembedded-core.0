Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFC0472E58
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 16:31:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t16GVF0G001344
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Feb 2015 08:31:15 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 6 Feb 2015 08:31:15 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 6 Feb 2015 11:31:08 -0500
Message-ID: <985259afe58317d3ab0146979207f73d7670db29.1423237494.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1423237494.git.bruce.ashfield@windriver.com>
References: <cover.1423237494.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] kern-tools: import patch performance improvements
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
X-List-Received-Date: Fri, 06 Feb 2015 16:31:23 -0000
Content-Type: text/plain

Updating the SRCREV for the following commits:

  4822d22b65c2 kgit-meta: dont run kgit-s2q for non-leaf nodes
  3e3de1b9cdec createme: remove meta branch checks

With these, we save 10 seconds on the average patch phase, and
significantly more if very long patch queues are used.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index ce872354f23c..acdb2c6b6015 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native"
 
-SRCREV = "23345b8846fe4bd167efdf1bd8a1224b2ba9a5ff"
+SRCREV = "53bf01d565957f6dba95fbd7126f1a3b3dff64a5"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.1.0


