Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D43106F67B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 06:59:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s276xxFK016411
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 23:00:00 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 22:59:59 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 01:59:32 -0500
Message-ID: <626e4dfde6c256337b7706ad041acec53a4d98c6.1394174908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1394174908.git.liezhi.yang@windriver.com>
References: <cover.1394174908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/14] e2fsprogs: mke2fs: update the manual for the -d option
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
X-List-Received-Date: Fri, 07 Mar 2014 06:59:59 -0000
Content-Type: text/plain

Update the manual for the -d option

[YOCTO #4083]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Reviewed-by: Darren Hart <dvhart@linux.intel.com>
---
 ...s.8.in-update-the-manual-for-the-d-option.patch |   43 ++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch
new file mode 100644
index 0000000..ddd2cb8
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch
@@ -0,0 +1,43 @@
+From 89fca439f1b58595f2f424598a27869f8c7bd815 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 23 Dec 2013 04:43:18 -0500
+Subject: [PATCH 11/11] mke2fs.8.in: update the manual for the -d option
+
+Update the manual for the -d option
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Reviewed-by: Darren Hart <dvhart@linux.intel.com>
+---
+ misc/mke2fs.8.in |    7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/misc/mke2fs.8.in b/misc/mke2fs.8.in
+index fea50da..b1ca486 100644
+--- a/misc/mke2fs.8.in
++++ b/misc/mke2fs.8.in
+@@ -52,6 +52,10 @@ mke2fs \- create an ext2/ext3/ext4 filesystem
+ .I number-of-inodes
+ ]
+ [
++.B \-d
++.I root-directory
++]
++[
+ .B \-n
+ ]
+ [
+@@ -502,6 +506,9 @@ the
+ ratio).  This allows the user to specify the number
+ of desired inodes directly.
+ .TP
++.BI \-d " root-directory"
++Add the files from the root-directory to the filesystem.
++.TP
+ .BI \-o " creator-os"
+ Overrides the default value of the "creator operating system" field of the
+ filesystem.  The creator field is set by default to the name of the OS the
+-- 
+1.7.10.4
+
-- 
1.7.10.4


