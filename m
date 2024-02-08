Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC57C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 11:13:56 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.15584.1707390830229923210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 03:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cwHwwc8S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33b40208735so1132859f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 03:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707390828; x=1707995628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C1NFSGQwhO2bGPibC6d6CULvNw7ePAifj6jtfvZjJ24=;
        b=cwHwwc8SS5tGXPEhui5ndp2DtCypQeWrP/oaX0nYZM+b22e0DrZrLgZrUt4jjCnQrK
         QN60yhSSgUhiTPN5WxZ5TzPL+zC00yMG2vT4AlEgoSa6Zsp+p83MaaTCMqEcl1G1U9dO
         s2NjN3/XIFuP57sno+l3vVBiinYgSL27VjFvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707390828; x=1707995628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1NFSGQwhO2bGPibC6d6CULvNw7ePAifj6jtfvZjJ24=;
        b=EyJ8LTuf8Ms0YEfCB/sfm0RH9HDceXrK8jMqTr3TH89p7qJRcPKKNdt9DceU8C9zfN
         e2cLIqHpAy4lZFusruVg+aKusFBjnrGLql0YG/AY3RFPYoqQOovgBreIdAGKYGj2bB6u
         ENH7PvnSNS64wM6PPmxtosRg3fNg8FdbSS0TlNW9S5Jd0npS7+WhOK/Ijo44y3Y9qfEI
         2wwK2ACPRfWAMHLBxK8qGiT6n4aQOVk7kbxR8zcfWqIpp+rvl1iwEB5QrPOXsTqFEGZi
         KW2dkQWIdupNWh2IwGhTtm0Lu+td5O6/rZfTcxZy0MUunBX1fnf+5FCLM3el/14zAcJo
         FLOQ==
X-Gm-Message-State: AOJu0YxQWc2KsAVbHF6J3vWZKDdjJevHsQSdjMNG2Og10FLugtd+vnx9
	Gb4cnmurGPAbg4fn9SeXiL++IgSxDJWUFzUUD4chZylFE8lW6UFwZOCGhFdBCB6uwlMbwAblkwI
	u
X-Google-Smtp-Source: AGHT+IEz3MKgi/ON2ntPP3mW5DcO5WqWqN2tqXjYZs16an/9Lm/fVOK3usoFRrMqqrb8E3bE+480fQ==
X-Received: by 2002:a5d:4b4c:0:b0:33b:5a5b:6a99 with SMTP id w12-20020a5d4b4c000000b0033b5a5b6a99mr819654wrs.67.1707390827553;
        Thu, 08 Feb 2024 03:13:47 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c14:ae3d:85df:fff])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d6341000000b0033aee3bfac5sm3337536wrw.16.2024.02.08.03.13.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 03:13:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-devsrc: Clean up whitespace
Date: Thu,  8 Feb 2024 11:13:46 +0000
Message-Id: <20240208111346.2817649-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 11:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195132

This file had a function full of mixed tabs and spaces. Our policy says
tabs, some layers use spaces but this function matched nothing.

