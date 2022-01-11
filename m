Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0EDC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 03:04:46 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.1800.1641870284397238845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 19:04:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=xU0qdp3j;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 07E7580FDA;
	Tue, 11 Jan 2022 04:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641870281;
	bh=PUiD6ubihe0HinaBwxmZIBTNijZgNUxFsI+VN3Qx1EA=;
	h=From:To:Cc:Subject:Date:From;
	b=xU0qdp3jwLeFRwJ0iNak1CeDMzGpvWgnqvLbgrHFjzik3QmHLuZaoJOq70iU92up1
	 C3pwk7gCcxGZZVA7quoJTmCirbZhv8xcxk6oxRcNYK39ksNTlas/DMGomgJhMyPRrn
	 tc4VVVTHnDwUrTOeeHJdZmxaCSl+EoRjInFtIgbfkEm7G1DdDUMv5x0UBhpZuepuEU
	 +v704TEjzKI66ugBhgTsxpIyOSYQNhJjm9xvvgzwYvJmg/5UMzHnDSJMvqBQj9UZOq
	 xb64GD7EQEBF8dKvxeyRYfstLXniYQdA+n9qUmN+pnaGoOdGCjqOfxJ/LOwobgpVYt
	 /3Hbv5lwf3P6g==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] u-boot: upgrade 2021.10 -> 2022.01
Date: Tue, 11 Jan 2022 04:04:22 +0100
Message-Id: <20220111030422.114638-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 03:04:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160384

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2021.10.bb =3D> u-boot-tools_2022.01.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2021.10.bb =3D> u-boot_2022.01.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2021.10.bb =3D> u-boot-tool=
s_2022.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2021.10.bb =3D> u-boot_2022.01.bb=
} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp=
/u-boot/u-boot-common.inc
index 5a3fc17ad1..c09b1c2876 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE =3D "1"
=20
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV =3D "d80bb749fab53da72c4a0e09b8c2d2aaa3103c91"
+SRCREV =3D "d637294e264adfeb29f390dfc393106fd4d41b17"
=20
 SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2021.10.bb b/meta/recip=
es-bsp/u-boot/u-boot-tools_2022.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2021.10.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2022.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2021.10.bb b/meta/recipes-bsp=
/u-boot/u-boot_2022.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2021.10.bb
rename to meta/recipes-bsp/u-boot/u-boot_2022.01.bb
--=20
2.34.1


