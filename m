Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TP8Ol-0007nY-IT
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 10:57:43 +0200
Received: by mail-wi0-f169.google.com with SMTP id hq4so646wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BgDRQggNkIR1nQReiRS5Byb6SUQSjGd9xE+zxCxA5mY=;
	b=nMigwiVYsp/hUSUYAT/xZO3cMyb9z/ay9z2uvcOIXOh1JoOXvRJkvNzAEvGPB7CSbA
	18R2IYdA7pJ5mKpdc8GcdiOnSJY4Q/jsMYHHYN+zrWNLHhaLePedQCrE4xQyQj7AClLa
	KoG3jwkREy85D6RQV33nxcReQqQjmaymPtPSJxRognozsZwNuYibt7iaEDOznbBKM9N9
	w7N5yTWAqHr+PZ8Sd2NJyOuCWKiJn2xJpNncBNRcQxTdFnsYlQyVGtViARA+ILUgdb6p
	ztipqXbZwbT9P13o1CYQM8n+sbnkMeKEMfVrnCvGz0atgiP4bkclkwwXUFLB+cB9a6iP
	+3fw==
Received: by 10.216.150.197 with SMTP id z47mr330163wej.221.1350636263273;
	Fri, 19 Oct 2012 01:44:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ei1sm2194066wid.7.2012.10.19.01.44.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 01:44:21 -0700 (PDT)
Date: Fri, 19 Oct 2012 10:44:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20121019084432.GH3087@jama.jama.net>
References: <1350600718-3052-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1350600718-3052-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Denys Dmytriyenko <denys@ti.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Add more tunes for new ARM processors Cortex-A15 and Cortex-A7
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
X-List-Received-Date: Fri, 19 Oct 2012 08:57:43 -0000
X-Groupsio-MsgNum: 30722
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3VRmKSg17yJg2MZg"
Content-Disposition: inline

--3VRmKSg17yJg2MZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 06:51:56PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> The patchset adds 2 more standard tune files for the new ARM MPCore (mult=
icore)
> processors Cortex-A15 and Cortex-A7, as per:
>=20
> http://www.arm.com/products/processors/cortex-a/cortex-a15.php
> http://www.arm.com/products/processors/cortex-a/cortex-a7.php

Please check this patchset=20
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/030759.=
html

>=20
> Denys Dmytriyenko (2):
>   tune-cortexa15: add tunes for ARM Cortex-A15
>   tune-cortexa7: add tunes for ARM Cortex-A7
>=20
>  meta/conf/machine/include/tune-cortexa15.inc | 24 ++++++++++++++++++++++=
++
>  meta/conf/machine/include/tune-cortexa7.inc  | 24 ++++++++++++++++++++++=
++
>  2 files changed, 48 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-cortexa15.inc
>  create mode 100644 meta/conf/machine/include/tune-cortexa7.inc
>=20
> --=20
> 1.7.12.3
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3VRmKSg17yJg2MZg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCBEvAACgkQN1Ujt2V2gBwhHQCeOiuAzz5ZyMWbrjT6xewxVpqa
qMEAn2M7kYPvFwJ5ielUEBoS9XV9Lag4
=GCd4
-----END PGP SIGNATURE-----

--3VRmKSg17yJg2MZg--
