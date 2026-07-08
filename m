Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0912C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:11:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6069.1783509075238403611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=mIux6UAh;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EE7D1F37
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 04:11:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8675A3F85F
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783509074; bh=JY2XNod406Yz36bXtie4utrk8zag/1m7/Uw8dZDwECE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mIux6UAhTjzO4xwIiJy1nxEtXd2pnB/qFPYtgNK1yCS69mW/STonlleXEAXHZcBt0
	 XXdsft78lD6aE+2tyeq/xISt8lQMF7rhziWJeIqnzLgo/P3hgwOKGDVYHr2/ZdXhvh
	 NY5TG2FQ1x6l5qBBduQhtPYsaiGx4kqtvbHBKRAU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] python3-hatchling: upgrade 1.30.1 -> 1.31.0
Date: Wed,  8 Jul 2026 12:11:07 +0100
Message-ID: <20260708111108.3577325-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708111108.3577325-1-ross.burton@arm.com>
References: <20260708111108.3577325-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240461

Upstream changelog:

- Only rewrite the shebang of a shared script when a Python shebang is
  present on the first line, preserving binary files and other content
  verbatim instead of dropping leading bytes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...{python3-hatchling_1.30.1.bb =3D> python3-hatchling_1.31.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.30.1.bb =3D> py=
thon3-hatchling_1.31.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb b/m=
eta/recipes-devtools/python/python3-hatchling_1.31.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hatchling_1.30.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.31.0.bb
index 23067e3e58..3acaa83638 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.30.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb
@@ -7,6 +7,6 @@ inherit pypi python_hatchling
=20
 DEPENDS +=3D "python3-pluggy-native python3-pathspec-native python3-pack=
aging-native python3-editables-native python3-trove-classifiers-native"
=20
-SRC_URI[sha256sum] =3D "eee4fd45357f72ebb3d7a42e5d72cfb5e29ed426d79e8836=
288926c4258d5f2e"
+SRC_URI[sha256sum] =3D "6b48ad4068a482ed7239b3a8215bc55b47aad3345d58dfc9=
4e553c5d2d46211b"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


