Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF44A6ABED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 02:28:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5L2Ssdc007302
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 19:28:54 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 20 Jun 2013 19:28:52 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jun 2013 10:28:47 +0800
Message-ID: <47bbd0a32e6a70e191539e221c8cbfafb28e747b.1371781463.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1371781463.git.jackie.huang@windriver.com>
References: <cover.1371781463.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2 v2] Add Upstream-Status for libxml2-CVE-2012-2871.patch
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
X-List-Received-Date: Fri, 21 Jun 2013 02:28:51 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libxml/libxml2/libxml2-CVE-2012-2871.patch     |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
index 3c66a9c..c425142 100644
--- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
+++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
@@ -1,5 +1,7 @@
 libxml2 CVE-2012-2871
 
+Upstream-Status: Backport
+
 the patch come from:
 http://src.chromium.org/viewvc/chrome/trunk/src/third_party/libxml/src \
 /include/libxml/tree.h?r1=56276&r2=149930
-- 
1.7.4.1


