Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbEI0-0005z9-Bt
	for openembedded-core@openembedded.org; Wed, 21 Nov 2012 18:40:44 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4053506eei.6
	for <openembedded-core@openembedded.org>;
	Wed, 21 Nov 2012 09:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5rBg7Yj7Cw2xuPrjQM1yfcU4Qmqt0OqHthXxlEOZOVI=;
	b=KCPkbW4sxHUh1MyuPQW1qds6e2jhPMfGl0BY5CUfHM65SCCgOYVYuXcIpgfcHHnHMR
	XmzNOxBA9Pj2fFuCazO9/qBVibW7aXMiZBA64QaHzV2D32gp2eFIL558O7ocVg8+PxIZ
	ZWdR8hHJMtBnu1Q8Hwy18KfHoEWcAel4Eub/DbOn154GjCQ4AFMKm7CtdFLUaI6vav18
	fCMQ79c2R/ixJAQqH1ugpf22GbakjbSOwM0z2q7XAettOoUvqgiFaBS367WD5ze3wU8y
	uWf/S2S0aX7F+eP8QfrLLvGO3ZYzn77XgPr9iIY+ZzgbRwRuMiJw76vLdCVyQA5LyjR+
	1d8g==
Received: by 10.14.223.4 with SMTP id u4mr47168561eep.19.1353518799309;
	Wed, 21 Nov 2012 09:26:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d44sm1389307eeo.10.2012.11.21.09.26.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 09:26:38 -0800 (PST)
Date: Wed, 21 Nov 2012 18:26:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Philip Balister <philip@balister.org>
Message-ID: <20121121172635.GM12637@jama.jama.net>
References: <1353518473-27252-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1353518473-27252-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] insane.bbclass : Disable tests for unsafe references in binaries and scripts.
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
X-List-Received-Date: Wed, 21 Nov 2012 17:40:44 -0000
X-Groupsio-MsgNum: 31619
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iKKZt69u2Wx/rspf"
Content-Disposition: inline

--iKKZt69u2Wx/rspf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2012 at 12:21:13PM -0500, Philip Balister wrote:
> These test look for programs in / that depend on programs in /usr. After
> a brief discussion in #oe, we decided these tests should be disabled so
> we can focus on more serious QA issues.
>=20
> If you are working on a system where / and /usr are on different partitio=
ns,
> you should turn these tests back on and resolving the QA warnings.
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta/classes/insane.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 237ee82..c5c84b8 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -113,7 +113,7 @@ def package_qa_get_machine_dict():
> =20
> =20
>  # Currently not being used by default "desktop"
> -WARN_QA ?=3D "ldflags useless-rpaths rpaths unsafe-references-in-binarie=
s unsafe-references-in-scripts staticdev libdir xorg-driver-abi textrel"
> +WARN_QA ?=3D "ldflags useless-rpaths rpaths staticdev libdir xorg-driver=
-abi textrel"
>  ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig=
 la perms dep-cmp"
> =20
>  ALL_QA =3D "${WARN_QA} ${ERROR_QA}"

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iKKZt69u2Wx/rspf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCtDssACgkQN1Ujt2V2gBwYtwCgjg2s/XkP40TJ6BkjuN3kYiNI
xIMAn0NuNlCmRbbsSAqkCatRnLKfvIg9
=HiBe
-----END PGP SIGNATURE-----

--iKKZt69u2Wx/rspf--
