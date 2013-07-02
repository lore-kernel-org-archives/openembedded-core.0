Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qe0-f49.google.com (mail-qe0-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8094662062
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 14:15:05 +0000 (UTC)
Received: by mail-qe0-f49.google.com with SMTP id cz11so2344161qeb.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Y0zBrAntAb23lkj++0ekB21fsNmxRQZeFLAKD9+AUrA=;
	b=zC2OJlzRCgv6HPy6XXX+58Z+Y0F/t+zwqOl1YhqaFQhttoU6p9VdlhiC2w9BhPK/fK
	DsK/Irklu52DeavRpzCAm+fHRaQXR9t1hZmaDTnZ+R9iVWbTmuJmbv2uBSjPFYlAlwcu
	dQIQxVfuH0tniG0vwZZrC5Bz51x6+2OrxQDH82hgTgVQj3hfO+ULYMYTB3qMz1XXICkj
	HiuviJ9YXlfBr2/T0uylkBzGDkiYVH6nKxEnIDkCxQAgxRA4xpth4bNY8y8q/jjFr1G1
	JBfaDNwnRnxe0/aDdnHvaeIK8spKb/gnm1Xw1dTY2lxUjhKaBJEjlm+nSBQKE2y+XcV7
	rRyw==
X-Received: by 10.229.170.78 with SMTP id c14mr1476393qcz.71.1372774506308;
	Tue, 02 Jul 2013 07:15:06 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.194.146])
	by mx.google.com with ESMTPSA id 15sm37190458qaa.9.2013.07.02.07.15.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 07:15:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  2 Jul 2013 11:14:41 -0300
Message-Id: <1372774482-16476-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1372774482-16476-1-git-send-email-otavio@ossystems.com.br>
References: <1372774482-16476-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/4] lttng-ust: Update to 2.2.0 based release
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
X-List-Received-Date: Tue, 02 Jul 2013 14:15:05 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../lttng-ust/build-Fix-out-of-tree-build.patch    | 28 ++++++++++++++++++++++
 .../{lttng-ust_2.1.2.bb => lttng-ust_2.2.0.bb}     |  6 ++---
 2 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/build-Fix-out-of-tree-build.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.1.2.bb => lttng-ust_2.2.0.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/build-Fix-out-of-tree-build.patch b/meta/recipes-kernel/lttng/lttng-ust/build-Fix-out-of-tree-build.patch
new file mode 100644
index 0000000..cc3220a
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/build-Fix-out-of-tree-build.patch
@@ -0,0 +1,28 @@
+From d5a822fbeaec69e86c6af1f0ab8db0ff030f6678 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Tue, 2 Jul 2013 10:25:06 -0300
+Subject: [PATCH] build: Fix out-of-tree build
+
+To allow out-of-tree build, we need to include top_buildir in include
+directories or the generated config header won't be found.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ liblttng-ust-comm/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/liblttng-ust-comm/Makefile.am b/liblttng-ust-comm/Makefile.am
+index 2ae997c..065dbbf 100644
+--- a/liblttng-ust-comm/Makefile.am
++++ b/liblttng-ust-comm/Makefile.am
+@@ -1,4 +1,4 @@
+-AM_CPPFLAGS = -I$(top_srcdir)/include
++AM_CPPFLAGS = -I$(top_builddir)/include -I$(top_srcdir)/include
+ 
+ noinst_LTLIBRARIES = liblttng-ust-comm.la
+ 
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.1.2.bb b/meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-ust_2.1.2.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb
index 93852b0..d03f207 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.1.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb
@@ -17,13 +17,13 @@ RPROVIDES_${PN} = "lttng2-ust"
 RREPLACES_${PN} = "lttng2-ust"
 RCONFLICTS_${PN} = "lttng2-ust"
 
-SRCREV = "3f7a0876566a432ad2cc2b27a2725641e36da92d"
-PV = "2.1.2"
-PR = "r0"
+SRCREV = "cfaee541fea7f5760b5501913c6902f5e4da9dba"
+PV = "2.2.0"
 PE = "2"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git \
 	   file://depends-liblttng-ust-tracepoin.patch \
+	   file://build-Fix-out-of-tree-build.patch \
 	   "
 
 S = "${WORKDIR}/git"
-- 
1.8.3.1


