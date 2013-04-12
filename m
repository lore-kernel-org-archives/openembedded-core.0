Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQiHS-0007zm-M1
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 20:00:59 +0200
Received: by mail-ee0-f53.google.com with SMTP id c13so1355740eek.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 10:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=5ytQWO6o7hNFVVQTcexKCja/74F4yFpyiU6fccSQixE=;
	b=aDeJCxAOA0+QGOw5z41RgCUDZa41qdy9MvyORqr8pqi0Dd9eq/Zopq9sskCJjyYtEX
	YpfoZlgRKVKASqMsesZH+E0Su9qrenXNoxZTDwOsmfdz9mJAv0qZcYgZo9WLVGVHYoTa
	LD4yMJs/9N/jtyGNHw8kWG2pq6jaOrORW8Bg5qz6FCMBiiWBqlVSIEn7HpggnS43I3WI
	ZUU9un2Pe95Z3U5PwG6KUFC4dXP3GQmU82fx32sE3HCeT359F1anjYsvDziU/OlVL9cN
	jrQ2tho/07E2F54eQam9LTvN3N2nQvmnIEJhq6JZqkGB5F2U3RQnHCXJIhLflR0Ny4sJ
	ukEg==
X-Received: by 10.14.215.193 with SMTP id e41mr11317964eep.32.1365788614141;
	Fri, 12 Apr 2013 10:43:34 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f47sm12196721eep.13.2013.04.12.10.43.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 10:43:33 -0700 (PDT)
Date: Fri, 12 Apr 2013 19:43:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130412174336.GT2477@jama>
References: <1365785190.16702.65.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1365785190.16702.65.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] multilib.conf: Workaround opkg multilib issues
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
X-List-Received-Date: Fri, 12 Apr 2013 18:01:08 -0000
X-Groupsio-MsgNum: 37839
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="twKjCw1/F6C/WBH6"
Content-Disposition: inline

--twKjCw1/F6C/WBH6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 05:46:30PM +0100, Richard Purdie wrote:
> Multilib with opkg hasn't worked since the --force-overwrite option was d=
ropped in
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D88a9f6db3482623c9c=
b54fb03db1045051cec9f6
>=20
> Since we merged the libexecdir changes, we also need the --force-maintain=
er flag
> to avoid conf file conflicts.
>=20
> Both these changes are suboptimal however the alternative is completely b=
roken and
> these changes only affect people who have multilibs enabled and use opkg.

Can we add --force-overwrite only when MULTILIB is enabled?
=20
> [YOCTO #3453]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index 9a129f1..9ff06cc 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -14,3 +14,5 @@ INHERIT +=3D "multilib_global"
>  BBCLASSEXTEND_append =3D " ${MULTILIBS}"
> =20
>  MULTILIB_GLOBAL_VARIANTS  =3D "lib32 lib64 libx32"
> +
> +OPKG_ARGS_append =3D " --force-maintainer --force-overwrite"
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--twKjCw1/F6C/WBH6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFoR8gACgkQN1Ujt2V2gBzuoACgryo5/a/lQFhq4dCY1BiRooPW
gV8AnjqaIzdo9D9v/0S/AbexSqPEmRAH
=eiT4
-----END PGP SIGNATURE-----

--twKjCw1/F6C/WBH6--
