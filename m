Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131E1C79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 13:49:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7880.1788875369125861451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 06:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WeZpMvX7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D72F21476
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 06:49:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 223D23F7B4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788875368; bh=tm+zuDGrtfUyqscktJZiKkehFC4h6tn0jZAl0phPE0w=;
	h=From:To:Subject:Date:From;
	b=WeZpMvX7xNS8I4VwGUk5Guw3qhReBsIWctQVrmzlDUOTjUipdLLouDJzEenS8E8d8
	 Qkbs0XSrHv6A3sKjh1BmDRTtBeqVjlWStO6lP6pMCShXWGXDgLQmWEe9dsfblqRAzH
	 37xX1DebPelir1Fh1vKAiOzZJ8vQ0Bv/yRdW/WPo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-iniconfig: remove obsolete DEPENDS
Date: Tue,  8 Sep 2026 14:49:25 +0100
Message-ID: <20260908134926.200628-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 13:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245364

hatch-vcs was removed as a build dependency in 2.2.0[1]. They moved to
setuptools so now depend on setuptools-scm instead.

[1] https://github.com/pytest-dev/iniconfig/commit/3af74adab75bf42fbfca55=
848da60b7a5a116859

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb b/me=
ta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
index 05b4dd6c749..6933ac49354 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4a73af4b5f1f3a=
8731e5def70e8c1254"
=20
 SRC_URI[sha256sum] =3D "c76315c77db068650d49c5b56314774a7804df16fee4402c=
1f19d6d15d8c4730"
=20
-DEPENDS +=3D "python3-hatch-vcs-native"
+DEPENDS +=3D "python3-setuptools-scm-native"
=20
 inherit pypi python_setuptools_build_meta
=20
--=20
2.43.0


