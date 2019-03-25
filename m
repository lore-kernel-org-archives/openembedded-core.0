Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id C8F327CFDF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 03:11:59 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id z126so11828419itd.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 20:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7HYhQqaGM/OMG9SyNzFj+xG/koIBRaExHv99NVxkspg=;
	b=rUO/BGNRRIhYhBmzQ1sCzN2MF+q17d5YyxPisXzFWP208vspFZL0gG5NecSHH8WTx/
	zeI7H4ZyBkNdB6DS/e/8FRW/sE4Febd1+w8YFpsO3nU+c0GsUn15x8X4FAfJcPa+Q704
	tsTMRb7Gh/TIt1YGne2nB3xOrrJ383K30jC7cn+jd2TIDlrdCe0/oTF8AhGGHAQ/VxHj
	163M23NICb831O8VHYnDOejn/KADkzjdpY/iRdlkigq2yEp5p+R+gfBcxyL2j8Q+31hU
	4iRWGmJkxgJB7w6iVOkxrQTPcCoBdyL/dFD1tM5q0OG1EKxdtOcJtFh1nQzRvim2cigI
	5j+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7HYhQqaGM/OMG9SyNzFj+xG/koIBRaExHv99NVxkspg=;
	b=XE1X4wAc0IIngb+x967RPNwpd3vb+gd7+XUkyTNqSYpdW4m8kOlXM7d7RRy+Thvgox
	2a6fw5C/ORoVAXLeJmOWyWCJDEv/Aeup4IEUXA+U3P1p0hlwpSwWZC42ErG3QvVed4n6
	2t9q7zuseJDU2DDK8jMy6SPtWFzwRahHJ7EEdZ9mOXPKRZrkhk+mYOb2gVmDujGfZIz0
	kb04WY9Cai9pRR4u6Me5BnYS8J48xA6it+HorEtm18I6T9p43854wPFftIyzjprLTqHX
	qz9jPCqnpJgy2Bl99UkfnZp7B+5hooKDK8+CueSY+glZCfdhR0ftmwkbhsfc2f3DdcoU
	db7g==
X-Gm-Message-State: APjAAAWfVAAzN6ptB7OeT8IKNcQwnW0kx3JanmJp7BnA4/F7gP34Gmys
	udS2WkCVUlFo9fy4hhxYApkxkxkaeKs=
X-Google-Smtp-Source: APXvYqzRB/redjtLdPLHaCf+DD5uOovuHfJ0AElxfveO1TwkPLC4PkrrchQmGqbgmjrz6+UD02lz1w==
X-Received: by 2002:a24:cc89:: with SMTP id x131mr8213705itf.121.1553483520692;
	Sun, 24 Mar 2019 20:12:00 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id l8sm5443416itl.26.2019.03.24.20.11.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Mar 2019 20:12:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 24 Mar 2019 23:11:50 -0400
Message-Id: <5c5b3091cc42999e6288cc2abff92112b19de6dc.1553483380.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1553483380.git.bruce.ashfield@gmail.com>
References: <cover.1553483380.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto: sound: Re-enable ENS1370 support
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
X-List-Received-Date: Mon, 25 Mar 2019 03:11:59 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit:

[
   Author: Tom Rini <trini@konsulko.com>
   Date:   Tue Mar 12 11:40:33 2019 -0400

       sound: Re-enable ENS1370 support

       Both the qemux86 and qemux86-64 targets RRECOMMEND the ens1370 kernel
       module and set QB_AUDIO_OPT to support that as one of the audio cards as
       well.

       Fixes: daadaf7fd7d5 ("yocto-kernel-cache: [PATCH] Update audio support v2")
       Signed-off-by: Tom Rini <trini@konsulko.com>
       Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 36761b9943..18a6fad2d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3059029718900250904b9f587e37ba22fb949ea6"
-SRCREV_meta ?= "41fe45f7c5e69f6ec26c657fea16c459544042cf"
+SRCREV_meta ?= "8bbb1a762d4370b0698403f75a5b98ed25a3517f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 2487da88d2..ead031166c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
-SRCREV_meta ?= "8fbd119bd954443b1cae496d7797c458faa02495"
+SRCREV_meta ?= "c713269d5c5a3dffb7e4aabeecbcb3d481a59151"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 52dbabd7a4..065e112ccd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "6cc861e796ab19a6827cf9996e7755f1875d553e"
 SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_meta ?= "41fe45f7c5e69f6ec26c657fea16c459544042cf"
+SRCREV_meta ?= "8bbb1a762d4370b0698403f75a5b98ed25a3517f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 04b319f1ca..589aee3431 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "2260c031075188dce4d30223527dda68e3940574"
 SRCREV_machine ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
-SRCREV_meta ?= "8fbd119bd954443b1cae496d7797c458faa02495"
+SRCREV_meta ?= "c713269d5c5a3dffb7e4aabeecbcb3d481a59151"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index aca9f15404..3beba32c34 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
 SRCREV_machine_qemux86-64 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
 SRCREV_machine_qemumips64 ?= "fc7a2bf24e0e39b6a260f8650a3c8d497b8cdcfd"
 SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_meta ?= "41fe45f7c5e69f6ec26c657fea16c459544042cf"
+SRCREV_meta ?= "8bbb1a762d4370b0698403f75a5b98ed25a3517f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 787710d860..81845c48da 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
 SRCREV_machine_qemux86-64 ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
 SRCREV_machine_qemumips64 ?= "8322515ba7a858c47386b95c6e7201c8a3a41175"
 SRCREV_machine ?= "37c8f2a3df1e3154087538a27228fad0c6e172c5"
-SRCREV_meta ?= "8fbd119bd954443b1cae496d7797c458faa02495"
+SRCREV_meta ?= "c713269d5c5a3dffb7e4aabeecbcb3d481a59151"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


