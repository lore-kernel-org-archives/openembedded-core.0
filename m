Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D51D9757D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 14:48:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t52EmthA027738
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jun 2015 07:48:55 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 07:48:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jun 2015 07:48:50 -0700
Message-ID: <d7eb6294438bb81d7b0990ab3b669a8dc36a2755.1433256486.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433256486.git.liezhi.yang@windriver.com>
References: <cover.1433256486.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] python-nose: 1.2.1 -> 1.3.6
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
X-List-Received-Date: Tue, 02 Jun 2015 14:48:57 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{python-nose_1.2.1.bb => python-nose_1.3.6.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-nose_1.2.1.bb => python-nose_1.3.6.bb} (74%)

diff --git a/meta/recipes-devtools/python/python-nose_1.2.1.bb b/meta/recipes-devtools/python/python-nose_1.3.6.bb
similarity index 74%
rename from meta/recipes-devtools/python/python-nose_1.2.1.bb
rename to meta/recipes-devtools/python/python-nose_1.3.6.bb
index f55461d..d6e8fc1 100644
--- a/meta/recipes-devtools/python/python-nose_1.2.1.bb
+++ b/meta/recipes-devtools/python/python-nose_1.3.6.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "735e3f1ce8b07e70ee1b742a8a53585a"
-SRC_URI[sha256sum] = "2171e9202d118d302d5db1decb52dd862b79e2a626ca19653a6914574a6ca7d9"
+SRC_URI[md5sum] = "0ca546d81ca8309080fc80cb389e7a16"
+SRC_URI[sha256sum] = "f61e0909a743eed37b1207e38a8e7b4a2fe0a82185e36f2be252ef1b3f901758"
 
 S = "${WORKDIR}/nose-${PV}"
 
-- 
1.7.9.5


