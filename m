Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id DA4A777160
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 20:35:34 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n128so4224981pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 12:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=qd6vnZlWQWpIOnzn9KkbOHXGSgWT98nSHQ970fPuX/Q=;
	b=f/4SdRRQ7TPUeiRDswZ2HtHEssFKQ6odfpiCD749JCqF93hkwFu3F1rt601Lt+1QK1
	ZwcAfU63EXZ9oSUHN6Lk9tWuTJKOAZP0OLAwxzXIi50Mlro2vWuICz1h3C0QiBTUd4uf
	mTNUSYZ3joUZHs7wma70/4BHi6ngb0SlrKWdEk9IDD1cvdrqlfZ7e1Uu4mG7TYLo6c23
	pUwyXirzS4bE8lzwnrjy14uvy9u5SCMrY8siwwexka8WV/rg9YHX12LRDdBiz2E5mNBI
	yGBPi0zqHLFjBo0efNPPQJ4lewgzp627yY6S0hkGl9RVF9bkwwxBwTBzlP+gvVbsVa9Q
	GDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=qd6vnZlWQWpIOnzn9KkbOHXGSgWT98nSHQ970fPuX/Q=;
	b=Z5Afmrrghr30cbWBdX1aG3dG7DS8Oa0jL+um/st8PQmf6wPqEAnmyL6w6JP5DN6WPc
	2HNctoS3BkfPh2pSKToCyaUBPnW6EqlA6eomTItmU/KdDd27rmslIksENfLn+3RA0NWo
	6T7tbbEE2NT8QXpFUp6T01twWQ0KbGA9uwzUqaxuUwiGfJdMrc+oPLa3feOroRBBpy5/
	uAGW8QKOT7NO2BKeK+fUJbhPeY/DiVe75VfYqTEaKP+xIeKzVG31yqKwsQnc/qw4RIhK
	RTvbuhHRWuS6y2tMhHkXHIkdHb3imPG7CdEGqGuodYCXLgte3b1dtK7qyo6E/FN4He31
	vr0A==
X-Gm-Message-State: AG10YOQPeKyKLF1lKZ0CBeTIOlPKFUhASsMAE++OJd8f4akPjOgt/htGMSeW/F/mhpsa3A==
X-Received: by 10.98.33.131 with SMTP id o3mr5186093pfj.97.1454099735481;
	Fri, 29 Jan 2016 12:35:35 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id r80sm858016pfi.9.2016.01.29.12.35.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 12:35:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 29 Jan 2016 12:35:20 -0800
Message-Id: <a2d7c50c8bd3313785ef23bb23e384a721b429cb.1454099596.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454099596.git.akuster@mvista.com>
References: <cover.1454099596.git.akuster@mvista.com>
In-Reply-To: <cover.1454099596.git.akuster@mvista.com>
References: <cover.1454099596.git.akuster@mvista.com>
Subject: [PATCH 5/6] qemu: Security fix CVE-2016-1568
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
X-List-Received-Date: Fri, 29 Jan 2016 20:35:35 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-1568 Qemu: ide: ahci use-after-free vulnerability in aio port commands

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-1568.patch | 46 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch
new file mode 100644
index 0000000..9c40ffb
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch
@@ -0,0 +1,46 @@
+From 4ab0359a8ae182a7ac5c99609667273167703fab Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Mon, 11 Jan 2016 14:10:42 -0500
+Subject: [PATCH] ide: ahci: reset ncq object to unused on error
+
+When processing NCQ commands, AHCI device emulation prepares a
+NCQ transfer object; To which an aio control block(aiocb) object
+is assigned in 'execute_ncq_command'. In case, when the NCQ
+command is invalid, the 'aiocb' object is not assigned, and NCQ
+transfer object is left as 'used'. This leads to a use after
+free kind of error in 'bdrv_aio_cancel_async' via 'ahci_reset_port'.
+Reset NCQ transfer object to 'unused' to avoid it.
+
+[Maintainer edit: s/ACHI/AHCI/ in the commit message. --js]
+
+Reported-by: Qinghao Tang <luodalongde@gmail.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: John Snow <jsnow@redhat.com>
+Message-id: 1452282511-4116-1-git-send-email-ppandit@redhat.com
+Signed-off-by: John Snow <jsnow@redhat.com>
+
+Upstream-Status: Backport
+
+http://git.qemu.org/?p=qemu.git;a=commit;h=4ab0359a8ae182a7ac5c99609667273167703fab
+
+CVE: CVE-2016-1568
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/ide/ahci.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+Index: qemu-2.4.0/hw/ide/ahci.c
+===================================================================
+--- qemu-2.4.0.orig/hw/ide/ahci.c
++++ qemu-2.4.0/hw/ide/ahci.c
+@@ -898,6 +898,7 @@ static void ncq_err(NCQTransferState *nc
+     ide_state->error = ABRT_ERR;
+     ide_state->status = READY_STAT | ERR_STAT;
+     ncq_tfs->drive->port_regs.scr_err |= (1 << ncq_tfs->tag);
++    ncq_tfs->used = 0;
+ }
+ 
+ static void ncq_finish(NCQTransferState *ncq_tfs)
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
index 6c12bee..6e6bd2b 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://CVE-2015-7504.patch \
             file://CVE-2015-7512.patch \
             file://CVE-2015-8345.patch \
+            file://CVE-2016-1568.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"
-- 
2.3.5


