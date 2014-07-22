Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 144F770588;
	Tue, 22 Jul 2014 09:17:47 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so7540965wgh.17
	for <multiple recipients>; Tue, 22 Jul 2014 02:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fN3IC2oCi5giPSAZIi/AGjbp0C1BCrerCKTnspGcNBs=;
	b=iw9QwQh1gURWDCUSnWaV3Hlw6NCu+5Xb15OmBf/bk/91hLuTL01S9ArHlIyDCM9G6Y
	OgNpjEUdf/N/LtuhnBRaCeuaVIR1cVmu7oJtSW6+iJR//MZAEgsvnb3OfAfSt7cJdH+d
	2/1ywa0ZYNU14ANCq3HbOsMRcuErxNGmEhN9QDHuWHa3q6Sfxst7C71VDoae9t3S5HPm
	p42UPF6iRIloUCDLk7Dbi+jIhW7AwQZ/0Fs2s/KpRssyviYfTvtnaoZhhVCoty9VfTDa
	6dJbmETg0ToGr3XodUP5TXppkzauW97zCbX/7/fLkOFk0d3z7xQVxT4RoUxN+SoaicLX
	KAvw==
X-Received: by 10.194.78.68 with SMTP id z4mr22300799wjw.126.1406020668704;
	Tue, 22 Jul 2014 02:17:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cj8sm44142060wjb.5.2014.07.22.02.17.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 02:17:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Jul 2014 11:18:03 +0200
To: openembedded-core@lists.openembedded.org, Ben Shelton <ben.shelton@ni.com>
Message-ID: <20140722091803.GO22875@jama>
References: <20140721182515.CD7355015A@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140721182515.CD7355015A@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Tollerton : bootlogd: ensure /var/log/boot is created in volatiles
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
X-List-Received-Date: Tue, 22 Jul 2014 09:17:56 -0000
X-Groupsio-MsgNum: 55350
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FYef6pHvFBuPZp1D"
Content-Disposition: inline

--FYef6pHvFBuPZp1D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2014 at 06:25:15PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master-next
> Commit: 6f963d761fa2916711b0d7808351515383bd5298
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D6f963d761fa2916711b0d7808351515383bd5298
>=20
> Author: Richard Tollerton <rich.tollerton@ni.com>
> Date:   Mon Jul 21 10:50:56 2014 -0500
>=20
> bootlogd: ensure /var/log/boot is created in volatiles

subject usually starts with recipe/bbclass name, so it should be
sysvinit not bootlogd.

> bootlogd does not write to /var/log/boot if it does not exist,
> so if using the volatiles facility (presumed to mount /var/log under a
> tmpfs), ensure that /var/log/boot gets created.
>=20
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-core/sysvinit/sysvinit/01_bootlogd | 1 +
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb  | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/sysvinit/sysvinit/01_bootlogd b/meta/recip=
es-core/sysvinit/sysvinit/01_bootlogd
> new file mode 100644
> index 0000000..a689d92
> --- /dev/null
> +++ b/meta/recipes-core/sysvinit/sysvinit/01_bootlogd
> @@ -0,0 +1 @@
> +f root root 0644 /var/log/boot none
> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipe=
s-core/sysvinit/sysvinit_2.88dsf.bb
> index 448d021..a8c10f2 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> @@ -16,7 +16,9 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-$=
{PV}.tar.bz2 \
>             file://rcS-default \
>             file://rc \
>             file://rcS \
> -           file://bootlogd.init"
> +	   file://bootlogd.init \
> +           file://01_bootlogd \

Please don't mix tabs and spaces for indentation, only spaces should be used
in multi-line variables.

> +"
> =20
>  SRC_URI[md5sum] =3D "6eda8a97b86e0a6f59dabbf25202aa6f"
>  SRC_URI[sha256sum] =3D "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7=
310a01f4d5df1519"
> @@ -92,6 +94,9 @@ do_install () {
>  	update-rc.d -r ${D} bootlogd start 07 S .
>  	update-rc.d -r ${D} stop-bootlogd start 99 2 3 4 5 .
> =20
> +	install -d ${D}${sysconfdir}/default/volatiles
> +	install -m 0644 ${WORKDIR}/01_bootlogd ${D}${sysconfdir}/default/volati=
les
> +
>  	chown root.shutdown ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdo=
wn
>  	chmod o-x,u+s ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
>  }
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FYef6pHvFBuPZp1D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPOLEsACgkQN1Ujt2V2gBw6RgCeNTd7vBH2TlHbxofRTHYHL7LT
bj8An3HNMRVfX/oVPFfrMnFK0a3RkQAQ
=U5zD
-----END PGP SIGNATURE-----

--FYef6pHvFBuPZp1D--
