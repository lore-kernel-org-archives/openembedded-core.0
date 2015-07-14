Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4C70165C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 12:38:30 +0000 (UTC)
Received: by wgmn9 with SMTP id n9so7787546wgm.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7Ngth9YaLIj4dLhE0BvlnAtarMLo1rAnKmj20pDtyiw=;
	b=a9vw227d+LXvPVdV8N1mgWewnEG4+57+yEo4Te0qzidf20dtyrnfOyzeKvL6cCWWED
	Pw9TlZ8qZShlIFXhLdq1yGRjVMY6E7Uw+oVYVLvRJ6VUtp0aqznQ46M3yHxjKYk2lD7Z
	gyDoLO6GulQlv6sFxvVFsA4wz2AI0h4mBcKpribzWLUBYryuiP46xO/RAMC5A8JY1TQ4
	5IbIyrtJkgvN35lOo1rmGaOM82ej+OTglGJ4njQAnnzR6k9eeh/ObR3mb6lKLlDy7lNF
	6W0Zi4KgqG6rX9vs0BgZCu4qlS+ml4e/98b0FWhBS8KD1uzGoQYTjIEVcnVVmyaCI5t4
	DnmQ==
X-Received: by 10.180.87.105 with SMTP id w9mr33197252wiz.32.1436877510177;
	Tue, 14 Jul 2015 05:38:30 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	x10sm1812197wjr.25.2015.07.14.05.38.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jul 2015 05:38:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Jul 2015 14:38:42 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150714123842.GB2184@jama>
References: <1436877405-29049-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1436877405-29049-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] connman-conf: fix SRC_URI_append
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
X-List-Received-Date: Tue, 14 Jul 2015 12:38:34 -0000
X-Groupsio-MsgNum: 67931
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline

--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2015 at 02:36:45PM +0200, Martin Jansa wrote:
> * add leading space so that it works even with some .bbappend adding
>   additional files to SRC_URI without trailing space

This issue exists for long time, please backport also to fido and dizzy.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-connectivity/connman/connman-conf.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/rec=
ipes-connectivity/connman/connman-conf.bb
> index 2358d9d..bd4c28d 100644
> --- a/meta/recipes-connectivity/connman/connman-conf.bb
> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> @@ -4,9 +4,9 @@ network interface for a qemu machine."
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0;md5=3D801f80980d171dd6425610833a22dbe6"
> =20
> -SRC_URI_append_qemuall =3D "file://wired.config \
> -                          file://wired-setup \
> -                         "
> +SRC_URI_append_qemuall =3D " file://wired.config \
> +                           file://wired-setup \
> +"
>  PR =3D "r2"
> =20
>  S =3D "${WORKDIR}"
> --=20
> 2.4.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWlAtIACgkQN1Ujt2V2gBxyOACdGJVIM/GqS4QH/n+0pVb/X3U0
WY0AoK98DUy+4bB1ClmDgdjwv1OYu5F3
=scEh
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
