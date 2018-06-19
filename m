Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E2A3E754AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 10:51:49 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z6-v6so18415358wma.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6PdoFVJLCn4JLBCrDoJMBbNWfIYuv+ukPk8sUJexv/A=;
	b=dSmpeI/pIlkWHyPLAzTkc3ZpmoN/CTS//ZvUXzgUnxC5Fh062X6io+zHagKZmVlx/x
	ZMYAzXYplGlH8djATonPperZX+WZ+BhX75D+0HcBQSV5jUj+niWCqBmgxIUEEzTJ40MC
	oaLyf8GTZgtuTnEXjzlacXVjD2eGr9O+hi058=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6PdoFVJLCn4JLBCrDoJMBbNWfIYuv+ukPk8sUJexv/A=;
	b=IHr4ioC+jBkONmtmqP7dlRpqVXgPQ8J30VWHZZ3G4KAAbeEfQISIQiYQMIy13wp6qG
	AOd1DV3KJ2nKxSQd/5U+xllT5AuwCNS4D2D8WEgKfpYi5QWoO74biKvhj1ahQlb5iWf4
	OQ/9+oHVjYwOZLMVhrM9NOaFygnnN1WGP2hc/JdUlIqowUSuF83jXRMvG8qGdM5eHxVL
	ykdPcPF2B5qllzDtqFHkjwuYkeU2QL47CpDu8nQpaJi5xhtd+OEGNgcsfT0Ywb98e6DV
	yX2+aomNRJj5Wt01pxET9aVWVYDnIkjxQJFQzC886pJkufsEEGaegdl89D6Im4uDdfbz
	Io8w==
X-Gm-Message-State: APt69E27pj3MFXCMdllN8hzP8G1Z+AdA8MRQTUIEfbd8NNIDR1vM/VL0
	aHjKTy9/0vPpEGF6FttiXVhjOW5SxnA=
X-Google-Smtp-Source: ADUXVKJDpmR59nx+esvubXLHInxYhEtoz851tepc0pivNetZM/ZY3lGHAadMuTjClA05q3Nuw5LxmQ==
X-Received: by 2002:a1c:cc10:: with SMTP id
	h16-v6mr10557475wmb.155.1529405510400; 
	Tue, 19 Jun 2018 03:51:50 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n12-v6sm15312083wrp.69.2018.06.19.03.51.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 03:51:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 11:51:43 +0100
Message-Id: <20180619105144.10687-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619105144.10687-1-richard.purdie@linuxfoundation.org>
References: <20180619105144.10687-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/5] rm_work: Improve code comments
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
X-List-Received-Date: Tue, 19 Jun 2018 10:51:50 -0000

This function is a little obtuse, add more comments about what its
doing and why. Also combine some of the statements where possible
to improve clarity.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rm_work.bbclass | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index b45b18ce01b..036680f5fad 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -47,31 +47,29 @@ do_rm_work () {
     cd `dirname ${STAMP}`
     for i in `basename ${STAMP}`*
     do
+        # By default we'll delete the stamp, unless $i is changed by the inner loop
+        # (i=dummy does this)
+
         for j in ${SSTATETASKS} do_shared_workdir
         do
             case $i in
             *sigdata*|*sigbasedata*)
-                i=dummy
-                break
-                ;;
-            *do_package_write*)
+                # Save/skip anything that looks like a signature data file.
                 i=dummy
                 break
                 ;;
             *do_image_complete_setscene*)
+                # Ensure we don't 'stack' setscene extensions to this stamp with the section below
                 i=dummy
                 break
                 ;;
             *do_image_complete*)
+                # Promote do_image_complete stamps to setscene versions (ahead of *do_image* below)
                 mv $i `echo $i | sed -e "s#do_image_complete#do_image_complete_setscene#"`
                 i=dummy
                 break
                 ;;
-            *do_rootfs*|*do_image*|*do_bootimg*|*do_write_qemuboot_conf*)
-                i=dummy
-                break
-                ;;
-            *do_build*)
+            *do_package_write*|*do_rootfs*|*do_image*|*do_bootimg*|*do_write_qemuboot_conf*|*do_build*)
                 i=dummy
                 break
                 ;;
@@ -81,20 +79,22 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
-            # We remove do_package entirely, including any
-            # sstate version since otherwise we'd need to leave 'plaindirs' around
-            # such as 'packages' and 'packages-split' and these can be large. No end
-            # of chain tasks depend directly on do_package anymore.
             *do_package|*do_package.*|*do_package_setscene.*)
+                # We remove do_package entirely, including any
+                # sstate version since otherwise we'd need to leave 'plaindirs' around
+                # such as 'packages' and 'packages-split' and these can be large. No end
+                # of chain tasks depend directly on do_package anymore.
                 rm -f $i;
                 i=dummy
                 break
                 ;;
             *_setscene*)
+                # Skip stamps which are already setscene versions
                 i=dummy
                 break
                 ;;
             *$j|*$j.*)
+                # Promote the stamp to a setscene version
                 mv $i `echo $i | sed -e "s#${j}#${j}_setscene#"`
                 i=dummy
                 break
-- 
2.17.1


