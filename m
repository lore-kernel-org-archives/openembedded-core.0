Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RsjZ7-0002hA-4Y
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 00:26:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Feb 2012 15:18:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102173892"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by azsmga001.ch.intel.com with ESMTP; 01 Feb 2012 15:18:15 -0800
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 1 Feb 2012 15:18:14 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.31]) by
	ORSMSX151.amr.corp.intel.com ([169.254.7.182]) with mapi id
	14.01.0355.002; Wed, 1 Feb 2012 15:18:14 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/8] bdwgc: change the PV
Thread-Index: AQHM4Sxk2p0yyb6oz0ywUO1tSjIMUpYpJBsA//+IrxA=
Date: Wed, 1 Feb 2012 23:18:14 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C012FB226@ORSMSX106.amr.corp.intel.com>
References: <6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
	<e50f34e22b4a6fd1b7352affb529082c86f946c1.1328133261.git.nitin.a.kamble@intel.com>
	<1328135030.2716.163.camel@x121e.pbcl.net>
In-Reply-To: <1328135030.2716.163.camel@x121e.pbcl.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Subject: Re: [PATCH 3/8] bdwgc: change the PV
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
X-List-Received-Date: Wed, 01 Feb 2012 23:26:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Lets ignore this commit then. As PV can not take the "_" it does not help m=
e achieve what I wanted to. (Internal version tracking system).

Nitin



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Wednesday, February 01, 2012 2:24 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 3/8] bdwgc: change the PV
>=20
> On Wed, 2012-02-01 at 13:55 -0800, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  .../{bdwgc_20110107.bb =3D> bdwgc_7_2alpha5.bb}      |    0
>=20
> Why is this a good thing?  Does the "_" in the string actually do what
> you wanted?
>=20
> The commit message for this patch is, to put it mildly, poor.  Please
> see:
>=20
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#New_De
> velopment
>=20
> and, in particular the last two sentences of that section:
>=20
> "It is not acceptable to have an empty or non-existent header, or just
> a
> single line message. The summary and description is required for all
> changes."
>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


