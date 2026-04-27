Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91460FF8867
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 21:09:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6360.1777324133375236730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 14:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=n98+cRbo;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F33A16F2
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:08:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 63F7F3F7B4
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777324132; bh=iBj7go2/f5KPNBjY6sx1fs0TWbGMGp4VX4cEWISfadE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n98+cRbohABt87hK2HgbuWW7mZsfoQHong7qCHq1kqQTXdpwhE6+VK9XtBXgvQct9
	 iUh0U8t/k/cB3nJcYdzGtEFxfq7oZfazvNm6tadF6PaXFw3wFekmsQBOLaY+YUF/d/
	 P2uigGHzt9Xz2YI3Gxi1qipYvVJJxApBFkVi3ZNc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] kernel-devsrc: remove obsolete explicit debug packaging
Date: Mon, 27 Apr 2026 22:08:47 +0100
Message-ID: <20260427210847.3027890-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427210847.3027890-1-ross.burton@arm.com>
References: <20260427210847.3027890-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 21:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236029

The .debug directories are packaged automatically by default, so this is
redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
index 62f5df7a01a..237dec6b128 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -429,7 +429,6 @@ do_install() {
 do_install[lockfiles] =3D "${TMPDIR}/kernel-scripts.lock"
=20
 FILES:${PN} =3D "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH}"
-FILES:${PN}-dbg +=3D "${KERNEL_BUILD_ROOT}*/build/scripts/*/.debug/*"
=20
 RDEPENDS:${PN} =3D "bc python3-core flex bison ${TCLIBC}-utils gawk"
 # 4.15+ needs these next two RDEPENDS
--=20
2.43.0


