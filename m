Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B81EC10F1A
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 16:39:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.762.1713803930832714546
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 09:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 841F71515;
	Mon, 22 Apr 2024 09:39:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5C493F7BD;
	Mon, 22 Apr 2024 09:38:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/5] ruby: remove obsolete build dependences
Date: Mon, 22 Apr 2024 16:38:43 +0000
Message-Id: <20240422163846.1012183-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422163846.1012183-1-ross.burton@arm.com>
References: <20240422163846.1012183-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 16:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198598

Ruby 3.3.0 no longer bundles the readline module[1] so readline is no
longer a build dependency[2].

Ruby 3.2.0 no longer bundles the gdbm module[3] so gdbm is no longer a
build dependency.

[1] https://github.com/ruby/ruby/commit/59fd67fc3d405e529e038172e769ff20a=
8fb5535
[2] https://github.com/ruby/ruby/commit/172077232e7f40b4dfedf6a5434c252b3=
d326fab

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/ruby/ruby_3.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby_3.3.0.bb b/meta/recipes-devt=
ools/ruby/ruby_3.3.0.bb
index 17eb6d73c2b..657fc31b4df 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5b8c87559868=
796979806100db3f3805 \
                     file://LEGAL;md5=3D81e6a4d81533b9263da4c3485a0ad883 =
\
                     "
=20
-DEPENDS =3D "zlib openssl libyaml gdbm readline libffi"
+DEPENDS =3D "zlib openssl libyaml libffi"
 DEPENDS:append:class-target =3D " ruby-native"
 DEPENDS:append:class-nativesdk =3D " ruby-native"
=20
--=20
2.34.1


