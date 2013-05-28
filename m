Return-Path: <nitin.a.kamble@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E10FB61F27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 16:25:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 May 2013 09:25:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,758,1363158000"; d="scan'208";a="344587159"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by fmsmga002.fm.intel.com with ESMTP; 28 May 2013 09:25:31 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.15]) by
	ORSMSX106.amr.corp.intel.com ([169.254.5.62]) with mapi id
	14.03.0123.003; Tue, 28 May 2013 09:25:31 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Eggleton, Paul" <paul.eggleton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] dropbear: a fix for hang in dropbearkey,
	built for x32
Thread-Index: AQHOWArHnmb8Vl14IEW2FUq6o2S8AJkayukQgAB3ZAD//4z/AA==
Date: Tue, 28 May 2013 16:25:30 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C70406D62@ORSMSX103.amr.corp.intel.com>
References: <cover.1369324957.git.nitin.a.kamble@intel.com>
	<f5d15445e6981c814b2726f916feb2ead0d3930c.1369324957.git.nitin.a.kamble@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C70406D1D@ORSMSX103.amr.corp.intel.com>
	<2106642.Q9pyc3AhWP@helios>
In-Reply-To: <2106642.Q9pyc3AhWP@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 1/1] dropbear: a fix for hang in dropbearkey, built for x32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 May 2013 16:25:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Eggleton, Paul
> Sent: Tuesday, May 28, 2013 9:15 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Kamble, Nitin A; Openembedded-core@lists.openembedded.org;
> Purdie, Richard; Wold, Saul
> Subject: Re: [OE-core] [PATCH 1/1] dropbear: a fix for hang in dropbearke=
y,
> built for x32
>=20
> On Tuesday 28 May 2013 16:10:33 Kamble, Nitin A wrote:
> > Saul, RP,
> >   FYI, this fix is still pending for oecore layer.
>=20
> It has already been merged:
Right, Thanks Paul for pointing it out. I missed rebasing my branch, and th=
ought it is not in yet...

Nitin


>=20
> http://cgit.openembedded.org/openembedded-
> core/commit/?id=3D8f5bc47729edb8cb051d81e9ff1680cb8d2eca25
>=20
> > Paul,
> >   This is for the 1.4.1 bug
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4496 . Once Saul or
> > RP pulls it in master, you can pull it in 1.4.1 release branch.
>=20
> OK; I have done this locally.
>=20
> Cheers,
> Paul

