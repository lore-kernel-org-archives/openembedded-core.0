Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9467D743
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 20:06:14 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id w15so1101821itc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 13:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n92x6K16tSGWTZC3uqjAJzFXMQYsWJukA+zbSVY5RRI=;
	b=dGQToqRxCuSWalhpukumTUWgrNIarKacqfvwJxkOT8gjsrTq1+kpjxm+tRO/oGuK+p
	+flidrD/W8W+Wil8J47lmS4b4pJxfGrz1KGMT7oMCqsNMOF/YsCRNaVaJka/sQtbwP0D
	OBiwZKIsM4CWX/TbJo9exix288ntgpdcN7l+YuXIdX0SvRz9N2f8Sgqc02kpjOEoZeiK
	DxSYk/j9l+Zj+HoME3d7KI6yj1jzA5zh/uaNxGjfhP4Sp6AObQsBHTJKu21SimZmO5H8
	e28PJNKx8+uQj1AiD+vr+q6anikNhM555IIf6DKMgL3EpIBoLB8KtL4YShX1EZE409x+
	iqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n92x6K16tSGWTZC3uqjAJzFXMQYsWJukA+zbSVY5RRI=;
	b=bkhV5at1A4zLSP9J5qjstH2s1Dm0J0f2vATEXqHg+7jlOeTGeXRcMecYZWk57YxEb9
	q2YLCXaJFSlyOjcOXxZ60TpzGRKdctKe7qQqzBc3F424xDrfBmdop30IVmabbgREopbZ
	lvA8U9YWjwsKd2vD4prDT4IZDHQnye8mvZVbS0dAmMqR7gHHN3eRWZE9VuHlwObnyclb
	gEnDIteekYr7eat0NJuihphinMg0FcxnmC67pAlHwhao37fI+J1t89jk4JOpiDyAReoO
	UTf1mYcp+aa6gomZS4p11W9IZuBXo5W9VLcFlGF4SLce0UpIUrfTDxMWVjhKI3u8XHeG
	t34w==
X-Gm-Message-State: APjAAAUUv2fwZ8K7CKWUmp3fie0ImSv+3kP/p8flXZPRArmd10tPo2KF
	WL9tax2NtOFbU8fmq4dd8Xk=
X-Google-Smtp-Source: APXvYqxlCyDQDrVAXpwKzvx9r5f4csH8zSFOWghZNPWCY7tBrxTd0xsKkGdOW+e2ZpnyVsCefSHUsA==
X-Received: by 2002:a02:52c9:: with SMTP id d192mr6699203jab.53.1556568374948; 
	Mon, 29 Apr 2019 13:06:14 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	o16sm11086902ioo.45.2019.04.29.13.06.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 13:06:14 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Mon, 29 Apr 2019 16:06:12 -0400
Message-Id: <20190429200612.8504-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.0: update TCP patch to mainline version
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
X-List-Received-Date: Mon, 29 Apr 2019 20:06:14 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the SRCREVs to drop our temporary workaround for TCP
timeout issues and switch to the mainline version:

  tcp: add sanity tests in tcp_add_backlog()
  Revert "tcp: fix issues relaed to implement coalescing on backlog queue"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.0.bb |  4 ++--
 .../linux/linux-yocto-tiny_5.0.bb              |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.0.bb   | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index ef3f0a0e1b..54f86dac92 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a3309af7ab77156bd8d731df3a97126d3d897916"
-SRCREV_meta ?= "2d838e11b084a96dd70e5cc0fec01d2e492f72c3"
+SRCREV_machine ?= "494384666b623a23e19cbbc54574d08e31496a03"
+SRCREV_meta ?= "d26eec23cf1057a715c05777a18f395678fcbf38"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 206e6c348d..720192152b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d905ae925fc4a60d63f45e1922163da683d8a3bc"
-SRCREV_machine ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
-SRCREV_meta ?= "2d838e11b084a96dd70e5cc0fec01d2e492f72c3"
+SRCREV_machine_qemuarm ?= "f07da0a13d6f503b72594776b5e8a9795da6d6a0"
+SRCREV_machine ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_meta ?= "d26eec23cf1057a715c05777a18f395678fcbf38"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 4ccf907ac5..ae8f643e9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v5.0/standard/base"
 KBRANCH_qemux86-64 ?= "v5.0/standard/base"
 KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "17c4b7e9db4d17aa713c85d0c3d2d84af962864a"
-SRCREV_machine_qemuarm64 ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
-SRCREV_machine_qemumips ?= "e5c23fb31438dab373a50afc40f6e4ab0c568485"
-SRCREV_machine_qemuppc ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
-SRCREV_machine_qemux86 ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
-SRCREV_machine_qemux86-64 ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
-SRCREV_machine_qemumips64 ?= "743d799797ad6828472087e1da8c67fdab87bf75"
-SRCREV_machine ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
-SRCREV_meta ?= "2d838e11b084a96dd70e5cc0fec01d2e492f72c3"
+SRCREV_machine_qemuarm ?= "99f3821bdc8718af3ef6e96d594b593d644ab2e4"
+SRCREV_machine_qemuarm64 ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_machine_qemumips ?= "1128cfe6c7915535c4066b75342c952640e65d72"
+SRCREV_machine_qemuppc ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_machine_qemux86 ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_machine_qemux86-64 ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_machine_qemumips64 ?= "55e385d52db438df1ff7ad3845c9076b2bb221eb"
+SRCREV_machine ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_meta ?= "d26eec23cf1057a715c05777a18f395678fcbf38"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


