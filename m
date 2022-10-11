Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07094C4167E
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:06:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.4731.1665475583064797253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Xn3y14JP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665475580; i=@fujitsu.com;
	bh=VIIq0yZm1VSmxR21kQtBiCAjSEQywSaIb3utArSkbNs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Xn3y14JPEAZF2ExZDNi5yAwd+5H3vLpIOp76T4LYCmKIb/OvtwxmMkrbXVvL1Oj+Y
	 Kv7QNdQjlky4f3MVqQlOlmvhGynDZ9k8zrVDCx2qVYeaZ2d3QWaAzDDrkO7tslz/Ic
	 Rr8JubpkPOWcfQwS+0kZkVybvyrgba29cM4DK+2JnfQ4/mLrqXX2q0kZCSLQlbyL2D
	 UTdRW5CEaJrr+6K//N3zFJisdU/BW0d00QsqbvrxWZGARgJz7vhkDkZvYP5BShVq5I
	 3KUKKBDRryIbHtJJcuz9S0ATsWfnJoxDAKIsKSmUgShgg9BFv+JqCpBFmDUn7VISLV
	 JJumAKo8FzXAw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8ORpPtL2TX
  ZYPESGYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePq1J2MBdv4KnZPn83UwHiSp4uRi0NI4AGj
  xI3/r9ghnMtMEsv2LmKBcPYwSvQ+WsvYxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCApYSy5tWgdksAqoSu9f1s4CU8wo4SSzbkgQSlhBQkJjy8D0ziM0rIChxcuYTFogxEh
  IHX7xghqhRlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRG/llI2mchaV/AyLSK0TapKDM9oyQ3MTN
  H19DAQNfQ0BRIG+sampjrJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZm
  SnH65B2Ml/b90jvEKMnBpCTKe/W5S7IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd5fSq7JQoJFq
  empFWmZOcAogUlLcPAoifD2SAGleYsLEnOLM9MhUqcYFaXEef8oAiUEQBIZpXlwbbDIvMQoKy
  XMy8jAwCDEU5BalJtZgir/ilGcg1FJmPcLyBSezLwSuOmvgBYzAS0+edUJZHFJIkJKqoFJ66s
  oQ89keaui4s+BVzQzjrR9nPTiWvq8GOljBza4bZ/6W+Dq8t61c5i6mR+9qG/4IMcfnri7NGid
  QH9uXOK3jzx758V55YTNeijMc6/DiVvWtP+3UYjq3PWGEl7nW478jg81s+74X+vs2nE0d4Zww
  56LPxgnmB2///77cZ1Qjw1THv6ZXSN96bza/MrQm+Xvk3VObvJlKg9nY5R7L39wgiy7RuPtqs
  cTvYoCzp6/8GntDp08D6PvjD2MB07ff5j7ZOWBXTxP5mwtvDlj73Ve9ia/68aHDwrKS36eY5V
  +qe/c1TnnF798pjj5gqPJxqfl/lxxWWpanlOcxD8F+d8s+f3L7fTNCJ6ZTzQOlMf4KrEUZyQa
  ajEXFScCANoimVpHAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-732.messagelabs.com!1665475578!9776!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10632 invoked from network); 11 Oct 2022 08:06:18 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:06:18 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D67741B2
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:06:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id CB58D1B0
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:06:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:06:15 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libffi: upgrade 3.4.2 -> 3.4.3
Date: Tue, 11 Oct 2022 16:05:54 +0800
Message-ID: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:06:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171600

License-Update: Copyriht year updated to 2022.

Changelog:
=========
  All struct args are passed by value, regardless of size, as per ABIs.
  Enable static trampolines for Cygwin.
  Add support for Loongson's LoongArch64 architecture.
  Fix x32 static trampolines.
  Fix 32-bit x86 stdcall stack corruption.
  Fix ILP32 aarch64 support.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libffi/{libffi_3.4.2.bb => libffi_3.4.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.4.2.bb => libffi_3.4.3.bb} (90%)

diff --git a/meta/recipes-support/libffi/libffi_3.4.2.bb b/meta/recipes-support/libffi/libffi_3.4.3.bb
similarity index 90%
rename from meta/recipes-support/libffi/libffi_3.4.2.bb
rename to meta/recipes-support/libffi/libffi_3.4.3.bb
index 41c3cad586..d2c86d1f9b 100644
--- a/meta/recipes-support/libffi/libffi_3.4.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.3.bb
@@ -8,13 +8,13 @@ library really only provides the lowest, machine dependent layer of a fully feat
 A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=679b5c9bdc79a2b93ee574e193e7a7bc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=32c0d09a0641daf4903e5d61cc8f23a8"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            file://0001-arm-sysv-reverted-clang-VFP-mitigation.patch \
            "
-SRC_URI[sha256sum] = "540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9e93620"
+SRC_URI[sha256sum] = "4416dd92b6ae8fcb5b10421e711c4d3cb31203d77521a77d85d0102311e6c3b8"
 
 EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
-- 
2.25.1


