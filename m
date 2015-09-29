Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id F0C447703D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 17:12:20 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so11782861pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=DDPm4F/Bzg7exHlTfY3od3A31PzgvstwVAhNlalg9Sw=;
	b=uBQPEBr0wW8oe8mYfQNmn/qHbstZbBwLTW2s6oAVgqn4AySY/YzTX5ilj83EzGlbZp
	anhEmk6tqkmTjXXOzE1qVA34RVtm9ePLeSfZHA3ZtUQB8xLvI/GAs/SgAH0M7tjYJ7o1
	+Xoi5xZTbcBsXP9iVNmOs3fao37osj7acWf4Jaj3BUc/NMEcudZBeSwln1lcAImvEaXn
	CPDqYZZ0TZabAHrd1TYNp540U11TDI2cfmIbBfftIUfOQa0zfa12n22YVIPw+04qMSJn
	clHB+/B1kJrDNRFGFdObg5ETtevIurgvToaQ6RbNJsJRlhGp9378bxjbsPMwfElwfjCJ
	TiVA==
X-Received: by 10.66.139.138 with SMTP id qy10mr5294289pab.97.1443546741238;
	Tue, 29 Sep 2015 10:12:21 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f90b:6fa0:21f7:85bc?
	([2601:646:8601:4580:f90b:6fa0:21f7:85bc])
	by smtp.gmail.com with ESMTPSA id
	g5sm26793637pat.21.2015.09.29.10.12.20
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Sep 2015 10:12:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1443533187.5162.34.camel@linuxfoundation.org>
Date: Tue, 29 Sep 2015 10:12:19 -0700
Message-Id: <350A363C-E3A9-4ED3-BCE9-83623AC94092@gmail.com>
References: <1443533187.5162.34.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3094)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] prelink: Allow it to work on 64 bit binaries in /lib
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
X-List-Received-Date: Tue, 29 Sep 2015 17:12:26 -0000
X-Groupsio-MsgNum: 71753
Content-Type: multipart/signed;
	boundary="Apple-Mail=_73D1608E-AF6A-4E6F-8234-F3C8451F7445";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_73D1608E-AF6A-4E6F-8234-F3C8451F7445
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 29, 2015, at 6:26 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> Checks within prelink force 64 bit binaries into lib64 and n32 =
binaries
> into lib32. We load prelink.conf with all combinations but this code
> then defeats it for us and means /lib is ignored.
>=20
> Comment out this code to disable it and allow our settings to work. =
This
> allows 64 bit binaries in /lib to work. We pass in the correct =
dyanamic
> loader path anyhow and our binaries don't contain ld.so so this should
> be safe for us.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/recipes-devtools/prelink/prelink/64bitfix.patch =
b/meta/recipes-devtools/prelink/prelink/64bitfix.patch
> new file mode 100644
> index 0000000..74b1a7d
> --- /dev/null
> +++ b/meta/recipes-devtools/prelink/prelink/64bitfix.patch
> @@ -0,0 +1,35 @@
> +These checks force 64 bit binaries into lib64 and n32 binaries into =
lib32. We
> +load prelink.conf with all combinations but this code then defeats it =
for us
> +and means /lib is ignored.
> +
> +Comment out this code to disable it and allow our settings to work. =
This
> +allows 64 bit binaries in /lib to work. We pass in the correct =
dyanamic
> +loader path anyhow and our binaries don't contain ld.so so this =
should be
> +safe for us.
> +
> +Upstream-Status: Inappropriate
> +RP 2015/9/23
> +
> +
> +Index: trunk/src/rtld/rtld.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- trunk.orig/src/rtld/rtld.c
> ++++ trunk/src/rtld/rtld.c
> +@@ -334,7 +334,7 @@ load_ld_so_conf (int use_64bit, int use_
> +
> +   /* Only use the correct machine, to prevent mismatches if we
> +      have both /lib/ld.so and /lib64/ld.so on x86-64.  */
> +-  if (use_64bit)
> ++  /*if (use_64bit)

may be it would be good to use it as fallback if nothing comes out of =
prelink.conf
such a patch would be acceptable upstream too.

> +     {
> +       dst_LIB =3D "lib64";
> +       add_dir (&ld_dirs, "/lib64/tls", strlen ("/lib64/tls"));
> +@@ -350,7 +350,7 @@ load_ld_so_conf (int use_64bit, int use_
> +       add_dir (&ld_dirs, "/usr/lib32/tls", strlen =
("/usr/lib32/tls"));
> +       add_dir (&ld_dirs, "/usr/lib32", strlen ("/usr/lib32"));
> +     }
> +-  else
> ++  else*/
> +     {
> +       dst_LIB =3D "lib";
> +       add_dir (&ld_dirs, "/lib/tls", strlen ("/lib/tls"));
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb =
b/meta/recipes-devtools/prelink/prelink_git.bb
> index 79a5f501..0cbce36 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -27,6 +27,7 @@ FILES_${PN}-cron =3D "${sysconfdir}/cron.daily =
${sysconfdir}/default"
> PACKAGES =3D+ "${PN}-cron"
>=20
> SRC_URI =3D =
"git://git.yoctoproject.org/prelink-cross.git;branch=3Dcross_prelink \
> +           file://64bitfix.patch \
>            file://prelink.conf \
>            file://prelink.cron.daily \
>            file://prelink.default \
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_73D1608E-AF6A-4E6F-8234-F3C8451F7445
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYKxnMACgkQuwUzVZGdMxRs2QCfS/qL6vqU7jfdRF8q7pwvD0/S
e2sAn0PcnBSEyeNxCTNNQSi7GG5Clipb
=ltFX
-----END PGP SIGNATURE-----

--Apple-Mail=_73D1608E-AF6A-4E6F-8234-F3C8451F7445--
