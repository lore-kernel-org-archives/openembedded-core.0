Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9886960097
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 22:56:24 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YJrp2-0003C3-RF from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Feb 2015 14:56:24 -0800
Received: from localhost (147.34.91.1) by SVR-ORW-FEM-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 6 Feb 2015 14:56:24 -0800
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Feb 2015 16:56:23 -0600
Message-ID: <1423263383-15461-1-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] lttng-tools: use perl-misc, perl-modules in ptest deps
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
X-List-Received-Date: Fri, 06 Feb 2015 22:56:32 -0000
Content-Type: text/plain

The testcases for lttng-tools use the "prove" command from perl-misc,
which needs many modules not in the base perl package.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.5.3.bb b/meta/recipes-kernel/lttng/lttng-tools_2.5.3.bb
index 87052ebb8e82..931e278ea583 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.5.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.5.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
 DEPENDS = "liburcu popt lttng-ust libxml2"
-RDEPENDS_${PN}-ptest += "make perl bash"
+RDEPENDS_${PN}-ptest += "make bash perl-misc perl-modules"
 
 SRCREV = "75d966798cf8cbe8ca12773c2bf2822983bd78a3"
 
-- 
1.9.3


