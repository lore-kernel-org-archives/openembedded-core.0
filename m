Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVK1n-0002s1-LM
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 13:07:52 +0200
Received: by mail-pa0-f49.google.com with SMTP id kp14so1802131pab.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 03:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=jswPBWvlwNwnYojqiNAaKd3VdTLPp6/Ys26sVyxDH6o=;
	b=mmIPASwTtZ7J4BLcx6D8R1e4v49sOodbdXwp6xzAWI1XtNUTuFg7GLcqYXWBZ/3vLF
	9T33vMO/o3eyGC6+MtmMjyhLaMcqf9b3t6offj95GlJ4IKhCzJun5xFnRaeeKllE4wxf
	1A91ltwx3QL0OIIPVZACciz8jZkNrIRwucBDSNherxOhSKUgriqr1mvgoUSUHGxv/+k1
	/cohIO5UHuA0Wgl/sCdAxQkmOyuF5FDDCVXkcWrhrFErOtQNLQIIzDg6Xlf80jO/Cgvw
	ZI93w4/n0YIkZ3yxaQNt+zZRLpDUurhTe5CvRWebIFkqpUwTdJmBlIj+KjPo7uGgSkm3
	bQdw==
X-Received: by 10.67.8.98 with SMTP id dj2mr24676965pad.76.1366887007774;
	Thu, 25 Apr 2013 03:50:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	aj2sm6932116pbc.1.2013.04.25.03.50.04 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 25 Apr 2013 03:50:06 -0700 (PDT)
Date: Thu, 25 Apr 2013 12:50:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20130425105016.GD5538@jama.dyndns-home.com>
References: <1366885598.14512.71.camel@phil-desktop.brightsign>
MIME-Version: 1.0
In-Reply-To: <1366885598.14512.71.camel@phil-desktop.brightsign>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: Disable hard-coding of library rpaths
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
X-List-Received-Date: Thu, 25 Apr 2013 11:07:54 -0000
X-Groupsio-MsgNum: 38380
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Content-Disposition: inline

--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2013 at 11:26:38AM +0100, Phil Blundell wrote:
> GDB's configury has a tendency to hard-code the path where it found
> libexpat using "-Wl,--rpath".  This is undesirable and leads to QA warnin=
gs.
>=20
> Fortunately, the helpful GDB maintainers have provided a "--disable-rpath"
> switch to turn this behaviour off.  Let's use it and profit.
>=20
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-devtools/gdb/gdb-common.inc |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devt=
ools/gdb/gdb-common.inc
> index 9eb6b60..0e542d8 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -42,6 +42,7 @@ EXTRA_OECONF =3D "--disable-gdbtk --disable-tui --disab=
le-x --disable-werror \
>                  --with-curses --disable-multilib --with-system-readline =
--disable-sim \
>                  ${GDBPROPREFIX} ${EXPAT} \
>                  ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enab=
le-64-bit-bfd', '', d)} \
> +		--disable-rpath \

Please don't mix tabs and spaces for indentation.

>                 "
> =20
>  GDBPROPREFIX =3D "--program-prefix=3D''"
> --=20
> 1.7.10.4
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF5CmgACgkQN1Ujt2V2gBwD0wCeK86rR+K1mPbv3ql49AMOBsMO
8SMAn12Yie+raGoFMaEsDi/rwwJshY+b
=Q9Fj
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--
