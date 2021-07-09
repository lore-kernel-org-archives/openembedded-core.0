Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.14908.1625854601624377641
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=Y2x56BEg;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 80B758323F;
	Fri,  9 Jul 2021 20:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1625854600;
	bh=10wQePubbF2QluMuxPrK/bm0UC4EhiYpcqTRnGUga60=;
	h=From:To:Cc:Subject:Date:From;
	b=Y2x56BEg1FKzid8Udswxkh4dhkTkyoW0xHlojYry+i8YBoxj5aIWF/qWU1dOZ/r4c
	 +r12uafx0r9sTfmY1tNuhLthuxq/OaPHwDYkiftsvojh5hadrUOGY45A40oyYGALO0
	 yJ2XEUfPUeAWWrlk+KW/oxpstbXRjbHI1Zaqivat3krKWjmGef/RKSM0YyTzjMn6Gr
	 WPdGRs7BRHgE8vlDzzxvG+JHSy0qXG/pEMN0zGserNDUTrYepwj0iyYmmYZ3QIsAfH
	 4iz4XmK0cGcTISsxHbVsnYAe8g8rCTqfk2D0Qm2m1GPHbMEavHUSwPM8pIDRkCmLmP
	 NmNhkj+/XbXzg==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Changqing Li <changqing.li@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>
Subject: [PATCH][dunfell] update-rc.d: update SRCREV to pull in fix for non-bash shell support
Date: Fri,  9 Jul 2021 20:16:30 +0200
Message-Id: <20210709181630.63081-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

This pulls in non-bash shell fix for enable/disable command, upstream
commit 8636cf4 ("update-rc.d: Fix enable/disable command"). This way
update-rc.d works with e.g. dash shell again.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Changqing Li <changqing.li@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/reci=
pes-core/update-rc.d/update-rc.d_0.8.bb
index 75632d9434..da716674c3 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -7,7 +7,7 @@ LICENSE =3D "GPLv2+"
 LIC_FILES_CHKSUM =3D "file://update-rc.d;beginline=3D5;endline=3D15;md5=3D=
d40a07c27f535425934bb5001f2037d9"
=20
 SRC_URI =3D "git://git.yoctoproject.org/update-rc.d"
-SRCREV =3D "4b150b25b38de688d25cde2b2d22c268ed65a748"
+SRCREV =3D "8636cf478d426b568c1be11dbd9346f67e03adac"
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
--=20
2.30.2

