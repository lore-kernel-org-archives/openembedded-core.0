Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1PxOnp-0002go-39
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 20:12:09 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Mar 2011 11:10:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,291,1297065600"; d="scan'208";a="400166605"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by azsmga001.ch.intel.com with ESMTP; 09 Mar 2011 11:10:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Wed, 9 Mar 2011 11:10:31 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Wed, 9 Mar 2011 11:10:31 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, "poky@yoctoproject.org"
	<poky@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 9 Mar 2011 11:10:12 -0800
Thread-Topic: PERL and FULLPERL from MakeMaker.pm
Thread-Index: AcveM0YGcH81/0D5RISKxkoSUI7zawAWh25g
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE9431E845BA@orsmsx504.amr.corp.intel.com>
References: <625BA99ED14B2D499DC4E29D8138F150575567B0A1@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <625BA99ED14B2D499DC4E29D8138F150575567B0A1@shsmsx502.ccr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: PERL and FULLPERL from MakeMaker.pm
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
X-List-Received-Date: Wed, 09 Mar 2011 19:12:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Tian, Kevin
> Sent: Wednesday, March 09, 2011 12:24 AM
> To: poky@yoctoproject.org; openembedded-core@lists.openembedded.org
> Cc: Kamble, Nitin A
> Subject: PERL and FULLPERL from MakeMaker.pm
>=20
> Hi, all,
>=20
> I just found that several perl-based projects (e.g. sgmlspl and git)
> failed to find
> ExtUtils modules, when sstate cache is used for perl-native while
> original build
> directory generating sstate packages have been deleted.
>=20
> We have a perl wrapper to make sure @INC correctly including current
> build
> sysroot, which however doesn't solve the problem seen here.
>=20
> Those projects make use of MakeMaker.pm to generate their Makefiles on
> the
> fly, while MakeMaker.pm generates below lines:
>=20
> PERL =3D /media/builds-0/demo-0309/tmp/sysroots/x86_64-
> linux/usr/bin/perl.real
> FULLPERL =3D
> /media/builds-0/demo-0309/tmp/sysroots/x86_64-linux/usr/bin/perl.real
>=20
> I can work around the issues by manually changing Makefile when the
> error
> occurs.
>=20
> I know little about perl internals, and thus would like to know whether
> it's a
> easy issue to tackle. I didn't find any explicit files containing a
> perl.real from
> perl-native sstate package, except the perl wrapper script. So it's
> interesting
> how MakeMaker.pm finds the perl.real binary.
>=20
> I reported a bug at:
> http://bugzilla.yoctoproject.org/post_bug.cgi
>=20
> Thanks,
> Kevin

Kevin,
  Looks like the build path for perl.real is used. I think it should be a p=
ath from the native sysroot. Thanks for opening the bug.
Thanks,
Nitin



