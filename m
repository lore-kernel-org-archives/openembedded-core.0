Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45909.1795624782332924578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Vy3sV/W1;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 091BE2F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F0283F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624781; bh=Bh+nZIR1XzHDaR1nvJ446NkrPKsOvRzVoLfCJhZV69k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vy3sV/W15zZP7kIfATAX4DUX3ODK5UCj2f9ct/85IUE77GgFuB75f7NgdJTJjkdO1
	 14XS3xYWFqPNcLR+ChKS3/UimVydZPVlGuw6GR4HhLdgRUzPsdWvm2y0whUFlS54sE
	 k5yg/DiqT61f1zZvhXu5jlbYTr+Bzwu7gSu9CJII=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/18] python3-pytest: add missing runtime dependencies
Date: Wed, 25 Nov 2026 16:39:26 +0000
Message-ID: <20261125163927.1835785-17-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251228
Content-Type: text/plain; charset="utf-8"

pytest uses hashlib and uuid, so add the dependencies for those.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pytest_9.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pytest_9.2.0.bb b/meta/=
recipes-devtools/python/python3-pytest_9.2.0.bb
index bd580dabd63..f7831e7afe8 100644
--- a/meta/recipes-devtools/python/python3-pytest_9.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest_9.2.0.bb
@@ -12,11 +12,13 @@ DEPENDS +=3D "python3-setuptools-scm-native"
 inherit update-alternatives pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
+    python3-crypt \
     python3-colorama \
     python3-debugger \
     python3-doctest \
     python3-iniconfig \
     python3-json \
+    python3-netclient \
     python3-packaging \
     python3-pluggy \
     python3-pygments \
--=20
2.43.0

