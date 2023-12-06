Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74045C46CA3
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 08:48:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27317.1701852521181794092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 00:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HS+QV1Vd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0704b166eb=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B67MIUR030589;
	Wed, 6 Dec 2023 08:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=1jMGf
	4dEq+T6OYSw+6VUlpDntb8+hXxZ71libHSop5g=; b=HS+QV1VdZkv1WgYG3IB7g
	djlzllmekzk3cODdhQFF1EwlrUDOxJ02vg8uTix//V+jU7MuLadxUZEGsBjFABDB
	Z/cFzH9Gwc7FgVeFi5myoJcCSI5p7wnVPDOr6cqJQ9th0wNneggIWG04MjHXnoXK
	9KKhT4VGEA32ZTsgQ1cnSy0fW5JtPNLEATefddp6bv0ahSOWKCrIR+xuNZSl6ls6
	m18ty/kr29dvoP/qo1zBMGwtHg9/j1DaCh90W5gMn+BdOf+fcg6z5KFwkiDSPBca
	VbFfkE0OH4t9jIzMeO0+sJDZu8cNXDkEe+sH/jAYhxe74yGcJFyY7FtvoZuMnNEY
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53gbdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 06 Dec 2023 08:48:38 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 00:48:40 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 00:48:40 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] socat: 1.7.4.4 -> 1.8.0.0
Date: Wed, 6 Dec 2023 00:48:35 -0800
Message-ID: <20231206084836.413144-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ugPCaS0S22lpz7kDxvuDZp1cquz3fmZc
X-Proofpoint-GUID: ugPCaS0S22lpz7kDxvuDZp1cquz3fmZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312060070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 08:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191873

From: Hongxu Jia <hongxu.jia@eng.windriver.com>

1. No chagne on license [1], original md5 is not right because
   beginline=241 does not match

2. Fix two compile and one install failures

[1] https://repo.or.cz/socat.git/blobdiff/c9ff62744f4140418f4edce7e395d1a30e9161b1..2da070164d454971d5c970b5278e645051f0d0f7:/README

Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
---
 .../0001-fix-compile-procan.c-failed.patch    | 62 +++++++++++++++++++
 .../{socat_1.7.4.4.bb => socat_1.8.0.0.bb}    |  8 ++-
 2 files changed, 67 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.4.4.bb => socat_1.8.0.0.bb} (86%)

diff --git a/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch b/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
new file mode 100644
index 0000000000..9051ae1abe
--- /dev/null
+++ b/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
@@ -0,0 +1,62 @@
+From 4f887cc665c9a48b83e20ef4abe57afa7e365e0e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@eng.windriver.com>
+Date: Tue, 5 Dec 2023 23:02:22 -0800
+Subject: [PATCH v2] fix compile procan.c failed
+
+1. Compile socat failed if out of tree build (build dir != source dir)
+...
+gcc -c -D CC="gcc" -o procan.o procan.c
+cc1: fatal error: procan.c: No such file or directory
+...
+Explicitly add $srcdir to makefile rule
+
+2. Compile socat failed if multiple words in $(CC), such as CC="gcc -m64"
+...
+from ../socat-1.8.0.0/procan.c:10:
+../socat-1.8.0.0/sysincludes.h:18:10: fatal error: inttypes.h: No such file or directory
+   18 | #include <inttypes.h>   /* uint16_t */
+...
+
+In commit [Procan: print umask, CC, and couple more new infos][1],
+it defeines marcro CC in C source, the space in CC will break
+C source compile. Use first word of $(CC) to defeine marco CC
+
+[1] https://repo.or.cz/socat.git/commit/cd5673dbd0786c94e0b3ace7e35fab14c01e3185
+
+Upstream-Status: Submitted [socat@dest-unreach.org]
+Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
+---
+ Makefile.in | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index c01b1a4..48dad69 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -109,8 +109,8 @@ depend: $(CFILES) $(HFILES)
+ socat: socat.o libxio.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ socat.o libxio.a $(CLIBS)
+ 
+-procan.o: procan.c
+-	$(CC) $(CFLAGS) -c -D CC=\"$(CC)\" -o $@ procan.c
++procan.o: $(srcdir)/procan.c
++	$(CC) $(CFLAGS) -c -D CC=\"$(firstword $(CC))\" -o $@ $(srcdir)/procan.c
+ 
+ PROCAN_OBJS=procan_main.o procan.o procan-cdefs.o hostan.o error.o sycls.o sysutils.o utils.o vsnprintf_r.o snprinterr.o
+ procan: $(PROCAN_OBJS)
+@@ -132,9 +132,9 @@ install: progs $(srcdir)/doc/socat.1
+ 	mkdir -p $(DESTDIR)$(BINDEST)
+ 	$(INSTALL) -m 755 socat $(DESTDIR)$(BINDEST)/socat1
+ 	ln -sf socat1 $(DESTDIR)$(BINDEST)/socat
+-	$(INSTALL) -m 755 socat-chain.sh  $(DESTDIR)$(BINDEST)
+-	$(INSTALL) -m 755 socat-mux.sh    $(DESTDIR)$(BINDEST)
+-	$(INSTALL) -m 755 socat-broker.sh $(DESTDIR)$(BINDEST)
++	$(INSTALL) -m 755 $(srcdir)/socat-chain.sh  $(DESTDIR)$(BINDEST)
++	$(INSTALL) -m 755 $(srcdir)/socat-mux.sh    $(DESTDIR)$(BINDEST)
++	$(INSTALL) -m 755 $(srcdir)/socat-broker.sh $(DESTDIR)$(BINDEST)
+ 	$(INSTALL) -m 755 procan $(DESTDIR)$(BINDEST)
+ 	$(INSTALL) -m 755 filan $(DESTDIR)$(BINDEST)
+ 	mkdir -p $(DESTDIR)$(MANDEST)/man1
+-- 
+2.42.0
+
diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
similarity index 86%
rename from meta/recipes-connectivity/socat/socat_1.7.4.4.bb
rename to meta/recipes-connectivity/socat/socat_1.8.0.0.bb
index 5a379380d1..912605c95c 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
@@ -7,11 +7,13 @@ SECTION = "console/network"
 
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
+                    file://README;beginline=241;endline=271;md5=338c05eadd013872abb1d6e198e10a3f"
 
-SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2"
+SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
+           file://0001-fix-compile-procan.c-failed.patch \
+"
 
-SRC_URI[sha256sum] = "fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac"
+SRC_URI[sha256sum] = "e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7"
 
 inherit autotools
 
-- 
2.42.0


