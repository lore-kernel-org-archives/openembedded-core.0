Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7A7CF9C7F
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.9254.1727246984662502903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LRadRwQn;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246987; x=1758782987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Hf9G6ikO1T1Uqw4qUUO9UBtMWoXH2g0xG8pTGNPHyYY=;
  b=LRadRwQnDEQwUC46zsyLefpjThB/456Zc65aHWwaW0bhhalv4dGhNzQy
   sUNFZg+GlAqj0t33Cin9tPo9WdfJ+SJPrKf6hXva7tqdV/XMKTwi2QAIu
   8dcQUemwXEJOhFf4IVMpB6c3v7K1fFnrr7QEdSzIl+9MekEEb21xoAY8D
   Kyz/2LTALdm8YUf3VWMoV/JUi1jtT4heUgshGXJd7QNhHvPD/eGU8KN0Q
   zdKwPSYhwQYSIO8O4n9gdXbjXB5kWfp6dyfwN669nZDPx4hPHhGibJ4Al
   i1bVdwNLV1OixYrYT3cgeY4qnivJ/klfBZrBYTqltJIQsYAJlEhV7ytcC
   w==;
X-CSE-ConnectionGUID: t3By07UpT2egk7uCMx/KSA==
X-CSE-MsgGUID: DInWTMmbQb+aPZXAPNK7HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="153715146"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="153715146"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:45 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F0C0E8523
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 895C8D5077
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1467E401E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B97341A01E9;
	Wed, 25 Sep 2024 14:49:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/47] orc: upgrade 0.4.39 -> 0.4.40
Date: Wed, 25 Sep 2024 14:48:56 +0800
Message-Id: <1727246960-20665-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-4.048000-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mr0NnUUVMlTKaUkE5/Yx+7mhxq
	dt22rdOg1jypNY0wtaaGOrQETBnJLUlT9lfH/XsbdXu122+iJtpNLPQl0QAltICy4REjLgaT/hO
	M73Q26rcH+So2jl071h8GSwQM8TG44nzYos/x/8JW04a/r/flJQOdZrK75FwE33Nl3elSfsru/Q
	yUVIt+aaIkYkaiW44WAV3bWT1nydov+0FNnM7lDQPZZctd3P4BEITY2UGMiNx2aJwQ9TrzgzJl3
	MhaKU4m4vM1YF6AJbb2xnRRfQRo4hZ4ylU2GwzAxEHRux+uk8hxKpvEGAbTDtFCHNjPPccSmh/I
	c6K3pMith/So8E9Dwb8hiuFRrE2dVrZdDlvTqyDaDrV1+VbzCAe4EoIDpX3fjkmlWJCQADGv599
	OthBH4YK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204912

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Security: Minor follow-up fixes for CVE-2024-40897
- powerpc: fix div255w which still used the inexact substitution
- x86: work around old GCC versions (pre 9.0) having broken xgetbv
  implementations
- x86: consider MSYS2/Cygwin as Windows for ABI purposes only
- x86: handle unnatural and misaligned array pointers
- orccodemem: Assorted memory mapping fixes
- Fix include header use from C++
- Some compatibility fixes for Musl
- ppc: Disable VSX and ISA 2.07 for Apple targets
- ppc: Allow detection of ppc64 in Mac OS
- x86: Fix non-C11 typedefs
- meson: Fix detecting XSAVE on older AppleClang
- x86: try fixing AVX detection again by adding check for XSAVE
- Check return values of malloc() and realloc()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/orc/{orc_0.4.39.bb => orc_0.4.40.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.39.bb => orc_0.4.40.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.39.bb b/meta/recipes-devtools/orc/orc_0.4.40.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.39.bb
rename to meta/recipes-devtools/orc/orc_0.4.40.bb
index 320abf536a..e437831cd7 100644
--- a/meta/recipes-devtools/orc/orc_0.4.39.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.40.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "33ed2387f49b825fa1b9c3b0072e05f259141b895474ad085ae51143d3040cc0"
+SRC_URI[sha256sum] = "3fc2bee78dfb7c41fd9605061fc69138db7df007eae2f669a1f56e8bacef74ab"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.34.1