It makes sense to clean this up, I'm torn between which to use. I've gone
with the lesser invasive change (despite what the diff looks like) and used
spaces as the code was clearly written with that partly in mind and tabs would
have changed every line. Hopefully this makes future patches a little less
weird looking.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 442 ++++++++++-----------
 1 file changed, 221 insertions(+), 221 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index c39ad7bc18c..55cac1fc817 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -47,21 +47,21 @@ do_install() {
     # create  a /usr/src/kernel symlink to /lib/modules/<version>/source
     mkdir -p ${D}/usr/src
     (
-	cd ${D}/usr/src
-	ln -rs ${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}/source kernel
+        cd ${D}/usr/src
+        ln -rs ${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}/source kernel
     )
 
     # for on target purposes, we unify build and source
     (
-	cd $kerneldir
-	ln -s build source
+        cd $kerneldir
+        ln -s build source
     )
 
     # first copy everything
     (
-	cd ${S}
-	cp --parents $(find  -type f -name "Makefile*" -o -name "Kconfig*") $kerneldir/build
-	cp --parents $(find  -type f -name "Build" -o -name "Build.include") $kerneldir/build
+        cd ${S}
+        cp --parents $(find  -type f -name "Makefile*" -o -name "Kconfig*") $kerneldir/build
+        cp --parents $(find  -type f -name "Build" -o -name "Build.include") $kerneldir/build
     )
 
     # then drop all but the needed Makefiles/Kconfig files
@@ -70,116 +70,116 @@ do_install() {
 
     # now copy in parts from the build that we'll need later
     (
-	cd ${B}
-
-	if [ -s Module.symvers ]; then
-	    cp Module.symvers $kerneldir/build
-	fi
-	cp System.map* $kerneldir/build
-	if [ -s Module.markers ]; then
-	    cp Module.markers $kerneldir/build
-	fi
-
-	cp -a .config $kerneldir/build
-
-	# This scripts copy blow up QA, so for now, we require a more
-	# complex 'make scripts' to restore these, versus copying them
-	# here. Left as a reference to indicate that we know the scripts must
-	# be dealt with.
-	# cp -a scripts $kerneldir/build
-
-	# although module.lds can be regenerated on target via 'make modules_prepare'
-	# there are several places where 'makes scripts prepare' is done, and that won't
-	# regenerate the file. So we copy it onto the target as a migration to using
-	# modules_prepare
-	cp -a --parents scripts/module.lds $kerneldir/build/ 2>/dev/null || :
+        cd ${B}
+
+        if [ -s Module.symvers ]; then
+            cp Module.symvers $kerneldir/build
+        fi
+        cp System.map* $kerneldir/build
+        if [ -s Module.markers ]; then
+            cp Module.markers $kerneldir/build
+        fi
+
+        cp -a .config $kerneldir/build
+
+        # This scripts copy blow up QA, so for now, we require a more
+        # complex 'make scripts' to restore these, versus copying them
+        # here. Left as a reference to indicate that we know the scripts must
+        # be dealt with.
+        # cp -a scripts $kerneldir/build
+
+        # although module.lds can be regenerated on target via 'make modules_prepare'
+        # there are several places where 'makes scripts prepare' is done, and that won't
+        # regenerate the file. So we copy it onto the target as a migration to using
+        # modules_prepare
+        cp -a --parents scripts/module.lds $kerneldir/build/ 2>/dev/null || :
 
         if [ -d arch/${ARCH}/scripts ]; then
-	    cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
-	fi
-	if [ -f arch/${ARCH}/*lds ]; then
-	    cp -a arch/${ARCH}/*lds $kerneldir/build/arch/${ARCH}
-	fi
-
-	rm -f $kerneldir/build/scripts/*.o
-	rm -f $kerneldir/build/scripts/*/*.o
-
-	if [ "${ARCH}" = "powerpc" ]; then
-	    if [ -e arch/powerpc/lib/crtsavres.S ] ||
-		   [ -e arch/powerpc/lib/crtsavres.o ]; then
-		cp -a --parents arch/powerpc/lib/crtsavres.[So] $kerneldir/build/
-	    fi
-	fi
-
-	if [ "${ARCH}" = "arm64" -o "${ARCH}" = "riscv" ]; then
+            cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
+        fi
+        if [ -f arch/${ARCH}/*lds ]; then
+            cp -a arch/${ARCH}/*lds $kerneldir/build/arch/${ARCH}
+        fi
+
+        rm -f $kerneldir/build/scripts/*.o
+        rm -f $kerneldir/build/scripts/*/*.o
+
+        if [ "${ARCH}" = "powerpc" ]; then
+            if [ -e arch/powerpc/lib/crtsavres.S ] ||
+                   [ -e arch/powerpc/lib/crtsavres.o ]; then
+                cp -a --parents arch/powerpc/lib/crtsavres.[So] $kerneldir/build/
+            fi
+        fi
+
+        if [ "${ARCH}" = "arm64" -o "${ARCH}" = "riscv" ]; then
             if [ -e arch/${ARCH}/kernel/vdso/vdso.lds ]; then
-	        cp -a --parents arch/${ARCH}/kernel/vdso/vdso.lds $kerneldir/build/
+                cp -a --parents arch/${ARCH}/kernel/vdso/vdso.lds $kerneldir/build/
             fi
-	fi
-	if [ "${ARCH}" = "powerpc" ]; then
-	    cp -a --parents arch/powerpc/kernel/vdso32/vdso32.lds $kerneldir/build 2>/dev/null || :
-	    cp -a --parents arch/powerpc/kernel/vdso64/vdso64.lds $kerneldir/build 2>/dev/null || :
-	    # v5.19+
-	    cp -a --parents arch/powerpc/kernel/vdso/vdso*.lds $kerneldir/build 2>/dev/null || :
-	fi
-
-	cp -a include $kerneldir/build/include
-
-	# we don't usually copy generated files, since they can be rebuilt on the target,
-	# but without this file, we get a forced syncconfig run in v5.8+, which prompts and
-	# breaks workflows.
-	cp -a --parents include/generated/autoconf.h $kerneldir/build 2>/dev/null || :
-
-	if [ -e $kerneldir/include/generated/.vdso-offsets.h.cmd ] ||
-	     [ -e $kerneldir/build/include/generated/.vdso-offsets.h.cmd ] ||
-	     [ -e $kerneldir/build/include/generated/.vdso32-offsets.h.cmd ] ; then
-	    rm -f $kerneldir/include/generated/.vdso-offsets.h.cmd
-	    rm -f $kerneldir/build/include/generated/.vdso-offsets.h.cmd
-	    rm -f $kerneldir/build/include/generated/.vdso32-offsets.h.cmd
-	fi
+        fi
+        if [ "${ARCH}" = "powerpc" ]; then
+            cp -a --parents arch/powerpc/kernel/vdso32/vdso32.lds $kerneldir/build 2>/dev/null || :
+            cp -a --parents arch/powerpc/kernel/vdso64/vdso64.lds $kerneldir/build 2>/dev/null || :
+            # v5.19+
+            cp -a --parents arch/powerpc/kernel/vdso/vdso*.lds $kerneldir/build 2>/dev/null || :
+        fi
+
+        cp -a include $kerneldir/build/include
+
+        # we don't usually copy generated files, since they can be rebuilt on the target,
+        # but without this file, we get a forced syncconfig run in v5.8+, which prompts and
+        # breaks workflows.
+        cp -a --parents include/generated/autoconf.h $kerneldir/build 2>/dev/null || :
+
+        if [ -e $kerneldir/include/generated/.vdso-offsets.h.cmd ] ||
+             [ -e $kerneldir/build/include/generated/.vdso-offsets.h.cmd ] ||
+             [ -e $kerneldir/build/include/generated/.vdso32-offsets.h.cmd ] ; then
+            rm -f $kerneldir/include/generated/.vdso-offsets.h.cmd
+            rm -f $kerneldir/build/include/generated/.vdso-offsets.h.cmd
+            rm -f $kerneldir/build/include/generated/.vdso32-offsets.h.cmd
+        fi
     )
 
     # now grab the chunks from the source tree that we need
     (
-	cd ${S}
+        cd ${S}
 
-	cp -a scripts $kerneldir/build
+        cp -a scripts $kerneldir/build
 
-	# for v6.1+ (otherwise we are missing multiple default targets)
-	cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
+        # for v6.1+ (otherwise we are missing multiple default targets)
+        cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
 
-	# For v6.6+ the debian packing is moved out to seperate rules file
-	# Remove as we else would ned to RDEPEND on make
-	rm $kerneldir/build/scripts/package/debian/rules 2>/dev/null || :
+        # For v6.6+ the debian packing is moved out to seperate rules file
+        # Remove as we else would ned to RDEPEND on make
+        rm $kerneldir/build/scripts/package/debian/rules 2>/dev/null || :
 
-	# if our build dir had objtool, it will also be rebuilt on target, so
-	# we copy what is required for that build
-	if [ -f ${B}/tools/objtool/objtool ]; then
-	    # these are a few files associated with objtool, since we'll need to
-	    # rebuild it
-	    cp -a --parents tools/build/Build.include $kerneldir/build/
-	    cp -a --parents tools/build/Build $kerneldir/build/
-	    cp -a --parents tools/build/fixdep.c $kerneldir/build/
-	    cp -a --parents tools/scripts/utilities.mak $kerneldir/build/
+        # if our build dir had objtool, it will also be rebuilt on target, so
+        # we copy what is required for that build
+        if [ -f ${B}/tools/objtool/objtool ]; then
+            # these are a few files associated with objtool, since we'll need to
+            # rebuild it
+            cp -a --parents tools/build/Build.include $kerneldir/build/
+            cp -a --parents tools/build/Build $kerneldir/build/
+            cp -a --parents tools/build/fixdep.c $kerneldir/build/
+            cp -a --parents tools/scripts/utilities.mak $kerneldir/build/
 
-	    # extra files, just in case
-	    cp -a --parents tools/objtool/* $kerneldir/build/
-	    cp -a --parents tools/lib/* $kerneldir/build/
-	    cp -a --parents tools/lib/subcmd/* $kerneldir/build/
+            # extra files, just in case
+            cp -a --parents tools/objtool/* $kerneldir/build/
+            cp -a --parents tools/lib/* $kerneldir/build/
+            cp -a --parents tools/lib/subcmd/* $kerneldir/build/
 
-	    cp -a --parents tools/include/* $kerneldir/build/
+            cp -a --parents tools/include/* $kerneldir/build/
 
-	    cp -a --parents $(find tools/arch/${ARCH}/ -type f) $kerneldir/build/
-	fi
+            cp -a --parents $(find tools/arch/${ARCH}/ -type f) $kerneldir/build/
+        fi
 
-	if [ "${ARCH}" = "arm64" ]; then
-	    # arch/arm64/include/asm/xen references arch/arm
-	    cp -a --parents arch/arm/include/asm/xen $kerneldir/build/
-	    # arch/arm64/include/asm/opcodes.h references arch/arm
-	    cp -a --parents arch/arm/include/asm/opcodes.h $kerneldir/build/
+        if [ "${ARCH}" = "arm64" ]; then
+            # arch/arm64/include/asm/xen references arch/arm
+            cp -a --parents arch/arm/include/asm/xen $kerneldir/build/
+            # arch/arm64/include/asm/opcodes.h references arch/arm
+            cp -a --parents arch/arm/include/asm/opcodes.h $kerneldir/build/
 
-	    # v6.1+
-	    cp -a --parents arch/arm64/kernel/asm-offsets.c $kerneldir/build/
+            # v6.1+
+            cp -a --parents arch/arm64/kernel/asm-offsets.c $kerneldir/build/
 
             cp -a --parents arch/arm64/kernel/vdso/*gettimeofday.* $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/sigreturn.S $kerneldir/build/
@@ -202,26 +202,26 @@ do_install() {
             if [ -e $kerneldir/build/arch/arm64/tools/gen-sysreg.awk ]; then
                  sed -i -e "s,#!.*awk.*,#!${USRBINPATH}/env awk," $kerneldir/build/arch/arm64/tools/gen-sysreg.awk
             fi
-	fi
-
-	if [ "${ARCH}" = "powerpc" ]; then
-	    # 5.0 needs these files, but don't error if they aren't present in the source
-	    cp -a --parents arch/${ARCH}/kernel/syscalls/syscall.tbl $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents arch/${ARCH}/kernel/syscalls/syscalltbl.sh $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents arch/${ARCH}/kernel/syscalls/syscallhdr.sh $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents arch/${ARCH}/kernel/vdso32/* $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents arch/${ARCH}/kernel/vdso64/* $kerneldir/build/ 2>/dev/null || :
-
-	    # v5.19+
-	    cp -a --parents arch/powerpc/kernel/vdso/*.S $kerneldir/build 2>/dev/null || :
-	    cp -a --parents arch/powerpc/kernel/vdso/*gettimeofday.* $kerneldir/build 2>/dev/null || :
-	    cp -a --parents arch/powerpc/kernel/vdso/gen_vdso*_offsets.sh $kerneldir/build/ 2>/dev/null || :
-
-	    # v6,1+
-	    cp -a --parents arch/powerpc/kernel/asm-offsets.c $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents arch/powerpc/kernel/head_booke.h $kerneldir/build/ 2>/dev/null || :
-	fi
-	if [ "${ARCH}" = "riscv" ]; then
+        fi
+
+        if [ "${ARCH}" = "powerpc" ]; then
+            # 5.0 needs these files, but don't error if they aren't present in the source
+            cp -a --parents arch/${ARCH}/kernel/syscalls/syscall.tbl $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/${ARCH}/kernel/syscalls/syscalltbl.sh $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/${ARCH}/kernel/syscalls/syscallhdr.sh $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/${ARCH}/kernel/vdso32/* $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/${ARCH}/kernel/vdso64/* $kerneldir/build/ 2>/dev/null || :
+
+            # v5.19+
+            cp -a --parents arch/powerpc/kernel/vdso/*.S $kerneldir/build 2>/dev/null || :
+            cp -a --parents arch/powerpc/kernel/vdso/*gettimeofday.* $kerneldir/build 2>/dev/null || :
+            cp -a --parents arch/powerpc/kernel/vdso/gen_vdso*_offsets.sh $kerneldir/build/ 2>/dev/null || :
+
+            # v6,1+
+            cp -a --parents arch/powerpc/kernel/asm-offsets.c $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/powerpc/kernel/head_booke.h $kerneldir/build/ 2>/dev/null || :
+        fi
+        if [ "${ARCH}" = "riscv" ]; then
             cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $kerneldir/build/
             cp -a --parents arch/riscv/kernel/vdso/note.S $kerneldir/build/
             # v6.1+
@@ -229,120 +229,120 @@ do_install() {
             if [ -e arch/riscv/kernel/vdso/gen_vdso_offsets.sh ]; then
                     cp -a --parents arch/riscv/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
             fi
-	    cp -a --parents arch/riscv/kernel/vdso/* $kerneldir/build/ 2>/dev/null || :
-	    if [ -e arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh ]; then
-	        cp -a --parents arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh $kerneldir/build/
-	    fi
-	    cp -a --parents arch/riscv/kernel/compat_vdso/* $kerneldir/build/ 2>/dev/null || :
-	fi
+            cp -a --parents arch/riscv/kernel/vdso/* $kerneldir/build/ 2>/dev/null || :
+            if [ -e arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh ]; then
+                cp -a --parents arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh $kerneldir/build/
+            fi
+            cp -a --parents arch/riscv/kernel/compat_vdso/* $kerneldir/build/ 2>/dev/null || :
+        fi
 
-	# include the machine specific headers for ARM variants, if available.
-	if [ "${ARCH}" = "arm" ]; then
-	    cp -a --parents arch/${ARCH}/mach-*/include $kerneldir/build/
+        # include the machine specific headers for ARM variants, if available.
+        if [ "${ARCH}" = "arm" ]; then
+            cp -a --parents arch/${ARCH}/mach-*/include $kerneldir/build/
 
-	    # include a few files for 'make prepare'
-	    cp -a --parents arch/arm/tools/gen-mach-types $kerneldir/build/
-	    cp -a --parents arch/arm/tools/mach-types $kerneldir/build/
+            # include a few files for 'make prepare'
+            cp -a --parents arch/arm/tools/gen-mach-types $kerneldir/build/
+            cp -a --parents arch/arm/tools/mach-types $kerneldir/build/
 
-	    # 5.19+
-	    cp -a --parents arch/arm/tools/gen-sysreg.awk $kerneldir/build/	2>/dev/null || :
+            # 5.19+
+            cp -a --parents arch/arm/tools/gen-sysreg.awk $kerneldir/build/ 2>/dev/null || :
 
-	    # ARM syscall table tools only exist for kernels v4.10 or later
+            # ARM syscall table tools only exist for kernels v4.10 or later
             SYSCALL_TOOLS=$(find arch/arm/tools -name "syscall*")
             if [ -n "$SYSCALL_TOOLS" ] ; then
-	        cp -a --parents $SYSCALL_TOOLS $kerneldir/build/
+                cp -a --parents $SYSCALL_TOOLS $kerneldir/build/
             fi
 
             cp -a --parents arch/arm/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
             # v6.1+
             cp -a --parents arch/arm/kernel/asm-offsets.c $kerneldir/build/ 2>/dev/null || :
             cp -a --parents arch/arm/kernel/signal.h $kerneldir/build/ 2>/dev/null || :
-	fi
-
-	if [ -d arch/${ARCH}/include ]; then
-	    cp -a --parents arch/${ARCH}/include $kerneldir/build/
-	fi
-
-	cp -a include $kerneldir/build
-
-	cp -a --parents lib/vdso/* $kerneldir/build/ 2>/dev/null || :
-
-	cp -a --parents tools/include/tools/le_byteshift.h $kerneldir/build/
-	cp -a --parents tools/include/tools/be_byteshift.h $kerneldir/build/
-
-	# required for generate missing syscalls prepare phase
-	cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build
-	cp -a --parents $(find arch/arm -type f -name "*.tbl") $kerneldir/build 2>/dev/null || :
-
-	if [ "${ARCH}" = "x86" ]; then
-	    # files for 'make prepare' to succeed with kernel-devel
-	    cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents $(find arch/x86 -type f -name "syscalltbl.sh") $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents $(find arch/x86 -type f -name "syscallhdr.sh") $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents $(find arch/x86 -type f -name "syscall_64.tbl") $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents arch/x86/tools/relocs_32.c $kerneldir/build/
-	    cp -a --parents arch/x86/tools/relocs_64.c $kerneldir/build/
-	    cp -a --parents arch/x86/tools/relocs.c $kerneldir/build/
-	    cp -a --parents arch/x86/tools/relocs_common.c $kerneldir/build/
-	    cp -a --parents arch/x86/tools/relocs.h $kerneldir/build/
-	    cp -a --parents arch/x86/tools/gen-insn-attr-x86.awk $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents arch/x86/purgatory/purgatory.c $kerneldir/build/
-
-	    # 4.18 + have unified the purgatory files, so we ignore any errors if
-	    # these files are not present
-	    cp -a --parents arch/x86/purgatory/sha256.h $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents arch/x86/purgatory/sha256.c $kerneldir/build/ 2>/dev/null || :
-
-	    cp -a --parents arch/x86/purgatory/stack.S $kerneldir/build/
-	    cp -a --parents arch/x86/purgatory/string.c $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents arch/x86/purgatory/setup-x86_64.S $kerneldir/build/
-	    cp -a --parents arch/x86/purgatory/entry64.S $kerneldir/build/
-	    cp -a --parents arch/x86/boot/string.h $kerneldir/build/
-	    cp -a --parents arch/x86/boot/string.c $kerneldir/build/
-	    cp -a --parents arch/x86/boot/compressed/string.c $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents arch/x86/boot/ctype.h $kerneldir/build/
-
-	    # objtool requires these files
-	    cp -a --parents arch/x86/lib/inat.c $kerneldir/build/ 2>/dev/null || :
-	    cp -a --parents arch/x86/lib/insn.c $kerneldir/build/ 2>/dev/null || :
-
-	    # v6.1+
-	    cp -a --parents arch/x86/kernel/asm-offsets* $kerneldir/build || :
-	    # for capabilities.h, vmx.h
-	    cp -a --parents arch/x86/kvm/vmx/*.h $kerneldir/build || :
-	    # for lapic.h, hyperv.h ....
-	    cp -a --parents arch/x86/kvm/*.h $kerneldir/build || :
-	fi
-
-	# moved from arch/mips to all arches for v6.1+
-	cp -a --parents kernel/time/timeconst.bc $kerneldir/build 2>/dev/null || :
-	cp -a --parents kernel/bounds.c $kerneldir/build 2>/dev/null || :
-
-	if [ "${ARCH}" = "mips" ]; then
-	    cp -a --parents arch/mips/Kbuild.platforms $kerneldir/build/
-	    cp --parents $(find	 -type f -name "Platform") $kerneldir/build
-	    cp --parents arch/mips/boot/tools/relocs* $kerneldir/build
-	    cp -a --parents arch/mips/kernel/asm-offsets.c $kerneldir/build
-	    cp -a --parents Kbuild $kerneldir/build
-	    cp -a --parents arch/mips/kernel/syscalls/*.sh $kerneldir/build 2>/dev/null || :
-	    cp -a --parents arch/mips/kernel/syscalls/*.tbl $kerneldir/build 2>/dev/null || :
-	    cp -a --parents arch/mips/tools/elf-entry.c $kerneldir/build 2>/dev/null || :
-	fi
-	
-	if [ "${ARCH}" = "loongarch" ]; then
-	    cp -a --parents arch/loongarch/kernel/asm-offsets.c $kerneldir/build
-	    cp -a --parents Kbuild $kerneldir/build
-	    cp -a --parents arch/loongarch/vdso/*.S $kerneldir/build 2>/dev/null || :
-	    cp -a --parents arch/loongarch/vdso/*gettimeofday.* $kerneldir/build 2>/dev/null || :
-	    cp -a --parents arch/loongarch/vdso/*getcpu.* $kerneldir/build 2>/dev/null || :
-	    cp -a --parents arch/loongarch/vdso/gen_vdso*_offsets.sh $kerneldir/build/ 2>/dev/null || :
-	fi
+        fi
+
+        if [ -d arch/${ARCH}/include ]; then
+            cp -a --parents arch/${ARCH}/include $kerneldir/build/
+        fi
+
+        cp -a include $kerneldir/build
+
+        cp -a --parents lib/vdso/* $kerneldir/build/ 2>/dev/null || :
+
+        cp -a --parents tools/include/tools/le_byteshift.h $kerneldir/build/
+        cp -a --parents tools/include/tools/be_byteshift.h $kerneldir/build/
+
+        # required for generate missing syscalls prepare phase
+        cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build
+        cp -a --parents $(find arch/arm -type f -name "*.tbl") $kerneldir/build 2>/dev/null || :
+
+        if [ "${ARCH}" = "x86" ]; then
+            # files for 'make prepare' to succeed with kernel-devel
+            cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents $(find arch/x86 -type f -name "syscalltbl.sh") $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents $(find arch/x86 -type f -name "syscallhdr.sh") $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents $(find arch/x86 -type f -name "syscall_64.tbl") $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/x86/tools/relocs_32.c $kerneldir/build/
+            cp -a --parents arch/x86/tools/relocs_64.c $kerneldir/build/
+            cp -a --parents arch/x86/tools/relocs.c $kerneldir/build/
+            cp -a --parents arch/x86/tools/relocs_common.c $kerneldir/build/
+            cp -a --parents arch/x86/tools/relocs.h $kerneldir/build/
+            cp -a --parents arch/x86/tools/gen-insn-attr-x86.awk $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/x86/purgatory/purgatory.c $kerneldir/build/
+
+            # 4.18 + have unified the purgatory files, so we ignore any errors if
+            # these files are not present
+            cp -a --parents arch/x86/purgatory/sha256.h $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/x86/purgatory/sha256.c $kerneldir/build/ 2>/dev/null || :
+
+            cp -a --parents arch/x86/purgatory/stack.S $kerneldir/build/
+            cp -a --parents arch/x86/purgatory/string.c $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/x86/purgatory/setup-x86_64.S $kerneldir/build/
+            cp -a --parents arch/x86/purgatory/entry64.S $kerneldir/build/
+            cp -a --parents arch/x86/boot/string.h $kerneldir/build/
+            cp -a --parents arch/x86/boot/string.c $kerneldir/build/
+            cp -a --parents arch/x86/boot/compressed/string.c $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/x86/boot/ctype.h $kerneldir/build/
+
+            # objtool requires these files
+            cp -a --parents arch/x86/lib/inat.c $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/x86/lib/insn.c $kerneldir/build/ 2>/dev/null || :
+
+            # v6.1+
+            cp -a --parents arch/x86/kernel/asm-offsets* $kerneldir/build || :
+            # for capabilities.h, vmx.h
+            cp -a --parents arch/x86/kvm/vmx/*.h $kerneldir/build || :
+            # for lapic.h, hyperv.h ....
+            cp -a --parents arch/x86/kvm/*.h $kerneldir/build || :
+        fi
+
+        # moved from arch/mips to all arches for v6.1+
+        cp -a --parents kernel/time/timeconst.bc $kerneldir/build 2>/dev/null || :
+        cp -a --parents kernel/bounds.c $kerneldir/build 2>/dev/null || :
+
+        if [ "${ARCH}" = "mips" ]; then
+            cp -a --parents arch/mips/Kbuild.platforms $kerneldir/build/
+            cp --parents $(find -type f -name "Platform") $kerneldir/build
+            cp --parents arch/mips/boot/tools/relocs* $kerneldir/build
+            cp -a --parents arch/mips/kernel/asm-offsets.c $kerneldir/build
+            cp -a --parents Kbuild $kerneldir/build
+            cp -a --parents arch/mips/kernel/syscalls/*.sh $kerneldir/build 2>/dev/null || :
+            cp -a --parents arch/mips/kernel/syscalls/*.tbl $kerneldir/build 2>/dev/null || :
+            cp -a --parents arch/mips/tools/elf-entry.c $kerneldir/build 2>/dev/null || :
+        fi
+
+        if [ "${ARCH}" = "loongarch" ]; then
+            cp -a --parents arch/loongarch/kernel/asm-offsets.c $kerneldir/build
+            cp -a --parents Kbuild $kerneldir/build
+            cp -a --parents arch/loongarch/vdso/*.S $kerneldir/build 2>/dev/null || :
+            cp -a --parents arch/loongarch/vdso/*gettimeofday.* $kerneldir/build 2>/dev/null || :
+            cp -a --parents arch/loongarch/vdso/*getcpu.* $kerneldir/build 2>/dev/null || :
+            cp -a --parents arch/loongarch/vdso/gen_vdso*_offsets.sh $kerneldir/build/ 2>/dev/null || :
+        fi
 
         # required to build scripts/selinux/genheaders/genheaders
         cp -a --parents security/selinux/include/* $kerneldir/build/
 
-	# copy any localversion files
-	cp -a localversion* $kerneldir/build/ 2>/dev/null || :
+        # copy any localversion files
+        cp -a localversion* $kerneldir/build/ 2>/dev/null || :
     )
 
     # Make sure the Makefile and version.h have a matching timestamp so that
@@ -382,9 +382,9 @@ do_install() {
     # left as /usr/bin/python rootfs assembly will fail, since we only have python3
     # in the RDEPENDS (and the python3 package does not include /usr/bin/python)
     for ss in $(find $kerneldir/build/scripts -type f -name '*'); do
-	sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "$ss"
-	sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "$ss"
-	sed -i 's,/usr/bin/python,/usr/bin/env python3,' "$ss"
+        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "$ss"
+        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "$ss"
+        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "$ss"
     done
 
     chown -R root:root ${D}
-- 
2.40.1


