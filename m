Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QXO8F-0000gc-K6
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 03:45:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Jun 2011 18:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,378,1304319600"; d="scan'208";a="16008164"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga001.jf.intel.com with ESMTP; 16 Jun 2011 18:42:29 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 17 Jun 2011 09:41:33 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 17 Jun 2011 09:41:32 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jun 2011 09:41:32 +0800
Thread-Topic: [OE-core] [PATCH 5/6] systemtap: add fishriver in
	COMPATIBLE_MACHINE
Thread-Index: AcwsL4ngRzFLO6fcTieguPGZP35jUgAX/8HA
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6721B52@shsmsx501.ccr.corp.intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<baf12b233c03a619928269bdbe6754d3e4d483e0.1308215406.git.dongxiao.xu@intel.com>
	<1308233519.23788.2.camel@elmorro>
In-Reply-To: <1308233519.23788.2.camel@elmorro>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] systemtap: add fishriver in COMPATIBLE_MACHINE
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
X-List-Received-Date: Fri, 17 Jun 2011 01:45:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Tom Zanussi
> Sent: Thursday, June 16, 2011 10:12 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 5/6] systemtap: add fishriver in
> COMPATIBLE_MACHINE
>=20
> On Thu, 2011-06-16 at 02:20 -0700, Dongxiao Xu wrote:
> > Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > ---
> >  meta/recipes-kernel/systemtap/systemtap_git.bb |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb
> > b/meta/recipes-kernel/systemtap/systemtap_git.bb
> > index 8ac4c14..0d18e1d 100644
> > --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> > +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> > @@ -23,7 +23,7 @@ EXTRA_OECONF =3D "--prefix=3D${D}
> --with-libelf=3D${STAGING_DIR_TARGET} --without-rpm
> >  SRC_URI[md5sum]    =3D "cb202866ed704c44a876d041f788bdee"
> >  SRC_URI[sha256sum] =3D
> "8ffe35caec0d937bd23fd78a3a8d94b58907cc0de0330b35e38f9f764815c459"
> >
> > -COMPATIBLE_MACHINE =3D
> "(qemux86|qemux86-64|qemuppc|emenlow|crownbay|atom-pc|n450)"
> > +COMPATIBLE_MACHINE =3D
> "(qemux86|qemux86-64|qemuppc|emenlow|crownbay|atom-pc|n450|fishrive
> r)"
> >
> >  S =3D "${WORKDIR}/git"
> >
>=20
> This shouldn't be necessary if/when my patch from a couple of days ago,
> "[PATCH] systemtap: remove non-core COMPATIBLE_MACHINES" gets pulled
> in.

Hi Tom,

I just saw your patch is in master now. I will remove my piece.

Thanks,
Dongxiao

>=20
> Tom
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


