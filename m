Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 50D8460653
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:02:11 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so93119pad.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 19:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=llyDMBInDIXorW9AxWmmXCS0bBsVhhTdhGDsY7Mo/a8=;
	b=aNtQlU0s4Er43lRcWuGifF8DCAM20Xtf7qw855I6EJ23NxErhuja1TXJAFK4StTcwr
	0FnuKWfYBR9l2cbvxG2q2c9dhjgLsRMFgPiv8gRc7C7o3RycAd5C5UuHuIUO1MDuk+6I
	NFJdScJbeATa5oALiRvg+rPF1ZY3ounAdb7e+yRBHkcodKAanM00Avh8HKXrLjLuv31S
	XXzYsxv1LwRBdK3aTJbReU9WsX+lDPI/XKCTfcofDZY0fLJ4hvpUXLRwCbtZoDfwVX9r
	/f0rneiAbXDTa95vOOPyFsOeLUaag/sFqRZOveEgCiyeI9NZkx1T1h34pO8kwPrPwIfM
	pJ7A==
X-Received: by 10.68.190.104 with SMTP id gp8mr10710017pbc.120.1369965731942; 
	Thu, 30 May 2013 19:02:11 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	kv2sm44283798pbc.28.2013.05.30.19.02.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 19:02:11 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 12:15:51 +1000
Message-Id: <1369966551-10246-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [PATCH] findutils: backport more fixes for documentation build errors
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
X-List-Received-Date: Fri, 31 May 2013 02:02:11 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../findutils-4.4.2/findutils_fix_doc.patch        | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_doc.patch b/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_doc.patch
index 8469b8d..a48cdc2 100644
--- a/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_doc.patch
+++ b/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_doc.patch
@@ -1,6 +1,17 @@
 Fix documentation build errors
 
 This fixes the following errors building the findutils documentation:
+find-maint.texi:45: misplaced {
+find-maint.texi:45: misplaced }
+find-maint.texi:236: warning: node next `Make the Compiler Find the Bugs' in menu `The File System Is Being Modified' and in sectioning `Factor Out Repeated Code' differ
+find-maint.texi:335: warning: node `Debugging is For Users Too' is next for `Factor Out Repeated Code' in sectioning but not in menu
+find-maint.texi:335: warning: node prev `Factor Out Repeated Code' in menu `Debugging is For Users Too' and in sectioning `Make the Compiler Find the Bugs' differ
+find-maint.texi:378: warning: node next `Debugging is For Users Too' in menu `Factor Out Repeated Code' and in sectioning `Don't Trust the File System Contents' differ
+find-maint.texi:378: warning: node prev `Debugging is For Users Too' in menu `Don't Trust the File System Contents' and in sectioning `Factor Out Repeated Code' differ
+find-maint.texi:392: warning: node next `Don't Trust the File System Contents' in menu `Debugging is For Users Too' and in sectioning `The File System Is Being Modified' differ
+find-maint.texi:392: warning: node prev `Don't Trust the File System Contents' in menu `The File System Is Being Modified' and in sectioning `Debugging is For Users Too' differ
+find-maint.texi:417: warning: node `Don't Trust the File System Contents' is next for `The File System Is Being Modified' in menu but not in sectioning
+find-maint.texi:417: warning: node prev `The File System Is Being Modified' in menu `Make the Compiler Find the Bugs' and in sectioning `Don't Trust the File System Contents' differ
 find.texi:53: misplaced {
 find.texi:53: misplaced }
 find.texi:1862: warning: node `Formatting Flags' is next for `Time Directives' in menu but not in sectioning
@@ -12,6 +23,29 @@ find.texi:1893: node `Time Formats' lacks menu item for `Formatting Flags' despi
 Upstream-Status: Backport
 Signed-off-by: Jonathan Liu <net147@gmail.com>
 
+--- a/doc/find-maint.texi
++++ b/doc/find-maint.texi
+@@ -42,7 +42,7 @@ Free Documentation License''.
+ 
+ @page
+ @vskip 0pt plus 1filll
+-@insertcopying{}
++@insertcopying
+ @end titlepage
+ 
+ @contents
+@@ -227,10 +227,10 @@ circumstances.
+ 
+ @menu
+ * Make the Compiler Find the Bugs::
++* Factor Out Repeated Code::
+ * The File System Is Being Modified::
+ * Don't Trust the File System Contents::
+ * Debugging is For Users Too::
+-* Factor Out Repeated Code::
+ @end menu
+ 
+ @node    Make the Compiler Find the Bugs
 --- a/doc/find.texi
 +++ b/doc/find.texi
 @@ -50,7 +50,7 @@ Texts.  A copy of the license is included in the section entitled
-- 
1.8.3


