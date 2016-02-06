Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 447317723E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:36 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 71so1869568pfv.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=PrCTdUvjbP+P4IYyD601KgfswGHP6NGH3xuXoQZC9Ik=;
	b=rfLtNlvRyje/25bGMAygljM4xSWNzX1BpCn5ytxsxvsBCSzCuFqXiST3qRcH61wxBM
	VuXqs6jYcBZLnl8UAV3clLVTjqnWOpVKKJOECPIKGKATMPBR1hb6iod8uzyuC1h+iqEl
	dkrg0jcNP2KsrHx70ZqJuuRJolWdVrBOOYhUYNdJUrMSURGv8JeIlaFlFu/FEmW0m6yA
	3b5wMy78W64o5s9YsqBfyVg4FQbZbeHIMpW4CT2cUwcWNimx9sEG59woNU1pRWAxaw4A
	wz8Rsxax49I8k1ZsJVKheYSzRB8IDeznHRMiB2lahV/ADhpq0z3rZEIHr25i5QfOQV5k
	DR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=PrCTdUvjbP+P4IYyD601KgfswGHP6NGH3xuXoQZC9Ik=;
	b=BfYs24uVt8K7DukWB5B9aDjenmiA8xxjlQiwfNuHoet+c9LWqGAEfhmlYea9Y0EVu7
	6s7Aw+E4TTicH8K7XyTXtq5MLW/vVqgiu3EsKjDGM1Yu57OylE35iZRGDvPTQaonhxo9
	U2Aot/vlPuWWdvRf5LpYqvhlcDj5Ai+uZNBzjcue7Qob7x7pEQb+J25kBqStfqWKee44
	IPlek2TQrnrnL6TA/nePGewfyBhee6Luy2QebcBeP0SFFsWpSYq87IXHpCmNumDbSlrM
	dW7Vz2qXZoGWITzQ43zUbzrOmjCPFS+Sd6cobYs+fFpP0T3NaXUDhNzK4u6x1d6CA0qt
	6YDA==
X-Gm-Message-State: AG10YORRYRJEP49PMnOTuGWQO5+ZsLfo/Y7bA5vMQwz0O0dK8KedFjqG/ZIbwqtmpL7qlw==
X-Received: by 10.98.0.7 with SMTP id 7mr31138605pfa.5.1454800537338;
	Sat, 06 Feb 2016 15:15:37 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:54 -0800
Message-Id: <48af65a1676c496c6dcdb27c45ff0fef27e63b3b.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 13/21] qemu: Security fix CVE-2016-1568
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:36 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-1568 Qemu: ide: ahci use-after-free vulnerability in aio port commands

(From OE-Core rev: 166c19df8be28da255cc68032e2d11afc59d4197)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-1568.patch | 46 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.2.0.bb           |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch
new file mode 100644
index 0000000..319ae24
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
+Index: qemu-2.2.0/hw/ide/ahci.c
+===================================================================
+--- qemu-2.2.0.orig/hw/ide/ahci.c
++++ qemu-2.2.0/hw/ide/ahci.c
+@@ -838,6 +838,7 @@ static void ncq_cb(void *opaque, int ret
+         ide_state->error = ABRT_ERR;
+         ide_state->status = READY_STAT | ERR_STAT;
+         ncq_tfs->drive->port_regs.scr_err |= (1 << ncq_tfs->tag);
++        ncq_tfs->used = 0;
+     } else {
+         ide_state->status = READY_STAT | SEEK_STAT;
+     }
diff --git a/meta/recipes-devtools/qemu/qemu_2.2.0.bb b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
index 72fda62..66e928f 100644
--- a/meta/recipes-devtools/qemu/qemu_2.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://CVE-2015-7504.patch \
             file://CVE-2015-7512.patch \
             file://CVE-2015-8345.patch \
+            file://CVE-2016-1568.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f7a5e2da22d057eb838a91da7aff43c8"
-- 
2.3.5


