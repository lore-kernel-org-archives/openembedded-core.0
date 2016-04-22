Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A7DF66011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:44:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3M5iaSV020870
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 22:44:36 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Apr 2016 22:44:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2016 22:44:33 -0700
Message-ID: <dc4e0e3653ac28bddfca011c39a7779bba5ec1b0.1461303847.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1461303847.git.liezhi.yang@windriver.com>
References: <cover.1461303847.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] utils.bbclass: warn for deprecated base_contains
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
X-List-Received-Date: Fri, 22 Apr 2016 05:44:37 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/utils.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 81b92cb..cf4bd25 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -24,6 +24,7 @@ def base_version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
     return oe.utils.version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d)
 
 def base_contains(variable, checkvalues, truevalue, falsevalue, d):
+    bb.warn('base_contains is depracated, please use bb.utils.contains instead.')
     return bb.utils.contains(variable, checkvalues, truevalue, falsevalue, d)
 
 def base_both_contain(variable1, variable2, checkvalue, d):
-- 
2.8.0


