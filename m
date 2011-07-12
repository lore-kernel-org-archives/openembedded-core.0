Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QgVWi-0006TY-Rh
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 07:28:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jul 2011 22:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,518,1304319600"; d="scan'208";a="26590302"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 22:24:57 -0700
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 12 Jul 2011 13:24:19 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server
	(TLS) id 14.1.289.1; Tue, 12 Jul 2011 13:24:19 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Tue, 12 Jul 2011 13:24:18 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jul 2011 13:24:17 +0800
Thread-Topic: [OE-core] [PATCH 0/2][PULL] alsa-tools: Fix recipe build error
Thread-Index: Acw9hkQSwdRc/78IRxSqxCKRwjcDpACzNubw
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6D85432@shsmsx501.ccr.corp.intel.com>
References: <cover.1310090994.git.dongxiao.xu@intel.com>
	<1310139923.20015.899.camel@rex>
In-Reply-To: <1310139923.20015.899.camel@rex>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 0/2][PULL] alsa-tools: Fix recipe build error
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
X-List-Received-Date: Tue, 12 Jul 2011 05:28:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Friday, July 08, 2011 11:45 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 0/2][PULL] alsa-tools: Fix recipe build err=
or
>=20
> On Fri, 2011-07-08 at 10:11 +0800, Dongxiao Xu wrote:
> > Hi Saul,
> >
> > This pull request fixes the alsa-tools recipe build error.
> > Please help to review and pull.
> >
> > [YOCTO #1038]
> >
> > Thanks,
> > Dongxiao
> >
> > The following changes since commit
> 2c79c9eb7ef8ef0aef8c3096c3c4387e28e56ea2:
> >
> >   pulseaudio: add 0.9.23 (2011-07-07 13:45:32 +0100)
> >
> > are available in the git repository at:
> >   git://git.pokylinux.org/poky-contrib dxu4/alsa-tools
> >
> > http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Ddxu4/alsa-tools
> >
> > Dongxiao Xu (2):
> >   fltk: add this recipe for alsa-tools build
> >   alsa-tools: Fix recipe build error.
>=20
> I'd like to understand whether we need gtk and fltk tools from alsa-tools=
 at this
> point in time?
>=20
> Could we just disable those?

I added those dependencies in since alsa-tools is not in our reference imag=
es (sato, sato-sdk, etc.), and it may not impact our daily builds.

Actually alsa-tools is a set of subprojects, we can disable certain sub-pro=
jects in alsa-tools to avoid including gtk and fltk.

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


