Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.428.1632156747377822952
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 09:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12E24113E
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 09:52:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0F9E3F59C
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 09:52:25 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] avahi: remove obsolete intltool-native dependency
Date: Mon, 20 Sep 2021 17:52:23 +0100
Message-Id: <20210920165223.3591446-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

intltool was replaced with gettext in the 0.8 release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
index cd0489e846..4b15d11b61 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -35,7 +35,7 @@ SRC_URI[sha256sum] =3D "060309d7a333d38d951bc27598c677a=
f1796934dbd98e1024e7ad8de79
 # Issue only affects Debian/SUSE, not us
 CVE_CHECK_WHITELIST +=3D "CVE-2021-26720"
=20
-DEPENDS =3D "expat libcap libdaemon glib-2.0 intltool-native"
+DEPENDS =3D "expat libcap libdaemon glib-2.0"
=20
 # For gtk related PACKAGECONFIGs: gtk, gtk3
 AVAHI_GTK ?=3D ""
--=20
2.25.1

