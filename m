Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id EC73B7F292
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:28:57 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id x4so1780713iog.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 12:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ibfYBqh0WF1P2SWmIXdebC1yArsO2GESzevhN2wBoOc=;
	b=kF1hiCTxEgUVyhIYTaC8YJUkIjvJ4h9wN9hrpbCgnStqalFRvuDiVEPBwt4VqX4beI
	nRrJilqGq8pndJakzOrELUg66U2sYL1xy6g+m1mz4A8CX14bT+0HRMq3CJi4TZI9PVYJ
	tyYpbPOAGiDCnJHCvvxsd5fYHuHW4MCHU9PRYjOOV9i6fPaEQq/jNHp4wU/JIfZDlT20
	XwneWbZ/bKA2K6RYfbcTeiYmjPaKSTXM0eUr0ocb4v+Fq3v3ersQ/aXDMivT1xEhinls
	ARnNQ6vylfK5oo3x5Wor2mMLe/l5BemS4Hxbn7J/QyIYXx7zjTPvuKTbtmoNGbsc+I8K
	RsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ibfYBqh0WF1P2SWmIXdebC1yArsO2GESzevhN2wBoOc=;
	b=nwq8AsK0LbTZBlK6s9u5p41665FnwrbYssQSb+43BoYShnDyQsnuiw4j1FATkCdruz
	HftcCIdAZLuo1p+88h8BAvFwEZasYl2Py8dlog0CHPTtLRT2En+vZD+ycbBW5Q43dSkD
	piMq3kZyfwT0Lu7gnUkq4YD56nMJtxw15WieXJUMSYMq6Kq02qdlxriWN2+5nyjBliKt
	KfP3XrXGDpEudXcwdb3A1oCVYC/2BJLXMCSfmFYCVpjLWz6k6XxUiuHpyHFd991bpp64
	bJRke/cgxbKXCAU5BhPmQhopLlDIiyYKnjj/xRueL6j+CP0mixfI+R5MghiInquhvieS
	Vq4w==
X-Gm-Message-State: APjAAAXFWBAszj3uE9Z+NRTbgt7NWzWlWb2rcGA9JmD1Zuj9HO+9hvaK
	ofeeTqf4JbiLqwKkql0508yvl305wnk=
X-Google-Smtp-Source: APXvYqxq2x3MxTpasjBEZdVRmzUcNk+B82b0t4feInseyA1zQj/MBhC4nYT6eEEf1WRAIjN7vTjseA==
X-Received: by 2002:a5e:c918:: with SMTP id z24mr6487669iol.234.1567020538720; 
	Wed, 28 Aug 2019 12:28:58 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id d6sm4454375iod.17.2019.08.28.12.28.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 12:28:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 28 Aug 2019 15:28:41 -0400
Message-Id: <bf30c204d8b7cf492639b3c1bd9dc53a5d9f023c.1567019771.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1567019771.git.bruce.ashfield@gmail.com>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] devsrc: update arm64 scripts/prepare for kernels 5.3+
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
X-List-Received-Date: Wed, 28 Aug 2019 19:28:58 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We need to include a few more small files for on target module
builds for 5.3+ kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index e17c0ea0ab..b68d945a8f 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -141,7 +141,7 @@ do_install() {
 	    # arch/arm64/include/asm/opcodes.h references arch/arm
 	    cp -a --parents arch/arm/include/asm/opcodes.h $kerneldir/build/
 
-            cp -a --parents arch/arm64/kernel/vdso/gettimeofday.S $kerneldir/build/
+            cp -a --parents arch/arm64/kernel/vdso/*gettimeofday.* $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/sigreturn.S $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/note.S $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
@@ -179,6 +179,8 @@ do_install() {
 
 	cp -a include $kerneldir/build
 
+	cp -a --parents lib/vdso/* $kerneldir/build/ 2>/dev/null || :
+
 	cp -a --parents tools/include/tools/le_byteshift.h $kerneldir/build/
 	cp -a --parents tools/include/tools/be_byteshift.h $kerneldir/build/
 
-- 
2.19.1


