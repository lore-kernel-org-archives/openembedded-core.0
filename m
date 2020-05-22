Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.8579.1590130885499997747
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 00:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04M70mRh027009
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 22 May 2020 00:00:58 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Fri, 22 May 2020 00:00:25 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <martin.jansa@gmail.com>
Subject: [PATCH v2 0/2] Add meson option introspection for libsecret
Date: Fri, 22 May 2020 15:00:21 +0800
Message-ID: <20200522070023.38061-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
* revert distro feature check for 'gobject-introspection-data'

Build with/without config

DISTRO_FEATURES_remove = "gobject-introspection-data"

$ bitbake webkitgtk pinentry

Build successfully.

Kai Kang (2):
  libsecret: add meson option introspection
  Revert "webkitgtk, pinentry: require gobject-introspection-data in
    DISTRO_FEATURES when libsecret PACKAGECONFIG is enabled"

 .../0001-meson-add-option-introspection.patch | 137 ++++++++++++++++++
 .../libsecret/libsecret_0.20.3.bb             |   8 +-
 meta/recipes-sato/webkit/webkitgtk_2.28.2.bb  |   6 +-
 .../pinentry/pinentry_1.1.0.bb                |   5 +-
 4 files changed, 144 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.patch

--
2.17.1

