Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RNx1t-0003WI-18
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 02:32:42 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Nov 2011 17:26:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="72526839"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 08 Nov 2011 17:26:24 -0800
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 9 Nov 2011 09:25:34 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 9 Nov 2011 09:25:34 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Wed, 9 Nov 2011
	09:25:20 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 9 Nov 2011 09:25:19 +0800
Thread-Topic: [OE-core] [PATCH 1/1] multilib: Drop MULTILIB_IMAGE_INSTALL
Thread-Index: AcyeIuYQUdldyDuvT0iqWWjkhFR5zwAWtQPA
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12DBAD34CB@shsmsx501.ccr.corp.intel.com>
References: <cover.1320732950.git.dongxiao.xu@intel.com>
	<8d5fb3fc99567457b497c859f333fe68b49806cb.1320732950.git.dongxiao.xu@intel.com>
	<1320762575.10843.45.camel@ted>
In-Reply-To: <1320762575.10843.45.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] multilib: Drop MULTILIB_IMAGE_INSTALL
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
X-List-Received-Date: Wed, 09 Nov 2011 01:32:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Tuesday, November 08, 2011 10:30 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 1/1] multilib: Drop MULTILIB_IMAGE_INSTALL
>=20
> On Tue, 2011-11-08 at 14:19 +0800, Dongxiao Xu wrote:
> > There should just be a single IMAGE_INSTALL variable. If the package
> > backends need this split into different multilib components they
> > should be responsible for doing this, not the user.
> >
> > This commit removes the MULTILIB_IMAGE_INSTALL variable.
> >
> > [YOCTO #1564]
> >
> > Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > ---
> >  meta/classes/image.bbclass       |    4 +---
> >  meta/classes/multilib.bbclass    |    5 ++---
> >  meta/classes/package_ipk.bbclass |   31
> ++++++++++++++++++++++++++++---
> >  meta/classes/package_rpm.bbclass |   37 +++++++++---------------------=
-------
> >  meta/classes/rootfs_ipk.bbclass  |    3 +--
> >  meta/classes/rootfs_rpm.bbclass  |    3 +--
> >  6 files changed, 42 insertions(+), 41 deletions(-)
>=20
> I'll take this as its a definite improvement over the current situation.
> I did however wonder what happens if we try something tri-arch e.g.
> i586, x86_64 and x32?
>=20
> I get the feeling both package backends could really use some cleanup now=
 we
> have the basics working and better abstraction of the code so we can loop=
 over
> something like tri-arch (or more) easily...

Thanks for merging it.

Currently the tri-arch multilib is not tested, and suppose there will be bu=
gs inside.
As you said, we can take this into consideration when doing a whole cleanup=
 for both rpm and ipk packaging.
Yes we do need that kind of cleanup since different people have different t=
hinking logic and coding style. For multilib it is better to unify them.

Thanks,
Dongxiao

>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


