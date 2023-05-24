Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD0BC77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 14:03:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9699.1684937017728692193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 07:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F36A1042;
	Wed, 24 May 2023 07:04:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 79C003F762;
	Wed, 24 May 2023 07:03:36 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] avahi: remove redundant gobject-introspection DEPENDS
Date: Wed, 24 May 2023 15:03:35 +0100
Message-Id: <20230524140335.3623060-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 14:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181674

From: Ross Burton <ross.burton@arm.com>

The gobject-introspection class adds this dependency as needed, so
remove it from DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
index 8649140a458..1764997c41b 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -35,7 +35,7 @@ SRC_URI[sha256sum] =3D "060309d7a333d38d951bc27598c677a=
f1796934dbd98e1024e7ad8de79
 # Issue only affects Debian/SUSE, not us
 CVE_CHECK_IGNORE +=3D "CVE-2021-26720"
=20
-DEPENDS =3D "expat libcap libdaemon glib-2.0 glib-2.0-native gobject-int=
rospection"
+DEPENDS =3D "expat libcap libdaemon glib-2.0 glib-2.0-native"
=20
 # For gtk related PACKAGECONFIGs: gtk, gtk3
 AVAHI_GTK ?=3D ""
--=20
2.34.1


