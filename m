Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1F070F06
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 09:52:46 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id q5so5852666wiv.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 02:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uU81bxoLBajzu7IiTlPIveOwk6DaiuQG1cWDv/CtwXs=;
	b=BznbCgFOl2xxp9tIxd3IOYtWD6o7DfyMxEPH2gvZoON3toXqKAdRm7TflHwMpmenG2
	HvjTNIoMeqgISYxWVHUdQDuPaEAHh5o1jycmMk2xDCk5iX4Nyx4W1aMuuKeyPWj/YFdM
	uHZu9S4bIWr9fv/6AZFxYleBPSsAks4IVZaHs4J/xSMeO4yv9gK4T9O20xAH0YVlUTCs
	OfDMekWRYIg+3Bdg8XYe3Hvbb9rzKM318JhzIZ48s79Gfue0KDSXKeoUlDwHxOfCPPp+
	RepR1xcV7baDkSfOPVMvhgCpK5o+ZHX/x0D9nRxSUBrwSOUh+2MIDAFzWrccX014hnZQ
	7z9g==
X-Received: by 10.181.27.197 with SMTP id ji5mr19782280wid.26.1414403566525;
	Mon, 27 Oct 2014 02:52:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cw6sm14988291wjb.18.2014.10.27.02.52.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Oct 2014 02:52:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Oct 2014 10:52:48 +0100
To: jackie.huang@windriver.com
Message-ID: <20141027095248.GC2430@jama>
References: <1414403082-28396-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1414403082-28396-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] which-2.18: Make sure ChangeLog exists for automake
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
X-List-Received-Date: Mon, 27 Oct 2014 09:52:49 -0000
X-Groupsio-MsgNum: 58942
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline

--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2014 at 05:44:42AM -0400, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Fixed:
> Makefile.am: error: required file './ChangeLog' not found

Isn't it better to pass foreign to automake?

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-extended/which/which_2.18.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-extended/which/which_2.18.bb b/meta/recipes-ext=
ended/which/which_2.18.bb
> index 5fa5d9e..49e9248 100644
> --- a/meta/recipes-extended/which/which_2.18.bb
> +++ b/meta/recipes-extended/which/which_2.18.bb
> @@ -25,6 +25,9 @@ do_configure_prepend() {
>  	OLD=3D"@ACLOCAL_CWFLAGS@"
>  	NEW=3D"-I ${STAGING_DIR_NATIVE}/${datadir}/cwautomacros/m4"
>  	sed -i "s#${OLD}#${NEW}#g" `grep -rl ${OLD} ${S}`
> +
> +	# Make sure ChangeLog exists for automake
> +	touch ${S}/ChangeLog
>  }
> =20
>  ALTERNATIVE_${PN} =3D "which"
> --=20
> 2.0.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlROFfAACgkQN1Ujt2V2gBz1FgCfRwCMFThfD4K8x13rA+szgRVD
8ZYAn2xKZv4ZQtpfd8O6TvZDw6/FGo2T
=IuZn
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--
