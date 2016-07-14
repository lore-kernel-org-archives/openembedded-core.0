Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 91A9273169
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 16:40:28 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id t190so4998205pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 09:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=t6Sjv1VQwNfU3TLDkY3Cecwv7GTzSGlZ8Jr7yjjHxDY=;
	b=umFKXyycb/AkBbqjPkWkb2GsNGEtjaBbsLWp8u/d9Q0b46bN1bIUQI6f/8ndliUpPt
	350/TpqpoKIS1csFy4gHhRXO5Q0YcqfiK/X7p6RCvRXF8jK0F5ay1ik2nVsKJWUpk2pO
	QHEdc/D8WbgbLTGNetRy7DLfliya29ZxJV+7YTmCv50pB3qtp4N41yzGTPwqkeLrHkQC
	J+KkiDmsgw8UyTcvCli5o5T2Dyta1auo0E7/B7Ar5u+/am/1KG/wxEJQvpRPAujdhinZ
	CLv9aIKccQq7d/rcONCL5CrIZNDoVr8TB6erEw2ILOzQff+QZq7Naxp9Vl5ZNWPfQHM6
	kHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=t6Sjv1VQwNfU3TLDkY3Cecwv7GTzSGlZ8Jr7yjjHxDY=;
	b=LyAPiBbaTyihlXqp/soitpB8ZoFGagsngYHumCnJPKT330SbFCbl0z4TEZVFRBxCrW
	xfm3cYuJTWAmCA7bLZJq3J5UwmU4mR9VzeYEjURkhRWrK81B/dl1yqg8LoPyhGa8EGrk
	IDiDDp+NYLZ9LOsbD+IK+IRgn/+ZHo1w9F9a8h1MmLF32ALyHcoDUX3Y98Ozr1pp5gt8
	T1zUsPEgx+9tqyyQbXFuyC+gByRguPk4NLF5c7vrjb1ZcT+5im0eU/tPLSgb9lij4coh
	zZQhS1W6nroN6K4M5QWAkTDgnnPxaOWPHKzzBKjkV29n9CQ04XVf6sPsC/89iph8cfGx
	y41w==
X-Gm-Message-State: ALyK8tL2g5En9QWZNlQSWt1VZ6Rjj7MbOciLCQ3wqES1D0UYGmhdp3n/QkOAkTN98Ro8TQ==
X-Received: by 10.98.35.145 with SMTP id q17mr5157344pfj.42.1468514428938;
	Thu, 14 Jul 2016 09:40:28 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:ccb8:155d:1dcd:c7ec?
	([2601:646:8882:b8c:ccb8:155d:1dcd:c7ec])
	by smtp.gmail.com with ESMTPSA id
	g26sm5013983pfj.82.2016.07.14.09.40.28
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jul 2016 09:40:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1468514260-5560-1-git-send-email-ross.burton@intel.com>
Date: Thu, 14 Jul 2016 09:40:21 -0700
Message-Id: <8DF9159C-E8F9-4012-B688-D992A1E62A47@gmail.com>
References: <1468514260-5560-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glibc: use the host locale archive in nativesdk builds
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
X-List-Received-Date: Thu, 14 Jul 2016 16:40:28 -0000
X-Groupsio-MsgNum: 84505
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5EB92BB5-B4DE-4D40-AAA9-64BF8CCB7092";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5EB92BB5-B4DE-4D40-AAA9-64BF8CCB7092
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 14, 2016, at 9:37 AM, Ross Burton <ross.burton@intel.com> =
wrote:
>=20
> The nativesdk libc when used by buildtools has a hard requirement on =
supporting
> a UTF-8 locale because Python 3 needs a UTF-8 locale.  However we =
currently only
> ship the C locale, which means that Python attempts to lookup the =
user's locale
> (for example, en_NZ.UTF-8) in the locale archive under it's prefix it =
fails and
> falls back to C.  This the results in Python using ASCII instead of =
UTF-8 for
> file encoding, and bitbake breaks.
>=20
> Th obvious solution would be to ship all locales, but this would add
> approximately 250MB to the size of the buildtools tarball (which is =
currently
> around 30MB).  Generating a binary locale archive reduces this down to =
100MB,
> but this is still a drastic increase in footprint.  If we ship a =
subset of
> locales in the tarball then there will be users whose locale isn't in =
the
> tarball, and they'll have to change their locale to an "approved" one, =
which
> isn't the best of messages to send to new users.
>=20
> The alternative is to tell the nativesdk libc that the locale archive =
isn't
> under it own prefix but is in fact at /usr/lib/locale/locale-archive, =
so the
> buildtools libc uses the host locale archive. The locale archive =
format appears
> to be at least fairly stable: our glibc 2.24 can read the locale =
archive
> generated by glibc 2.17 (Centos 7).

I think this patch is good. Although, there might be issues with SDKs =
when tried
on different distros. But as long as we keep the tested distros in shape =
we are ok

>=20
> [ YOCTO #9775 ]
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-core/glibc/glibc_2.24.bb | 6 ++++++
> 1 file changed, 6 insertions(+)
>=20
> diff --git a/meta/recipes-core/glibc/glibc_2.24.bb =
b/meta/recipes-core/glibc/glibc_2.24.bb
> index 456f206..4bc6443 100644
> --- a/meta/recipes-core/glibc/glibc_2.24.bb
> +++ b/meta/recipes-core/glibc/glibc_2.24.bb
> @@ -129,6 +129,12 @@ do_compile () {
>=20
> }
>=20
> +# Use the host locale archive when built for nativesdk so that we =
don't need to
> +# ship a complete (100MB) locale set.
> +do_compile_prepend_class-nativesdk() {
> +    echo "complocaledir=3D/usr/lib/locale" >> ${S}/configparms
> +}
> +
> require glibc-package.inc
>=20
> BBCLASSEXTEND =3D "nativesdk"
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_5EB92BB5-B4DE-4D40-AAA9-64BF8CCB7092
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleHwHsACgkQuwUzVZGdMxQFNwCfdgm8UqelXwN82+XmAsmSxDJJ
hJ0An3H+d2zH/7GUoxgnpYVP0dwnm+Nk
=C0Om
-----END PGP SIGNATURE-----

--Apple-Mail=_5EB92BB5-B4DE-4D40-AAA9-64BF8CCB7092--
