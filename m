Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web11.803.1621988879842184842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 17:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 51C54E0C2D;
	Wed, 26 May 2021 12:27:47 +1200 (NZST)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH 3/3] icecc-create-env: Silence warning: invalid ICECC_ENV_EXEC
Date: Wed, 26 May 2021 12:27:44 +1200
Message-Id: <20210526002744.3683697-4-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526002744.3683697-1-douglas.royds@taitradio.com>
References: <20210526002744.3683697-1-douglas.royds@taitradio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.=
bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
index 231c1c20ec..61b8487c7e 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
@@ -11,6 +11,7 @@ PR =3D "r2"
=20
 DEPENDS =3D ""
 INHIBIT_DEFAULT_DEPS =3D "1"
+ICECC_DISABLED =3D "1"
=20
 # This is needed, because otherwise there is dependency loop from quilt-=
native
 # Dependency loop #1 found:
--=20
2.25.1

