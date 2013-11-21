Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D35DC6DBDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:14:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7EYBG013419
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:14:34 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:14:34 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:13:55 -0600
Message-ID: <1385018038-23380-10-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
References: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 09/12] e2fsprogs/mke2fs: update the manual for the -d option
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
X-List-Received-Date: Thu, 21 Nov 2013 07:14:35 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

update the manual for the -d option

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...s.8.in-update-the-manual-for-the-d-option.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0009-mke2fs.8.in-update-the-manual-for-the-d-option.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0009-mke2fs.8.in-update-the-manual-for-the-d-option.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0009-mke2fs.8.in-update-the-manual-for-the-d-option.patch
new file mode 100644
index 0000000..494d33d
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0009-mke2fs.8.in-update-the-manual-for-the-d-option.patch
@@ -0,0 +1,40 @@
+From 1f8d6c42c4c3ac3494f603ef57c197f35a220bd5 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 27 Aug 2013 15:55:35 +0800
+Subject: [rootdir 09/10] mke2fs.8.in: update the manual for the -d option
+
+update the manual for the -d option
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/mke2fs.8.in |    7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/misc/mke2fs.8.in b/misc/mke2fs.8.in
+index fe2dcdb..b268154 100644
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
+@@ -490,6 +494,9 @@ the
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
1.8.1.2.545.g2f19ada


