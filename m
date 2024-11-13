Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85A9D462D6
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 15:55:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14822.1731513321896712208
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 07:55:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4557D1474
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 07:55:51 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA53A3F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 07:55:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 7/8] builder: use x-terminal-emulator
Date: Wed, 13 Nov 2024 15:55:10 +0000
Message-Id: <20241113155511.1948551-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113155511.1948551-1-ross.burton@arm.com>
References: <20241113155511.1948551-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 15:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207119

Don't hardcode matchbox-terminal, but use the alternative.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/builder/files/builder_session.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/builder/files/builder_session.sh b/met=
a/recipes-graphics/builder/files/builder_session.sh
index 4e509a701ac..a59c5ce84b6 100644
--- a/meta/recipes-graphics/builder/files/builder_session.sh
+++ b/meta/recipes-graphics/builder/files/builder_session.sh
@@ -30,4 +30,4 @@ fi
 cd /home/builder/poky
 . ./oe-init-build-env
=20
-matchbox-terminal&
+x-terminal-emulator &
--=20
2.34.1


