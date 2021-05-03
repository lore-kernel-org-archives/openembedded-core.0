Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.32219.1620041623838669312
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 04:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=u+64I+Fa;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: sbabic@denx.de)
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: noc@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E1992824AD
	for <openembedded-core@lists.openembedded.org>; Mon,  3 May 2021 13:33:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1620041620;
	bh=kbJtmMAqO7TdddzhqCYPENGUiqBH3GyRTosObcAIq+c=;
	h=From:To:Cc:Subject:Date:From;
	b=u+64I+FaY3w8HYt4IO1Ew8CU54tZTcqIG+yQ83e9yAgF9HoaKVSo9SIL8PY+eeC90
	 +QEgDv7u8b55O0ZF0We7Poz5Xlk3LWowsq9y+zHOg2H8TOxvfn+2aqqcWirJh0PMlg
	 MsLDJr6p2djQk9C+4Wtc0oWyR9aDkXuYDCHX8nhLMBNwNEGMCJx923hn7mOatN9wYZ
	 BYv/PJeWD733sx7QuGiHA0VaTEoWbdGt22WY5rkBdEy5XU5gcRaZUsLLEWjxyVQhmH
	 n+0Z4sNo4cgstp09vTMm/XXiwvlyKHLHLSIoLO0x+PoeIXk//zlL6AQ7lG4Gl6wUsB
	 NrfOT/Y8Vj0QA==
Received: from pollux.denx.de (pollux [192.168.1.1])
	by mail-internal.denx.de (Postfix) with ESMTP id CA6A9181A45
	for <openembedded-core@lists.openembedded.org>; Mon,  3 May 2021 13:33:36 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 531)
	id 9EE821A8BAF; Mon,  3 May 2021 13:33:36 +0200 (CEST)
From: "Stefano Babic" <sbabic@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Babic <sbabic@denx.de>
Subject: [PATCH] libubootenv: upgrade 0.3.1 -> 0.3.2
Date: Mon,  3 May 2021 13:33:34 +0200
Message-Id: <20210503113334.1143865-1-sbabic@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

This is a bugfix release which includes the following changes:

f4ab25d shared library: Link against zlib
e663439 Always fsync file writes
80b7f31 Treat '=3D' as an illegal character in variable names
950f541 libuboot_env: fix calculation of usable envsize
fb88032 Correct initialisations in libuboot_configure
20d1ec7 Force writing of environment if default is used
5ca11bd libuboot_env: correct length to usable env size length
cd4a8f1 libuboot_env_store: fix env double-null termination
9510164 uboot_env: fix infinite loop on short read (EOF)

Signed-off-by: Stefano Babic <sbabic@denx.de>
---
 .../u-boot/{libubootenv_0.3.1.bb =3D> libubootenv_0.3.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.1.bb =3D> libubootenv_0.=
3.2.bb} (94%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb b/meta/recipes-=
bsp/u-boot/libubootenv_0.3.2.bb
similarity index 94%
rename from meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
index 613e3161fb..2cf87c794e 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://Licenses/lgpl-2.1.txt;md5=3D=
4fbd65380cdd255951079008b36
 SECTION =3D "libs"
=20
 SRC_URI =3D "git://github.com/sbabic/libubootenv;protocol=3Dhttps"
-SRCREV =3D "824551ac77bab1d0f7ae34d7a7c77b155240e754"
+SRCREV =3D "ba7564f5006d09bec51058cf4f5ac90d4dc18b3c"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.25.1

