Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 338017D72E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 15:38:01 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id x132so5640614itf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 08:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/P79aXNKZTXsHOw0R8ob8s6iMxMODblSWfI6v6PLvng=;
	b=Iv7Wn7pmUOcY2UPP7nAfCPRQzueSM93LfLUR5F7QWdTmzFmnNf/WL0rvLMzjsgUbj4
	zSMuHCEdeHoHyG2dDKycai/FLjLgomw92KXzkpa+kX9u8e6GPUQB+Fa1hFZHBghaXitv
	fZRRfx0tJ/j8eiORYPad031DwxTe7u57t+JCAJLVh+Nb5XaAyS6cZXV+fqPU4//ss3cQ
	WKtpzu9NrIQWTK7VnzPbiM9PUgnztQsp7wLlCwDTxVfaQ6s6VVfib2XzYykXCXgsMxwO
	e+HsKl23JT9GxxuZkj2XlvQiRISWLhFREVK2Kw8Hczl9BjeO9rnK3NUpRKRd0ajKbeQn
	+d7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/P79aXNKZTXsHOw0R8ob8s6iMxMODblSWfI6v6PLvng=;
	b=JdMu3vf62sGnFjAT2NdGh1VOdCdsWX7PJGuiqo41+FuCfJRgkeQkJ1gGNNDrkcieo0
	gDiyIVbsY5DNF77E82y175HtRiZy4oQcCgQSRrfZ3Jo8VqfkC9/uTZhH2/J9XLSfBR9H
	Ognzs6Tf8ZNw9BYwzFX0zOG1PglRxSXbyQsnlicCczrfEiY7Q7h7iu7JtEyw03E9I1CN
	Gfct3tIa7XATiS3ytzeIrTblvkD3/qio0i3BcTLaccVCW9fNH6K3xUTlh9dB/D9E7Ku5
	P2V+pnH7XzTcyzxbj+ciA1Ej79rXcq4Tsep0gupUTfZgmMkVNxcH6JY7R+UDkxySoTHO
	Q75A==
X-Gm-Message-State: APjAAAXl0WD60hMqW+eBlc4hLeQzWlwz74V0wBzleobuYoRC8R5VUCek
	LaWwp5Khb2Lk0hrjBk3mOjrOY2xhNok=
X-Google-Smtp-Source: APXvYqzLq0yF/zE9EE8XxhnconA74QIJ6GKUA9GKBtZUxS9bnr4njdK6o/tUmaPu7Uk6BQ3F9MfdQw==
X-Received: by 2002:a24:684b:: with SMTP id v72mr9842566itb.101.1554824282060; 
	Tue, 09 Apr 2019 08:38:02 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	y24sm12376510iol.8.2019.04.09.08.38.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 08:38:01 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue,  9 Apr 2019 11:37:52 -0400
Message-Id: <e1f5feae63c632da390bd845f87a95bfb0218419.1554824014.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1554824014.git.bruce.ashfield@gmail.com>
References: <cover.1554824014.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/5.0: update CGL audit configuration fragment
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
X-List-Received-Date: Tue, 09 Apr 2019 15:38:01 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the follow config tweak:

    cgl: audit: Remove CONFIG_AUDIT_WATCH and CONFIG_AUDIT_WATCH

    In the following commits, these two options have been replaced by
    CONFIG_AUDITSYSCALL which is in audit.cfg.

    c8fc5d49c341 ("audit: remove WATCH and TREE config options")
    cb74ed278f80 ("audit: always enable syscall auditing when supported and audit is enabled")

    Signed-off-by: He Zhe <zhe.he@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 65c3698495..68c57e89f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "06e1ff79ea9efef052404ee1989cae038b28e954"
-SRCREV_meta ?= "705457837e7ddd27e4e2ecf6d3dbd255b1aaf848"
+SRCREV_meta ?= "172634f02e7e293bb53c6c7b1473306b9b30058d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index dc60548c6f..b3027c0057 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "b0477279877bb2b5cca6ec49c64e931901ff2022"
 SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_meta ?= "705457837e7ddd27e4e2ecf6d3dbd255b1aaf848"
+SRCREV_meta ?= "172634f02e7e293bb53c6c7b1473306b9b30058d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index be5dbaedc1..dc3cc11466 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
 SRCREV_machine_qemux86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
 SRCREV_machine_qemumips64 ?= "2468c20c15477ebe5ecd73c0e0162d7432149318"
 SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_meta ?= "705457837e7ddd27e4e2ecf6d3dbd255b1aaf848"
+SRCREV_meta ?= "172634f02e7e293bb53c6c7b1473306b9b30058d"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


