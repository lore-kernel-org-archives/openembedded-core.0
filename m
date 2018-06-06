Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4381278263
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:37:37 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id d2-v6so3623795pga.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 14:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bMJVWMN0uGkePdK35IsJZvJbisVGnygV0MLjes13C5Y=;
	b=lLyjNDO1h/GhhFkTQ242y6vtlFK+kNvUA0MmzeaHpfQ7Yru1Xtf++hueK5QU180FX/
	bl5nb8wtmXT2MVfpSpldpGSUUBIglBtB57dz3x1tzG1Rx1SPp6mfZYHXQm36hRTQUPZV
	+K8NKl9yPT3iITaGfnGz8v9v9Mbsa5J9nDS59ZGCNg5PSOcf9GfeM9rXEyPWj7FKE3Yt
	lne2APRxHPmObLbv6qPMS7rcLOCw6OSK8RSAuxiiWcfN2PDirMMaOhCzJ9nzPvOgDQx+
	TxkQwP7bCeWro63RG74KRAcY7rk17IiejTtBdeKhgnyTr6KLPD+RN5ifFLvrFcs/q6NW
	XwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bMJVWMN0uGkePdK35IsJZvJbisVGnygV0MLjes13C5Y=;
	b=K5UMg5prRg+w3N7thx74kl/Gzx51JDphoJstATAOb5uSXJZzvb8TpDO49DrNOio5ad
	IYWsUnXXFE+AzPxkwVTWQvOPdpIpNZ7VK8XyK4YSTcB5QCzCxph05R5pofKN+SoEMK5A
	mAmqc4aZSO+obHDnBvA/IN5SKpWTx0qEmpD/0VS9/UOcffnYzqnZ9WelBIIhWYpoqJmO
	/I8R26Cksm485RjK31TJfF8QrVwy0tOuGFj6XPvJgtKWJeIa25IyTUgK1iwureLIuCdo
	YgbIGCH3ysvYSl6WEDIrYXZeztRftNyVta14Pgezf6rvQ10jv88onHfODSROpsVqPOm5
	VD6A==
X-Gm-Message-State: APt69E2nrr54e4mVRSM5oEGD38gydhLDLp5sox5n8AVF9+NmAoTIzcUz
	Ji6TqHF8MEWS5MSJcmnUBX5xuA==
X-Google-Smtp-Source: ADUXVKIfwrycJChaMkYJUXAyBFbC1wrVLXyEiuYmvoUTkFRnZ/ruPDEvJv07TrzvQUydC7MI6BtLIg==
X-Received: by 2002:a62:8dd1:: with SMTP id
	p78-v6mr4024627pfk.141.1528321058034; 
	Wed, 06 Jun 2018 14:37:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c191-v6sm30452374pfg.48.2018.06.06.14.37.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 14:37:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:37:27 -0700
Message-Id: <8bd3847db5f79d7bcc2f43dd334165667f20c7fb.1528320772.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528320772.git.raj.khem@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
Subject: [PATCH 11/12] linux-yocto: Fix mips64 build with gcc8
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
X-List-Received-Date: Wed, 06 Jun 2018 21:37:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ps64-Disable-attribute-alias-warning.patch | 26 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.15.bb |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/0001-mips64-Disable-attribute-alias-warning.patch

diff --git a/meta/recipes-kernel/linux/files/0001-mips64-Disable-attribute-alias-warning.patch b/meta/recipes-kernel/linux/files/0001-mips64-Disable-attribute-alias-warning.patch
new file mode 100644
index 0000000000..0d3882f985
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-mips64-Disable-attribute-alias-warning.patch
@@ -0,0 +1,26 @@
+From 65fa442fb787b03aa28920cf54a4d1e6da10bb35 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 May 2018 12:43:49 -0700
+Subject: [PATCH] mips64: Disable attribute-alias warning
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch/mips/kernel/Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
+index eb92e52eb3db..795aa4c9ef7f 100644
+--- a/arch/mips/kernel/Makefile
++++ b/arch/mips/kernel/Makefile
+@@ -4,6 +4,8 @@
+ #
+ CFLAGS_signal.o		+= $(call cc-disable-warning, attribute-alias)
+ CFLAGS_syscall.o	+= $(call cc-disable-warning, attribute-alias)
++CFLAGS_linux32.o	+= $(call cc-disable-warning, attribute-alias)
++CFLAGS_signal32.o	+= $(call cc-disable-warning, attribute-alias)
+ 
+ extra-y		:= head.o vmlinux.lds
+ 
+-- 
+2.17.0
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index d579ffd645..32e63a57d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-powerpc-Disable-attribute-alias-warnings-from-gcc8.patch \
             file://0002-powerpc-ptrace-Disable-array-bounds-warning-with-gcc.patch \
             file://0001-mips-Disable-attribute-alias-warnings.patch \
+            file://0001-mips64-Disable-attribute-alias-warning.patch \
 "
 
 LINUX_VERSION ?= "4.15.13"
-- 
2.17.1


