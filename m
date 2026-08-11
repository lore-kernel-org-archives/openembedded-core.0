Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F66DC5B572
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 14:36:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55473.1786458975274497400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 07:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Q+TbzXSm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC9FA1516
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:36:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5DB573F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786458974; bh=G1ApRCJH1Wkj6gQp0ZRcJRKGp5snEm7YwALUOZemPaw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q+TbzXSmvi2BZuJrxJKwBXdNuSQ/n0YgBlLyPyTER+ERWWtAhYB37spIyK3fd1qFe
	 JuhQYBzRpwzcVS5XyJpF1F2s6bZqjS0XKTn3wDcFEYd2lzR60x23BvWHr3gHMbUAkR
	 bufn02gQzNSmjTNbDYuWZUF1fFnSlqRIIZt6g6U4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] classes/python_setuptools_build_meta: remove wheel dependency
Date: Tue, 11 Aug 2026 15:36:07 +0100
Message-ID: <20260811143607.1200407-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811143607.1200407-1-ross.burton@arm.com>
References: <20260811143607.1200407-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 14:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243209

Historically, setuptools provided most of the build commands but the
wheel package provided bdist_wheel.

However, as of setuptools 70.1.0[1], this command is part of setuptools
itself and the wheel package is not required.

[1] https://github.com/pypa/setuptools/commit/b3d3e93a834426f1bef8712e140=
5495084eb3b7f

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_setuptools_build_meta.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_setuptools_build_meta.bbclass b/m=
eta/classes-recipe/python_setuptools_build_meta.bbclass
index f09f7e9a918..d488debdb0e 100644
--- a/meta/classes-recipe/python_setuptools_build_meta.bbclass
+++ b/meta/classes-recipe/python_setuptools_build_meta.bbclass
@@ -6,7 +6,7 @@
=20
 inherit python_pep517
=20
-DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
+DEPENDS +=3D "python3-setuptools-native"
=20
 # This isn't nice, but is the best solutions to ensure clean builds for =
now.
 # https://github.com/pypa/setuptools/issues/4732
--=20
2.43.0


