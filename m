Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TQjpe-0006Fu-IS; Tue, 23 Oct 2012 21:08:06 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so3058664wgb.24
	for <multiple recipients>; Tue, 23 Oct 2012 11:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HjKbdzNf4AZHTukY3Hc5FOtWxCX2gy67AJHCxOMgNYA=;
	b=CguvO6z1WtPQ3cH0ePJZs37wA5upbZaYxlssMqWX8qYFSuZtPe7JFat+ZJMMhq7wWb
	S1v5Tc0eWDuW+MNl8E8SWu+emVw98LrgcFagpoggvR8M0ju4KoMPnHZwEK2WbqC2mDqL
	H/+KFQzy1/316CTqULckJfuGCFRYVV4Vo1CnHZLW+Lehdat4/n1TLevH1FdC8ptcAFjM
	2W9itdvaQ1qSkMlLzdLwQw7e1jC4e4D8iiQWwNRXekKYZs8vrZjCM9CX4ZEyq403EeCk
	r3DTsu6kOxEcas3YMkvp4BzryT4P5czDgFJiXZOnTtyOVbXi7ExkDPyFMABPQaxDoWN1
	a8Eg==
Received: by 10.216.197.41 with SMTP id s41mr7518377wen.205.1351018480187;
	Tue, 23 Oct 2012 11:54:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm149843wiz.3.2012.10.23.11.54.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 11:54:37 -0700 (PDT)
Date: Tue, 23 Oct 2012 20:54:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Message-ID: <20121023185454.GS3269@jama.jama.net>
References: <1349345672-803-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<CA+chaQePjXEa0o6ziqV7rUVgqWOEoyJPMb1iApbv-9MEJzts0Q@mail.gmail.com>
	<20121018205948.GE3087@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20121018205948.GE3087@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gypsy: removed gypsy from meta/recipes-connectivity
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 19:08:06 -0000
X-Groupsio-MsgNum: 30891
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1IOPqZ3f1xe/JZlz"
Content-Disposition: inline

--1IOPqZ3f1xe/JZlz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 10:59:48PM +0200, Martin Jansa wrote:
> On Thu, Oct 18, 2012 at 08:59:19PM +0200, Martin Jansa wrote:
> > I know you've sent
> > http://patchwork.openembedded.org/patch/37763/
> > to add it to meta-oe, but this patch removed also newer gypsy_0.9.bb
> > and only older gypsy_git.bb was added back.
> >=20
> > Please fix that.
>=20
> There is also this diff which isn't mentioned in your commit.
>=20
> -SRCREV =3D "3652e1f37e82b8e63983e30fda3482cd099a8cf5"
> +SRCREV =3D "be8c9c382d2d1d37b51d29b0843045121ec90213"
>  PV =3D "0.8+git${SRCPV}"
>  PR =3D "r2"
>=20
> @@ -15,4 +15,5 @@
>                      file://gypsy/gypsy-time.h;beginline=3D1;endline=3D24=
;md5=3D06432ea19a7b6607428d04d9dadc37fd"
>=20
>  SRC_URI =3D "git://anongit.freedesktop.org/gypsy;protocol=3Dgit \
> -           file://fixups.patch"
> +           file://fixups.patch \
> +           file://0001-gypsy-m4-directory-missing-from-structure.patch"

ping

meta-oe is still broken because of this

Cheers,

--1IOPqZ3f1xe/JZlz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCG5/4ACgkQN1Ujt2V2gBzp6ACfSXCSXZ/1mnC/HqPPtZhOwBkB
rgYAnRjE4DMcqyO/GoExnGx7v20Dhj06
=yXol
-----END PGP SIGNATURE-----

--1IOPqZ3f1xe/JZlz--
