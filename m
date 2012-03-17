Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S8hlI-0002DX-4U
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Mar 2012 01:44:49 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Mar 2012 17:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119990055"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by azsmga001.ch.intel.com with ESMTP; 16 Mar 2012 17:35:58 -0700
Received: from orsmsx105.amr.corp.intel.com (10.22.225.132) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 16 Mar 2012 17:35:57 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX105.amr.corp.intel.com ([169.254.4.199]) with mapi id
	14.01.0355.002; Fri, 16 Mar 2012 17:35:58 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 6/7] python-pycurl: fix packaging warnings
Thread-Index: AQHNA6cTySouFNp1wEGhei8c2lsWJ5ZuDOsA//+XUYA=
Date: Sat, 17 Mar 2012 00:35:57 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C01378348@ORSMSX106.amr.corp.intel.com>
References: <29a1b86fa5383e17f311314c38972b78d760fd92.1331924359.git.nitin.a.kamble@intel.com>
	<b10ee19a1ab989049aafcb0f8eefadf8296dc900.1331924359.git.nitin.a.kamble@intel.com>
	<1331941774.18586.214.camel@ted>
In-Reply-To: <1331941774.18586.214.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] python-pycurl: fix packaging warnings
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
X-List-Received-Date: Sat, 17 Mar 2012 00:44:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Friday, March 16, 2012 4:50 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 6/7] python-pycurl: fix packaging
> warnings
>=20
> On Fri, 2012-03-16 at 12:00 -0700, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > This commit fixes these packaging warnings:
> >  WARNING: For recipe python-pycurl, the following files/directories
> were
> > installed but not shipped in any package:
> >  WARNING:   /usr/share/share
> >
> > PR not bumber because no change in the output packages.
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  .../python/python-pycurl_7.19.0.bb                 |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
> b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
> > index d9fe465..8b849d7 100644
> > --- a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
> > +++ b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
> > @@ -29,3 +29,7 @@ export STAGING_INCDIR
> >  export STAGING_LIBDIR
> >
> >  BBCLASSEXTEND =3D "native"
> > +
> > +do_install_append() {
> > +	rm -rf ${D}${datadir}/share
> > +}
>=20
> What is actually in there? Is that a file or a directory?
>=20
> This is one of the cases it might be worth looking at why it exists at
> all as something looks wrong there at a deeper level...
>=20
That is an empty directory. Yes this need further looking why that director=
y existed in the 1st place.

Nitin


> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


