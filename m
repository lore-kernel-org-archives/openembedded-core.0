Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 80CCD77F90
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 18:03:18 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r68so3588773wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 11:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jHVIGhW7mlGcT0Aip+IM9ze2tg1gdTrZvWRjGEYyo3E=;
	b=qTXpC6jFTxNSYfoLkGh1LZpdpO6KyHDoPMVvvDyBgtZdndhPewRlkgs2qGt4UYPsme
	Q+rCR0WZmXVQq1nTQArlL4GUN7L5qsaX/4ChcL7EZp/t6sJczdSyUEP4CWdC4Wh45Qvv
	lRmNP3vwmhEzgR7t9sqUBddveYkxh7313CfHMJ3v/CJAYeNOR1n1xsNoFAQBbLUftMAz
	FrBStOSWXH5TlZ4XGszZ5NhA00MgOLKGrJqdDvnYtE2UgtG+18F6M4gdaR7j1qv2OjjQ
	/HnyhoUuvDyGEO/edl7RNDo36YLj4mNDotZFHlWkQ/dmIMt5HZMlNNrJaPm/Cc8U8MSa
	Ma4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=jHVIGhW7mlGcT0Aip+IM9ze2tg1gdTrZvWRjGEYyo3E=;
	b=KNhRpMoKnYab+9PAbKUYMtUOMTODCTVsShSH44LuGX+I6lgFowtei5xPvi957VEMT8
	k8DLBh7UVfaYhy6R3N+QtYM/0c/x4J6W8iBAR4AXvHXXYzOrxXiPXU5Fa1XkRNAUEUsE
	j3C+KKmLO2vgsAbhRz6oZuD1pmPmkY5nSrKCe7Hqu39fv+sl4CBKV85O5MHw1qkOQnbT
	yJSsQbqabSSxaaL1yEPPR+4GQIrQHwDeB+6cDOp4aEOlQDvEnEOpv6KdjH0RWFN0Eoc3
	AXD01NIyFOsFi/Lc1KZbWanDUDBwyCbYG8gdT8V1kX5pEny55zRQc4WGfNUMRuU+WmF0
	A9YQ==
X-Gm-Message-State: AMCzsaVbU7MNScwkBh9Ub8DOyyrbPIISNCvjstZtXq+xpWDhFKN0ZXDP
	xyuNPymyLAR+vJR38LkvuYHN6Fs0
X-Google-Smtp-Source: ABhQp+TiIt7Qp98NFiqm4m5BmsrtfQMPXBPB+2uQmkr/tOr+deMuaSgy5JmnfCXIMw+5yc7wr+uJxg==
X-Received: by 10.28.27.194 with SMTP id b185mr997401wmb.21.1508954599193;
	Wed, 25 Oct 2017 11:03:19 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id
	b190sm3243487wma.22.2017.10.25.11.03.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Oct 2017 11:03:18 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 20:03:11 +0200
Message-Id: <20171025180312.10308-2-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171025180312.10308-1-thomas.perrot@tupi.fr>
References: <20171025180312.10308-1-thomas.perrot@tupi.fr>
Subject: [meta][PATCH 2/3] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 25 Oct 2017 18:03:19 -0000

Ignore fitImage type in do_bundle_initramfs task because the packaging is made by do_assemble_fitimage_initramfs

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 756707a3c2..7f8c8985f3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -208,7 +208,9 @@ do_bundle_initramfs () {
 		# Backing up kernel image relies on its type(regular file or symbolic link)
 		tmp_path=""
 		for type in ${KERNEL_IMAGETYPES} ; do
-			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
+			if [ "$type" = "fitImage" ] ; then
+				continue
+			elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
 				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$type`
 				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$type`
 				mv -f $realpath $realpath.bak
-- 
2.13.6


