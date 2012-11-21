Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbEDV-0005lO-40
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 18:36:05 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2816849eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 09:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q9dRDZ0QWI6zKs9Z890xhXiQt/5TThIMUKHvnTtIfqk=;
	b=Sy6jJIn2tVOCcPMdSGVOg6l8uQZq7SjRLUc7xQuPU70wE8zqh/vRE8Bm5Q6kC4p4Hf
	sFhIRVoNRn8M/g9xZUrP+dQFfkb+Cu7REtEVtO4hRYz6qHyloXGU+SAC6oZkX2e3XN7j
	lalmDndmSDHT2fouyW4H6GQcy5Mv7CA1o1XAGp8FNsii7c409TpC13KsxiiwInQ043mo
	Q3ILLqZOYZb2ORh+NoOZcgDIzqx5h1f6EU+KdB6oarSwDmyr8UpIjCHJB0lw/LEEh/Ex
	5IKGaIqhteWVimlvxhn9RT1MftX27of/VSTX5b89z9tmRJ+pu09Nx7/3OyaXMzvJTYUN
	FTiw==
Received: by 10.14.216.70 with SMTP id f46mr47369803eep.12.1353518519892;
	Wed, 21 Nov 2012 09:21:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q2sm1351996eem.13.2012.11.21.09.21.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 09:21:59 -0800 (PST)
Date: Wed, 21 Nov 2012 18:21:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121121172155.GL12637@jama.jama.net>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<7f73d8a0aee08a41e949ec7a1297f5edbf12ed57.1352898505.git.laurentiu.palcu@intel.com>
	<20121121162051.GK12637@jama.jama.net>
	<1353517951.10459.21.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1353517951.10459.21.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 12/12] xf86-video-omap: add new recipe to follow the maintained repo
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
X-List-Received-Date: Wed, 21 Nov 2012 17:36:05 -0000
X-Groupsio-MsgNum: 31616
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TdMwOTenGjBWB1uY"
Content-Disposition: inline

--TdMwOTenGjBWB1uY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2012 at 05:12:31PM +0000, Richard Purdie wrote:
> On Wed, 2012-11-21 at 17:20 +0100, Martin Jansa wrote:
> > On Wed, Nov 14, 2012 at 03:21:10PM +0200, Laurentiu Palcu wrote:
> > > This new recipe is needed because the old driver is unmaintained. This
> > > new recipe will follow the new repo.
> >=20
> > On which MACHINE did you test this? Here it fails in do_configure with:
> > | configure:18796: result: yes
> > | configure:18808: checking whether to include DRI support
> > | configure:18812: checking for /usr/include/xorg/dri.h
> > | configure:18818: error: cannot check for file existence when cross co=
mpiling
> >=20
> > So I'm wondering if it was tested at all.
> >=20
> > With xf86-video-omapfb not ported to xserver-1.13 video API it makes new
> > default xserver from oe-core unusable on many armv7a machines..
>=20
> /usr/include/xorg/dri.h probably existed on the machine it was tested
> on. I appreciate this needs to get fixed but I know it was tested.

Doesn't AC_CHECK_FILE macro fail the same when it does exist?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TdMwOTenGjBWB1uY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCtDbMACgkQN1Ujt2V2gBzhYgCfaUClxd4u0a7ooSyP0rIP5GLi
R5MAoJrrivFUfA1Pi9vUUZI2pfkzVUaz
=yook
-----END PGP SIGNATURE-----

--TdMwOTenGjBWB1uY--
