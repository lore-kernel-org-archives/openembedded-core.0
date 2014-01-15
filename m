Return-Path: <dvhart@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 221B86B4F7;
	Wed, 15 Jan 2014 05:22:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jan 2014 21:22:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,660,1384329600"; 
	d="asc'?scan'208";a="458996556"
Received: from unknown (HELO [10.255.12.195]) ([10.255.12.195])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2014 21:22:42 -0800
Message-ID: <1389763343.3092.17.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Jan 2014 21:22:23 -0800
In-Reply-To: <20140109144245.GF3709@jama>
References: <20140106112936.C3F0C50472@opal> <20140109144245.GF3709@jama>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : autogen-native: upgrade to 5.18.2
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
X-List-Received-Date: Wed, 15 Jan 2014 05:22:42 -0000
X-Groupsio-MsgNum: 48996
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-WsC6bwxqRjgUtOIetivM"

--=-WsC6bwxqRjgUtOIetivM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2014-01-09 at 15:42 +0100, Martin Jansa wrote:
> On Mon, Jan 06, 2014 at 11:29:36AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 6bcd2dafa379badab11bff9d7b607f7f5d72fc94
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D6bcd2dafa379badab11bff9d7b607f7f5d72fc94
> >=20
> > Author: Robert Yang <liezhi.yang@windriver.com>
> > Date:   Fri Dec 27 01:05:14 2013 +0800
> >=20
> > autogen-native: upgrade to 5.18.2
> >=20
> > * Upgrade from 5.17.4 to 5.18.2
> > * Rename files -> autogen
> >=20
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> Fails in world builds:

Guessing I'm behind somewhere - seeing this as well. I thought it was an
sstate issue, but doesn't appear to be. Is this addressed in a MUT build
or something already?


--=20
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


--=-WsC6bwxqRjgUtOIetivM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAABAgAGBQJS1hsPAAoJEKbMaAwKp364uzcIAI8ikqxRWpv4EEt4w3P1JTtF
GKUAJDp6dwhXx/Jqhr9YR3t6K/YQsqGxL+zSuHgQ4GgFXbKBHJzNU5ebIBXOPl/+
hSX++rJzRVNeKqgNLLz4wYJ/3GYTyRmq/hYbEDaeFvmhLyCngqtjmHqQJv0O2iwE
MuVPT/jOQqHiBMwK/ZVEnpQJMn3coAUn/syxl3+VCz3jCotksgVmvbTi7xQy1l2B
SD12qXu1Q/azhqCVrruoqlkcJ2XR8GBDFD2qmRZq2hvYO7/kg/5cgvDhwZ2UwtM3
/LidWZRYDYaGH71Z6P4aRwGh0NBshlwv5Rfj6KGx+hD3KrsIaYi9rdALDN+bZo0=
=LKCj
-----END PGP SIGNATURE-----

--=-WsC6bwxqRjgUtOIetivM--
