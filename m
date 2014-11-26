Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9654E7210C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 16:22:26 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id y10so3065475pdj.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=C/73SDuQgNFbmoO64T9uDwsNFPMZmiPjzumeDNRdMrM=;
	b=ZoyjuKSkD5AA4AhrbbPMQJObAFHKMpTfUADIaN9kXf9JYWa2pYALdJvDljdwnReJ3q
	t+it3KKNrOKjyFb2UzmUzIMsFpvQJZr3BYvHqYqyCHspGvl0Uj+5G3YrcfkbObHVKIGO
	ojb+m4xnfL5KwB2H98420tqQLc/2HsUfud+CPCpj7Uo8fEZYOso5Vyuaa9L2/h8Ka50/
	1L7OrHvmkE5Uk7xeseQ9VjstYXyf+DWl1wBJAnU1mPlaxPbxE/eTZx4sKzS0sySNR6we
	n7PMliW2vm/ih7NzEYq/AglRv/QoOFh9ZoIkM0h5xBuSG/R5gLj2ljQZuvROOVKyAQEW
	hRsA==
X-Received: by 10.66.118.201 with SMTP id ko9mr55508060pab.46.1417018947254;
	Wed, 26 Nov 2014 08:22:27 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qn1sm4736673pdb.42.2014.11.26.08.22.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Nov 2014 08:22:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 08:22:06 -0800
Message-Id: <70913bed20a9a69e2f27a261bcf7d0779e2702ee.1417018567.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
References: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
In-Reply-To: <cover.1417018567.git.akuster808@gmail.com>
References: <cover.1417018567.git.akuster808@gmail.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 02/11] wic: Update the help text to include -D (--debug)
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
X-List-Received-Date: Wed, 26 Nov 2014 16:22:26 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

The --debug option is missing from the wic help text; this adds it and
at the same time rearranges the usage into a more logical arrangement.

(From OE-Core rev: cf5144ef241d8f4ccaa3461ae5c9f89c2cf2f8d1)

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/image/help.py | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 080795e..0963532 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -109,8 +109,9 @@ wic_create_usage = """
 
  usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
             [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
-            [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-dir]
-            [-k, --kernel-dir] [-n, --native-sysroot] [-s, --skip-build-check]
+            [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
+            [-r, --rootfs-dir] [-b, --bootimg-dir]
+            [-k, --kernel-dir] [-n, --native-sysroot]
 
  This command creates an OpenEmbedded image based on the 'OE kickstart
  commands' found in the <wks file>.
@@ -129,8 +130,9 @@ NAME
 SYNOPSIS
     wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
         [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
-        [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-dir]
-        [-k, --kernel-dir] [-n, --native-sysroot] [-s, --skip-build-check]
+        [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
+        [-r, --rootfs-dir] [-b, --bootimg-dir]
+        [-k, --kernel-dir] [-n, --native-sysroot]
 
 DESCRIPTION
     This command creates an OpenEmbedded image based on the 'OE
@@ -172,6 +174,12 @@ DESCRIPTION
     explicitly, 'wic' assumes the user knows what he or she is doing
     and skips the build check.
 
+    The -D option is used to display debug information detailing
+    exactly what happens behind the scenes when a create request is
+    fulfilled (or not, as the case may be).  It enumerates and
+    displays the command sequence used, and should be included in any
+    bug report describing unexpected results.
+
     When 'wic -e' is used, the locations for the build artifacts
     values are determined by 'wic -e' from the output of the 'bitbake
     -e' command given an image name e.g. 'core-image-minimal' and a
@@ -519,8 +527,9 @@ DESCRIPTION
 
        usage: wic create <wks file or image name> [-o <DIRNAME> | ...]
             [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
-            [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-dir]
-            [-k, --kernel-dir] [-n, --native-sysroot] [-s, --skip-build-check]
+            [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
+            [-r, --rootfs-dir] [-b, --bootimg-dir]
+            [-k, --kernel-dir] [-n, --native-sysroot]
 
        This command creates an OpenEmbedded image based on the 'OE
        kickstart commands' found in the <wks file>.
-- 
1.9.1


