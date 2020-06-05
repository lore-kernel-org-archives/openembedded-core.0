Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.6961.1591348056156418820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 02:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05597ZkN019832
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Jun 2020 02:07:35 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Fri, 5 Jun 2020 02:07:22 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] avahi-dnsconfd: rdepends on avahi-daemon
Date: Fri, 5 Jun 2020 17:07:19 +0800
Message-ID: <20200605090719.12759-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 05597ZkN019832
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Kai Kang <kai.kang@windriver.com>

Systemd service avahi-dnsconfd.service=C2=A0requires avahi-daemon.socket
and avahi-daemon.service which are from avahi-daemon. So make
avahi-dnsconfd rdepends on avahi-daemon.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
index 2b0c71159d..35d0c3ea75 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -144,6 +144,7 @@ FILES_avahi-utils =3D "${bindir}/avahi-* ${bindir}/b*=
 ${datadir}/applications/b*"
=20
 RDEPENDS_${PN}-dev =3D "avahi-daemon (=3D ${EXTENDPKGV}) libavahi-core (=
=3D ${EXTENDPKGV})"
 RDEPENDS_${PN}-dev +=3D "${@["", " libavahi-client (=3D ${EXTENDPKGV})"]=
[bb.utils.contains('PACKAGECONFIG', 'dbus', 1, 0, d)]}"
+RDEPENDS_${PN}-dnsconfd =3D "${PN}-daemon"
=20
 RRECOMMENDS_avahi-daemon_append_libc-glibc =3D " libnss-mdns"
=20
--=20
2.17.1

