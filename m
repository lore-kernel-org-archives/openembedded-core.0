Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwvAb-00010m-OK
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 15:10:29 +0200
Received: by wibhm2 with SMTP id hm2so4932007wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 05:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V2o3ewpmPGjCeCKHWIwYBOvBVT6KyRjkbZbbaXH2r9k=;
	b=aOU18IJaEJ0gYq2HAUc4oqBBkwJKgrX8AfUI/36/F3dlyexfM1IhWKFqwBTIgI2VlX
	MhxBFRz2fCAUBZo9U9BrmEMsCoccNCI/iBHMmDitZM1oUGJscFgRi24JQqdHP/s9SF9H
	yx5arKAroaQKpViRu3XinAS4ZN0+CfnMdcVjES+ZrEhGrzeaGEaQ5t9QoNwjOYXf5D3M
	7tIn2eZj93z+pfnM7M9KvB4zZuY6ukDaQBCTNxR/ltF/BSTAgu6PTMv1HW0ZvAN7Lqb5
	jHMPNSOBJV+zsSzhO9tMmN5H2iDASAkwQt8A7UhSUdMw8qCVr84SXNsBOBX8/mO6bAZY
	Xa2A==
Received: by 10.216.132.76 with SMTP id n54mr10368409wei.135.1343912330247;
	Thu, 02 Aug 2012 05:58:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm33524380wiz.0.2012.08.02.05.58.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 05:58:48 -0700 (PDT)
Date: Thu, 2 Aug 2012 14:58:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120802125846.GP16306@jama.jama.net>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
	<CAJTo0LY4e_Boi-RU4iyu+_2gRvuvLO40b2Pu8FsCRnXqSdACvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY4e_Boi-RU4iyu+_2gRvuvLO40b2Pu8FsCRnXqSdACvQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/9] buildhistory improvements
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
X-List-Received-Date: Thu, 02 Aug 2012 13:10:29 -0000
X-Groupsio-MsgNum: 26777
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fjEAjMKpll6GDq3U"
Content-Disposition: inline

--fjEAjMKpll6GDq3U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2012 at 12:27:05PM +0100, Burton, Ross wrote:
> On 2 August 2012 10:23, Paul Eggleton <paul.eggleton@linux.intel.com> wro=
te:
> > A bunch of improvements for buildhistory, implementing some feature
> > requests and todo items of my own, as well as tidying up some of the
> > code.
>=20
> I've been using this branch for an hour or so whilst reviewing
> changes, the new features are useful and it didn't break.
>=20
> Acked-by: Ross Burton <ross.burton@intel.com>

My tests also look good, some interesting (expected) changes recorded
here

http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=3D2fe=
33b15dcec9eb69f9075f138cea2405c061b00

Thanks!

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fjEAjMKpll6GDq3U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAaeYYACgkQN1Ujt2V2gBzcIACeKYLzAef1seJyD0t5PoFmxdDK
eKYAnifK5yNUX/rA/PhHtQFF+ae+Ov0u
=CPjp
-----END PGP SIGNATURE-----

--fjEAjMKpll6GDq3U--
