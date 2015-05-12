Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A15DC73F4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 12:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4CC3eLw032401; Tue, 12 May 2015 13:03:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eex-7r-_qO7V; Tue, 12 May 2015 13:03:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4CC3TYe032385
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 12 May 2015 13:03:40 +0100
Message-ID: <1431432209.30971.127.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Khem Raj
	<raj.khem@gmail.com>
Date: Tue, 12 May 2015 13:03:29 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] gcc: Fix packaging for gcc v5
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
X-List-Received-Date: Tue, 12 May 2015 12:03:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Fixes:

ERROR: QA Issue: gcc: Files/directories were installed but not shipped in any package:
  /usr/bin/i586-poky-linux-gcov-tool

with gcc v5.x

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index e348517..47fe1b6 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -83,7 +83,7 @@ FILES_cpp = "\
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
 FILES_cpp-symlinks = "${bindir}/cpp"
 
-FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov"
+FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov*"
 FILES_gcov-symlinks = "${bindir}/gcov"
 
 FILES_g++ = "\



