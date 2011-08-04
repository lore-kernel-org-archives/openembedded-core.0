Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp65G-0005EU-Uq
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:08:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2011 15:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,319,1309762800"; d="scan'208";a="35520970"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2011 15:03:41 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 4 Aug 2011 15:03:41 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Thu, 4 Aug 2011 15:03:41 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 4 Aug 2011 15:03:41 -0700
Thread-Topic: [OE-core] [PATCH 06/10] kernel, module-base.bbclass: fix
	KERNEL_LD & KERNEL_AR vars
Thread-Index: AcxS8Jqa+ULSwxa+T6u981vPucXqkgAAYFUQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE85F4BE@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<e4f4b9c5a4b28f252e30c4b92cdfc3c624bc22e5.1312469790.git.nitin.a.kamble@intel.com>
	<1312494624.3169.1.camel@lenovo.internal.reciva.com>
In-Reply-To: <1312494624.3169.1.camel@lenovo.internal.reciva.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 06/10] kernel, module-base.bbclass: fix KERNEL_LD & KERNEL_AR vars
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
X-List-Received-Date: Thu, 04 Aug 2011 22:08:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Thursday, August 04, 2011 2:50 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 06/10] kernel, module-base.bbclass: fix
> KERNEL_LD & KERNEL_AR vars
>=20
> On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > KERNEL_LD was using ${LD} in it's definition, which is not correct
> for
> > different ABIs such as x32 or i386 on x86_64 machine.
> >
> > Same with KERNEL_AR var.
>=20
> Why is ar an issue?  That doesn't have any unusual args, does it?
>=20
> p.

No special args for ar, but The change makes definition of KERNEL_AR consis=
tent with other definitions like KERNEL_CC & KERNEL_LD.

Nitin
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


