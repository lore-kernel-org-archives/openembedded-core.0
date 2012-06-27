Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SjndY-0005Sc-GP
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 10:30:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5R8JE36009330
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 01:19:14 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 27 Jun 2012 01:19:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jun 2012 16:19:52 +0800
Message-ID: <a74dfe799d4bfdfccdb5f28677093a7d70a77430.1340773014.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1340773014.git.liezhi.yang@windriver.com>
References: <cover.1340773014.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/2] icu 3.6: dropp apply=yes from path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2012 08:30:41 -0000
Content-Type: text/plain

The "apply=yes" doesn't appear to be necessary, so drop it.

[YOCTO #2664]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/icu/icu-3.6.inc |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/icu/icu-3.6.inc
index 23447d3..d3391fe 100644
--- a/meta/recipes-support/icu/icu-3.6.inc
+++ b/meta/recipes-support/icu/icu-3.6.inc
@@ -3,11 +3,13 @@ DESCRIPTION = "The International Component for Unicode (ICU) is a mature, portab
 HOMEPAGE = "http://www-01.ibm.com/software/globalization/icu/index.jsp"
 
 BASE_SRC_URI = "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-3_6-src.tgz \
-           file://gccfix.patch;apply=yes \
+           file://gccfix.patch \
            file://fix-parallel-build.patch \
-           file://use-g++-for-linking.patch;apply=yes"
+           file://use-g++-for-linking.patch \
+           "
 SRC_URI = "${BASE_SRC_URI} \
-           file://noldlibpath.patch;apply=yes"
+           file://noldlibpath.patch \
+           "
 SRC_URI_virtclass-native = "${BASE_SRC_URI}"
 
 LICENSE = "ICU"
-- 
1.7.1



