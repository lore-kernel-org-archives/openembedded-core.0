Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCqvu-0004Jq-8x
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 13:20:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Mar 2012 04:11:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="82545749"
Received: from unknown (HELO helios.localnet) ([10.252.123.244])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Mar 2012 04:11:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 28 Mar 2012 12:11:49 +0100
Message-ID: <26662553.TyMenuqT12@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1203280659340.27661@oneiric>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
	<6668552.CMpgp5lzfB@helios>
	<alpine.DEB.2.02.1203280659340.27661@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Wed, 28 Mar 2012 11:20:54 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday 28 March 2012 07:06:21 Robert P. J. Day wrote:
> On Wed, 28 Mar 2012, Paul Eggleton wrote:
> > On Wednesday 28 March 2012 12:51:46 Marko Kati=C4=87 wrote:
> > > I always use "bitbake -c clean -c cleansstate package" for that p=
urpose.
> >=20
> > Firstly, cleansstate does a clean already, so no need to specify th=
at as
> > well.
> >=20
> > Secondly, images are always rebuilt so provided you comment out the=

> > IMAGE_INSTALL_append or whatever you have done to change the image
> > contents, you can just build the image again and it will be rebuilt=

> > as it was before.
>=20
>   i was testing the various solutions presented, and the first couple=

> worked just by changing the local.conf file (both adding and
> removing), but the third using DISTRO_EXTRA_RDEPENDS didn't appear to=

> make a difference after i added the appropriate line to local.conf.
>=20
>   if i add the line:
>=20
> DISTRO_EXTRA_RDEPENDS +=3D "sysfsutils"
>=20
> do you know if this requires an explicit reconfiguration of some kind=

> to be picked up?  it's exactly these niggling details i'm trying to
> clarify.

Yes, it will. You would need to clean and rebuild task-base because unl=
ike the=20
other methods the dependency gets built into a task package.

This is one of the reasons you should not use DISTRO_EXTRA_RDEPENDS fro=
m=20
local.conf - this is intended to be set from the distro configuration o=
nly.=20
Please don't recommend this to be modified from local.conf - stick to=20=

CORE_IMAGE_EXTRA_INSTALL (or IMAGE_INSTALL_append, if you must).

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


