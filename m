Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QXMxf-0007Ia-AI
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 02:30:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Jun 2011 17:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,378,1304319600"; d="scan'208";a="14210843"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by azsmga001.ch.intel.com with ESMTP; 16 Jun 2011 17:27:29 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 17 Jun 2011 08:27:28 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Fri, 17 Jun 2011 08:27:27 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jun 2011 08:27:26 +0800
Thread-Topic: [OE-core] [PATCH 4/6] connman-gnome: Add 3G configuration support
Thread-Index: AcwsCBGPN6skPFhYTUWM3JOxYf0LkwAfPDvQ
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6721A5E@shsmsx501.ccr.corp.intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<c5f9a9413707c40c2839c4f72571d0440f8f59bf.1308215406.git.dongxiao.xu@intel.com>
	<FC24B0CA-5644-4123-9CE5-1BBBF64EB661@dominion.thruhere.net>
In-Reply-To: <FC24B0CA-5644-4123-9CE5-1BBBF64EB661@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 4/6] connman-gnome: Add 3G configuration	support
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
X-List-Received-Date: Fri, 17 Jun 2011 00:30:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Thursday, June 16, 2011 5:30 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 4/6] connman-gnome: Add 3G configuration
> support
>=20
>=20
> Op 16 jun 2011, om 11:20 heeft Dongxiao Xu het volgende geschreven:
>=20
> > Change connman-gnome to be git type recipe.
>=20
> It already is a git recipe...
>=20
> > --- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
> > +++ b/meta/recipes-connectivity/connman/connman-gnome_git.bb
>=20
> 'git' is not a valid PV, '0.5' is. Please don't break versioning like thi=
s.
>=20
> > +SRC_URI[md5sum] =3D "0e1c4c25d19cad9b08a216848a320716"
> > +SRC_URI[sha256sum] =3D
> "4d5fe481b444fc3e64fd9caa149dbcd76de166a25733f18fd93da01d2abf5d1c"
>=20
> What exactly is that checksumming?

The above changes are not necessary, I will remove it in next pull request.

Thanks,
Dongxiao

>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


