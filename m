Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E6910D14B7
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 13:28:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51465.1774877315091370076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 06:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=hu62deiR;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BE683562
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 06:28:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0696C3F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774877314; bh=iMD4ydDmhCGxUYxm88z8cac3+Itpri9UVBowRqzo4v0=;
	h=From:To:Subject:Date:From;
	b=hu62deiRpiYd0LeO3yugYEz72BXViiTGJR99NJ3qNMLB+S9hFrNRqh4Jax2nqTcYZ
	 llz+X2+C4BTw5EbsRb6j2qL73rwGEEGAoTHowQfq3zpAOv9Bs4qWIvhonHHt+MI4xz
	 HWEYZthI3XN3+Ao5l+HCk/mqkHpkhenJRV+bj9zk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] gnutls: update patch status
Date: Mon, 30 Mar 2026 14:28:22 +0100
Message-ID: <20260330132825.1784802-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 13:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234233

This patch was merged upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/gnutls/gnutls/c99.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls/c99.patch b/meta/recipes-=
support/gnutls/gnutls/c99.patch
index f176c0c3393..3f41241deba 100644
--- a/meta/recipes-support/gnutls/gnutls/c99.patch
+++ b/meta/recipes-support/gnutls/gnutls/c99.patch
@@ -13,7 +13,7 @@ explicitly for just c89.
=20
 Closes #1806.
=20
-Upstream-Status: Submitted [https://gitlab.com/gnutls/gnutls/-/merge_req=
uests/2081]
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/merge_requ=
ests/2081]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  configure.ac | 6 +++---
--=20
2.43.0


