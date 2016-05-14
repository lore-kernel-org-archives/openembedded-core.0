Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3FBD260851
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 May 2016 01:03:19 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 145so10510059pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 18:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=e1gxlYGW3q4Zgo31ZoH+SYojPTtUxJORhr5llH71ojA=;
	b=A7cfh95Yyq8Pl6juyo2nFa75HTtsrKUA5mUjGLQ/fkiV5LWRkAJlDKUwjWQjobT2MV
	ij8khg7GgferKwuXwnutOTCduJBzhv8XAl5Ywq+Hyaa2Utv10UqgA7a/Z0NEZ5arD2Nd
	N2hOhfNUABC3/3AX4TvB9tQSMMifqTxoe8CaGvdKDj4+e+fNROWFVaCeuRAtxW7iGBEs
	96rvY8NkT8CEn7+auu6xugaG+SVQJX/Q8lhFTpjpsVkNfe89/8wkDwdxtKuw040ibMs3
	a39Yr/80fC5A7hNhkbOI5QFnj3r4iyOm3bi3tImmNfgnjJNN5P0dCSfqAwaHFOZhn07q
	XW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=e1gxlYGW3q4Zgo31ZoH+SYojPTtUxJORhr5llH71ojA=;
	b=Zu9+0KyBzdzzv4NK8N2OuslKyKXEECXGycS0afo5yLcprlTTki64v4lZcyULvRNyTM
	m1aGctGshg3eY9wPDfTk/feuirtp5ZIjkydbDAcZb3bmXkP0l75zaX8bjq6U79RjFiAZ
	gSvU1jFcY3KLZQ+jCfmUZD+WHK9rWeYUvmqH8XxPtqd2Qmi8Zm3UF7wtBc2BesR5pN1V
	oPmizs5UCRklTEcp8QOyb/h/PfLJVZoFLklXoe8aTDpNbANR/9DtQjnCwdwO+0hmrzbE
	mjkk6u06zInXvms7g4vLxPw4dk8McY+4piSjXXhguUNsT0ejqmxDYX8clBeSUplp4lII
	Bpog==
X-Gm-Message-State: AOPr4FWxgzUf6M0xVXHHEN/j9srCUq2+w4lV+/m6K7s9HbJoDmiicaEqZrw1RP1DrJ5aLQ==
X-Received: by 10.98.100.71 with SMTP id y68mr27524093pfb.84.1463187800662;
	Fri, 13 May 2016 18:03:20 -0700 (PDT)
Received: from ?IPv6:2601:641:c001:6120:a892:19b5:540a:b5a8?
	([2601:641:c001:6120:a892:19b5:540a:b5a8])
	by smtp.gmail.com with ESMTPSA id
	o7sm30115689pfb.76.2016.05.13.18.03.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2016 18:03:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1462896289-15644-2-git-send-email-danismostlikely@gmail.com>
Date: Fri, 13 May 2016 18:03:19 -0700
Message-Id: <B23209CC-2F78-48A8-B6CA-37DFD5B27BCE@gmail.com>
References: <1462896289-15644-1-git-send-email-danismostlikely@gmail.com>
	<1462896289-15644-2-git-send-email-danismostlikely@gmail.com>
To: danismostlikely@gmail.com
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][krogoth][PATCH 3/5] openjade-native: work around bug exposed by GCC 6
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
X-List-Received-Date: Sat, 14 May 2016 01:03:20 -0000
X-Groupsio-MsgNum: 82100
Content-Type: multipart/signed;
	boundary="Apple-Mail=_41FFA24F-923D-41F2-A58F-303C898A3D24";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_41FFA24F-923D-41F2-A58F-303C898A3D24
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 10, 2016, at 9:04 AM, danismostlikely@gmail.com wrote:
>=20
> From: Dan McGregor <danismostlikely@gmail.com>
>=20
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>=20
> Simply turn off the optimzation that is causing this breakage. I had
> originally used -fno-lifetime-dse, but -fno-tree-dse works at least
> going back as far as gcc 4.8.
>=20
> This isn't a real fix, but it allows openjade to work enough to =
complete
> a build.

would be good to add a comment on where its discussed e.g.

https://bugzilla.redhat.com/show_bug.cgi?id=3D1306162
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D69534

>=20
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
> meta/recipes-devtools/openjade/openjade-native_1.3.2.bb | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb =
b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> index bc25008..afcb8ca 100644
> --- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> +++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> @@ -44,6 +44,7 @@ CONFIGUREOPTS :=3D "${@d.getVar('CONFIGUREOPTS', =
True).replace('--datadir=3D${datadi
> oe_runconf[vardepsexclude] +=3D "CONFIGUREOPTS"
>=20
> CFLAGS =3D+ "-I${S}/include"
> +CXXFLAGS +=3D "-fno-tree-dse"
>=20
> SSTATEPOSTINSTFUNCS +=3D "openjade_sstate_postinst"
> SYSROOT_PREPROCESS_FUNCS +=3D "openjade_sysroot_preprocess"
> --
> 2.8.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_41FFA24F-923D-41F2-A58F-303C898A3D24
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc2eVsACgkQuwUzVZGdMxQduACfbz36WgAP/cw3PIaGjl0vZ2z1
+lYAoJL97+5cLgmwf84b7plzVhq2Z5Ga
=QEpH
-----END PGP SIGNATURE-----

--Apple-Mail=_41FFA24F-923D-41F2-A58F-303C898A3D24--
