Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SQDcp-0005ph-0a
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 10:12:27 +0200
Received: by wgbds1 with SMTP id ds1so953545wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 01:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kBq8rYoYJ1IbQgU0HybzRJO0W8KOVQtcjOqxMt2oX5g=;
	b=lsjFF+xIYu7Vej5gtVTTlRulszsq4RF7Sbvmh/LyDR2zOKHbjC4XFYtPFtmwiHaKHR
	FqABeTJ7rHxOYGOUzD+nPQWOjissslL9uTmpf0EciDOQVAR2Z6tPTxowiReODgKDPkjr
	9RlewcGcX0g5HAVtAZKe36smbw+UTMgW+nNWA3wva/X9Q1IhZMKx26Xb88HksgksdxEg
	daZiYPDSLuh268hl/Lh6W858Gdt0fsegJ8S/1n4hT4/MdOzapJbg2OYpDkTYD7ozVgOC
	ZZbDzVM8UnnytSAYkCQUyLeaiNGVFCzKfPYaA5Du77RaZVyyopW/qwHsNLPcDMJgshZZ
	8maw==
Received: by 10.180.78.164 with SMTP id c4mr10534018wix.10.1336118560693;
	Fri, 04 May 2012 01:02:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff2sm12514033wib.9.2012.05.04.01.02.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 01:02:39 -0700 (PDT)
Date: Fri, 4 May 2012 10:02:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120504080242.GD3163@jama.jama.net>
References: <2FE2EDAA-66BE-4D28-AE9E-344308BF0DB3@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2FE2EDAA-66BE-4D28-AE9E-344308BF0DB3@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: How to fix warning: set SYSTEMD_PACKAGES as <existing-package>-systemd
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
X-List-Received-Date: Fri, 04 May 2012 08:12:27 -0000
X-Groupsio-MsgNum: 21646
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline

--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2012 at 09:54:35AM +0200, Elvis Dowson wrote:
> Hi,
>       I get the following warnings when I try to do bitbake core-image-mi=
nimal
>=20
> WARNING: /tool/yocto/meta-openembedded/meta-oe/recipes-connectivity/netwo=
rkmanager/networkmanager_0.9.2.0.bb: it is recommended to set SYSTEMD_PACKA=
GES as <existing-package>-systemd
>=20
> WARNING: /tool/yocto/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.=
bb: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
>=20
> What is the appropriate change to make these two warnings go away?

Check this thread
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg24=
963.html

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+jjSIACgkQN1Ujt2V2gBw0jwCeIJ4fVgGhURxnDgef8o2NFSGQ
M+4An3KdCbxbYcBIJDVp1C4D6uy5ayKE
=idnT
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
