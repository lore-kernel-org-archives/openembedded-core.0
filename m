Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D638F6B5C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 10:58:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46D4QV4xBwz3P
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 12:58:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566385106;
	bh=lzp8oFMjaYvDEE1cjEX0qTkrflgVJH23lmDL4/ukcG8=;
	h=From:To:Subject:Date:From;
	b=lwwtHeh24i1WgAzOFQ+9IPiCrx5wV7QEaGELQCOA/mDMuzDE4gRH0ltA4g0kmx8k0
	2dfRFivljNtb6Oee6+Ppq69ntWNyr9/5ord4EY2gSTozBtZKGqXsiaCiHAU8iMWo0d
	XSsfHUI4UA9vstrZF8uAM4CdK4G/Eo3B+gn5UuNOvNk593AbcUyQHZfKsiATabaHnQ
	qU356OAz+O7JcWUIxR4Evpqj+29fxia7CecJNjsyJFlgXra+8qSvkVA5Rc1H0bFaFC
	HXyid7tw8M54/+mxe5UxUVw282ovM71l9UFNazMCsQW2/s2Zmvfi9O+G/xf2R19nqK
	804dxwWcKaTFsO1AkvpKea+EwOHGZO0cRiIWD0f67k7Pw1SuTM057gr99NgP/Jspkg
	THBNYMNA+1QcxlFp4EKhEddOGuWPQhpUqHukACaFJYIAusTDpi6C8V01nioL74B1uE
	4oyDPDKY20Sy3YKkGlba6kEz//4doxI3AKf/nu/H4oAXtQIRqMmlGPqNqvaCjCI2lS
	xErVJGM2cMajBOaubyiahCcM7O+GdG3X6bmyYzxVfmw0cF9NJWJiixBE8EnauLziOI
	T80o4kmkf/lKz4ij4Vv0sd33pKxQSKEk7cImkqug0e3tUoTITc/R/rx7PMDS84I6cO
	Wd1Ie5gjiBlY2bTCC5cx7k/w=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2019 13:58:25 +0300
Message-Id: <20190821105825.23219-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] btrfs-tools: Add a PACKAGECONFIG for zstd
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
X-List-Received-Date: Wed, 21 Aug 2019 10:58:27 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb
index 138ec749e7..647516cf92 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb
@@ -24,7 +24,8 @@ inherit autotools-brokensep pkgconfig manpages distutils3-base
 CLEANBROKEN = "1"
 
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
-EXTRA_OECONF = " --disable-zstd"
+PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
+
 EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
 EXTRA_PYTHON_CFLAGS = "${DEBUG_PREFIX_MAP}"
 EXTRA_PYTHON_CFLAGS_class-native = ""
-- 
2.17.1


