Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4F06FFC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 21:11:49 +0000 (UTC)
Received: by pfv76 with SMTP id 76so1135324pfv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Xd2aPdEW3LrO4Rq/2w6U5qScJ2BE+SBpe97appuE4JI=;
	b=ELGvH3qvawKcHEnBQU0Dw8Ed0JfZKeu57gDbAC8QydhFH8Pj7x5J+BeeOOpfmjDI4A
	MVgFcniW8OzVJMcU+3xX8Y+sKj8zX6iUgVxtS1Nkte6KK+ZHLpxPXczESbifUkpzfrUm
	aguoKVi5AriYuVH++T2algv6tCAA6522z9KyUUGam9/4X/mKNQWWNqG/JUxzRQamHsAa
	5OpAuGVMrjYSW1VCeb5kUlkrtdU+45q42sVgKypDsmIQInB+CDEqnvUbkXbKoxzwG/wY
	0uWz/ImKoCGDTwQ0dfCQIa4QzGWf86gcwH85XvUlwjZbocVek+9+75mGNP080vblAErW
	5A1g==
X-Received: by 10.98.79.206 with SMTP id f75mr10175082pfj.24.1449781910778;
	Thu, 10 Dec 2015 13:11:50 -0800 (PST)
Received: from ?IPv6:2601:647:4c02:370d:8808:cc68:7cdd:e1d?
	([2601:647:4c02:370d:8808:cc68:7cdd:e1d])
	by smtp.gmail.com with ESMTPSA id 1sm20428188pfc.3.2015.12.10.13.11.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Dec 2015 13:11:49 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <12d049af4428da8cac1638636b8f655eca44d48d.1449754344.git.Martin.Jansa@gmail.com>
Date: Thu, 10 Dec 2015 13:11:44 -0800
Message-Id: <FEE7EF40-0110-4F2B-9A24-FF9C48E6DFFC@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
	<cover.1449754344.git.Martin.Jansa@gmail.com>
	<12d049af4428da8cac1638636b8f655eca44d48d.1449754344.git.Martin.Jansa@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][master][RESEND 01/15] sanity.bbclass: add more information to error message about TUNE_PKGARCH missing in PACKAGE_ARCHS
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
X-List-Received-Date: Thu, 10 Dec 2015 21:11:51 -0000
X-Groupsio-MsgNum: 74624
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BF5AB789-FD67-4642-8C45-E0FA075914B4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BF5AB789-FD67-4642-8C45-E0FA075914B4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 10, 2015, at 5:48 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> * sometimes it's hard to see whots wrong here

typo 'whats'

> * error message:
>  Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH =
(cortexa7t2hfhf-vfp-vfpv4-neon).
>  doesn't help much to understand what exactly went wrong and where
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> meta/classes/sanity.bbclass | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index ad9dda8..9f35558 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -329,6 +329,7 @@ def check_sanity_validmachine(sanity_data):
>     # Check that we don't have duplicate entries in PACKAGE_ARCHS & =
that TUNE_PKGARCH is in PACKAGE_ARCHS
>     pkgarchs =3D sanity_data.getVar('PACKAGE_ARCHS', True)
>     tunepkg =3D sanity_data.getVar('TUNE_PKGARCH', True)
> +    defaulttune =3D sanity_data.getVar('DEFAULTTUNE', True)
>     tunefound =3D False
>     seen =3D {}
>     dups =3D []
> @@ -345,7 +346,7 @@ def check_sanity_validmachine(sanity_data):
>         messages =3D messages + "Error, the PACKAGE_ARCHS variable =
contains duplicates. The following archs are listed more than once: %s" =
% " ".join(dups)
>=20
>     if tunefound =3D=3D False:
> -        messages =3D messages + "Error, the PACKAGE_ARCHS variable =
does not contain TUNE_PKGARCH (%s)." % tunepkg
> +        messages =3D messages + "Error, the PACKAGE_ARCHS variable =
(%s) for DEFAULTTUNE (%s) does not contain TUNE_PKGARCH (%s)." % =
(pkgarchs, defaulttune, tunepkg)



>=20
>     return messages
>=20
> --
> 2.6.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_BF5AB789-FD67-4642-8C45-E0FA075914B4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZp6pMACgkQuwUzVZGdMxTClgCfUGvrW4oc9ZcaHTXWLRW2R84r
M54AoIzu8IJ7YbW4J8MzJ/rS50IXRjm5
=qLFU
-----END PGP SIGNATURE-----

--Apple-Mail=_BF5AB789-FD67-4642-8C45-E0FA075914B4--
