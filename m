Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web09.7987.1609214160834241323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 19:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from misaki.hotel.hz.sumomo.pri (unknown [192.168.10.3])
	by kozue.soulik.info (Postfix) with ESMTPA id F2175100029;
	Tue, 29 Dec 2020 12:55:42 +0900 (JST)
From: "Randy Li" <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Cc: Randy Li <ayaka@soulik.info>
Subject: [PATCH v2 0/2] meson: fixup nativesdk sysroot
Date: Tue, 29 Dec 2020 11:55:48 +0800
Message-Id: <20201229035550.226617-1-ayaka@soulik.info>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I still saw the request for this patch from Gstreamer users
sometimes. I have verified this version would work fine.

Only the exported SDK would need this patch.

Changelog:
V2:
fix the script for not list-type config option

Randy Li (2):
  meson: don't turn sting into a list in nativesdk
  meson: add sysroot property

 meta/recipes-devtools/meson/meson/meson-setup.py      | 10 +++++++---
 meta/recipes-devtools/meson/nativesdk-meson_0.56.0.bb |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

--=20
2.29.2

