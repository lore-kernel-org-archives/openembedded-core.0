Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.14889.1625854540057324756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 11:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=v3VWcqja;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EECBA8323F;
	Fri,  9 Jul 2021 20:15:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1625854537;
	bh=Iv+9g05rBUwzRNDmIsvA5Y0nWWp7MPUViJ095UFVe/I=;
	h=From:To:Cc:Subject:Date:From;
	b=v3VWcqjaUMtT4UarMeakHs/bJESpM5JLzAQ78vOfes3RvnaCo5NE2RCwM5NHojOTg
	 8CnaH5jo2Z7oLGAIbdcJSQZmL6nPc4xw0QO7zYsbRuHNz0u5qGmKMweStWOP1Vd8vb
	 vziIwBo3Tu8ihA0Y/dcN29XX0z1hYZ9TNj+kOEAI/PluB29V2+++ss70ZDrGQ4WC6f
	 kHrZR0DXygwh5F1v4JDd9IvyvSdO8pwAwaQ8i63eeYUF4qgI91fT3A5FL5nogAwxi5
	 Ov+t4z97kgNfijYiw4xEOHi+Ihfs4WGexILYQ+d2D71ck/mjuT3ZuG20ni9L/LRwuB
	 ajXuVeY5pV7Kw==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Changqing Li <changqing.li@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] update-rc.d: update SRCREV to pull in fix for non-bash shell support
Date: Fri,  9 Jul 2021 20:15:20 +0200
Message-Id: <20210709181520.62938-1-marex@denx.de>
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

