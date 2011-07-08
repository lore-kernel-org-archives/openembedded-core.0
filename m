Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QfESv-0004J0-Pr
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 19:03:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Jul 2011 09:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="24515714"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by azsmga001.ch.intel.com with ESMTP; 08 Jul 2011 09:59:51 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 8 Jul 2011 09:59:50 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Fri, 8 Jul 2011 09:59:51 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jul 2011 09:59:49 -0700
Thread-Topic: [OE-core] eglibc issuettes continued
Thread-Index: Acw9jxeiy/BxS6CgSh282AVTzzkWHgAATnFA
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE226629@orsmsx504.amr.corp.intel.com>
References: <1310139697.6337.134.camel@phil-desktop>
	<1310143750.20015.911.camel@rex>
In-Reply-To: <1310143750.20015.911.camel@rex>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: eglibc issuettes continued
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
X-List-Received-Date: Fri, 08 Jul 2011 17:03:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I sent a patch to fix /etc/localtime & /etc/rpc files. Other than that I am=
 not seeing any issues for the eglibc recipe packaging.

Nitin


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Friday, July 08, 2011 9:49 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] eglibc issuettes continued
>=20
> On Fri, 2011-07-08 at 16:41 +0100, Phil Blundell wrote:
> > I'm not sure whether there are pending patches which will address
> these
> > or not, but with a fresh pull from today I'm still not getting very
> good
> > packaging for eglibc 2.13.  Specifically:
> >
> > WARNING: For recipe eglibc, the following files were installed but
> not
> > shipped in any package:
> > WARNING:   /etc/localtime
> > WARNING:   /etc/rpc
> > WARNING:   /etc/ld.so.conf
> > WARNING:   /lib/gconv/ISO-2022-CN-EXT.so
> > WARNING:   /lib/gconv/IBM921.so
> > [... etc ...]
> > WARNING:   /lib/gconv/.debug/ISO-2022-CN-EXT.so
> > WARNING:   /lib/gconv/.debug/IBM921.so
> > [... etc ...]
> > WARNING:   /share/i18n/charmaps/ISO-8859-15.gz
> > WARNING:   /share/i18n/charmaps/IBM285.gz
> > [... etc ...]
> > WARNING:   /share/i18n/locales/ss_ZA
> > WARNING:   /share/i18n/locales/is_IS
> > [... etc ...]
> > WARNING: QA Issue: libc-extra-nss rdepends on eglibc-dev
> > WARNING: QA Issue: libc-thread-db rdepends on eglibc-dev
> > ERROR: QA run found fatal errors. Please consider fixing them.
> >
> > I'm not sure if these are actually new or not, though.  It's possible
> > that they've been there for ages and I only just noticed.
>=20
> I'm guessing something is going wrong with prefixes somewhere. I'm
> certainly not seeing the bulk of those locally...
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


