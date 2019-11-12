Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 106C47FC0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:51 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w11so10952986pga.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7Ms6MKgjE+QNzlqNWf7w4/ngLmARObhjlYpBOSwRkBQ=;
	b=kK715hyEJW4GMI6yRHmAoTwBiCW0PNzG9dug2JB1VwuzdZsTkztU58QRP4V+SP8N1U
	GtHnWN2DbwSrxgZmNg7W5g+Ajk/UoiswcZpUTfmalYzTbKhL1wpgnt9oG4rCng5ttjAH
	h9ga2I4+K763kFqkLiuM6qyii+OqgM8vAh+smpGhDqvY7Jfx6bXl7mUcvDWZnahm5Fxl
	VNpevJfhhwhH6MzZ4cfUCXWFpOc6uqcY9nrNYKWLwRDm3CEOQaCIoP2g2FOCut9CtW1s
	TjyJdVnnnw1ns2QcsDe0d9pYKBSw11HMDvk3oMOGftROxztIYDdLrgbKWOykKZHkjYEZ
	yolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7Ms6MKgjE+QNzlqNWf7w4/ngLmARObhjlYpBOSwRkBQ=;
	b=lsfeC7Y8LYrucDsRM27wlCh4Rw7NorQRWGVcBvhD2iSwy3RiXrJ4HqVGHarP5FOguZ
	e7+7PYUwHi7ArMIlSFresPKzMsIaYiN78HXONXz16PZNdm0X7ggwl+20k70ptNaCcBwT
	56mG2KFeXruYd+usejaaYG5PJVEYTwiyHWyQU9SGFN8u/QmvMtunisiOyLotogqDpRep
	0h1UlhrIatfmA3CHn1KPqpA8e4i7Hv2ElO2Rdktml4n8Y7y4SzgqH43XS81qQTKRhv4Z
	/zTa3ZLFNwFVOAMmLEgvCjO3yvfjw4/PFDu85/uet4sj5jXEGm2YW/LK0Be7KTFj9yVn
	/YdQ==
X-Gm-Message-State: APjAAAX2IFUOeC6zorqcpnuekKp5mw4l9zWEhvH3BNXAMPS+9qGGKj8I
	BuLLMQ2odpEAktpISIU7Vl93JE53
X-Google-Smtp-Source: APXvYqwxd44xxElx4ejCZ3x7YmbVcBmed2P5wy2vqZ+23/9Eeb8lBB++RsG8zmUtyeHUG/3zh5Xkrg==
X-Received: by 2002:a17:90a:cc07:: with SMTP id
	b7mr3598121pju.135.1573533232965; 
	Mon, 11 Nov 2019 20:33:52 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:31 -0800
Message-Id: <fee32997f99dae150ddf464e6faa70da921ce09b.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 12/20] OEQA: remove postinit test done w/selftest runtime
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:52 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/bsp-qemu.json | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-qemu.json b/meta/lib/oeqa/manual/bsp-qemu.json
index 5ec275c..021ba57 100644
--- a/meta/lib/oeqa/manual/bsp-qemu.json
+++ b/meta/lib/oeqa/manual/bsp-qemu.json
@@ -1,40 +1,6 @@
 [
   {
     "test": {
-      "@alias": "bsps-qemu.bsps-tools.Post-installation_logging",
-      "author": [
-        {
-          "email": "yi.zhao@windriver.com",
-          "name": "yi.zhao@windriver.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": "Download the poky source and set environment \n",
-          "expected_results": "The /var/log/postinstall.log should exist in the first boot. The content of this log is like below:  \n\nRunning postinst /etc/rpm-postinsts/man... \nList directory to check the output log \nbin \nboot \ndev \netc \nhome \nlib \nlost+found \nmedia \nmnt \nproc \nrun \nsbin \nsys \ntmp \nusr \nvar \nList nonexist directory to check the stderr redirection log \nls: /nonexist: No such file or directory "
-        },
-        "2": {
-          "action": "Add the following lines to a .bb file. For expample, meta/recipes-connectivity/openssh/openssh_6.2p2.bb:   \n\npkg_postinst_ontarget_${PN} () {  \n       #!/bin/sh -e  \n       if [ x\"$D\" = \"x\" ]; then  \n       echo \"List directory to check the output log\"  \n       ls /  \n       echo \"List nonexist directory to check the stderr redirection log\"  \n       ls /nonexist  \n       else  \n       exit 1  \n       fi  \n}  \n\nMake sure the feature \"debug-tweaks\" is added in conf/local.conf \n",
-          "expected_results": ""
-        },
-        "3": {
-          "action": "Add ssh-server-openssh to EXTRA_IMAGE_FEATURES in local.conf \n",
-          "expected_results": ""
-        },
-        "4": {
-          "action": "Build core-image-minimal \n",
-          "expected_results": ""
-        },
-        "5": {
-          "action": "Boot up the image and check the /var/log/postinstall.log  ",
-          "expected_results": ""
-        }
-      },
-      "summary": "Post-installation_logging"
-    }
-  },
-  {
-    "test": {
       "@alias": "bsps-qemu.bsps-tools.Add_user_with_cleartext_type_password_during_filesystem_construction",
       "author": [
         {
-- 
2.7.4


