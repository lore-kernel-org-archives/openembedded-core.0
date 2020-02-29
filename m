Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 74F0861A71
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 17:10:17 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 4922A600A9;
	Sat, 29 Feb 2020 18:10:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1582996213;
	bh=LM2kn6zRR1NAlFwcMXvq67++8sVeN39ySLNsnwCZdVo=;
	h=From:To:Cc:Subject:Date:From;
	b=F+njfGUpbDIFdPCg38nG5Io+QK66pg2RDlNURF3qwulIkIrosiUaO/JJWFN9ALrM5
	6AbGLx1NL46GvDluSOWsishte+yeYh4vA+m4qNDjqs6D2zAIVIhjjhNT6bz7iFp+gM
	yPiMOppyHLrg1TJ7xmh6Oy48kLOp55/QcW8tpoC8IyFj3eiVTQI0+LxVl7Dgwx6fq1
	dNb7SdCC8iQ54JDz1JhNLqq+A6rM+uxxM8S683Br+xyViVaMhvGUzb3m4R3/j6UFFY
	6lpaq3tUI4LA3SFgD/HPC09xRU36klxnSHFsfVP21OOXx/5zBQnZBmN26/tBxUMxta
	6VRvtBIAKNRKw==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 18:10:06 +0100
Message-Id: <1582996206-4795-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libarchive: support mbedtls in PACKAGECONFIG
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
X-List-Received-Date: Sat, 29 Feb 2020 17:10:17 -0000

The version 3.4.2 of libarchive add support for mbed TLS [1].

So, add PACKAGECONFIG for mbedtls.

[1] - https://github.com/libarchive/libarchive/releases/tag/v3.4.2

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-extended/libarchive/libarchive_3.4.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
index c3edb57..0ab40fc 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -28,6 +28,7 @@ PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat,"
 PACKAGECONFIG[lzo] = "--with-lzo2,--without-lzo2,lzo,"
 PACKAGECONFIG[nettle] = "--with-nettle,--without-nettle,nettle,"
 PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
+PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,"
 
 EXTRA_OECONF += "--enable-largefile"
 
-- 
2.7.4


