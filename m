Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736CCC433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 14:36:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11751.1647354974570008001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 07:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF0AC1474
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 07:36:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DA2B3F66F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 07:36:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: update reproducibility Upstream-Status
Date: Tue, 15 Mar 2022 14:36:09 +0000
Message-Id: <20220315143609.551311-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 14:36:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163291

This is now upstreamed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/openssl/openssl/reproducibility.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/reproducibility.pa=
tch b/meta/recipes-connectivity/openssl/openssl/reproducibility.patch
index 8accbc9df2..2a8adfb4df 100644
--- a/meta/recipes-connectivity/openssl/openssl/reproducibility.patch
+++ b/meta/recipes-connectivity/openssl/openssl/reproducibility.patch
@@ -2,7 +2,7 @@ Using localtime() means the output can depend on the time=
zone of the build machi
 Using gmtime() is safer. For complete reproducibility use SOURCE_DATE_EP=
OCH if set.
=20
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending [should be suitable]
+Upstream-Status: Backport [27aca04e13ca8a9bead49de7bc380110ecb7064e]
=20
 Index: openssl-3.0.1/apps/progs.pl
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--=20
2.25.1


