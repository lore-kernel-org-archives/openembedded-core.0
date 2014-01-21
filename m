Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id A43DD6E367
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:58:26 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so4136057ead.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 14:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4u6ODRElKlk8rOZyMVOnD/kM0Iw1xnrhDQc0cjdCYUA=;
	b=AtVCV9zXB0LWv8/wMYrNiKPigSt/DCVahK2XXxNE/0PYUpKx3PhK1U/Hr4nhYg6l/7
	SnWv/OtmGyQAi670IHl+FTlizFRFtoKfW7/VohpFmBBPEOZGVWzHcyC01IKNuF/WGbTw
	NXHsesXbky3fGDytlg96QZ76TBZiDd7pqFx8fge9M/dvekgrwlZ7QnBZDLQ3SWicgc0X
	Fky7OpPCl6SFJ05M/F+jmNay4R0xb5VOOgDYnNr4rnfZH+Vyf92V05Shkl2Urs7JinRs
	8hpTL8s04ljKRy8NcUYlWt7YqIkLormkzyQdBWTOjxvApwPAVbvfHOZ6BLwU22NWPZ9L
	RGIA==
X-Received: by 10.14.127.132 with SMTP id d4mr4406226eei.66.1390345107185;
	Tue, 21 Jan 2014 14:58:27 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	d43sm19892243eeo.12.2014.01.21.14.58.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 14:58:25 -0800 (PST)
Date: Tue, 21 Jan 2014 23:58:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20140121225825.GM4100@jama>
References: <cover.1390342768.git.dvhart@linux.intel.com>
	<c65b846c5d5882f4adcb504ca01291173bd4bcf8.1390342768.git.dvhart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <c65b846c5d5882f4adcb504ca01291173bd4bcf8.1390342768.git.dvhart@linux.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/15] genericx86: Use the core2 tune file
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
X-List-Received-Date: Tue, 21 Jan 2014 22:58:27 -0000
X-Groupsio-MsgNum: 49310
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aiCxlS1GuupXjEh3"
Content-Disposition: inline

--aiCxlS1GuupXjEh3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2014 at 02:39:58PM -0800, Darren Hart wrote:
> Aside from the movbe and specialized instruction scheduling for the lack
> of out-of-order scheduling in the older Atom CPUs, the core2 tune covers
> these CPUs adequately. Since the current atom tune just uses core2
> anyway, go ahead and make this explicit here.
>=20
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
>  meta-yocto-bsp/conf/machine/genericx86.conf |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-yocto-bsp/conf/machine/genericx86.conf b/meta-yocto-bsp=
/conf/machine/genericx86.conf
> index 9d29f62..549fc8e 100644
> --- a/meta-yocto-bsp/conf/machine/genericx86.conf
> +++ b/meta-yocto-bsp/conf/machine/genericx86.conf

This isn't for oe-core, is it?

> @@ -3,5 +3,6 @@
> =20
>  #@DESCRIPTION: Machine configuration for generic X86 (32-bit) PCs. Suppo=
rts a moderately wide range of drivers that should boot and be usable on "t=
ypical" hardware.
> =20
> -include conf/machine/include/tune-atom.inc
> +DEFAULTTUNE ?=3D "core2-32"
> +include conf/machine/include/tune-core2.inc
>  include conf/machine/include/genericx86-common.inc
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aiCxlS1GuupXjEh3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLe+5EACgkQN1Ujt2V2gBxd+ACgqN+H2M8pY6wXcGyBd9QR1ig2
n3MAnjtJhazkUPvYJ3mEARH6GCZnQ8/C
=GOCq
-----END PGP SIGNATURE-----

--aiCxlS1GuupXjEh3--
