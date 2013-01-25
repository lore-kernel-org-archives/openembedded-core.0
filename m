Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TykdK-000135-W1
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 15:51:59 +0100
Received: by mail-pa0-f52.google.com with SMTP id fb1so291613pad.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 06:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=F7IK0HBtylfz07hy5x5XT1ZFwgkSDtDVI4vXloVwQ9k=;
	b=yJuCWHIgoAW8yWXJZKviAGWLtxvQVnYWaGaKH4PIYOxg5rjXAA8HZz48aLB/Xf1OnL
	DLpj1mXRAvR7hkY+xQFIuqFL54dsCVLisC+6RmhBnq847HktLTymk7E6q+nJZ07vZe1T
	0nTuYsq2YXZ27OqjaW4Xs6kEu0nlDiATLc/BrQa5vMQ99GkYsFPzMnJn0dhFiuoUgrn3
	PffAdhwDRcKP6EYFi5RN7pI3CL+llMg1GxeO2EWlSm8jhfvT6HR7ZYOM69L1JS66gYaD
	2qvFiVv20mJmqtiLKd/f4VFN6WnJf7ulO2VRv3srWwJ2GEqEOJsdsf0cnZ0MYJrC848t
	s5YA==
X-Received: by 10.68.230.101 with SMTP id sx5mr14809210pbc.50.1359124584016;
	Fri, 25 Jan 2013 06:36:24 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gl5sm770248pbc.51.2013.01.25.06.36.21
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 06:36:23 -0800 (PST)
Date: Fri, 25 Jan 2013 15:36:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Message-ID: <20130125143619.GI3200@jama>
References: <1359124075-3504-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1359124075-3504-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: fix evacuate_scripts for external toolchains
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
X-List-Received-Date: Fri, 25 Jan 2013 14:51:59 -0000
X-Groupsio-MsgNum: 34437
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8884J15jRwcBTvu"
Content-Disposition: inline

--n8884J15jRwcBTvu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 03:27:55PM +0100, Marcin Juszkiewicz wrote:
> Not every external toolchain has mtrace/sotruss/xtrace scripts so check
> their existance first.
>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta/recipes-core/eglibc/eglibc-package.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-c=
ore/eglibc/eglibc-package.inc
> index 79c43f1..4a4e54a 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -113,7 +113,9 @@ do_evacuate_scripts () {
>  	target=3D${D}${includedir}/eglibc-scripts-internal-${MULTIMACH_TARGET_S=
YS}
>  	mkdir -p $target
>  	for i in ${bashscripts}; do
> -		cp ${D}${bindir}/$i $target/
> +	    if [ -f ${D}${bindir}/$i ]; then
> +		    cp ${D}${bindir}/$i $target/
> +		fi

Please don't use mix of spaces and tabs for indentation.

>  	done
>  }
> =20
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--n8884J15jRwcBTvu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlECmGMACgkQN1Ujt2V2gBzxTACgirFX2ZJsVkJB39CsbksIbyzc
st4AniWtd0IucVXrFOZ7TtlZvi5i5LyF
=oMvW
-----END PGP SIGNATURE-----

--n8884J15jRwcBTvu--
