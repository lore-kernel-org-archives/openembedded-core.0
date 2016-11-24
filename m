Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 255776B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 10:29:08 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id j65so72486034iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 02:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nIatoUh4SHBt1L1uTN3IpWmfp4tD50/aXNY8Ber6QOA=;
	b=lc3HY6C6H2AZfAapdJPhs0279TNEB8Ng6xxyN0WYW8nK+NsohjoTPlS8la5mLl36nQ
	qz48dHP9WTXidL2r1Hi+5t9fdHmv33+OonyzYfF65FksQ07Ugd3f10nePQQ98b3RoW1z
	q60XAZAtw6C5ZRhLqZB4bNVt9kpoHH8wWGWz70SXjSZk22X6ygrqw3vTPmb8xL0aSUZM
	klFO8+9Kr2T7A+7I+qZhS60YQYg9dDL2aWdA+RKtnwKWr4kZv+OUWrFsNnhMAOQS/Yyf
	6qgfWW7Dejx63Th3/S2HVm8Qke4m3YApU/bxWtUhcS+gC4dcm9GAdjhIGGcLU2zYRPBp
	YSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nIatoUh4SHBt1L1uTN3IpWmfp4tD50/aXNY8Ber6QOA=;
	b=jspIErWhl1RnCp9CGLm3v8oJG6cCqo2VMJD1+BvZrBbPiEFB/D1oI5Xm4HjXeSjVQz
	e5USwMJnu6i8L66dJtGrs79eH+rGmhO9FR/eGb7gpWIxWESbsPgihwrEgPIDuzRYlUOi
	Jcl/d9oDBcd3JD+HNjFgFSkBeVd30dbw0SyWwT1ic4sBFQmuROR2r4xj9+m/zyTgnf+O
	zGZqM7Nkq0wnMsLRTU5FdBPnrojSx5qy4vNZV1rxUOWD326nrzuquoaNGK8gKbQE67C9
	baL/Jy+rbDWjxJxpNMUnznfeJbw9+uWxhnnCFCYvBW2Fnv68jsjOuCjVp83zRo2vmneV
	UUiw==
X-Gm-Message-State: AKaTC00Az8M/faVzPPailrsTCCjSY1pnuyAvShiSV2F4hxSoFLVT/giGsbw5jR3mgLWVf99z
X-Received: by 10.107.59.87 with SMTP id i84mr1262771ioa.204.1479983350067;
	Thu, 24 Nov 2016 02:29:10 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8D6D7.dip0.t-ipconnect.de.
	[93.232.214.215]) by smtp.gmail.com with ESMTPSA id
	q82sm2510039itd.10.2016.11.24.02.29.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Nov 2016 02:29:09 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 11:28:59 +0100
Message-Id: <1479983339-2967-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1479981089-2181-1-git-send-email-patrick.ohly@intel.com>
References: <1479981089-2181-1-git-send-email-patrick.ohly@intel.com>
Subject: [PATCH v2] pseudo: include fix for xattr corruption
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
X-List-Received-Date: Thu, 24 Nov 2016 10:29:09 -0000

pseudo_1.8.1.bb gets the backported patch and pseudo_git.bb gets
updated to include the commit.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---

Notes:
    Change since V1:
    Updated the commit message. It was still the one written
    for the initial, broken upstream patch for the problem.
    The attached patch works.

 .../pseudo/files/More-correctly-fix-xattrs.patch   | 37 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |  1 +
 meta/recipes-devtools/pseudo/pseudo_git.bb         |  2 +-
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch

diff --git a/meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch b/meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch
new file mode 100644
index 0000000..3d178f9
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch
@@ -0,0 +1,37 @@
+From 45eca34c754d416a38bee90fb2d3c110a0b6cc5f Mon Sep 17 00:00:00 2001
+From: Seebs <seebs@seebs.net>
+Date: Thu, 3 Nov 2016 11:36:12 -0500
+Subject: [PATCH] More-correctly fix xattrs
+
+Fix provided by Patrick Ohly <patrick.ohly@intel.com>. This resolves
+the actual cause of the path length mismatches, and explains why
+I couldn't quite explain why the previous one had only sometimes
+worked, also why it showed up on directories but not plain files.
+
+Signed-off-by: Seebs <seebs@seebs.net>
+
+Fixes [YOCTO #10623]
+
+Upstream-Status: Backport [commit 45eca34c754d416a38bee90fb2d3c110a0b6cc5f]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+---
+ pseudo_client.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pseudo_client.c b/pseudo_client.c
+index 6a08df3..b1a00fa 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -1676,7 +1676,7 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
+ 	 * empty path for that.
+ 	 */
+ 	if (path_extra_1) {
+-		size_t full_len = path_extra_1len + 1 + pathlen;
++		size_t full_len = path_extra_1len + 1 + pathlen - strip_slash;
+ 		size_t partial_len = pathlen - 1 - strip_slash;
+ 		if (path_extra_2) {
+ 			full_len += path_extra_2len + 1;
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
index fb70034..90b53c0 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz
            file://0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch \
            file://0002-Use-correct-file-descriptor.patch \
            file://0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch \
+           file://More-correctly-fix-xattrs.patch \
            "
 
 SRC_URI[md5sum] = "ee38e4fb62ff88ad067b1a5a3825bac7"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 8110b1a..ac923bb 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRCREV = "befc6dbd6469d428c9e0830dbe51bdf7ac39d9ae"
+SRCREV = "45eca34c754d416a38bee90fb2d3c110a0b6cc5f"
 PV = "1.8.1+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
-- 
2.1.4


