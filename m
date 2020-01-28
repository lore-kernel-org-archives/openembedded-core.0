Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA897FD9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 22:14:14 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d18so11610782qtj.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 14:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=25+DnutJ54BEagI3mF0XC6cBqR6gLwoF7yRVxF/Ewek=;
	b=m9tNXgQX/+20jAEMwZMVQ4Ps/nIe5qU914H59Tj2NV2DRwXaLwYj96cutk/aSg0c+K
	D9hGEoJ5cajTMI2ChDFK/WxOMo4nMHvvsh3GgPjX57WqeQW2JQdNC00gZ/8PbUK22j7m
	Adq9WYg4xhk16g+hIDMW0pr4rj4S+0F7WKRONe1JR8dSS0k6y4hVfF9s730cM4ZcGlaB
	DFl/9/dGYuJFL8dPSBboUFe3YoHjrr1wZ2ynIGEbuDL00J1BSpb8GGxL2t3D7Cu+nRm0
	B/JwL3yrIUvhxKWOn3hS09Gbh27eTgBlmlFrU6s81RaKvxOMtDWmmqNmIKzvmLTAOY3H
	WYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=25+DnutJ54BEagI3mF0XC6cBqR6gLwoF7yRVxF/Ewek=;
	b=MMulUDsiD1EXzQNPNbRVaKuVAkjQHybnKXEWc1RqYT++pIcAMbtW/Fb/dQYmXuXVsn
	MYk/3jJIvAwZcHKoNsxVhelR/X8a2bf3bRhKjzAbuZ5r0m3697WjcQcZyjMJ17WwXzSl
	0vA/qkzgIwjMcgB66Uc+FPSe2sUThvok2r1h5+X5adljrv0qJ2EK4m0HBO/JGdGSB43Q
	FNDO/p1iaOjZok0F1vXYIbVC7fRYCzLhEjnEVxrusQ3+U4K5w8aYvnr+a0mw5/+Sx5+9
	rwY36pmUuuh0ujvrbnfefgx8cjrWN3vOS2Th6aF+J/Acqa7oalesLRULJNKxNRI1tS1h
	5aSg==
X-Gm-Message-State: APjAAAXwuL591OVpBfcKw8DDvJEGfkbHHbF5BuJP+5ZX0AcCusuO7atU
	fOv9k8fDLUGCTt+zKLLN1+Cv38Px468=
X-Google-Smtp-Source: APXvYqzfKKcHbg8Shgw95WEAz4ymG4fuKDMirZjU8uOc3atd/5lpIvM2IeWxoJfzvW1heCjUtvuGaw==
X-Received: by 2002:ac8:1496:: with SMTP id l22mr23921470qtj.38.1580249655555; 
	Tue, 28 Jan 2020 14:14:15 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	l184sm13194994qkc.107.2020.01.28.14.14.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 14:14:15 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue, 28 Jan 2020 17:14:10 -0500
Message-Id: <880d1707d8b21049375e903e6114af931bc7967d.1580248809.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1580248809.git.bruce.ashfield@gmail.com>
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] kernel-devsrc: update to v5.4+
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
X-List-Received-Date: Tue, 28 Jan 2020 22:14:15 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@xilinx.com>

To support on-target module building, we need to include syscall.tbl
for ARM64 (just like we do for other architectures).

We also copy .config with -a to ensure that we don't trigger extra
processing and regen configs.

Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index b6f2dbc2b0..2fa4be67cc 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -78,7 +78,7 @@ do_install() {
 	    cp Module.markers $kerneldir/build
 	fi
 
-	cp .config $kerneldir/build
+	cp -a .config $kerneldir/build
 
 	# This scripts copy blow up QA, so for now, we require a more
 	# complex 'make scripts' to restore these, versus copying them
@@ -128,11 +128,12 @@ do_install() {
 
 	    # extra files, just in case
 	    cp -a --parents tools/objtool/* $kerneldir/build/
-	    cp -a --parents tools/lib/str_error_r.c $kerneldir/build/
-	    cp -a --parents tools/lib/string.c $kerneldir/build/
+	    cp -a --parents tools/lib/* $kerneldir/build/
 	    cp -a --parents tools/lib/subcmd/* $kerneldir/build/
 
 	    cp -a --parents tools/include/* $kerneldir/build/
+
+	    cp -a --parents $(find tools/arch/${ARCH}/ -type f) $kerneldir/build/
 	fi
 
 	if [ "${ARCH}" = "arm64" ]; then
@@ -186,6 +187,7 @@ do_install() {
 
 	# required for generate missing syscalls prepare phase
 	cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build
+	cp -a --parents $(find arch/arm -type f -name "*.tbl") $kerneldir/build
 
 	if [ "${ARCH}" = "x86" ]; then
 	    # files for 'make prepare' to succeed with kernel-devel
-- 
2.19.1


