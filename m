Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5D7C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 10:41:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.66597.1701686467581250143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 02:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBE6C106F;
	Mon,  4 Dec 2023 02:41:53 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D45E3F6C4;
	Mon,  4 Dec 2023 02:41:06 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] avahi: update URL for new project location
Date: Mon,  4 Dec 2023 10:41:04 +0000
Message-Id: <20231204104104.3443255-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 10:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191731

From: Ross Burton <ross.burton@arm.com>

Avahi has moved to a new parent organisation on GitHub, so update the
URLs to match.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
index 910da3c9cce..7295c4e05b6 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -6,7 +6,7 @@ IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for=
 automatic IP address \
 configuration from the link-local 169.254.0.0/16 range without the need =
for a central \
 server.'
 HOMEPAGE =3D "http://avahi.org"
-BUGTRACKER =3D "https://github.com/lathiat/avahi/issues"
+BUGTRACKER =3D "https://github.com/avahi/avahi/issues"
 SECTION =3D "network"
=20
 # major part is under LGPL-2.1-or-later, but several .dtd, .xsl, initscr=
ipts and
@@ -33,8 +33,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-$=
{PV}.tar.gz \
            file://CVE-2023-38473.patch \
            "
=20
-GITHUB_BASE_URI =3D "https://github.com/lathiat/avahi/releases/"
-SRC_URI[md5sum] =3D "229c6aa30674fc43c202b22c5f8c2be7"
+GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
 SRC_URI[sha256sum] =3D "060309d7a333d38d951bc27598c677af1796934dbd98e102=
4e7ad8de798fedda"
=20
 CVE_STATUS[CVE-2021-26720] =3D "not-applicable-platform: Issue only affe=
cts Debian/SUSE"
--=20
2.34.1


