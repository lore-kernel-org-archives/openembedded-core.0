Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 61F017E517
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:10 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id a3so3663544pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Qm3nUp4ETfFw7xKL3DtOf5xMQ5Jy/AP61ADuVeZdZ74=;
	b=ITyXspVQIy3Rjf+MAzkJm/SYdCduMd2r0L9m67Ajmtvaj9aWdXsBWqCtLnk5oFLcrE
	4pmZ4mC2K+S4qq/GtwpNSHfG9xtb/03flYtx9xhudPKL3X7NthKd4TphtWHsCj59CcN1
	Qn0ndQ0gVUUHfCJHn6+5axc/BufRjs/c70Gb7MkqepF7THWHqn5ZIzIsGGssMK1RMGzx
	8FlP1QI8RUH+WQgcNTGq+Y6JyhcFiBvEMF0UCFfD99CJkDf8mq8FuzrZmuvu6Btd87b+
	s7Ov++eQZZhCla+QC/dObfs9YHQoqwRsyWVeX36HbowjbHYgWxmFVTwggAnC4poMUta2
	l0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Qm3nUp4ETfFw7xKL3DtOf5xMQ5Jy/AP61ADuVeZdZ74=;
	b=M/dolHpQ+fZ75M0BS3a/Xlw4FI+TR0elPfLwcf/6s+n9I1qgFIR/fjHmG9giJVyJUt
	OX5PDeCsYn7ILJGXbDxSp/zkKgXYAO2jkV7BhXOTGbcm2bylcyUAmiZ90far/Gg1Hj1H
	rGDlJ8sCS8lviKMiCG74NYYCcs0+y/002pHr6lh8ZN8md5XH+bI3nL2EuKFSEobhFjaR
	tem2ufvLnvkXtXqjT4M+2PR+8vbm1Gk5mRaEHfSY2PCFEBauXZ+HtI7v063TYvJMl5mC
	Qik/oBUaPsNjdp6s5KLD29yuyXUUU77i3rv80aeLKk1FBGO47h1JqO49Ya+nLvxB45Nn
	XS+w==
X-Gm-Message-State: APjAAAUHBq3DgQukPBuLKdhvgWhXj0BTEfANCudIcGPGl5Tpbevv+hUk
	c3TkVqjNeyhCNi36Xx6X+dBSArER
X-Google-Smtp-Source: APXvYqwcQmfuKLU0BdLHPaRE0IXtJyZ4WvgWSfn26fEgasnshBrIEI9rFz+eSha8SfQKrLAqva44Cw==
X-Received: by 2002:a17:90a:37e9:: with SMTP id
	v96mr16155789pjb.10.1560092051465; 
	Sun, 09 Jun 2019 07:54:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:41 -0700
Message-Id: <6d062f21e9ae63aaacddc48a300bb0db12d3872d.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 06/27] kernel: package modules.builtin.modinfo
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:10 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

As of commit 898490c010b [moduleparam: Save information about built-in
modules in separate file] (kernels v5.2-rc1+), modules.builtin.modinfo
is generated as part of the kernel build process.

We package it along with the other module artifacts, so it can be used
by scripts/other build steps.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 437b8c7..111a0b2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -558,7 +558,7 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
 PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
 FILES_${PN} = ""
-FILES_${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
+FILES_${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
 FILES_${KERNEL_PACKAGE_NAME}-image = ""
 FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
-- 
2.7.4


