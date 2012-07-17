Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr4Pk-0004d4-KF
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 11:49:56 +0200
Received: by wibhq4 with SMTP id hq4so3142485wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 02:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JAVrrtGOxffsNV9K/aVU+h9+hc3DDINY6cjTLR9IWgg=;
	b=k1rnI2qjjDnOpPHLLdMH5Ps/3CmdwWTl3PYi7EUyr/dBVFKrxnYNU+kustON4fzTfm
	DhhSbYCiGs+TzHbn11MT4t/ZSuSs03HIeE+xPCaMm1W7udBExe298yG0CnicCQEpmNtc
	Xkv3fLlBtA/0l4nw92KTqojfQ3qlDSQzDFUvYpalnJUexaLUhbMKogs/zx190YsmAUe5
	SThOU/nuzjudzcRAHVqBJUoDj9IggmNY2yzXvM00kGn85lCDSgzc2pKjOH8ZIrdHrgJ0
	gZZ6pcUyMAWDPicqHbx5mQOI95+VFNn3+z6GkRzP08clt/hH+hq2FlYTQsarTHL2MkXu
	7bBg==
Received: by 10.216.211.131 with SMTP id w3mr936336weo.163.1342517917642;
	Tue, 17 Jul 2012 02:38:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm38721158wib.0.2012.07.17.02.38.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 02:38:36 -0700 (PDT)
Date: Tue, 17 Jul 2012 11:38:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120717093846.GB3390@jama.jama.net>
References: <1342517864-26972-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1342517864-26972-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] netbase: remove networkmanager handling for qemu machines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 09:49:57 -0000
X-Groupsio-MsgNum: 25465
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline

--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 17, 2012 at 11:37:43AM +0200, Martin Jansa wrote:
> * see http://lists.linuxtogo.org/pipermail/openembedded-core/2012-Februar=
y/018279.html thread

Sorry this was sent by accident..=20

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/netbase/netbase_5.0.bb |    9 ---------
>  1 files changed, 0 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core=
/netbase/netbase_5.0.bb
> index 3aea874..7c609af 100644
> --- a/meta/recipes-core/netbase/netbase_5.0.bb
> +++ b/meta/recipes-core/netbase/netbase_5.0.bb
> @@ -34,15 +34,6 @@ do_install () {
>  	install -m 0644 etc-services ${D}${sysconfdir}/services
>  	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfa=
ces
>  	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
> -
> -	# Disable network manager on machines that commonly do NFS booting
> -	case "${MACHINE}" in
> -		"qemuarm*" | "qemux86" | "qemux86-64" | "qemumips*" | "qemuppc" | "qem=
ush*")
> -			touch ${D}${sysconfdir}/network/nm-disabled-eth0
> -			;;
> -		*)
> -			;;
> -	esac
>  }
> =20
>  CONFFILES_${PN} =3D "${sysconfdir}/hosts ${sysconfdir}/network/interface=
s"
> --=20
> 1.7.8.6
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAFMqYACgkQN1Ujt2V2gByBWgCfeCcaHZDWmKbtYdpS4ZRVcisi
woAAn1xJhLUSQcF+4uO8cgGxiuTYK/Wy
=whE3
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
