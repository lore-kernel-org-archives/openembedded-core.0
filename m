Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJa6-0005eM-Ac
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:50 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so5531122pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ficPjM6RX7XFwz43ziLo+1RhJDwTK/v2XRujndDkC7U=;
	b=XWlrKQ0rZPBCXXBCc7p90pKtDINuKIL7/5qAIJWMqjJIXTXxfPzx53mdLCAgw2D3RT
	8RycrmrFrMO4XOQvkbQ/W7WlpG0CTGpCUVo/tIzES/XVAAPkezU201XUg4MD/hpqnOJJ
	j1ODB0w2tIgpHV7fHlC8JQbeflNbxC6wt6c5MjWUKNMLkxgCDBtCCaGl0OVmKm8WCjqc
	HOY4ZTl827ec3vu5Pcb3nFPhcHkLbjnpCv0FgPsse1qNmtZvUIEG7vN7SmnvKUBEpIRp
	eXUUmkJYJss/3GkRl1vn0l+epJlID2pEFHFHlEZUbt9U7ZfQL/X6NoVUVs+aOtUpw9kb
	3png==
Received: by 10.68.213.101 with SMTP id nr5mr63194295pbc.131.1337571405292;
	Sun, 20 May 2012 20:36:45 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:49 -0700
Message-Id: <2c29473d6c6c931d71b53701af5fddf682cc9ca5.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
References: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 14/14] qemush4.conf: Add machine configuration for qemush4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2012 03:46:52 -0000

SH4 qemu emulation using rts7751r2dplus board

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemush4.conf |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/qemush4.conf

diff --git a/meta/conf/machine/qemush4.conf b/meta/conf/machine/qemush4.conf
new file mode 100644
index 0000000..acf7faf
--- /dev/null
+++ b/meta/conf/machine/qemush4.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: base
+#@DESCRIPTION: rts7751r2dplus
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-sh4.inc
+
+KERNEL_IMAGETYPE = "zImage"
+
+SERIAL_CONSOLE = "115200 ttySC1 noiotrap earlyprintk=sh-sci.1"
+
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
+
-- 
1.7.5.4



