Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id A65007DD6E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 16:14:08 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id o9so4604614iom.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2019 09:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3ldo4B2M6edOvvfhBzDusxLZzSWkLjPs4skQMPN82X0=;
	b=DfPqf8NEY+Ugv0bYcUeh3qyqKMfz8s1j8nm4b/qyFyEKJ4dDOjnEJ6j6QoCY3mRzFX
	KImD1HTcNssAZffy1YgvnSEsOkidEFNdbfxmL61G/YYCviivNvsQ3mAuSMQq9daGeW7H
	hJmTNb/JiCtRqcRtYPdhJ+7NAGBJJTq7Ig7ibKRAz8Bpau0LlSmc0Sb/0osL0OsXzFSd
	PAqa5PKZk4cqZojBCvA4pfspxLdBh6nIsgVVhZrdy5moHU5vJGUS2DYNwJO4fn/+jlgX
	lyXenZQm/GGu2nARQRYTTdwL4dCR7TV55tbSLd0rLQeKiP15mrOKAz1G2ER1cUTaAEal
	cR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3ldo4B2M6edOvvfhBzDusxLZzSWkLjPs4skQMPN82X0=;
	b=GYxkFLJCeAWsMN4GUnXlxe8GTDV3s8fhsdgCS+DGDd6DQ2G37rQrEN6gVMHaMi/8zo
	1fnY0mciIMqGYkwLcPR+Pk4oxtuBv4iNzO5hOvt6gVZ+0RA1ZCLmLSSV2oMKFlSg7+R7
	B5V6lYIoX/l5P6U2jxKCNW3gvDJ2IchqFAkZZkvMtEOhMajtECzKs/Pjp3L8LmNAMwsz
	B0ABJt5ADeDOW0Tu3IUDht7ZhMVmhfeackgguTBFg593qzG+uGWbtzFnvDIjgcT/lbj7
	CGrtQnzptxQlfqWKkgCjFvE9E0401qne38Fl1VrBpvckTp8ODu/8vveVsjLmDl/a7Q3u
	aQkA==
X-Gm-Message-State: APjAAAVUNeyYRkMS1kyDcoVTcUkzyt48R/zuERGSwGLZiKljIXUf1N9K
	G00kMeZEt8gRhES0oY5CGi0Z24l1OPM=
X-Google-Smtp-Source: APXvYqy0G03XGLzZbIRkvZAcqlyvx5WSUIy9APaDC9jC0DLAcOJRa5Z1sHQsLY7IQPLme8cSvEVkxw==
X-Received: by 2002:a5d:9942:: with SMTP id v2mr5168447ios.177.1562343249638; 
	Fri, 05 Jul 2019 09:14:09 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	m10sm1871386ioj.75.2019.07.05.09.14.08
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 09:14:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  5 Jul 2019 12:14:03 -0400
Message-Id: <4e3936e7a8fd143d54e7fc93b1543c9e7316e35a.1562342843.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1562342843.git.bruce.ashfield@gmail.com>
References: <cover.1562342843.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto: bsp/beaglebone: support qemu -machine virt
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
X-List-Received-Date: Fri, 05 Jul 2019 16:14:08 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

While we don't normally do a dual h/w and virt BSP (since they
tend to have conflicting requirements over time). A minimal overhead
option to do this was submitted to linux-yocto. Since it has no
impact on the h/w reference, has SDK testing value and can serve
as a template on how to do this for other arm boards, it is worth
making the configuration available.

The original commit log follows:

[

   If the kernel supports Qemu's virt machine, runqemu works almost for free.
   The device tree for machine virt is included in Qemu, which simplifies
   everything quite a bit.
   This change adds ARCH_VIRT=y and some drivers to the beaglebone kernel
   configuration which allows to:

     export MACHINE="beaglebone-yocto"
     bitbake core-image-minimale
     runqemu

   This also works out of an eSDK. Whithout this feature usually two
   different SDKs need to be compiled and maintained. One SDK is used for development
   in Qemu, another one is used to develop for the real target hardware.

   Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 35f2350d52..9e822f2e7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9c1e84c9b81b6bf1df55f26f2e0517266c37f7eb"
-SRCREV_meta ?= "eb6ef084f987441359145c41cadcbdd768eeb012"
+SRCREV_meta ?= "c2e34d9ab2894edc6abc6be9ac89907bf4348447"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 96cfb3dcd1..a1719651b6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "fabee455f397ba8054f35a3ad5f2250bbad93bef"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "eb6ef084f987441359145c41cadcbdd768eeb012"
+SRCREV_meta ?= "c2e34d9ab2894edc6abc6be9ac89907bf4348447"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index d4d30853f0..0e4a372d2d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "eb6ef084f987441359145c41cadcbdd768eeb012"
+SRCREV_meta ?= "c2e34d9ab2894edc6abc6be9ac89907bf4348447"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


