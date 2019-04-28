Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8A83A7D416
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Apr 2019 09:38:59 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 26so9745662wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Apr 2019 02:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=mxckAnfFkI9f6Yxx1BmSL06/mmCpKYsEFWbPJhnCc3c=;
	b=r7nUFpSPhhyKnGqJMJDDStnOkNYoJegcufsbD+F5x6jtG3f5yx96K6PtMEw5zDn/SN
	n3krEKq7HMhTVCZP3Ip79CdZzdW+sVFak4ymYryIcXe03am4El6Lx2CcjiAWS2hBqLle
	u5Wt4aOEoJl9I1Kl7himf/2tdsAMih0+Uq7xDHQbdIFiTDN4DJWTivfj4vrmPLqHiawx
	EF6jumO3IkczIgK1u3ox8DTUyN6Qkwz6NpT3MemT1al3exGLopKWu/Dh+MkZ1z3yO+He
	7iOWT0mkI+g/9DK4nDJj0I6cjzeqIKPNxE6eeBFkEl5nvmXvRX/Tc2dBsuFBOwIedlGh
	1q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=mxckAnfFkI9f6Yxx1BmSL06/mmCpKYsEFWbPJhnCc3c=;
	b=QxHA3LUtjDYzIARCyBrNQPAgIavwhL7rrl6twPJ2C1uhOPhrT6/j2Y8op6c7w/wd6X
	kD0tEFq4Aw/dMlXCvRUGQ8ILdZibkPR01Hg8JmZd9aupVrmoo3PaAeylA9pK3mMSa014
	c9spqIhyk1GPHZIxzLodUYxDyOBmyDwVv7QRgZg03T2fgskvkRAuRT7R3nLN2JXS7ynk
	qU+6LGH5jGicQ+OhkLyHpnXoq+6JXm1puD2/iU0AClXgC0Vknj954Jr3XuiFUxn9kyEY
	li14ZuaLJ/+hOkHQGl/4nDcwffQOBbF76Zrh8ytcYyfdKgbfcZvkcLS2Dip0O/6V3dUi
	iW8g==
X-Gm-Message-State: APjAAAU5EFBemtBlNYyhN+YUFZyyuU6DI6RkJbOhxum5iBOa+BCeGw6V
	jn49DLReQIUWNE8ixTfl0IU=
X-Google-Smtp-Source: APXvYqwVqpvR4eRoJAmhASHB801UY4hDmPcmvenC5W7aujMt8Eyg3FXLGkYoyaL675SZGuyxXI2sHA==
X-Received: by 2002:a1c:e085:: with SMTP id x127mr13707471wmg.87.1556444340309;
	Sun, 28 Apr 2019 02:39:00 -0700 (PDT)
Received: from ?IPv6:2a02:8109:b5c0:1267:3809:5f50:accd:2e8f?
	([2a02:8109:b5c0:1267:3809:5f50:accd:2e8f])
	by smtp.gmail.com with ESMTPSA id
	d16sm11514087wra.54.2019.04.28.02.38.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Apr 2019 02:38:59 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <1556434971-251075-1-git-send-email-mingli.yu@windriver.com>
Date: Sun, 28 Apr 2019 11:38:58 +0200
Message-Id: <E278AA1B-9805-4539-9572-1D55212BC2D3@gmail.com>
References: <1556434683-140874-1-git-send-email-mingli.yu@windriver.com>
	<1556434971-251075-1-git-send-email-mingli.yu@windriver.com>
To: mingli.yu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bjam-native: do not search all PATHs variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Apr 2019 09:38:59 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Wait, why is this a problem for specifically bjam, but not the other tools t=
hat also look into PATH? Shouldn=E2=80=99t you fix the nfs instead?

Alex

