Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D839EC982C1
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 21:01:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25450.1789592505924143785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 14:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=RxS0mm8Q;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5B971477
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 14:01:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B7893F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 14:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789592505; bh=DXMlpRMii6fWxl44ck9B9Fk8QqW2zU0/L4uX7QMt6kU=;
	h=From:To:Subject:Date:From;
	b=RxS0mm8QUSpFzECrl5ipeeyHNTTK5bdlxODvptu+i0Z31XXlqEYVnDl5Fg91phXx6
	 HJOirA+VPTACfjSYdLwMXJ6yusAe4mFrqViZ+XLiGQekqnZLd1CxfuWjyeKEBDLi4I
	 6+Bdi1JA/+SU1HnxN8QKvGvjdnSxk6d/RbTA4jqE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-bcrypt: enable native builds
Date: Wed, 16 Sep 2026 22:01:39 +0100
Message-ID: <20260916210141.1080593-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 21:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245998

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb b/meta/=
recipes-devtools/python/python3-bcrypt_5.0.0.bb
index 51b7edef8cf..909b5890844 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
@@ -19,3 +19,5 @@ RDEPENDS:${PN}:class-target +=3D "\
     python3-ctypes \
     python3-shell \
 "
+
+BBCLASSEXTEND =3D "native"
--=20
2.43.0


