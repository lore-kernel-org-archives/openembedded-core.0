Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB1FC43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:16:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38495.1782742565201113532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=U0pF37Lc;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29C0116A3
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:16:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2C6A23F905
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782742564; bh=MnSkzdx7mtHdtKhO9KF5ztfUK0aftnCOhIPmXz3bAbk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U0pF37Lc651m/BmwWvg1Aoqy8+E7QoYIZXAvRFSJw9PApPnj/ZmKUXdKcCM9K1aLm
	 wTcx9zdMqBIpJ427uUpt642gE9zojUbaDiPPWUWbsqtkvbmuq2iTEG0M+Njc3Z7grj
	 NbWYaQtxFTmq02YS+1nJ2hT8oVhOOmsTMxs02guk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] systemd-systemctl-native: update MESON_TARGET for direct ninja use
Date: Mon, 29 Jun 2026 15:15:58 +0100
Message-ID: <20260629141559.1305873-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629141559.1305873-1-ross.burton@arm.com>
References: <20260629141559.1305873-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239786

We can't specify the target type now that the Meson class calls ninja
directly, so drop it. This doesn't change what is built.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb =
b/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
index 3d01d60e9c1..351f78d173c 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "gperf-native libcap-native util-linux-native=
 python3-jinja2-native"
=20
 inherit pkgconfig meson native
=20
-MESON_TARGET =3D "systemctl:executable"
+MESON_TARGET =3D "systemctl"
 MESON_INSTALL_TAGS =3D "systemctl"
 EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
 EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
--=20
2.43.0


