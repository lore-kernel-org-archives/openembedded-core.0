Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FFBC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 01:23:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.48747.1658280202181732340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 18:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F4fJa2qu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658280200; i=@fujitsu.com;
	bh=w8XLT3r/3yaJLJlIh0PVeLhxvy8giFGgvxdzAemBl+M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=F4fJa2quwvdqSzIPaaBkjfzxc/iyV34eoIH/JgBh+PSRpI4eP6QFFMzD32eeu4ygT
	 pULOEsaM+t8u5WqvjTfwbXgpg3hlWysW+NB1XC4CPOP/Gdp0fHE7mf1LqdeyoPIItQ
	 koA4dygiMDT29WNfcNiddflUmgtP0NIhEYJ59Vw4EwFmnjm2pojVhJARhe+jUj8IAC
	 TjgCKzw6SBf2TGYU4jRN61LJKaSetNql2l4ZOdiKTSafACjmg1+UTS4IOkvbSPgbfu
	 O5YNmt3h9XEQ+IWPThDkjKRkj2+V6DyTqX/Uj86AJcMmyk6+eC3s587AYoSdjvU8gT
	 6TM0ODBi4KciQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqMseeT3
  J4PB0SYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePrw8SCmxwVb66fYG9g/MjexcjJISTwmFHi
  yz7/LkYuIPsak8T5K5+ZIZy9jBLT2jsZQarYBDQkdk+9DJTg4BAR0JO4+k8UJMwsoCZx9OVPZ
  hBbWCBIYsffJ2DlLAKqEi+vz2MDsXkFXCRe//8KtkxCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  UzRI2SxNtLexgh7AqJ14cvQcXVJK6e28Q8gZF/FpL2WUjaFzAyrWK0TirKTM8oyU3MzNE1NDD
  QNTQ01bU00zU000us0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMyZTiBIEd
  jHv3/dI7xCjJwaQkypv+/1qSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne/UHXk4QEi1LTUyvSM
  nOA8QGTluDgURLh3RwOlOYtLkjMLc5Mh0idYlSUEue9BZIQAElklObBtcFi8hKjrJQwLyMDA4
  MQT0FqUW5mCar8K0ZxDkYlYd5QkCk8mXklcNNfAS1mAlo8yekKyOKSRISUVAPT1jU37pi/Xt3
  v2HjX7ub+fCGPpL2y897qZyw/PT+8fp99+UvRKyJhCWobbvxz197JsvRcZrkNh22/8K0fD4zi
  ZdceUcnKcEq0/LbAhmE+/4xPMouruRqZIi7s6XGZ/3ml9oaj2rd/mbrJ9VvLGx25M5+r4Lv11
  RKrtnwPZp3N6qJ+u9q4nybnaTSuT09oNdnydUfrlvzLjd7rO+WqrsRoX/l4+XnKOsboAC5dFd
  +j8799nmfPOdffdYWUGWtDm/0UX9O7H6d/la9wOBVcL1vn9dGad57Vo2XbVu3PCuBp8hAUjFG
  pqAyIF4j1nqx826+rd5cXn+vlMxcqROrNvkafkZhYFDXjhfBM2boZXEosxRmJhlrMRcWJAN1s
  JudEAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-11.tower-728.messagelabs.com!1658280199!21317!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30114 invoked from network); 20 Jul 2022 01:23:19 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Jul 2022 01:23:19 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CE812100191
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:23:18 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C28CE100043
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:23:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 20 Jul 2022 02:23:17 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] systemd: Added base_bindir into
 pkg_postinst:udev-hwdb.
Date: Wed, 20 Jul 2022 09:23:03 +0800
Message-ID: <1658280183-3796-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 01:23:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168290

Otherwise in sdk environment, the base_bindir is empty and the path of UDEVADM="${base_bindir}/udevadm" is not correct.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-core/systemd/systemd_251.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_251.2.bb b/meta/recipes-core/systemd/systemd_251.2.bb
index bb3c59f418..2d0d21a69a 100644
--- a/meta/recipes-core/systemd/systemd_251.2.bb
+++ b/meta/recipes-core/systemd/systemd_251.2.bb
@@ -786,7 +786,7 @@ pkg_prerm:${PN}:libc-glibc () {
 PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst:udev-hwdb () {
 	if test -n "$D"; then
-		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} rootlibexecdir="${rootlibexecdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}"
+		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} rootlibexecdir="${rootlibexecdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}" base_bindir="${base_bindir}"
 	else
 		udevadm hwdb --update
 	fi
-- 
2.25.1


