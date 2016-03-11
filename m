Return-Path: <helio.castro@bmw-carit.de>
X-Greylist: delayed 351 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Mar 2016 14:31:00 UTC
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 1ECB76FF7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 14:31:00 +0000 (UTC)
Received: from exchange2010.bmw-carit.intra ([192.168.100.28]:10670
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Helio.Castro@bmw-carit.de>)
	id 1aeO03-0008O1-37 for openembedded-core@lists.openembedded.org;
	Fri, 11 Mar 2016 15:25:08 +0100
Received: from localhost (172.20.20.223) by Exchange2010.bmw-carit.intra
	(192.168.100.28) with Microsoft SMTP Server (TLS) id 14.3.123.3;
	Fri, 11 Mar 2016 15:25:07 +0100
X-CTCH-RefID: str=0001.0A0C0205.56E2D544.0001, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: <helio.castro@bmw-carit.de>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Mar 2016 15:24:44 +0100
Message-ID: <1457706284-38023-1-git-send-email-helio.castro@bmw-carit.de>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
X-Originating-IP: [172.20.20.223]
Subject: [PATCH] gcc: Fix the license on GNU OpenMP
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
X-List-Received-Date: Fri, 11 Mar 2016 14:31:03 -0000
Content-Type: text/plain

From: Helio Chissini de Castro <helio.castro@bmw-carit.de>

Poky jethro has libgomp ( GNU OpenMP ) license marked as GPL-3.0,
where's in fact the correct is GPL-3.0 with GCC Library Runtime Exception

As stated on https://github.com/gcc-mirror/gcc/blob/master/libgomp/libgomp.h
header license:
 ...
   Under Section 7 of GPL version 3, you are granted additional
   permissions described in the GCC Runtime Library Exception, version
   3.1, as published by the Free Software Foundation.
 ...

Signed-off-by: Helio Chissini de Castro <helio.castro@bmw-carit.de>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 33 ++++---------------------------
 1 file changed, 4 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 690d780..98cc4b6 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -93,35 +93,10 @@ PACKAGES = "\
     libatomic-staticdev \
 "
 
-# Most libraries are licensed with the exception, but
-# one library is really GPLv3.
-#
-LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception & GPLv3"
-LICENSE_libstdc++ = "GPL-3.0-with-GCC-exception"
-LICENSE_libstdc++-precompile-dev = "GPL-3.0-with-GCC-exception"
-LICENSE_libstdc++-dev = "GPL-3.0-with-GCC-exception"
-LICENSE_libstdc++-staticdev = "GPL-3.0-with-GCC-exception"
-LICENSE_libg2c = "GPL-3.0-with-GCC-exception"
-LICENSE_libg2c-dev = "GPL-3.0-with-GCC-exception"
-LICENSE_libssp = "GPL-3.0-with-GCC-exception"
-LICENSE_libssp-dev = "GPL-3.0-with-GCC-exception"
-LICENSE_libssp-staticdev = "GPL-3.0-with-GCC-exception"
-LICENSE_libgfortran = "GPL-3.0-with-GCC-exception"
-LICENSE_libgfortran-dev = "GPL-3.0-with-GCC-exception"
-LICENSE_libgfortran-staticdev = "GPL-3.0-with-GCC-exception"
-LICENSE_libmudflap = "GPL-3.0-with-GCC-exception"
-LICENSE_libmudflap-dev = "GPL-3.0-with-GCC-exception"
-LICENSE_libmudflap-staticdev = "GPL-3.0-with-GCC-exception"
-LICENSE_libquadmath = "GPL-3.0-with-GCC-exception"
-LICENSE_libquadmath-dev = "GPL-3.0-with-GCC-exception"
-LICENSE_libquadmath-staticdev = "GPL-3.0-with-GCC-exception"
-LICENSE_libatomic = "GPL-3.0-with-GCC-exception"
-LICENSE_libatomic-dev = "GPL-3.0-with-GCC-exception"
-LICENSE_libatomic-staticdev = "GPL-3.0-with-GCC-exception"
-
-LICENSE_libgomp = "GPLv3"
-LICENSE_libgomp-dev = "GPLv3"
-LICENSE_libgomp-staticdev = "GPLv3"
+LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception"
+LICENSE_${PN} = "GPL-3.0-with-GCC-exception"
+LICENSE_${PN}-dev = "GPL-3.0-with-GCC-exception"
+LICENSE_${PN}-staticdev = "GPL-3.0-with-GCC-exception"
 
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
-- 
2.5.0


