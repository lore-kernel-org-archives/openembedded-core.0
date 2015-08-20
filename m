Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 207E660557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 19:30:43 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so44334482wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 12:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vDWGAsNeouPp4FowVR77CnxVpE7wD+aLxsZX862AUtw=;
	b=OWnYjEioLiJTEL/8dLDQABlAR+0hwXHDKlb6baySSSbjZ/MXM7HS4mGtTX4I9r0p4s
	HxO5aLEX5cbx3UDrs0RTISnD6Iwh6swIqZD6nCad/mxhdaUMmhcrpJ0KthJeTm8nOvRt
	S9gdkX+5oJkPbAXMDR9raZhHMrRDcoNPSzjfDk4hw+xXvGbydTI5CKS6DRmQojeTaKv0
	1LDl9dU2jICPh9S3z8YuMatzecV3FSiZ0GZT0CisdXPP8hxrtlDXSxO/rwu0q0rHMwee
	BStZ+ikLZWyOtW60TyNcrMxAsUnhSYUhM/ZwSTieHeW1DDMcQZ9JO61AVrBi9YrOMqw/
	tOyA==
X-Received: by 10.180.216.42 with SMTP id on10mr68769826wic.3.1440099043532;
	Thu, 20 Aug 2015 12:30:43 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pu6sm6830225wjc.34.2015.08.20.12.30.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 12:30:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2015 21:31:10 +0200
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20150820193110.GA15465@jama>
References: <cover.1440098114.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1440098114.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] Dizzy-next for 1.7.3
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
X-List-Received-Date: Thu, 20 Aug 2015 19:30:44 -0000
X-Groupsio-MsgNum: 69741
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2015 at 12:20:31PM -0700, Armin Kuster wrote:
> Please consider these changes for inclusion to the 1.7.3 update.
>=20
> The following changes since commit e8da5133c2efd3bc4c5f41bb27207c053bc236=
0d:
>=20
>   runqueue: Add message to explain the problem if diffsigs multiple tasks=
 don't exist (2015-08-20 12:11:24 -0700)

Can you add:
http://patchwork.openembedded.org/patch/97485/
?

It's already in master and fido.

> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>   http://git.yoctoproject.org/cgit.cgi//log/?h=3Dakuster/dizzy-next
>=20
> Richard Purdie (2):
>   fetch2: Extend mirroruri handlling
>   sstate: Use SSTATE_DIR for FILESPATH
>=20
> Saul Wold (2):
>   grub-efi: Use the backport patch from grub
>   grub-efi: Add trailing \ missed in last patch
>=20
> Sona Sarmadi (3):
>   bind9.9.5: CVE-2015-5477
>   qemu: CVE-2014-7840
>   qemu-vnc: CVE-2014-7815
>=20
>  bitbake/lib/bb/fetch2/__init__.py                  |  1 +
>  meta/classes/sstate.bbclass                        |  4 +-
>  meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
>  .../bind/bind/bind9_9_5-CVE-2015-5477.patch        | 45 +++++++++++++++++
>  meta/recipes-connectivity/bind/bind_9.9.5.bb       |  1 +
>  .../recipes-devtools/qemu/qemu/CVE-2014-7840.patch | 57 ++++++++++++++++=
++++++
>  .../qemu/qemu/vnc-CVE-2014-7815.patch              | 53 ++++++++++++++++=
++++
>  meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  2 +
>  8 files changed, 163 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-201=
5-5477.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.pat=
ch
>=20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXWKv0ACgkQN1Ujt2V2gByD2ACgiPJ+RhFrWr3DVvpAMbdRMYHq
fGAAniz8ZzMLuedvc0vmi+eX5jnOdjQ5
=vDuC
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
