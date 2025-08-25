Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9CCCA0FE7
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 03:51:35 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.31420.1756093892532564086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 20:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bgzh0XtX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756093893; x=1787629893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7eS2jiegFYVC1xHr+SNDuEuwH4M30A1JiV8RGyG8JVA=;
  b=bgzh0XtXMiciQMwG38li6lsEpVb7tEBSsU4ZqH9XIUmnavjMWGF86M1f
   07WpD34yG4S1nV6C8Y4r64yYio97pew5Sq5kxbKAZ2ZDa3M9oZHAHcMgu
   7G5SvsyqigViEjlOidQEwwy5L3voqlSZ0Kx6h1ybOgALFj0FDOqqafdOf
   YpmqTLXCCVSVl0Uz0NlndkKeFvJ8nXm4TAdUsDKxQre3ytto7FH57+FHl
   PQLzY9/Rkgqmnbqj/MrYOUgTn5vj5osQQSJn/z2hXEKicOXL7P0GSgczf
   LH1KOSjDmz+edLUPcJtzFPcbYjCdR1TW9VJsITe1qtnWUZE/WZlwaGnYi
   g==;
X-CSE-ConnectionGUID: 34PeZyc6Rwe84EZUyb/1Bw==
X-CSE-MsgGUID: 7lBNZPCVQeCyIOawpBDWow==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="213844155"
X-IronPort-AV: E=Sophos;i="6.17,312,1747666800"; 
   d="scan'208";a="213844155"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 12:51:31 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 6AAA31C1C700
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:30 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 29AD61400386
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 3670314000FF
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:28 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 662FF1A0090;
	Mon, 25 Aug 2025 11:51:24 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 07/10] python3-cython: upgrade 3.1.2 -> 3.1.3
Date: Mon, 25 Aug 2025 11:51:06 +0800
Message-ID: <20250825035109.797-7-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
References: <20250825035109.797-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 03:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222404

Changelog:
==========
- Some method calls with 0 or 1 argument failed to use ``PyObject_VectorCallMethod()``.
- Walrus assignments of literal Python integers could generate invalid C code.
  (Github issue :issue:`6989`)
- ``cython.pythread_type_lock`` (also used as fallback for ``cython.pymutex``)
  could stall on heavily contended locks.
  (Github issue :issue:`6999`)
- C string arrays (not pointers) always coerced to the Python default string type,
  even on explicit casts to other string types.
  (Github issue :issue:`7020`)
- Unterminated ``\N{}`` character escapes in strings could unrail the parser.
  (Github issue :issue:`7056`)
- An internal C function was not marked as ``static`` and leaked a linker symbol.
  (Github issue :issue:`6957`)
- Some Unicode letters were not recognised as lexically valid name parts.
  (Github issue :issue:`7059`)
- Compatibility with PyPy3.8 was lost by accident.
- The Linux binary wheels of 3.1.2 used SSSE3 CPU instructions which are not available on some CPUs.
  (Github issue :issue:`7038`)

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../python/{python3-cython_3.1.2.bb => python3-cython_3.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.1.2.bb => python3-cython_3.1.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython_3.1.2.bb b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.1.2.bb
rename to meta/recipes-devtools/python/python3-cython_3.1.3.bb
index 77dbbe8b2c..dcb61a3634 100644
--- a/meta/recipes-devtools/python/python3-cython_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "6bbf7a953fa6762dfecdec015e3b054ba51c0121a45ad851fa130f63f5331381"
+SRC_URI[sha256sum] = "10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089"
 
 inherit pypi setuptools3 cython
 
-- 
2.43.0


