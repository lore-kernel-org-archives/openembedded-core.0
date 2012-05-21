Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJa4-0005eM-To
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:49 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so5531122pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=a7vK8QZ5HtPgaO4rUZydAWbrEMDVcrDcwS5NVVifx6M=;
	b=vrOUdBHEvHnnoH3H0jZXGEdzlc43kl3gNhiTfjleK8gwqz8mBQvIdPpRp6tXtVydwV
	VtjstRpKg8RYkmkU5ZLgfuNuliYIctikoDp+WyQM9o8WwpM7uNYXd/a1v/+c0MnHcsfB
	OpN8+GwKaXrYaqqguk60cwaKGS2iwmguTanMYTzFC0B+wNnv2VPzFmoS8IzEb8c3E1fa
	fnnufTxBXJHjrB7d36DawLL71qpzVp6c7S8w450BCHjs1SuahKN8oN9j/lrYXUMzUE8l
	3JztV+Pq0wt09igwjmzWwndZPcwY1UUVehbYg4qDqGYTxF2u6QqTlO6IW758P8sK7I21
	9mAQ==
Received: by 10.68.234.129 with SMTP id ue1mr2706354pbc.140.1337571403875;
	Sun, 20 May 2012 20:36:43 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:48 -0700
Message-Id: <7444023ab05c42934dd061e424a30b91d354e76d.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
References: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 13/14] qemumips64.conf: Add machine configuration for mips64(eb)
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
X-List-Received-Date: Mon, 21 May 2012 03:46:49 -0000

New machine description for qemu emulating malta64/mips64
big-endian system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemumips64.conf |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/qemumips64.conf

diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
new file mode 100644
index 0000000..8e9a488
--- /dev/null
+++ b/meta/conf/machine/qemumips64.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: mti_malta64 MIPS64
+#@DESCRIPTION: mti_malta64
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-mips64.inc
+
+KERNEL_IMAGETYPE = "vmlinux"
+KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
+
+SERIAL_CONSOLE = "115200 ttyS0"
+
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
-- 
1.7.5.4



