Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4637670E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 03:35:01 +0000 (UTC)
Received: by pacrr5 with SMTP id rr5so42155791pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 20:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=IzP64r4ucg3tKnLifRDpJVOwXx9eMudCMhTtVzN6SJw=;
	b=jCVGgcCTZtTIOYieUv2S6dFGhuEJRqVyWxBv2k3voxT+SgzN3H0DNsOK//jS9FMME+
	riegRArGUeUYZjjoHlUbhqfCC7Lv0fkpbHeUGp2jT1SDVPUTXQT5aiiyQ+KlcEi7T0Q4
	4ahAakJDKJKE4t7YTGZvk28uQ1xGPSNYQpUExkioAs4ROjKgjQH1O9QqlMbCg54Zur4X
	4cPUak2V1/t2KCS4ZYcQxbR9BTXLy0d3tx14F9r4+LcS3g4JiaYWReNrx8pRFuLRoJUw
	t//zOYjPzWzsC8lkiZwUGv8bbRX8TIxlX2St7FZVBU9OHLsXufEv63mVEs/RW8l9iLTO
	+AwA==
X-Received: by 10.68.244.137 with SMTP id xg9mr10102280pbc.27.1438918501840;
	Thu, 06 Aug 2015 20:35:01 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:bc52:c673:225f:3d8b?
	([2601:646:8601:4580:bc52:c673:225f:3d8b])
	by smtp.gmail.com with ESMTPSA id
	da6sm1142084pdb.22.2015.08.06.20.34.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Aug 2015 20:35:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <29f1e0392fbe4325b13dac7e0fca69319825da76.1438849692.git.jussi.kukkonen@intel.com>
Date: Thu, 6 Aug 2015 20:34:54 -0700
Message-Id: <43BA4AA7-911B-4F0E-8910-1A289F0D4240@gmail.com>
References: <2c93029d78af982ced18f114b4ed6e09ef350b00.1438849692.git.jussi.kukkonen@intel.com>
	<cover.1438849692.git.jussi.kukkonen@intel.com>
	<29f1e0392fbe4325b13dac7e0fca69319825da76.1438849692.git.jussi.kukkonen@intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] vte: Fix LICENSE to LGPL2.0
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
X-List-Received-Date: Fri, 07 Aug 2015 03:35:02 -0000
X-Groupsio-MsgNum: 69081
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C17E49FE-F322-47E1-8642-38FE5439C229";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C17E49FE-F322-47E1-8642-38FE5439C229
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 6, 2015, at 1:42 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> =
wrote:
>=20
> Current releases of vte are LGPL 2.1+ but the one we have is still
> LGPL 2.0.
>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
> meta/recipes-support/vte/vte.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/vte/vte.inc =
b/meta/recipes-support/vte/vte.inc
> index 4081a7f..874062a 100644
> --- a/meta/recipes-support/vte/vte.inc
> +++ b/meta/recipes-support/vte/vte.inc
> @@ -1,6 +1,6 @@
> SUMMARY =3D "Virtual terminal emulator GTK+ widget library"
> BUGTRACKER =3D "https://bugzilla.gnome.org/buglist.cgi?product=3Dvte"
> -LICENSE =3D "LGPLv2.1+"
> +LICENSE =3D =E2=80=9CLGPLv2.0"

this brings to notice that this recipe needs upgrade
latest vte srcs already use LGPL2.1 may be updating to latest version is =
0.40
http://ftp.gnome.org/pub/gnome/sources/vte/0.40/

> DEPENDS =3D " glib-2.0 gtk+ intltool-native ncurses =
gobject-introspection-stub"
> RDEPENDS_libvte =3D "vte-termcap"
>=20
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_C17E49FE-F322-47E1-8642-38FE5439C229
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXEJ2IACgkQuwUzVZGdMxTM9QCfZoFKMJcZhLXwG0S9DaL5F53G
aeMAnjcCqAuUm0ue9TJcoA0juM/QQvwx
=oDra
-----END PGP SIGNATURE-----

--Apple-Mail=_C17E49FE-F322-47E1-8642-38FE5439C229--
