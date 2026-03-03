Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94EBE67A9D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:27 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14982.1772532621286634297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bKT0aki4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532621; x=1804068621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EHB4d98Bis42oUZnoDYZTDDdEP8jnXoo24r4eLnsyqo=;
  b=bKT0aki4yQnpngFKUKtaq9NCx+zk3WRY8QuCLf2qil7O/mMqbPcX9cZF
   xM5cYCxnFR412Fa1b3J6Z/0GuNKzg4msHqefGkt69e9IWZDhNmvjACbl1
   4CFjQPiDsDt7HzuYT9bAp0IhBgb9zGmOQ3SlPNJl5BtBvpNOgMGdXGMPf
   hGnRj3Qmj0/CCVZJG4z92PHtw9U3cKEp1XwsG72/5KLB851HIh2GFe1h+
   Cwa0+zSNNRnZlaDahjeXNu8SlCWYyCu6+vUzwI0uZ1R6rEoQgsUSoi9mF
   DC+jyiEuOJ4LpFFGAaEdl+4JbHzdLc140Y0odYbLG2iaoUgO03N7mtg7g
   A==;
X-CSE-ConnectionGUID: s0XbZ4a2QU6BYsjUCJZtYQ==
X-CSE-MsgGUID: fBhwcg7tRzC0A0Tm+uF75A==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="231155287"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="231155287"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DED591000350
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:19 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 90F551001359
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id CF21C1001CE4;
	Tue,  3 Mar 2026 10:10:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/23] taglib: upgrade 2.1.1 -> 2.2
Date: Tue,  3 Mar 2026 18:09:25 +0800
Message-ID: <20260303100929.1624-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232296

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 * Support for Matroska (MKA, MKV) and WebM files.
 * Support for NI STEM in MP4 files.
 * New method isDsd() in WavPack Properties.
 * Stricter verification of ID3v2 frames.
 * Fix setting the last header flag in Ogg FLAC files.
 * Fix reading of the last page in Ogg streams.
 * Avoid corrupting invalid Ogg FLAC files without Vorbis comment.
 * Windows: Support MP4 files with 64-bit atoms.
 * Fix use of property keys with non-ASCII characters in C bindings.
 * Fix building with Android NDK 29.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/taglib/{taglib_2.1.1.bb => taglib_2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.1.1.bb => taglib_2.2.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.1.1.bb b/meta/recipes-support/taglib/taglib_2.2.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.1.1.bb
rename to meta/recipes-support/taglib/taglib_2.2.bb
index 6b700578b8..55a3d9d72f 100644
--- a/meta/recipes-support/taglib/taglib_2.1.1.bb
+++ b/meta/recipes-support/taglib/taglib_2.2.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "3716d31f7c83cbf17b67c8cf44dd82b2a2f17e6780472287a16823e70305ddba"
+SRC_URI[sha256sum] = "c89e7ebd450535e77c9230fac3985fcdce7bee05e06c9cd0bc36d50184e9c9dd"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.43.0


