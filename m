Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SOsSM-0000Tr-S2
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 17:24:07 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Apr 2012 08:14:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94632313"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Apr 2012 08:14:21 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 30 Apr 2012 08:14:02 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.126]) by
	ORSMSX153.amr.corp.intel.com ([10.22.226.247]) with mapi id
	14.01.0355.002; Mon, 30 Apr 2012 08:14:02 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] eglibc: package mtrace separately
Thread-Index: AQHNI/99P/rGA9O4aECmGavcKib22JavREwAgABpEACAA9HIYA==
Date: Mon, 30 Apr 2012 15:14:02 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0309FA16@ORSMSX106.amr.corp.intel.com>
References: <cover.1335480719.git.nitin.a.kamble@intel.com>
	<385b9b6d43ea3d98d355edc50989d2e0ab488cd7.1335480719.git.nitin.a.kamble@intel.com>
	<4F9ABCEC.60403@linux.intel.com> <1335563534.7232.0.camel@ted>
In-Reply-To: <1335563534.7232.0.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] eglibc: package mtrace separately
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
X-List-Received-Date: Mon, 30 Apr 2012 15:24:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Friday, April 27, 2012 2:52 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 1/2] eglibc: package mtrace separately
>=20
> On Fri, 2012-04-27 at 08:36 -0700, Saul Wold wrote:
> > On 04/26/2012 03:53 PM, nitin.a.kamble@intel.com wrote:
> > > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> > >
> > > And install it only for nativesdk images
> > >
> > I think this needs to be in the -sdk images also, not just nativesdk.
>=20
> Why? Do we need mtrace in the nativesdk?
>=20
> I'm not sure why we're adding this.
>=20
This was in response to this bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2374

If I understand it correctly, Saul wanted to package mtrace separately to a=
void the perl dependency issue on fedora 17.
Nitin



