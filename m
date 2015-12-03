Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 917BB6FF76
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 10:01:55 +0000 (UTC)
Received: by wmec201 with SMTP id c201so14803945wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 02:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=A4XpXluz+W3+aupJwm1iy6M8D1nmMpnV8iIoWQ/NC0Y=;
	b=Ad05JjxZPmUkJ2l/MD3zXp+xwaXivIZO0TL047wi1ktOiGDHrysVwntYWp5ZYAjPae
	B6RPSz/0dfEs2ricaK9bY6/mBPIvD4VJmdjkXoHBOT7e3fQ4Gia9vnkdaa2p6EDvTVMm
	0I5xKMZRALB0Z3+kYScuEHJ609ubKfJF45wykTbhGti3TbhVLlbidHj8Cr9XmVjYY71l
	C2xb6LDmSFFf2d7FbWhd6PcKpcf95wfRr7AsJDIG2BdtcY/TG3Eoh/CEvUn8iapfROO3
	7bb5xh4lSexpiTSM5UIptlDWHpvIAxixIUjPYWhE+mr8Wl/AzDiE6fX5RwHwpPKEsTcd
	oR/Q==
X-Received: by 10.28.19.20 with SMTP id 20mr51410874wmt.49.1449136914485;
	Thu, 03 Dec 2015 02:01:54 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id jm4sm6766401wjb.7.2015.12.03.02.01.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Dec 2015 02:01:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 3 Dec 2015 11:03:03 +0100
To: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <20151203100303.GB3758@jama>
References: <cover.1449134546.git.joshua.lock@collabora.co.uk>
	<81ce23956c7c609f6e6c2f264236970a5c2d9e6b.1449134546.git.joshua.lock@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <81ce23956c7c609f6e6c2f264236970a5c2d9e6b.1449134546.git.joshua.lock@collabora.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] connman-conf: mark as allarch
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
X-List-Received-Date: Thu, 03 Dec 2015 10:01:55 -0000
X-Groupsio-MsgNum: 74305
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline

--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2015 at 09:23:47AM +0000, Joshua Lock wrote:
> This recipe just installs some data files and thus is architecture
> independent and doesn't require a compiler and libc in its DEPENDS.

Sorry I didn't notice it before, but this recipe is meant to provide
MACHINE specific configuration, like the qemuall overrides does few
lines below, so this cannot be allarch.

>=20
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>  meta/recipes-connectivity/connman/connman-conf.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/rec=
ipes-connectivity/connman/connman-conf.bb
> index bef9237..4c6a2d2 100644
> --- a/meta/recipes-connectivity/connman/connman-conf.bb
> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> @@ -4,7 +4,7 @@ network interface for a qemu machine."
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0;md5=3D801f80980d171dd6425610833a22dbe6"
> =20
> -inherit systemd
> +inherit systemd allarch
> =20
>  SRC_URI_append_qemuall =3D " file://wired.config \
>                             file://wired-setup \
> --=20
> 2.4.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZgE1cACgkQN1Ujt2V2gBx2WQCgu3ycXeGk0P+HWv5VkDmaCihz
ZggAn3npoZUalKRNtcvusIan7WvCrw99
=MPhr
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
