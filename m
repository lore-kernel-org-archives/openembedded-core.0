Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E314AC56205
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 17:24:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25197.1786037081401713531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 10:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=tWJHlwwo;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF139153B
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 10:24:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 17DE73F632
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 10:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786037080; bh=CDdJobbnhTqOzDp0NwciE65a6soZUCwTv8GboH9ZO94=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tWJHlwwoeRYnQPPxm8o+PXnBISptRlo84NtxqrtAqD9HJ7GMy/JtJ0Ha9vsrHPrIT
	 so1QFjHXjIBTN6TX2KYPe9A/5fVM3Bu5nj3b9k7KNYawV63uWfIhpR733FyHGF31BZ
	 HYs3Tm59HFXKlEjfGjE9RKklMLv8+2TcbvEzZaqk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-pip: use the flit_core build backend
Date: Thu,  6 Aug 2026 18:24:37 +0100
Message-ID: <20260806172437.647443-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806172437.647443-1-ross.burton@arm.com>
References: <20260806172437.647443-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 17:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242962

pip moved to flit in 25.3[1].

[1] https://github.com/pypa/pip/commit/9abe08127cb666e9eef9e231d4bec0e89a=
fdc830

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pip_26.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pip_26.2.bb b/meta/reci=
pes-devtools/python/python3-pip_26.2.bb
index 13ba2b9e5f3..4e5a777931c 100644
--- a/meta/recipes-devtools/python/python3-pip_26.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.2.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52ba=
f95163b597008bb46db68030 \
                     file://src/pip/_vendor/urllib3/LICENSE.txt;md5=3D52d=
273a3054ced561275d4d15260ecda \
                     "
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
=20
 SRC_URI +=3D "file://no_shebang_mangling.patch"
=20
--=20
2.43.0


