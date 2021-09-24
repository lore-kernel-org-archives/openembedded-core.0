Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.1873.1632444039056102323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 17:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=VpS+T45v;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 979EF833CD;
	Fri, 24 Sep 2021 02:40:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1632444036;
	bh=/+sdo7wdyuS+Mf4luyR+XUnTwAtYno+0+1Fwmi+KJIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VpS+T45vsSqOjOsfY1AYOburDhQnFJfWdJrkZ18/yVMQn8CdfJFplaz/uYnZMC8FI
	 ex7ALSbKzRWw1Pc2xJvvXqVKFsa4ELwAToQP9lJzLtXM7ykY0kunySqYVxVbszGgEG
	 S4SSfyPsvRy/i1dhtV6t5s3Zvsn1jd/buUAG5EsFLXnKRpOJqFcCQQxBGi2cF/ESlr
	 vDOW0jpu62gnPFaEyIYaDLS8Nv76LuWWN3HyQ/5b6DbqA74ZxMglxLnvrg0atWfiIm
	 h3S7LufD27squ01SsgyveLHPAMbvhcs6AGaw86iiXS8acANbUD1sNwZDce6H3CykVw
	 M+3+E62MAteIg==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Stefano Babic <sbabic@denx.de>,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/2] mtd-utils: upgrade 2.1.2 -> 2.1.3
Date: Fri, 24 Sep 2021 02:40:20 +0200
Message-Id: <20210924004020.413105-2-marex@denx.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924004020.413105-1-marex@denx.de>
References: <20210924004020.413105-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

From: Stefano Babic <sbabic@denx.de>

Drop also --enable-install-tests from configuration options because this
was removed in 2.1.3.

(cherry picked from commit c95c852b84f02f5e2ad5c575ab683bba0471f221)
Signed-off-by: Stefano Babic <sbabic@denx.de>
CC: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-de=
vtools/mtd/mtd-utils_git.bb
index 55f05dc8f9..d8355bbad3 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,17 +11,15 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS =3D "zlib e2fsprogs util-linux"
 RDEPENDS_mtd-utils-tests +=3D "bash"
=20
-PV =3D "2.1.2"
+PV =3D "2.1.3"
=20
-SRCREV =3D "7b986779342021bda87c04da3bf729718736d8ab"
+SRCREV =3D "42ea7cd48d2b3c306d59bb6c530d79f8c25bf9f5"
 SRC_URI =3D "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            "
=20
 S =3D "${WORKDIR}/git/"
=20
-EXTRA_OECONF +=3D "--enable-install-tests"
-
 # xattr support creates an additional compile-time dependency on acl bec=
ause
 # the sys/acl.h header is needed. libacl is not needed and thus enabling=
 xattr
 # regardless whether acl is enabled or disabled in the distro should be =
okay.
--=20
2.33.0

