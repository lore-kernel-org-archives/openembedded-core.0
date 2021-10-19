Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52986C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:26:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.14963.1634671585546337374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3542B1063
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:26:20 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC7093F694
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:26:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] strace: remove TOOLCHAIN assignment
Date: Tue, 19 Oct 2021 20:26:14 +0100
Message-Id: <20211019192614.153903-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019192614.153903-1-ross.burton@arm.com>
References: <20211019192614.153903-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:26:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157201

Back in 2016 strace failed to link when using clang, but this isn't the
case anymore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/strace/strace_5.14.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace_5.14.bb b/meta/recipes-d=
evtools/strace/strace_5.14.bb
index 9ae1367337..5e02df9145 100644
--- a/meta/recipes-devtools/strace/strace_5.14.bb
+++ b/meta/recipes-devtools/strace/strace_5.14.bb
@@ -53,4 +53,3 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D "\
 "
=20
 BBCLASSEXTEND =3D "native"
-TOOLCHAIN =3D "gcc"
--=20
2.25.1


