Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40CCC43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 07:49:30 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.4651.1655884160436097398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 00:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=AwT5Cl+4;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655884160; i=@fujitsu.com;
	bh=xEQYu+X6EL6/kmbhk2DRYdNqmO+tOJSDIHN/IVnC6CA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=AwT5Cl+4tSY1zmom8m7aveFZ32GLyxtKG3aubvTXIQJvykOJ7G2wBea1CaKROxWNv
	 hOSCNIjAI6d+uzbXAbjqlD3bSmcWjBM6cg8xle/kmpfB1xB6KAKjIakB6fxEm8lwQ8
	 9CagSRPD3tZKXbtSZmxzwJCvKZBQjRyvT+8rSvjX6Qsq+STUuVTEXrnj99vY8k6Dog
	 565/NcRn4A1/Hig81geWXQ3YSJivIks/KYVfefEEW2KIQfOC5zPnHadfFsRRCqeHoq
	 gP4R5UTXaxvmRV1ZsX81/wyH3ohOlc42xDqqiLnKHRtr9+0wonYtFBz6Yq1TzOEING
	 7oTnMJnH/JCFg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleJIrShJLcpLzFFi42Kxs+HYrNtwclO
  SQXuboMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnH66jGmgjapiqWrzrA2MK4T72Lk4hASeMAo
  0Xn8CSuEc5NJ4vXiuYwQzh5GidZNL5i7GDk52ATUJKbfugFUxcEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jASGLbyS2sIDaLgKrE+fstbCDlvAJOErcmeoKEJQQUJKY8fA82kVPAWWLx3f1gthBQSe
  vSB0wgNq+AoMTJmU9YIMZrSrRu/80OYctLNG+dzQwxR1Fi9uVmFgi7QmLGjG1sELaaxNVzm5g
  nMArNQjJqFpJRs5CMWsDIvIrRKqkoMz2jJDcxM0fX0MBA19DQVNdU18jIVC+xSjdRL7VUtzy1
  uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzDkU4pZH+5gXNz3U+8QoyQHk5Ior+SBTUlCfEn5K
  ZUZicUZ8UWlOanFhxhlODiUJHjjjgPlBItS01Mr0jJzgPEHk5bg4FES4bU9AZTmLS5IzC3OTI
  dInWL05ljbcGAvM8f+a1eA5NTZ//YzcywHkzO/th1g5jj9Z/oBZiGWvPy8VClx3q8HgUYIgIz
  IKM2DWwBLI5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMWgxzCk5lXAnfHK6ATmYBOfLJ8
  A8iJJYkIKakGplrvlTdXiQRuemjsIckl4mSvkSemnlSZvp1pj1HAM9mZlvEp/Pn9GkIKyatzo
  3TdzrYxXdp+uC3u05N3zkxlPmdO+M/yvPoyf9KkKe/+Pj4a6KVyLyXg4bEw+/c7824uCymaei
  jErCxlx+kXYYvbdvqyfuvqeW1VG2bC9urynq/b1USPX5HU7nBbLKxyWTTx0UaDnqqDHvsMdhf
  Kd52o6TlRnzuzZcKZipZbFm91t8+MUVirENylsmDj6hnPjywId37QeHC1vmKqrKIr8840lglV
  nSeiHgspzpuZmJC+x9ZyfmFJ732F8tQNmxc923wv/cGaz2VfQw5l9ElduzpfxyS4cr1jThdLf
  mhbepCWEktxRqKhFnNRcSIA0XInHZ4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1655884159!401774!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18945 invoked from network); 22 Jun 2022 07:49:20 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jun 2022 07:49:20 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CAD53150
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:49:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BE3A0142
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:49:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 22 Jun 2022 08:49:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sbc: upgrade 1.5 -> 2.0
Date: Wed, 22 Jun 2022 15:48:48 +0800
Message-ID: <1655884130-22843-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655884130-22843-1-git-send-email-wangmy@fujitsu.com>
References: <1655884130-22843-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 07:49:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167219

