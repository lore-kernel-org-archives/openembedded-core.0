Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp6cy-0006rP-Vn
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:42:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Aug 2011 15:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,320,1309762800"; d="scan'208";a="35979816"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2011 15:38:32 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.226.10) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 4 Aug 2011 15:38:31 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx605.amr.corp.intel.com ([10.22.226.10]) with mapi; Thu, 4 Aug 2011
	15:38:31 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 4 Aug 2011 15:38:32 -0700
Thread-Topic: [OE-core] [PATCH] libc-package bbclass: fix binary localedata
	dependency code
Thread-Index: AcxS8fohSoxdzZL8TSezN6iyPtfRiAABEaNA
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE85F53E@orsmsx504.amr.corp.intel.com>
References: <1312296431-18991-1-git-send-email-koen@dominion.thruhere.net>
	<C9D28EB1-CE86-42E9-9825-0A408698FD66@dominion.thruhere.net>
	<1312297317.4325.46.camel@phil-desktop>
	<F2D133A8-03CF-408A-A22B-CCC200E2AF18@dominion.thruhere.net>
	<1312495226.3169.8.camel@lenovo.internal.reciva.com>
In-Reply-To: <1312495226.3169.8.camel@lenovo.internal.reciva.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Thu, 04 Aug 2011 22:42:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Thursday, August 04, 2011 3:00 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] libc-package bbclass: fix binary
> localedata dependency code
>=20
> On Wed, 2011-08-03 at 08:19 +0200, Koen Kooi wrote:
> > Op 2 aug. 2011, om 17:01 heeft Phil Blundell het volgende geschreven:
> >
> > > It does look a bit weird.  That code was introduced in 561d8754,
> > > ostensibly as a merger of the eglibc and glibc equivalents.  But,
> the
> > > original code from glibc-package.bbclass did:
> > >
> > >       def output_locale_binary_rdepends(name, pkgname, locale,
> encoding):
> > >               m =3D re.match("(.*)\.(.*)", name)
> > >               if m:
> > >                       glibc_name =3D "%s.%s" % (m.group(1),
> m.group(2).lower().replace("-",""))
> > >               else:
> > >                       glibc_name =3D name
> > >               bb.data.setVar('RDEPENDS_%s' % pkgname,
> legitimize_package_name('glibc-binary-localedata-%s' % glibc_name), d)
> > >
> > > ... i.e. it was using the "." separator both for splitting and
> joining,
> > > which seems reasonable.  But somehow when it showed up in
> > > libc-package.bbclass it had gotten transmogrified so that it split
> on
> > > "_" but joined with "." as you showed below.  That seems bogus to
> me.
>=20
> I'm not sure whether your original locale problem is still an issue,
> but
> I am still fairly convinced that the change to the regex in the code
> above was incorrect.  Unless the author of 561d8754 wants to speak up
> in
> its defence soon, I will submit a patch to change it back to using ".".
>=20
> p.
>=20
Phil,
   Feel free to do the right thing. :) I am out of context here, and need t=
o dig this further to understand the situation better.=20
Nitin


>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


