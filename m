Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A3EC52CD8
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 15:30:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39439.1721921438723237123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 08:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C97D11476
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 08:31:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C42033F766
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 08:30:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] insane: add pep517-backend to WARN_QA
Date: Thu, 25 Jul 2024 16:30:27 +0100
Message-Id: <20240725153029.828624-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725153029.828624-1-ross.burton@arm.com>
References: <20240725153029.828624-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 15:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202508

Enable the new pep517-backend warning from setuptools3, initially as a
warning so as not to break builds straight away.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 7bf33f9bc0f..ad38879fa4b 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -26,7 +26,7 @@
=20
 # Elect whether a given type of error is a warning or error, they may
 # have been set by other files.
-WARN_QA ?=3D "32bit-time native-last"
+WARN_QA ?=3D "32bit-time native-last pep517-backend"
 ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files arch pkgconfig la =
\
             textrel incompatible-license files-invalid \
             infodir build-deps src-uri-bad symlink-to-sysroot multilib \
--=20
2.34.1


