Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UbloX-0001kQ-Mf
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 08:00:56 +0200
Received: by mail-pb0-f54.google.com with SMTP id ro8so1643056pbb.27
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 22:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=QrUJe0Fs0TjF4P2TuceaKclOSbj3ZuvKKWMi5ZpKvQ4=;
	b=Z7SpnGVfOMoQkWQqWTPgiUvWCAr34jTqefs+1FVZxqQfyxr4BZcziFffn5TrMM7KR5
	gW4DIJRKULsD8KjfVGPByktrKhQ0qOUSwFCFlJnYoI+gvAXSH5HaSMWGZZKWDUcnJyPp
	v8UGcJh7PRGRqffVSBLJRwu8hiRepaPyTQwhePXte8q4iOTWkdWmwrFjSgMyaD9nRw/z
	pFjx7rRiBwqkgBznaH+kKA4r7zFkNvXWx60iapBRLzhEpJY02UlrG9mb+197wUAfLf0O
	mkdMZWwnOPgRYUgfhiCPsLC7gRU6gGqkWJhezkbVnRkjyOsHvx5yrqNK/R35RQsRfMpH
	QQsg==
X-Received: by 10.68.213.231 with SMTP id nv7mr28149235pbc.70.1368423759855;
	Sun, 12 May 2013 22:42:39 -0700 (PDT)
Received: from norse.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	aj6sm12620928pbd.14.2013.05.12.22.42.38 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 12 May 2013 22:42:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 May 2013 22:42:25 -0700
Message-Id: <b0592ab08273e17cb1511384ad189281f88c8b03.1368423406.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <a5c9cc4750706a0a84751170a0f10ce9e4f07f0d.1368423406.git.raj.khem@gmail.com>
References: <a5c9cc4750706a0a84751170a0f10ce9e4f07f0d.1368423406.git.raj.khem@gmail.com>
In-Reply-To: <cover.1368423406.git.raj.khem@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] machine/qemumips64: Add machine definition
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 06:01:25 -0000
X-List-Received-Date: Mon, 13 May 2013 06:01:25 -0000
X-List-Received-Date: Mon, 13 May 2013 06:01:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemumips64.conf | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/conf/machine/qemumips64.conf

diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
new file mode 100644
index 0000000..b2c7998
--- /dev/null
+++ b/meta/conf/machine/qemumips64.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: mti-malta64-be MIPS64
+#@DESCRIPTION: mti-malta64-be
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
1.8.2.1



