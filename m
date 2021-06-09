Received: from bahamut.mc.pp.se (bahamut.mc.pp.se [213.115.244.39])
 by mx.groups.io with SMTP id smtpd.web08.276.1623268326466626752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 12:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mc.pp.se header.s=hedgehog header.b=hrrYnatp;
 spf=pass (domain: mc.pp.se, ip: 213.115.244.39, mailfrom: marcus@mc.pp.se)
Received: from hakua (hakua [192.168.42.40])
	by bahamut.mc.pp.se (Postfix) with SMTP id A9C8FA3D41;
	Wed,  9 Jun 2021 21:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mc.pp.se; s=hedgehog;
	t=1623268323; bh=VJs8U6U4M4I7oiGPWrDJDH0S9gjAfbrIvzd7zq1REUg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding; b=hrrYnatpORxgh8LspwkMpGX0F99HUMZBlBb43
	Vkg1JoB4jy8Hb/n4/DdfVZfaVXgLhES25ZYFVQsLKmxIuu8fPsZioi2w2mjFDhwEZWI
	BxIpq8yJXjstf05P523tm/cA96iVmw0kO+iigPuFQa+SYeY5W3FD2IsQzsjjniLOrKo
	=
Received: by hakua (sSMTP sendmail emulation); Wed, 09 Jun 2021 21:52:02 +0200
From: "Marcus Comstedt" <marcus@mc.pp.se>
To: openembedded-core@lists.openembedded.org
Cc: Marcus Comstedt <marcus@mc.pp.se>
Subject: [PATCH] conf/machine-sdk: Add ppc64 SDK machine
Date: Wed,  9 Jun 2021 21:50:56 +0200
Message-Id: <20210609195055.28099-1-marcus@mc.pp.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Marcus Comstedt <marcus@mc.pp.se>
---

I was able to work around the lack of this file by putting

SDKMACHINE =3D ""
SDK_ARCH =3D "${BUILD_ARCH}"

into local.conf, but it seems to me that should not be necessary.

Thanks

  // Marcus


 meta/conf/machine-sdk/ppc64.conf | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta/conf/machine-sdk/ppc64.conf

diff --git a/meta/conf/machine-sdk/ppc64.conf b/meta/conf/machine-sdk/ppc=
64.conf
new file mode 100644
index 0000000000..1eb064eef0
--- /dev/null
+++ b/meta/conf/machine-sdk/ppc64.conf
@@ -0,0 +1,2 @@
+SDK_ARCH =3D "ppc64"
+ABIEXTENSION_class-nativesdk =3D ""
--=20
2.31.1