0001-sbc_primitives-Fix-build-on-non-x86.patch
revmoed since it's included in 2.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-sbc_primitives-Fix-build-on-non-x86.patch | 45 -------------------
 .../sbc/{sbc_1.5.bb =3D> sbc_2.0.bb}            |  6 +--
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-multimedia/sbc/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch
 rename meta/recipes-multimedia/sbc/{sbc_1.5.bb =3D> sbc_2.0.bb} (76%)

diff --git a/meta/recipes-multimedia/sbc/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch b/meta/recipes-multimedia/sbc/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch
deleted file mode 100644
index 11cec74fbb..0000000000
--- a/meta/recipes-multimedia/sbc/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From f4a1224323e386090a44bf70ee0ac9877ba7fb0d Mon Sep 17 00:00:00 2001
-From: Marius Bakke <marius@gnu.org>
-Date: Tue, 22 Dec 2020 11:04:26 +0000
-Subject: [PATCH] sbc_primitives: Fix build on non-x86.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Don't call __builtin_cpu_init unless targeting i386 or x86_64.
-Otherwise we get an error at link time:
-
-  CC       sbc/sbc_primitives.lo
-sbc/sbc_primitives.c: In function =E2=80=98sbc_init_primitives_x86=E2=80=99:
-sbc/sbc_primitives.c:596:2: warning: implicit declaration of function =E2=80=98__builtin_cpu_init=E2=80=99; did you mean =E2=80=98__builtin_irint=E2=80=99=3F [-Wimplicit-function-declaration]
-[...]
-  CCLD     src/sbcdec
-ld: sbc/.libs/libsbc-private.a(sbc_primitives.o): in function `sbc_init_primitives':
-sbc_primitives.c:(.text+0x3a30): undefined reference to `__builtin_cpu_init'
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- sbc/sbc_primitives.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sbc/sbc_primitives.c b/sbc/sbc_primitives.c
-index 97a75be..09c214a 100644
---- a/sbc/sbc_primitives.c
-+++ b/sbc/sbc_primitives.c
-@@ -593,6 +593,7 @@ static int sbc_calc_scalefactors_j(
- 
- static void sbc_init_primitives_x86(struct sbc_encoder_state *state)
- {
-+#if defined(__x86_64__) || defined(__i386__)
- 	__builtin_cpu_init();
- 
- #ifdef SBC_BUILD_WITH_MMX_SUPPORT
-@@ -604,6 +605,7 @@ static void sbc_init_primitives_x86(struct sbc_encoder_state *state)
- 	if (__builtin_cpu_supports("sse4.2"))
- 		sbc_init_primitives_sse(state);
- #endif
-+#endif
- }
- 
- /*
diff --git a/meta/recipes-multimedia/sbc/sbc_1.5.bb b/meta/recipes-multimedia/sbc/sbc_2.0.bb
similarity index 76%
rename from meta/recipes-multimedia/sbc/sbc_1.5.bb
rename to meta/recipes-multimedia/sbc/sbc_2.0.bb
index e5c72ec0b4..d25be9e80c 100644
--- a/meta/recipes-multimedia/sbc/sbc_1.5.bb
+++ b/meta/recipes-multimedia/sbc/sbc_2.0.bb
@@ -12,11 +12,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 DEPENDS =3D "libsndfile1"
 
-SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/${BP}.tar.xz \
-           file://0001-sbc_primitives-Fix-build-on-non-x86.patch \
-           "
+SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/${BP}.tar.xz"
 
-SRC_URI[sha256sum] =3D "0cbad69823a99e8421fe0700e8cf9eeb8fa0c1ad28e8dbc2182b3353507931d2"
+SRC_URI[sha256sum] =3D "8f12368e1dbbf55e14536520473cfb338c84b392939cc9b64298360fd4a07992"
 
 inherit autotools pkgconfig
 
-- 
2.25.1


