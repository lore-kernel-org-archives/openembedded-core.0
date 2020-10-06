Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web10.12841.1601986274182494907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 05:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4C5GXJ5jGnz1sNcx;
	Tue,  6 Oct 2020 14:11:12 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4C5GXJ5LFQz1qv2d;
	Tue,  6 Oct 2020 14:11:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id mD4iL8k17EQF; Tue,  6 Oct 2020 14:11:11 +0200 (CEST)
X-Auth-Info: m6KO2wN0u8X3TPYvxERl0RWZJZaWcf/5yrsIWWedyb0=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  6 Oct 2020 14:11:11 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] [dunfell] lttng-tools: update to 2.11.5
Date: Tue,  6 Oct 2020 14:11:04 +0200
Message-Id: <20201006121105.94671-2-marex@denx.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201006121105.94671-1-marex@denx.de>
References: <20201006121105.94671-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Update to latest available.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-tools_2.11.2.bb =3D> lttng-tools_2.11.5.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.11.2.bb =3D> lttng-tools=
_2.11.5.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb b/meta/recip=
es-kernel/lttng/lttng-tools_2.11.5.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb
index 36a19ec18d..a969fffd62 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.11.5.bb
@@ -36,8 +36,8 @@ SRC_URI =3D "https://lttng.org/files/lttng-tools/lttng-=
tools-${PV}.tar.bz2 \
            file://0001-tests-regression-disable-the-tools-live-tests.pat=
ch \
            "
=20
-SRC_URI[md5sum] =3D "68ed78f7fa4235477ea577e48b3cd245"
-SRC_URI[sha256sum] =3D "936477305b25f65c5dd22db9161287d30a309ce868b61808=
57b1fd1fb5e6a56b"
+SRC_URI[md5sum] =3D "4bd983891f642d4139f80251f209ef81"
+SRC_URI[sha256sum] =3D "38167b49e4d1bf78fdd5c3156d411123713fd8f04b0067d4=
b1cd03742d0edfaa"
=20
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
=20
--=20
2.28.0

