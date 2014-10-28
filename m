Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 681BC65CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 02:12:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9S2C1jl020331
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 19:12:01 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 27 Oct 2014 19:12:01 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Oct 2014 22:12:00 -0400
Message-ID: <1414462320-15405-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH v2] which-2.18: Use foreign strictness to avoid automake errors
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
X-List-Received-Date: Tue, 28 Oct 2014 02:12:09 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fixed:
Makefile.am: error: required file './ChangeLog' not found

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../which/which-2.18/automake-foreign.patch        | 28 ++++++++++++++++++++++
 meta/recipes-extended/which/which_2.18.bb          |  4 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/which/which-2.18/automake-foreign.patch

diff --git a/meta/recipes-extended/which/which-2.18/automake-foreign.patch b/meta/recipes-extended/which/which-2.18/automake-foreign.patch
new file mode 100644
index 0000000..495cdc6
--- /dev/null
+++ b/meta/recipes-extended/which/which-2.18/automake-foreign.patch
@@ -0,0 +1,28 @@
+Subject: [PATCH] automake foreign strictness
+
+Use foreign strictness to avoid automake errors.
+
+Upstream-Status: Inappropriate [upstream no longer active]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.ac |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b30b6f5..bd3222c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,6 +1,7 @@
+ dnl Process this file with autoconf to produce a configure script.
+-AC_INIT(which.c)
+-AM_INIT_AUTOMAKE(which, 2.18)
++AC_INIT([which],[2.18])
++AC_CONFIG_SRCDIR(which.c)
++AM_INIT_AUTOMAKE([foreign])
+ AM_CONFIG_HEADER(config.h)
+ AM_MAINTAINER_MODE
+ 
+-- 
+1.7.1
+
diff --git a/meta/recipes-extended/which/which_2.18.bb b/meta/recipes-extended/which/which_2.18.bb
index 5fa5d9e..fd68520 100644
--- a/meta/recipes-extended/which/which_2.18.bb
+++ b/meta/recipes-extended/which/which_2.18.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PR = "r2"
 
 SRC_URI = "http://www.xs4all.nl/~carlo17/which/which-${PV}.tar.gz \
-           file://fix_name_conflict_group_member.patch"
+           file://fix_name_conflict_group_member.patch \
+           file://automake-foreign.patch \
+"
 
 SRC_URI[md5sum] = "42d51938e48b91f6e19fabf216f5c3e9"
 SRC_URI[sha256sum] = "9445cd7e02ec0c26a44fd56098464ded064ba5d93dd2e15ec12410ba56b2e544"
-- 
2.0.0


