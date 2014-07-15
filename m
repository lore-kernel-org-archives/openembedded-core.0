Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 18D1C701C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:19:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEJf0b012719
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:19:41 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:19:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:19:09 -0700
Message-ID: <55ef60ee41642e67eb780680a7ff2e28c7a90605.1405433828.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405433828.git.liezhi.yang@windriver.com>
References: <cover.1405433828.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/38] lttng-tools: add perl bash python to RDEPENDS_lttng-tools-ptest
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
X-List-Received-Date: Tue, 15 Jul 2014 14:19:40 -0000
Content-Type: text/plain

Perl script:
lttng-tools-ptest/usr/lib/lttng-tools/ptest/tests/utils/babelstats.pl

Python script:
lttng-tools-ptest/usr/lib/lttng-tools/ptest/tests/regression/run-report.py

Bash script:
[snip]
47 ones

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb |    2 +-
 meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
index db8b65b..0474578 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
 DEPENDS = "liburcu popt lttng-ust"
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make perl bash python"
 
 SRCREV = "5d985544a7ad54afa0514ea7f522a89d8d844860"
 PV = "v2.3.1"
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
index aab9bf6..34b9869 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
 DEPENDS = "liburcu popt lttng-ust"
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make perl bash python"
 
 SRCREV = "8e3234eea2d81f8a962214c570532f8e096a9a8d"
 PV = "v2.4.0"
-- 
1.7.9.5


