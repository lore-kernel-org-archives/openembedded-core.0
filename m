Return-Path: <santhosh.nadig@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 619657C200
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 15:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id CA3BC18484
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 16:35:29 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id SKdd2htFu1_F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 16:35:29 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 36E4218483
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 16:35:29 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 236CF1A077
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 16:35:29 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 184661A061
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 16:35:29 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 16:35:29 +0100 (CET)
Received: from lnxsanthosn.se.axis.com (lnxsanthosn.se.axis.com [10.94.106.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 0C2AD2E3D;
	Tue, 12 Feb 2019 16:35:29 +0100 (CET)
Received: by lnxsanthosn.se.axis.com (Postfix, from userid 11451)
	id 02F07409A9; Tue, 12 Feb 2019 16:35:28 +0100 (CET)
From: Santhosh Nadig <santhosh.nadig@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2019 16:35:14 +0100
Message-Id: <20190212153514.18497-1-santhosn@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Cc: Santhosh Nadig <santhosn@axis.com>
Subject: [PATCH] libgfortran: Set license to GPL-3.0-with-GCC-exception
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
X-List-Received-Date: Tue, 12 Feb 2019 15:35:29 -0000

libgfortran did not have the GCC exception in the same manner as
libgcc had.

Change-Id: If48ab6e6775da235c8fdd0ca4e835acf1e831252
Signed-off-by: Santhosh Nadig <santhosn@axis.com>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 05237647df..4b7b7b2aca 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -53,6 +53,11 @@ PACKAGES = "\
     libgfortran-dev \
     libgfortran-staticdev \
 "
+
+LICENSE_${PN} = "GPL-3.0-with-GCC-exception"
+LICENSE_${PN}-dev = "GPL-3.0-with-GCC-exception"
+LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception"
+
 FILES_${PN} = "${libdir}/libgfortran.so.*"
 FILES_${PN}-dev = "\
     ${libdir}/libgfortran*.so \
-- 
2.11.0


