Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QK09S-0000aO-Fj
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 05:31:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2011 20:29:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; 
   d="scan'208";a="702382"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2011 20:28:54 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 10 May 2011 20:28:54 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Tue, 10 May 2011 20:28:54 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Gary Thomas <gary@mlbassoc.com>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 May 2011 20:28:53 -0700
Thread-Topic: [poky] GCC 4.6.0 on ARM?
Thread-Index: AcwIyJNbynKMIDwESuGhducxL+Cx2wGwuZoQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94D88F0101@orsmsx504.amr.corp.intel.com>
References: <4DB99F31.4000308@mlbassoc.com>
	<BANLkTikaf3MHYrnbvHDno3dSv_LhsLyFVg@mail.gmail.com>
	<BANLkTi=G-4UfXNdnJSy7qF3gb0-xLr6+4Q@mail.gmail.com>
	<4DBEAA2C.1020601@mlbassoc.com>
In-Reply-To: <4DBEAA2C.1020601@mlbassoc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: Poky Project <poky@yoctoproject.org>, Patches,
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] GCC 4.6.0 on ARM?
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
X-List-Received-Date: Wed, 11 May 2011 03:31:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: poky-bounces@yoctoproject.org [mailto:poky-
> bounces@yoctoproject.org] On Behalf Of Gary Thomas
> Sent: Monday, May 02, 2011 5:57 AM
> To: Khem Raj
> Cc: Poky Project; Patches and discussions about the oe-core layer
> Subject: Re: [poky] GCC 4.6.0 on ARM?
>=20
> On 04/30/2011 04:10 PM, Khem Raj wrote:
> > On Thu, Apr 28, 2011 at 11:23 AM, Khem Raj<raj.khem@gmail.com>
> wrote:
> >> On Thu, Apr 28, 2011 at 10:09 AM, Gary Thomas<gary@mlbassoc.com>
> wrote:
> >>> I got my OMAP target to build with GCC-4.6.0 using the latest
> >>> Poky tree after a fresh rebuild.  Sadly, the Linux kernel
> (2.6.37.3)
> >>> does not run correctly when built with this compiler.  It
> >>> fails when enumerating the USB bus :-(
> >>>
> >>> Are there known issues with the Linux kernel on ARM and GCC-4.6?
> >>>
> >>
> >> There has been fixes on top of 4.6.0 the one we have right now is
> vanilla
> >> 4.6.0 release. I plan to add second set of patches but you have to
> dig a bit
> >> more to identify the problem
> >>
> >
> > I have some updates for gcc 4.6.0
> > they are staged in
> >
> > http://git.openembedded.org/cgit.cgi/openembedded-core-
> contrib/log/?h=3Dkraj/gcc-4.6
> >
> > (top 3 patches)
> >
> > Please test them out and if you are lucky
> > your problem might be fixed too.
> >
> > All, please try these patches and provide any feedback
>=20
> I was able to build my kernel (ARM OMAP/3530 based) using this, but
> the USB still doesn't work, so no improvement, sorry.

Gary,
 Is the USB breakage is due to gcc 4.6.0 ?

Thanks,
Nitin

>=20
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky


