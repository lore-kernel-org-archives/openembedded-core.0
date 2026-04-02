Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0A7CC6B03
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 06:59:36 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10188.1775113167849255067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 23:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ecAJQkm5;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2402; q=dns/txt;
  s=iport01; t=1775113167; x=1776322767;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=M1BVO84MA3Hve7OPRU+ATsxUPH2z7p1hGl6MM8hsXpM=;
  b=ecAJQkm5uNUTV3x18axGmisB34xoVe9WKcMowe7t+lww7ze2nB5g5AC5
   /pYHX5GlcNsDthlO9Kg5R4eUrNxwq145VSwcWn4+mLRR2sHKwo40VUF4m
   s/rejFVY6Zb0gzVYGicJahDewn9Rt4RJ1OGqG4OtFAxpduXjgaAXlZKka
   PFDKjjGO22+GEHuj3SbAccMiNd0G2gtAeV/siXK6nfYvQ6Xt+S5QXNd6y
   aisPJZmzNZ8BELy4rFs8THSsSDZDMpa4p862X8nUYAf70Caf9Rn2xJ4FP
   /ffKPgjznFCqfnVvXOI/4c+T+TSCjOpa3ygmbs8csLwbH3hgQshGGn3hy
   Q==;
X-CSE-ConnectionGUID: TY1JmFeNTxuO6swGz4M0cA==
X-CSE-MsgGUID: t+rmaRhVSH27hvhItQuhtQ==
X-IPAS-Result: =?us-ascii?q?A0CaAgAuE85p/4z/Ja1aglmCV3FfQkmUKoIki2SSNoF/D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUHAo0nAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBAycLAVYcAwECLyALIwgZgwIBgjoDNgIBEbQbg?=
 =?us-ascii?q?XkzgQGDaAJDT9hHDYJSAQUGFAGBOIU+gnmFI1sYAYR6JxsbgXKBFYE7gi2BB?=
 =?us-ascii?q?YEaQgEDGIIThXcEgiKBDoFhjxlIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQwbBwWBS4dcdG2BE4N+VwMLGA1IESw3FBsEPm4Hi3MpgjaBDiyoIKAdc?=
 =?us-ascii?q?Qoog3SMHo8+hXwaM6prC5h7jgmECZJHhGiBaDyBRwsHcBWDIlIZD444hWiDF?=
 =?us-ascii?q?L8WIzUCCTMBBwIHDgKBc5F9AQE?=
IronPort-Data: A9a23:k1j3+a/WuTJUGeGy4ONpDrUD03+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WsZUDiFPf+DM2H2cot/YNux/BlQvpOBn9ZnS1dtrXpEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsbjpOs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kKDNQ6/8h6J11e6
 NtGMy8ifEym3+mflefTpulE3qzPLeHxN48Z/3UlxjbDALN+GtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Un1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3Fb4KJIYHWHJQO9qqej
 n6F5WHwOBEkD/zFljqb8lOwv/LPgRquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjNCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rOrLxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:9eQ536t3Kx/3QtywLW+ippCR7skDd9V00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5SXzLbLfD5HZQGQ2njeL+od
X-Talos-CUID: 9a23:nMoT+W0BfU4LI7Dc+b5JC7xfJvF8UHjzwVHsM1KfV312Z6/JbAeb0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3AAWE8BAwVCZ6g0uzVEAk41f8QLfaaqLjtEkUEq5U?=
 =?us-ascii?q?4gOneaixuOxaBtSm3XrZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,155,1770595200"; 
   d="scan'208";a="704354193"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Apr 2026 06:59:19 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 3FE1018000628
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 06:59:07 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id DE351CC12B5; Wed,  1 Apr 2026 23:59:06 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH v4 4/4] binutils: Fix CVE-2025-69652
Date: Wed,  1 Apr 2026 23:58:59 -0700
Message-Id: <20260402065859.3784922-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260317041229.2932275-1-deeratho@cisco.com>
References: <20260317041229.2932275-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 06:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234493

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=44b79abd0fa12e7947252eb4c6e5d16ed6033e01
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69652

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 2f34037eed..3dc73c3ad0 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -49,4 +49,5 @@ SRC_URI = "\
      file://CVE-2025-69648.patch \
      file://CVE-2025-69644_CVE-2025-69647.patch \
      file://CVE-2025-69649.patch \
+     file://CVE-2025-69652.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
new file mode 100644
index 0000000000..5de94820d1
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
@@ -0,0 +1,40 @@
+From 5a2f57ab03067f6622c19983e1e31207bd2293a6 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 16:04:44 +1030
+Subject: [PATCH] PR 33701, abort in byte_get_little_endian
+
+	PR 33701
+	* dwarf.c (process_debug_info): Set debug_info_p NULL when
+	DEBUG_INFO_UNAVAILABLE.
+
+CVE: CVE-2025-69652
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=44b79abd0fa12e7947252eb4c6e5d16ed6033e01]
+
+(cherry picked from commit 44b79abd0fa12e7947252eb4c6e5d16ed6033e01)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ binutils/dwarf.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 2462e6540a7..0d88ea94619 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -4248,9 +4248,11 @@ process_debug_info (struct dwarf_section * section,
+ 	      break;
+ 	    }
+ 
+-	  debug_info *debug_info_p = ((debug_information
+-				       && unit < alloc_num_debug_info_entries)
+-				      ? debug_information + unit : NULL);
++	  debug_info *debug_info_p = NULL;
++	  if (debug_information
++	      && num_debug_info_entries != DEBUG_INFO_UNAVAILABLE
++	      && unit < alloc_num_debug_info_entries)
++	    debug_info_p = debug_information + unit;
+ 
+ 	  assert (!debug_info_p
+ 		  || (debug_info_p->num_loc_offsets
+-- 
+2.35.6
+
-- 
2.35.6


