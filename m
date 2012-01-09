Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Rk8HZ-0000ND-9L
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 07:00:33 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jan 2012 21:53:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="94283668"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga001.jf.intel.com with ESMTP; 08 Jan 2012 21:53:05 -0800
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sun, 8 Jan 2012 21:53:04 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.229]) by
	ORSMSX151.amr.corp.intel.com ([169.254.7.170]) with mapi id
	14.01.0355.002; Sun, 8 Jan 2012 21:53:04 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] eglibc: Upgrade recipes 2.14 -> 2.15
Thread-Index: AQHMzCUG3QQ9CEymOE63C0FLBhqCf5X+x1nQgACqywCAADDtQIAA2yEAgADrUcA=
Date: Mon, 9 Jan 2012 05:53:04 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C01596D@ORSMSX106.amr.corp.intel.com>
References: <1325821207-2843-1-git-send-email-raj.khem@gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C014BC2@ORSMSX106.amr.corp.intel.com>
	<4F069E36.7000600@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C014F82@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sqrrShTqFjoutMxgtNuU2n2u31wftB9n=Wsy6FGPyvngA@mail.gmail.com>
In-Reply-To: <CAMKF1sqrrShTqFjoutMxgtNuU2n2u31wftB9n=Wsy6FGPyvngA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH] eglibc: Upgrade recipes 2.14 -> 2.15
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
X-List-Received-Date: Mon, 09 Jan 2012 06:00:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Friday, January 06, 2012 3:09 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] eglibc: Upgrade recipes 2.14 -> 2.15
>=20
> On Fri, Jan 6, 2012 at 10:07 AM, Kamble, Nitin A
> <nitin.a.kamble@intel.com> wrote:
> > That is a big change for x32, It may work out or not, last time x32 +
> eglibc-2.15 was causing some issues which were I think actually more
> eglibc-2.15 issues. The worst case is I can move the eglibc-2.14 recipe
> into the meta-x32 layer.
>=20
> If you are not on a release trail I would suggest to try 2.15. You can
> move the recipes to a
> layer certainly but its better to keep less versions around for
> maintenance sake. what problems do u envision that can happen with
> 2.15 ?

I do not remember all the issues now, but I was seeing more failures. I can=
 give it a try with 2.15 and see how it goes.

Thanks,
Nitin

>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


