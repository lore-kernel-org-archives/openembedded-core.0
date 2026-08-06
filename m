Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7961C5AC80
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 17:24:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25196.1786037080402918804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 10:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=qQbza8M8;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B66BE153B
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 10:24:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 556773F632
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 10:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786037079; bh=vu8fOenQSVjpB+ROUEdOh/UdI14BEqn5z7X8ijg01z8=;
	h=From:To:Subject:Date:From;
	b=qQbza8M8p2xasBrYAdg7m4B3gDun0x3a9u+DazCn2bvZ2CO/FLYKQJCtxkqNJ0Y/t
	 XHdWXpgXrEKYTJbKXF70XMaI5JDL5Pgahf9HAZLqDV/Ta+iix7dNAXBekfICgJq8tR
	 at0O+qw+jGjApAgV/eAety4rNnnsy6PYZNeCuFMo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-iniconfig: use the setuptools build backend
Date: Thu,  6 Aug 2026 18:24:36 +0100
Message-ID: <20260806172437.647443-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 17:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242961

iniconfig moved to setuptools in 2.2.0[1].

[1] https://github.com/pytest-dev/iniconfig/commit/3af74adab75bf42fbfca55=
848da60b7a5a116859

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb b/me=
ta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
index 1937285c3b7..05b4dd6c749 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
@@ -8,6 +8,6 @@ SRC_URI[sha256sum] =3D "c76315c77db068650d49c5b56314774a7=
804df16fee4402c1f19d6d15d
=20
 DEPENDS +=3D "python3-hatch-vcs-native"
=20
-inherit pypi python_hatchling
+inherit pypi python_setuptools_build_meta
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


