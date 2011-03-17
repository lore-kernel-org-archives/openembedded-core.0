Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q0ILO-00058T-CX
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 19:54:49 +0100
Received: by pxi1 with SMTP id 1so670253pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=qL2ukIqTqd1thCWvY9uHb6OVwUwVsmfqUz4wwG9/1L4=;
	b=HKicAOvHo9QJ0QHCUhhJ161P2F32aPCR/6imjDUzHkmT8Ok+XQJlGPI/Shu8z7OU1C
	aXa24YVxv0SiQ6Qeif1k9KpxUIfGQRZHzbqPSiuJZjiJckoE+IxWfDdG11onTV6hbnka
	eXynfG2x3ZZ77aNVwJt/1uqS/HY0VZ+2NqRzg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DSLCdwK4YjMuQeAW90Bk4AiZin6RXOG8hpcHm5jN8hvzBRb3Um2ONs9JqHWjtaQgEe
	QMZjO3AsVXX4aGRm+x/l2eqpsYvN1AWwqbSSjGBykcHY85T8N7ftFAzdJ2Igj9hnf4Uc
	DKOfLx8Pzpi47eQ9UhIqPW47LzBzeAR2N5Omk=
Received: by 10.142.165.11 with SMTP id n11mr58296wfe.357.1300387968612;
	Thu, 17 Mar 2011 11:52:48 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m10sm2816564wfl.23.2011.03.17.11.52.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 11:52:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Mar 2011 11:52:43 -0700
Message-Id: <c2018dde3d247173e985ab1a8930c93956c809e2.1300387701.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300387701.git.raj.khem@gmail.com>
References: <cover.1300387701.git.raj.khem@gmail.com>
Subject: [PATCH 2/5] qemu.inc: Add sh4, sh4eb, mips64, mips64el targets
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
X-List-Received-Date: Thu, 17 Mar 2011 18:54:50 -0000

In order to leavarage more emulations in oe-core
these targets needs to be built as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2c6b114..913d7c6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -3,7 +3,8 @@ HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "zlib"
 
-EXTRA_OECONF = "--target-list=arm-linux-user,arm-softmmu,i386-linux-user,i386-softmmu,x86_64-linux-user,x86_64-softmmu,mips-linux-user,mips-softmmu,ppc-linux-user,ppc-softmmu,mipsel-linux-user --disable-werror --disable-vnc-tls --enable-kvm --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370"
+EXTRA_OECONF = "--target-list=arm-linux-user,arm-softmmu,i386-linux-user,i386-softmmu,x86_64-linux-user,x86_64-softmmu,mips-linux-user,mips-softmmu,ppc-linux-user,ppc-softmmu,mipsel-linux-user,mips64el-softmmu,mips64-softmmu,sh4-linux-user,sh4-softmmu,sh4eb-linux-user,sh4eb-softmmu --disable-werror --disable-vnc-tls --enable-kvm --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370"
+
 #EXTRA_OECONF += "--disable-sdl"
 
 inherit autotools
@@ -34,6 +35,6 @@ do_configure() {
 SRC_URI_append_virtclass-nativesdk = " file://glflags.patch;patch=1"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk qemugl-nativesdk"
 RDEPENDS_virtclass-nativesdk = "libsdl-nativesdk"
-EXTRA_OECONF_virtclass-nativesdk = "--target-list=arm-linux-user,arm-softmmu,i386-softmmu,x86_64-softmmu,mips-linux-user,mipsel-linux-user,mips-softmmu,ppc-softmmu --disable-vnc-tls --cross-prefix=${TARGET_PREFIX}"
+EXTRA_OECONF_virtclass-nativesdk = "--target-list=arm-linux-user,arm-softmmu,i386-linux-user,i386-softmmu,x86_64-linux-user,x86_64-softmmu,mips-linux-user,mips-softmmu,ppc-linux-user,ppc-softmmu,mipsel-linux-user,mips64el-softmmu,mips64-softmmu,sh4-linux-user,sh4-softmmu,sh4eb-linux-user,sh4eb-softmmu --disable-werror --disable-vnc-tls --cross-prefix=${TARGET_PREFIX}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.4.1



