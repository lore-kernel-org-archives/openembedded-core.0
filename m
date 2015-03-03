Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 89EAD73779
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 21:39:46 +0000 (UTC)
Received: by wggy19 with SMTP id y19so42744037wgg.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 13:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nGv0QVSQaJm52vO5lNh2nwYSk9G1JTJaFrib4QpSxrY=;
	b=dNUwW6P9UihFCmTL+Kf4Z65J64r3oJfnNjsrBrtcNklZ+Yg2nu1v3tpBPGFF1FW10R
	yoMfAwHo5VSoqwqWBXkXC7ZeT5G5TetU44QbXjthpB9iH/QL9GYlR0SwCDTK650eesIM
	692DuerGAb0k4PRdYMh+plZoZ/sXGKjVntudYN32oz6Fft9bTslYhE3UIYfa+pdrkntj
	+0XU6hyn/Y8E1F+cRAm1E9bi0yEwgT5H0VUG7FDTHePmptDC6FobDddVsSAlqN0qkIDE
	OuahuV8xYAvmimfmfEGMG8IbH1BbQ5OrrISPC29fyQMUmDKpJwVXxCH3FzdQFFZbtbjt
	enZg==
X-Received: by 10.194.21.137 with SMTP id v9mr1648015wje.140.1425418787307;
	Tue, 03 Mar 2015 13:39:47 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ub1sm3028120wjc.43.2015.03.03.13.39.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Mar 2015 13:39:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 3 Mar 2015 22:39:49 +0100
To: Rob Woolley <rob.woolley@windriver.com>
Message-ID: <20150303213949.GE2337@jama>
References: <1425418365-16648-1-git-send-email-rob.woolley@windriver.com>
	<1425418365-16648-2-git-send-email-rob.woolley@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1425418365-16648-2-git-send-email-rob.woolley@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] nfs-utils: Identify CONFFILES
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
X-List-Received-Date: Tue, 03 Mar 2015 21:39:53 -0000
X-Groupsio-MsgNum: 62923
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JBi0ZxuS5uaEhkUZ"
Content-Disposition: inline

--JBi0ZxuS5uaEhkUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2015 at 04:32:44PM -0500, Rob Woolley wrote:
> Some package formats explicitly track which files are configuration files
> so that they are not overwritten on updates. Explicitly list the
> configuration files.
>=20
> Signed-off by: Rob Woolley <rob.woolley@windriver.com>
> --- meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> +++ meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> @@ -68,6 +68,12 @@ PACKAGECONFIG[nfsidmap] =3D "--enable-nfsi
>  INHIBIT_AUTO_STAGE =3D "1"
> =20
>  PACKAGES =3D+ "${PN}-client ${PN}-stats"
> +
> +CONFFILES_${PN}-client +=3D "/var/lib/nfs/etab"
> +CONFFILES_${PN}-client +=3D "/var/lib/nfs/rmtab"
> +CONFFILES_${PN}-client +=3D "/var/lib/nfs/state"
> +CONFFILES_${PN}-client +=3D "/var/lib/nfs/xtab"

Use 1 multiline append and ${localstatedir}/lib/nfs.

> +
>  FILES_${PN}-client =3D "${base_sbindir}/*mount.nfs* ${sbindir}/*statd \
>  		      ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
>  		      ${sbindir}/showmount ${sbindir}/nfsstat \
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JBi0ZxuS5uaEhkUZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT2KiUACgkQN1Ujt2V2gByergCgu6GQP3Jf/hVpeOAbbi/MLDLe
J7YAoK8+FWRxaV8WU/WWe443mmuv2Guz
=ljTG
-----END PGP SIGNATURE-----

--JBi0ZxuS5uaEhkUZ--