> On 28 Apr 2019, at 9.02, <mingli.yu@windriver.com> <mingli.yu@windriver.co=
m> wrote:
>=20
> From: Li Wang <li.wang@windriver.com>
>=20
> By default, it searches all paths specified by $PATH.
>=20
> But if the directory of the $PATH variable on
> build host includes nfs(build host as nfs client),
> it causes the build hung when the nfs server is
> unavailable.
>=20
> Signed-off-by: Li Wang <li.wang@windriver.com>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
> meta/recipes-support/boost/bjam-native_1.69.0.bb   |  1 +
> .../bjam-do-not-search-all-PATHs-varibale.patch    | 53 ++++++++++++++++++=
++++
> 2 files changed, 54 insertions(+)
> create mode 100644 meta/recipes-support/boost/files/bjam-do-not-search-all=
-PATHs-varibale.patch
>=20
> diff --git a/meta/recipes-support/boost/bjam-native_1.69.0.bb b/meta/recip=
es-support/boost/bjam-native_1.69.0.bb
> index 94f96e6..395ad34 100644
> --- a/meta/recipes-support/boost/bjam-native_1.69.0.bb
> +++ b/meta/recipes-support/boost/bjam-native_1.69.0.bb
> @@ -6,6 +6,7 @@ SECTION =3D "devel"
> inherit native
>=20
> SRC_URI +=3D "file://bjam-native-build-bjam.debug.patch \
> +            file://bjam-do-not-search-all-PATHs-varibale.patch \
> "
>=20
> do_compile() {
> diff --git a/meta/recipes-support/boost/files/bjam-do-not-search-all-PATHs=
-varibale.patch b/meta/recipes-support/boost/files/bjam-do-not-search-all-PA=
THs-varibale.patch
> new file mode 100644
> index 0000000..742603a
> --- /dev/null
> +++ b/meta/recipes-support/boost/files/bjam-do-not-search-all-PATHs-variba=
le.patch
> @@ -0,0 +1,53 @@
> +bjam: do not search all PATHs varibale
> +
> +By default, it searches all paths specified by $PATH.
> +But if the directory of the $PATH variable on
> +build host includes nfs, it causes system hung
> +when nfs server is unavailable.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Li Wang <li.wang@windriver.com>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + tools/build/src/engine/build.jam | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/tools/build/src/engine/build.jam b/tools/build/src/engine/bu=
ild.jam
> +index a92b70f..f866619 100644
> +--- a/tools/build/src/engine/build.jam
> ++++ b/tools/build/src/engine/build.jam
> +@@ -781,8 +781,8 @@ if $(OS) =3D NT
> + }
> + SUFEXE ?=3D "" ;
> +=20
> +-yacc ?=3D [ GLOB $(PATH) : yacc$(SUFEXE) ] ;
> +-yacc ?=3D [ GLOB $(PATH) : bison$(SUFEXE) ] ;
> ++yacc ?=3D [ GLOB "" : yacc$(SUFEXE) ] ;
> ++yacc ?=3D [ GLOB "" : bison$(SUFEXE) ] ;
> + yacc ?=3D [ GLOB "$(ProgramFiles:J=3D )\\GnuWin32\\bin"
> +     "C:\\Program Files\\GnuWin32\\bin" : bison$(SUFEXE) ] ;
> + yacc =3D $(yacc[1]) ;
> +@@ -966,7 +966,7 @@ if $(OS) =3D NT
> + }
> + if $(UNIX) =3D true
> + {
> +-    tar ?=3D [ GLOB $(PATH) : star bsdtar tar ] ;
> ++    tar ?=3D [ GLOB "" : star bsdtar tar ] ;
> +     tar =3D $(tar[1]) ;
> +     switch $(tar:D=3D:S=3D)
> +     {
> +@@ -1047,8 +1047,8 @@ rule .package ( dst-dir : src-files + )
> + }
> +=20
> + # RPM distro file.
> +-rpm-tool =3D [ GLOB $(PATH) : "rpmbuild" ] ;
> +-rpm-tool ?=3D [ GLOB $(PATH) : "rpm" ] ;
> ++rpm-tool =3D [ GLOB "" : "rpmbuild" ] ;
> ++rpm-tool ?=3D [ GLOB "" : "rpm" ] ;
> + rpm-tool =3D $(rpm-tool[1]) ;
> + rule .rpm ( name : source )
> + {
> +--=20
> +2.18.1
> +
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

