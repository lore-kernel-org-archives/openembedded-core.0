Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TqjiU-0005Zw-Pr
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 13:16:18 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so6153647eaa.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 04:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=jVHNnWNy3jW2K/TXkCiZn9y5TjdZZiCLvbW/OUTAIas=;
	b=BD/44MSoBZH062tDhYteFxaKiham9MjXRSZhOep+xemtwnOsynaWlCNVncyQcM10Cn
	zSFJ2RqmvQVwYGbUSotRD9o9IO+BsN26/hNTSQWLOOW5prqQ+UlC+Bd3CS2Wy9gmAAKL
	adfYSMNLPTHgN9euVEUxTlrPqfWJaAMMhkfAeAlCN8n6iDh2Mq8nQSAvhEi+1vLy9eM7
	9Zb2wXfCU+qCROrI/Prs0JGXf9Vx9GeOW4dJYmmsrMRttJGwvcrH9YN1tAWzMBqddl/R
	J1rjm2kxwg/6RddiTm3RK9CLy5GoKsIvQMDz622TQujbyU75olumxtJfybvkN+y+1oW0
	x5EQ==
X-Received: by 10.14.223.135 with SMTP id v7mr134161294eep.41.1357214467241;
	Thu, 03 Jan 2013 04:01:07 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 6sm103537789eea.3.2013.01.03.04.01.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 04:01:06 -0800 (PST)
Date: Thu, 3 Jan 2013 13:01:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130103120117.GF3276@jama>
References: <1357213493-25506-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1357213493-25506-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+: add native class
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
X-List-Received-Date: Thu, 03 Jan 2013 12:16:18 -0000
X-Groupsio-MsgNum: 33232
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Content-Disposition: inline

--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 03, 2013 at 11:44:53AM +0000, Ross Burton wrote:
> It's easiest to bootstrap GTK+ 3 using a native GTK+ 2.
>=20
> (Patch taken from meta-oe)

That's 4th or 5th version of this patch:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019625.ht=
ml
  rejected in http://lists.linuxtogo.org/pipermail/openembedded-core/2012-M=
arch/019683.html
http://patches.openembedded.org/patch/33761/
http://patches.openembedded.org/patch/36913/
=2E..

Cheers,

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-gnome/gtk+/gtk+_2.24.14.bb |    3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb b/meta/recipes-gnome=
/gtk+/gtk+_2.24.14.bb
> index 553196a..a6e705b 100644
> --- a/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
> @@ -60,3 +60,6 @@ python populate_packages_prepend () {
>      if (d.getVar('DEBIAN_NAMES', True)):
>          d.setVar('PKG_${PN}', '${MLPREFIX}libgtk-2.0')
>  }
> +
> +BBCLASSEXTEND =3D "native"
> +RRECOMMENDS_${PN}_virtclass-native =3D ""
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDlcw0ACgkQN1Ujt2V2gBwqAACgp3zYuuJ7fT0pf82JjpBJwBJ4
RLYAnRSuruRrBAwoWVQrCHkZqa9HEl/A
=CFkf
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--
