Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0604E609C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:24:52 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so5674624wiv.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 04:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aoT8HnoPQZ/d7GS6J0RDIpZXDPRsrmnCah7Nzb39eos=;
	b=Q9b8kpAWCcNf9RSglRWcfWbDvc6EWrY6Z7SldA4qqtj5d5yKKMRmQ3kpS5Ow0lMW5c
	SxbijixKU3s4/kdRd7k4ctHtqj8lLVerfJ6Fsdwqgvexdvn/6jodVfF3IlxRwlCw+MZB
	mDg37Ttpbt8tI6mOXPcyI8pDCotLElzqO0DQKtZvrdkvbE8knCv51QMph5CPN2SiriS3
	q7AijBchBxnjVRCjvUVG9TygPgG0VyWoGDrNBJXONq28EzPXk/g6IBG/U4ffVPy2cDoN
	KulrtbVEaLcEYLmuRcSl8cJhlFY7gLzs86QJZCESYWsz6Y7KAWqyC1CPlshm/AHQwbxf
	lVtQ==
X-Received: by 10.180.103.74 with SMTP id fu10mr32371818wib.47.1407842693588; 
	Tue, 12 Aug 2014 04:24:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u7sm55208802wif.3.2014.08.12.04.24.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 04:24:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 13:25:28 +0200
To: Sujith H <sujith.h@gmail.com>
Message-ID: <20140812112528.GE14848@jama>
References: <1407834260-22021-1-git-send-email-sujith.h@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1407834260-22021-1-git-send-email-sujith.h@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pyparted: Add recipe
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
X-List-Received-Date: Tue, 12 Aug 2014 11:25:00 -0000
X-Groupsio-MsgNum: 56347
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jL3CgPauyjmRqeXN"
Content-Disposition: inline

--jL3CgPauyjmRqeXN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2014 at 02:34:20PM +0530, Sujith H wrote:
> From: Sujith H <Sujith_Haridasan@mentor.com>
>=20
> This recipe will provide a set of Python modules that
> provide Python programmers an interface to libparted,
> the GNU parted library for disk partitioning and filesystem
> manipulation.

Why not add it to meta-python?


>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> ---
>  meta/recipes-extended/pyparted/pyparted_3.9.bb | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta/recipes-extended/pyparted/pyparted_3.9.bb
>=20
> diff --git a/meta/recipes-extended/pyparted/pyparted_3.9.bb b/meta/recipe=
s-extended/pyparted/pyparted_3.9.bb
> new file mode 100644
> index 0000000..7b284cc
> --- /dev/null
> +++ b/meta/recipes-extended/pyparted/pyparted_3.9.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION =3D "pyparted is a set of Python modules that provide Python=
 programmers \
> +an interface to libparted, the GNU parted library for disk partitioning =
and \
> +filesystem manipulation."
> +SUMMARY =3D "Python bindings for libparted"
> +HOMEPAGE =3D "https://fedorahosted.org/pyparted/"
> +SCM_URI =3D "git://git.fedorahosted.org/pyparted.git"
> +LICENSE =3D "GPL-2.0+"
> +LIC_FILES_CHKSUM =3D "\
> +    file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b \
> +    file://src/_pedmodule.c;startline=3D10;endline=3D22;md5=3D70c62bd737=
82a03f56a0571a9f08ea46 \
> +"
> +DEPENDS +=3D "parted"
> +PR =3D "r0"
^ drop
> +
> +SRC_URI =3D "https://fedorahosted.org/releases/p/y/pyparted/pyparted-${P=
V}.tar.gz"
> +SRC_URI[md5sum] =3D "f16c7ef7f5fa4a43fcb2a4654b487e39"
> +SRC_URI[sha256sum] =3D "a56712e3d058ce3d859c158236dbbf45224018919efd3d88=
0ea80f9e0d0bebbb"
> +
> +inherit distutils
> +
> +BBCLASSEXTEND +=3D "native"
> --=20
> 1.8.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jL3CgPauyjmRqeXN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPp+agACgkQN1Ujt2V2gBxf2ACfed0oa3a3gtt5sIrQD0amqZKQ
iFMAoLBBNa/o8TanW7STNtjT45A//aRb
=jyMQ
-----END PGP SIGNATURE-----

--jL3CgPauyjmRqeXN--
