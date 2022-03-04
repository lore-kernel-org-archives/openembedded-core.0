Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1E3C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 17:14:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1051.1646414053412406383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 09:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BDDD1424
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Mar 2022 09:14:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 051FD3F7B4
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Mar 2022 09:14:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] asciidoc: update git repository
Date: Fri,  4 Mar 2022 17:14:06 +0000
Message-Id: <20220304171408.2672507-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 17:14:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162744

The asciidoc-py3 repository has been renamed to asciidoc-py.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb b/meta/rec=
ipes-extended/asciidoc/asciidoc_10.1.3.bb
index 34bf2550f5..fc8cbc89c8 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
@@ -8,7 +8,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D4e5d1baf6f20559e3bec172226a=
47e4e \
                     file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3 "
=20
-SRC_URI =3D "git://github.com/asciidoc/asciidoc-py3;protocol=3Dhttps;bra=
nch=3Dmain"
+SRC_URI =3D "git://github.com/asciidoc/asciidoc-py;protocol=3Dhttps;bran=
ch=3Dmain"
 SRCREV =3D "342639edbbc0dcc64354a0291d2214d4d5e65cab"
=20
 DEPENDS =3D "libxml2-native libxslt-native docbook-xml-dtd4-native docbo=
ok-xsl-stylesheets-native"
--=20
2.25.1


