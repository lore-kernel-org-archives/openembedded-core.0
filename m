Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D849C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 13:08:18 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.7853.1646140097452060688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 05:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Hnk5IR7N;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646140095; i=@fujitsu.com;
	bh=A19Y6tRDJ+mU5N+pvdFpcVdAdonvCkuDQmS1kJCiMkg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Hnk5IR7NOYmQQG2dXfWUY0GRx4NzmMXDBAeWW5otnNWK5s2Th0PWdn8byLa0CCc+/
	 mA20weFCvCXdcrfZkNYEK8mNQifb5wDSAqIiOHOcNu+9iHBlcom/KpGRW7dGUxMXdL
	 4sD7gnqKew/rZmbCAG0sxQLqJL1r0xT4B9FMeo6Sr5gf64NAfSV+HK07tWG/3N7dPc
	 sVhmlixy8iCmgrp9b/y6WyHAoC1aPKdpzUv1qObZe+xJ7SB0PTJzKJRxp53Vgtk67e
	 8NuJ5CfQCiCOXzDLM9H9CRX709S8ji3A73hJKfNmzVuoEFnrw5hsoY4PyWGpXzrSXb
	 IpkofnBWr/1+Q==
Received: from [100.115.66.23] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 83/A5-24566-FBA1E126; Tue, 01 Mar 2022 13:08:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqLtPSi7
  J4PdJK4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPKlv3MBc/kKxZ+38TWwPhBuouRi0NI4DGj
  xPo1x9ggnPNMEs/PrmXqYuQEco4zSqzZkA9iswmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgKXE6YuXmUFKWIDibUsFQMK8Ak4SEx4uZwSxJQQUJKY8fM8MEReUODnzCQvEGAmJgy
  9eMEPUKErMvtzMAmFXSMya1cYEYatJXD23iXkCI/8sJO2zkLQvYGRaxWibVJSZnlGSm5iZo2t
  oYKBraGiqa2ama2mml1ilm6iXWqqbnJpXUpQIlNVLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMy5Ri
  p4QdjI/6fuodYpTkYFIS5VW7KZskxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3ophckpBgUWp6a
  kVaZg4wRmDSEhw8SiK8qeJAad7igsTc4sx0iNQpRmOOnVsu72XmuHrlyl5mIZa8/LxUKXHe6S
  ClAiClGaV5cINgsXuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvpQTQFJ7MvBK4fa+ATmE
  COuVvsBTIKSWJCCmpBqZ7CeoCu7//vn9oW5D0S6FdglcE2dKyHiWFBqYskUr4/GGxx5XQZtZ3
  cTMSN5XfTZy6W2fXrpiW2nczzPjPpy1ZG3vz3OT6HNe9zW8PBO1d+Xeec/3RxT4yxfukvwm5T
  /Dbdfn/pxVV39f4hr34rxSZeW67gA/3ruVdJVMjfB0cJjOVBnksWeh+XXf2nMoH5xYWyi5uem
  O5Yos668fX/6eFXTxb8j3tuZNDuHcl87Q7nRe45odK5czZ8WE9v+J9F64HCuKau4R+Hupe8WS
  d67fkry+XBHHfqE28cv7yzG/Hpj5a1P/2as10e77Cyh0e3kzN1xYefCGul2guc2bfw0N19WeW
  8lSktRz52je9dEvDXCWW4oxEQy3mouJEAIyXGmZYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-532.messagelabs.com!1646140094!18930!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23655 invoked from network); 1 Mar 2022 13:08:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 13:08:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6F947100192
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 13:08:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 60489100184
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 13:08:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 13:08:04 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ovmf: upgrade 202111 -> 202202
Date: Tue, 1 Mar 2022 21:07:52 +0800
Message-ID: <1646140075-39370-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 13:08:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162554

0001-Fix-VLA-parameter-warning.patch
removed since it's included in 202202

Changelog:
=========
OvmfPkg Add new target for Cloud Hypervisor
Add TDVF to OvmfPkg
Add new APIs to UefiCpuPkg/UefiCpuLib
Add AMD Secure Nested Paging Support
Add SSDT PCI generator in DynamicTablesPkg
Support ACPI 6.4 PPTT changes
Add FdtHwInfoParser library
Add DynamicPlatRepo library
Make package and platform builds reproducible across source format changes
Add Uncrustify CI Plugin
Apply uncrustify changes to all package C and H files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ovmf/0001-Fix-VLA-parameter-warning.patch | 51 -------------------
 meta/recipes-core/ovmf/ovmf_git.bb            |  5 +-
 2 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch b/meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch
deleted file mode 100644
index d658123b81..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 498627ebda6271b59920f43a0b9b6187edeb7b09 Mon Sep 17 00:00:00 2001
-From: Adrian Herrera <adr.her.arc.95@gmail.com>
-Date: Mon, 22 Mar 2021 21:06:47 +0000
-Subject: [PATCH] Fix VLA parameter warning
-
-Make VLA buffer types consistent in declarations and definitions.
-Resolves build crash when using -Werror due to "vla-parameter" warning.
-
-Upstream-Status: Submitted [https://github.com/google/brotli/pull/893]
-Signed-off-by: Adrian Herrera <adr.her.arc.95@gmail.com>
----
- c/dec/decode.c | 6 ++++--
- c/enc/encode.c | 5 +++--
- 2 files changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c b/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
-index 114c505..bb6f1ab 100644
---- a/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
-+++ b/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
-@@ -2030,8 +2030,10 @@ static BROTLI_NOINLINE BrotliDecoderErrorCode SafeProcessCommands(
- }
- 
- BrotliDecoderResult BrotliDecoderDecompress(
--    size_t encoded_size, const uint8_t* encoded_buffer, size_t* decoded_size,
--    uint8_t* decoded_buffer) {
-+    size_t encoded_size,
-+    const uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(encoded_size)],
-+    size_t* decoded_size,
-+    uint8_t decoded_buffer[BROTLI_ARRAY_PARAM(*decoded_size)]) {
-   BrotliDecoderState s;
-   BrotliDecoderResult result;
-   size_t total_out = 0;
-diff --git a/c/enc/encode.c b/c/enc/encode.c
-index 68548ef..ab0a490 100644
---- a/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
-+++ c/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
-@@ -1470,8 +1470,9 @@ static size_t MakeUncompressedStream(
- 
- BROTLI_BOOL BrotliEncoderCompress(
-     int quality, int lgwin, BrotliEncoderMode mode, size_t input_size,
--    const uint8_t* input_buffer, size_t* encoded_size,
--    uint8_t* encoded_buffer) {
-+    const uint8_t input_buffer[BROTLI_ARRAY_PARAM(input_size)],
-+    size_t* encoded_size,
-+    uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(*encoded_size)]) {
-   BrotliEncoderState* s;
-   size_t out_size = *encoded_size;
-   const uint8_t* input_start = input_buffer;
--- 
-2.31.1
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 9db1514acc..b15d40eac8 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -21,11 +21,10 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0003-ovmf-Update-to-latest.patch \
            file://0005-debug-prefix-map.patch \
            file://0006-reproducible.patch \
-           file://0001-Fix-VLA-parameter-warning.patch \
            "
 
-PV = "edk2-stable202111"
-SRCREV = "bb1bba3d776733c41dbfa2d1dc0fe234819a79f2"
+PV = "edk2-stable202202"
+SRCREV = "b24306f15daa2ff8510b06702114724b33895d3c"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.25.1


