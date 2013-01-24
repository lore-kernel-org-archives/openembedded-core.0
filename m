Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TyKLB-0004Uw-Fv
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 11:47:29 +0100
Received: by mail-pa0-f41.google.com with SMTP id bj3so5463681pad.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 02:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=eMh2Xo6U2HVpk8ESP+D8Iky85/gsvE9NHeFynY4jDKs=;
	b=VcdJatnBo0wjGbeakdBKM7/N1YICggwYkqo0+T7YpeLKrA0S1M7BELt+QhIIPnB4/9
	5wD7pyXBPM73Ja0qhIr1N+Atg/GWJ8dm6Fxi/5Gk2VnmwGI3RvryYWBWcomOLYXNVpTM
	w94bs9sXhunHfo9+u9C0YBZ62rrI6kB9uYVsOGgbLhAzw1IZgMQQ9pItFxgAPuxt69C2
	9l1VcIy8pS34jHsxc/oe7HvBedDe9I/v5wpm935O7c7k2wINqq9/UMAUDoo7ni3mZezJ
	Uyphjc5LgyMOGCGskuFhkEB8sgoPZHSYib2uCEvy0PKlxaQ47sbXWpi8+eNhvDkGMgrc
	Cx3w==
X-Received: by 10.68.244.230 with SMTP id xj6mr3434350pbc.106.1359023515997;
	Thu, 24 Jan 2013 02:31:55 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id us7sm14644482pbc.40.2013.01.24.02.31.52
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 02:31:54 -0800 (PST)
Date: Thu, 24 Jan 2013 11:31:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20130124103150.GA3012@jama>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<c60b41bd635d38aa01ffdd5c6221fd1a9c34b68f.1359014474.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c60b41bd635d38aa01ffdd5c6221fd1a9c34b68f.1359014474.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/12] volatiles.bbclass: add recipe
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
X-List-Received-Date: Thu, 24 Jan 2013 10:47:29 -0000
X-Groupsio-MsgNum: 34336
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2013 at 04:16:45PM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> All recipes that need to tweak their directories need to inherit this
> class and set VOLATILE_DIR, VOLATILE_LINK and VOLATILE_PKGS.
>=20
> [YOCTO #3406]
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/volatiles.bbclass |   11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta/classes/volatiles.bbclass
>=20
> diff --git a/meta/classes/volatiles.bbclass b/meta/classes/volatiles.bbcl=
ass
> new file mode 100644
> index 0000000..f27e598
> --- /dev/null
> +++ b/meta/classes/volatiles.bbclass
> @@ -0,0 +1,11 @@
> +# This bbclass is for read-only-rootfs support. All recipes that may twe=
ak their
> +# own directories in order to run correctly in a read-only rootfs enviro=
ment
> +# should inherit this class and set VOLATILE_DIR, VOLATILE_LINK, VOLATIL=
E_PKGS.
> +
> +# For each package, the net result is a read-only specific conf file gen=
erated
> +# and packaged, which has the name of readonly-${VOLATILESPN}.
> +
> +# All these config files are then parsed by populate-volatile.sh to crea=
te proper
> +# directories and links.
> +
> +inherit ${@base_contains('DISTRO_FEATURES','sysvinit','volatiles_sysvini=
t','',d)}

Does "inherit " work?

I mean empty inherit when DISTRO_FEATURES don't contain sysvinit? IIRC
it will fail to parse.

Cheers,

> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEBDZYACgkQN1Ujt2V2gBzN4gCdFFIdnI/QTN1gjbIOekMQzHAS
bqcAn21nXc76OfSDBPgmt+K4NSXzYULA
=+LdG
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
