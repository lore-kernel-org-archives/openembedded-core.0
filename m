Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp6tA-0007Wq-0e
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:59:40 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2011 15:55:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,320,1309762800"; d="scan'208";a="35292251"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by azsmga001.ch.intel.com with ESMTP; 04 Aug 2011 15:54:57 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.226.10) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 4 Aug 2011 15:54:57 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx605.amr.corp.intel.com ([10.22.226.10]) with mapi; Thu, 4 Aug 2011
	15:54:56 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 4 Aug 2011 15:54:56 -0700
Thread-Topic: [OE-core] [PATCH 10/10] local.conf.sample: make BBMASK
	assignment weak
Thread-Index: AcxS+Tzz/zyHtsUNQrmw5MepmOvhwAAAD8MQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE85F57C@orsmsx504.amr.corp.intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
	<e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<aa5a0621a4d7110828517949f4c07221e62b068c.1312469790.git.nitin.a.kamble@intel.com>
	<CA+M6bXnGxvjb7y23xss2epiaMXW3CWAK5Hq2ixPqM8iyATXuCA@mail.gmail.com>
In-Reply-To: <CA+M6bXnGxvjb7y23xss2epiaMXW3CWAK5Hq2ixPqM8iyATXuCA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 10/10] local.conf.sample: make BBMASK	assignment weak
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
X-List-Received-Date: Thu, 04 Aug 2011 22:59:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Tom Rini
> Sent: Thursday, August 04, 2011 3:53 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 10/10] local.conf.sample: make BBMASK
> assignment weak
>=20
> On Thu, Aug 4, 2011 at 8:01 AM,  <nitin.a.kamble@intel.com> wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > So that it can be overridden by layers if needed.
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> > =A0meta-yocto/conf/local.conf.sample | =A0 =A02 +-
> > =A01 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta-yocto/conf/local.conf.sample b/meta-
> yocto/conf/local.conf.sample
> > index 3e71b0a..4acec37 100644
> > --- a/meta-yocto/conf/local.conf.sample
> > +++ b/meta-yocto/conf/local.conf.sample
> > @@ -39,7 +39,7 @@ DISTRO ?=3D "poky"
> >
> > =A0# BBMASK is a regular expression that can be used to tell BitBake to
> ignore
> > =A0# certain recipes.
> > -BBMASK =3D ""
> > +BBMASK ?=3D ""
> >
> > =A0# EXTRA_IMAGE_FEATURES allows extra packages to be added to the
> generated images
> > =A0# (Some of these are automatically added to certain image types)
>=20
> In oe.dev we just dropped this from local.conf iirc since a real
> assignmnet was overriding a useful setting we provided.  IMHO, we
> should do the same here (or at least comment it out).

I agree. We should comment it out.
>=20
> --
> Tom
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


