Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.7699.1626014739145468284
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 07:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=tBqvoA50;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AB67981EBD;
	Sun, 11 Jul 2021 16:45:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1626014735;
	bh=9Z0nCBsQDTv1fZKwvEu2KxhlHAKmXspABqWZCH/TvHU=;
	h=From:To:Cc:Subject:Date:From;
	b=tBqvoA50/8N8OCKUUkVtX5xlOVfRBsoN5FQvxF5iLSma0nAdHFYSod2uUF7LTmDfu
	 LbBLvak7iGk7E8znJb6u+9hlca3E05VmO79uVXVeT7cQ3/9t09f1uTzkYR1zHyzV7e
	 BT9xmUS6ZIx8XtdS/YF2VOzUN1MOdagDqFouK+sF+ikuXCW3FdBy1ZZhzP/0cIShTQ
	 iA05a1fduWgtMgiveygE9LbI+MwgPA/H1aZU6PGIgDHEkKLCeQGnhqOkGdu1dlNydz
	 +MBZVBQVZn4kaEpFPYuMvUGtzXktKzYbNvMEIPAZpNi6xSQyfVmybQAVcLSYm+SoQQ
	 /8pCcsy52jeUg==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH][dunfell] bootchart2: update 0.14.8 -> 0.14.9
Date: Sun, 11 Jul 2021 16:45:15 +0200
Message-Id: <20210711144515.21566-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
NOTE: We need this in dunfell too, since it fixes python 3.8 compatibilit=
y.
---
 .../bootchart2/{bootchart2_0.14.8.bb =3D> bootchart2_0.14.9.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/bootchart2/{bootchart2_0.14.8.bb =3D> bootc=
hart2_0.14.9.bb} (99%)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta=
/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
similarity index 99%
rename from meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
rename to meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index a938b2da49..6571c19938 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -97,8 +97,7 @@ SRC_URI =3D "git://github.com/xrmx/bootchart.git \
           "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "331ada031f1d65f6d934d918f896e1c708c64bf7"
-PV .=3D "+git${SRCPV}"
+SRCREV =3D "868a2afab9da34f32c007d773b77253c93104636"
=20
 inherit systemd update-rc.d python3native update-alternatives
=20
--=20
2.30.2

