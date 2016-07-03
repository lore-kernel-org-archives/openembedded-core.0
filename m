Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id D37CF60111
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jul 2016 18:16:18 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 66so14440792pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jul 2016 11:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=LX2oERCIJdwClvFm3pYJhqK/2sYaPcRFI8ZgkWs3za4=;
	b=RuoTxyL+yQH2KYXEKiico7pna0B8mcye3D8c9Qh3diy2k1lQXyE6ej95aBmTqhJ9Qn
	i0312xewNXoNPa3+QNbUcgIk6ya/32rlvOjPN/159nxnvwZ7MaZuoIQgw6j3ug/dfWPX
	XJNKTOMQcE9rxLmnWT0fNxw2nJbueradQsh98/+IkpjF4Ai6eqxTDTvpG0ebdcUUoq9t
	lnnXHjvp+qEaaO/E1LcFt2FUtxx3Af1nlNqOCK9mXwMqWBGg5GB7Wp/vZFusmvWISN7Q
	x+3xDCP+6wny4EtuIGcIKH27XW2InZjxtHp4idMXgsRNAgsZc++cJfLujDnUzj4gwQdE
	G4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=LX2oERCIJdwClvFm3pYJhqK/2sYaPcRFI8ZgkWs3za4=;
	b=jq9PRdy2D1Q8lJQZ0agUsgGuUizaNwWGzUhEUX59VYCiNOFAwfrrl2BmSPAOJt0F/V
	s3OYQnqMvleHRs74gSWbPSGByPB5xhAjSf6/v8CCHaggqSIdbNLs3QFfYyPiHJnpnQ8d
	OeFsOjKuK1A02lsZ9krvMajsHYq+y2CvktOXw+ZqPVhie9RHEo7g5I+TaWr/+ONoNiMx
	L1UT0Ay1gX1x42jVkLch6idjHNwgZVr0XeXF5GZaEP5TK7wdThT67W9zAZMD0paFGCNO
	WJeEtazfql4rJog9ckXlMGgFY49K+dKgfQR2HvaPvAUSxnRK6kzKXpmmqDnkp5PjNszv
	0V2g==
X-Gm-Message-State: ALyK8tJNYQmOB5n815IPsHuqzvFLF5YAlxiZrntSwmKV62p2jS38/2DML+M+fCQ16HBMzQ==
X-Received: by 10.98.85.5 with SMTP id j5mr15536654pfb.81.1467569779487;
	Sun, 03 Jul 2016 11:16:19 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 77sm4822770pfp.66.2016.07.03.11.16.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jul 2016 11:16:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Sun,  3 Jul 2016 11:15:48 -0700
Message-Id: <b4a3552c7078b6d6bc2b91bbf9f9e09ee1132b7d.1467569369.git.akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1467569369.git.akuster@mvista.com>
References: <cover.1467569369.git.akuster@mvista.com>
In-Reply-To: <cover.1467569369.git.akuster@mvista.com>
References: <cover.1467569369.git.akuster@mvista.com>
Subject: [PATCH 5/5] qeme: add ppc64 to poky QEMU_TARGET
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
X-List-Received-Date: Sun, 03 Jul 2016 18:16:19 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-poky/conf/distro/poky.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 6cae44e..361e2f1 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -28,6 +28,7 @@ PREFERRED_VERSION_linux-yocto_qemuarm ?= "4.4%"
 PREFERRED_VERSION_linux-yocto_qemumips ?= "4.4%"
 PREFERRED_VERSION_linux-yocto_qemumips64 ?= "4.4%"
 PREFERRED_VERSION_linux-yocto_qemuppc ?= "4.4%"
+PREFERRED_VERSION_linux-yocto_qemuppc64 ?= "4.4%"
 
 SDK_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${IMAGE_BASENAME}-${TUNE_PKGARCH}"
 SDKPATH = "/opt/${DISTRO}/${SDK_VERSION}"
@@ -40,12 +41,13 @@ DISTRO_EXTRA_RDEPENDS_append_qemuarm = " ${POKYQEMUDEPS}"
 DISTRO_EXTRA_RDEPENDS_append_qemuarm64 = " ${POKYQEMUDEPS}"
 DISTRO_EXTRA_RDEPENDS_append_qemumips = " ${POKYQEMUDEPS}"
 DISTRO_EXTRA_RDEPENDS_append_qemuppc = " ${POKYQEMUDEPS}"
+DISTRO_EXTRA_RDEPENDS_append_qemuppc64 = " ${POKYQEMUDEPS}"
 DISTRO_EXTRA_RDEPENDS_append_qemux86 = " ${POKYQEMUDEPS}"
 DISTRO_EXTRA_RDEPENDS_append_qemux86-64 = " ${POKYQEMUDEPS}"
 
 TCLIBCAPPEND = ""
 
-QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 ppc x86_64"
+QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 ppc ppc64 x86_64"
 # Other QEMU_TARGETS "mips64el sh4"
 
 PREMIRRORS ??= "\
-- 
1.9.1


