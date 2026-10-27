Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16831.1793100655405197803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 04:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=rZ/G1+RB;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B705515A1
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:30:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6DAFE3F59E
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793100654; bh=IYUhrGUI1QBVTPR+cSfI1GnydR+TwFd/4+7f4kKMjUw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rZ/G1+RBGVWd+fLzx6OenJGQe7rsTq9ol3YYQIWqyEtOP63FxyD69O5Sl7RdyRDlH
	 MS9KY7/XjsDj31A97p8ZDECTnyUGoorhwQgqLQbQq0+QOg8/jKC4p8xnIEZHJ8lO//
	 nrSwerUO3tOWgHFsEiD84YhwmJBEUh5yG4RAxGGY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] mc: use .tar.gz instead of .tar.bz2 in SRC_URI
Date: Tue, 27 Oct 2026 11:30:45 +0000
Message-ID: <20261027113048.1086884-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027113048.1086884-1-ross.burton@arm.com>
References: <20261027113048.1086884-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 11:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248731
Content-Type: text/plain; charset="utf-8"

.xz files are significantly smaller than .bz2, so download that instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/mc/mc_4.8.33.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/mc/mc_4.8.33.bb b/meta/recipes-extende=
d/mc/mc_4.8.33.bb
index 0682ae4bb6a..b09416415ab 100644
--- a/meta/recipes-extended/mc/mc_4.8.33.bb
+++ b/meta/recipes-extended/mc/mc_4.8.33.bb
@@ -8,10 +8,10 @@ DEPENDS =3D "ncurses glib-2.0 util-linux file-replaceme=
nt-native"
 RDEPENDS:${PN} =3D "ncurses-terminfo-base"
 RRECOMMENDS:${PN} =3D "ncurses-terminfo"
=20
-SRC_URI =3D "http://ftp.midnight-commander.org/${BPN}-${PV}.tar.bz2 \
+SRC_URI =3D "http://ftp.midnight-commander.org/${BPN}-${PV}.tar.xz \
            file://nomandate.patch \
            "
-SRC_URI[sha256sum] =3D "a3ceb0af84226fedfe5f339464ff2849c3f6bf0321b72027=
c47b2c10e66a6dba"
+SRC_URI[sha256sum] =3D "cae149d42f844e5185d8c81d7db3913a8fa214c65f852200=
a9d896b468af164c"
=20
 inherit autotools gettext pkgconfig
=20
--=20
2.43.0

