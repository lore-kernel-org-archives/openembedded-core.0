Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXvsk-0007Lg-Pc
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:57:39 +0200
Received: by mail-pa0-f45.google.com with SMTP id lj1so421653pab.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 08:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=kMrH4UqrALPhBYaRq5IWIo49W/ucbn0n0QU1lB5q7+E=;
	b=lc267Bh3qn0fcmYhtABKAcQ+xhrsLKj1CG1EoMdfkAHy99RP0u+RddHmrw3hkXIv56
	0upEs970VkXzLX8u15YmPzNVHP1DI53bLQTrXxC+Qf/Q7I7xo1e0JQ4mge9C7VyBwH2p
	Ijc83cGkzDIBhqPmOH/R6sTbQhOFBedKl99sLzsxf/cf4MLDPAymhGL7TK48k8Jk6yMM
	1BlpN9iCVC6jpqmdcF6j7k1lLB4Xju+8XK58/xBLa9A/h9voSz/+TeQ7GUEypk5WcCbn
	u6qGDUar6fDC5olWfT81zkx/b+BYeLDZ8fpwU3gLRGEIi5Jw0TX/OnTn7PdBQesRppmw
	AOuQ==
X-Received: by 10.66.19.234 with SMTP id i10mr10383777pae.152.1367509164465;
	Thu, 02 May 2013 08:39:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	qh4sm8732444pac.8.2013.05.02.08.39.18 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 02 May 2013 08:39:23 -0700 (PDT)
Date: Thu, 2 May 2013 17:39:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Message-ID: <20130502153930.GD3206@jama>
References: <1367506593-11381-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1367506593-11381-3-git-send-email-jukka.rissanen@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1367506593-11381-3-git-send-email-jukka.rissanen@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] neard: Use SRCREV instead of SRCPV
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
X-List-Received-Date: Thu, 02 May 2013 15:57:49 -0000
X-Groupsio-MsgNum: 38658
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UfEAyuTBtIjiZzX6"
Content-Disposition: inline

--UfEAyuTBtIjiZzX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2013 at 05:56:32PM +0300, Jukka Rissanen wrote:
>=20
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> ---
>  meta/recipes-connectivity/neard/neard_0.10.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/neard/neard_0.10.bb b/meta/recipes=
-connectivity/neard/neard_0.10.bb
> index dc43f7e..b9198af 100644
> --- a/meta/recipes-connectivity/neard/neard_0.10.bb
> +++ b/meta/recipes-connectivity/neard/neard_0.10.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1f=
f87c09e5b7ccc2c4ca7e \
> =20
>  S =3D "${WORKDIR}/git"
>  SRCREV =3D "eb486bf35e24d7d1db61350f5ab393a0c880523d"
> -PV =3D "0.10+git${SRCPV}"
> +PV =3D "0.10+git${SRCREV}"

Why? SRCPV is better.

>  PR =3D "r0"
> =20
>  inherit autotools pkgconfig systemd update-rc.d
> --=20
> 1.7.11.7
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UfEAyuTBtIjiZzX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGCiLIACgkQN1Ujt2V2gBxgxwCfWEtM4ybTT2jEs2eUWU816e3A
8b0AoIaA20JyIR2hNgHJV8SqouA2dZWF
=4+Yx
-----END PGP SIGNATURE-----

--UfEAyuTBtIjiZzX6--
