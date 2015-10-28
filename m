Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2112F76FD0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 15:21:07 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZrSXD-0007jy-Pt from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Oct 2015 08:21:07 -0700
Received: from localhost (147.34.91.1) by SVR-ORW-FEM-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 28 Oct 2015 08:21:07 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Oct 2015 10:21:05 -0500
Message-ID: <1446045665-25881-1-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.4.3
MIME-Version: 1.0
Subject: [PATCH] lttng-tools: add libgcc to RDEPENDS
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
X-List-Received-Date: Wed, 28 Oct 2015 15:21:08 -0000
Content-Type: text/plain

The lttng-sessiond program uses pthread_cancel, whose implementation
in glibc requires libgcc_s.so.1 to be present.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
index 909acc37a75d..c7a7c4c5f284 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
 DEPENDS = "liburcu popt lttng-ust libxml2"
+RDEPENDS_${PN} = "libgcc"
 RDEPENDS_${PN}-ptest += "make perl bash"
 
 SRCREV = "d522c1f14285e2e8b10b7c0cd011847696ffe779"
-- 
2.4.3


