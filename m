Return-Path: <juro.bystricky@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C4F4F601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 20:46:40 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 14 Sep 2016 13:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,335,1470726000"; d="scan'208";a="168222416"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
	by fmsmga004.fm.intel.com with ESMTP; 14 Sep 2016 13:46:41 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.16]) by
	ORSMSX105.amr.corp.intel.com ([169.254.2.172]) with mapi id
	14.03.0248.002; Wed, 14 Sep 2016 13:46:39 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Seebs <seebs@seebs.net>, "Fan, Wenzong (Wind River)"
	<wenzong.fan@windriver.com>
Thread-Topic: [OE-core] pseudo 1.8.1 doesn't work with docker & dumb-init
Thread-Index: AQHSA2kVcWdNnETw+kGQp6SoDdMCUKBjrMEAgAI11ACAAAosgIAIJQgAgAACEgCAC3U4MA==
Date: Wed, 14 Sep 2016 20:46:38 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B61188FFD1@ORSMSX112.amr.corp.intel.com>
References: <e33a2d23-6067-cf14-57ab-d40623a3597a@windriver.com>
	<1A4DD5F0-D89E-4FC1-820A-457817B4FCD3@seebs.net>
	<b59ea47c-1b82-c480-5d9f-7dfb8051f83a@windriver.com>
	<BDCB4B3D-E034-4AFD-915C-8DDE5B66D76D@seebs.net>
	<c4af9282-ed95-b7fc-f263-4a66eccfa4bf@windriver.com>
	<9478781A-C1DD-46F5-B447-04D324E9EBA6@seebs.net>
In-Reply-To: <9478781A-C1DD-46F5-B447-04D324E9EBA6@seebs.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: pseudo 1.8.1 doesn't work with docker & dumb-init
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
X-List-Received-Date: Wed, 14 Sep 2016 20:46:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am pretty sure I glimpsed the messages:=20
	Child process timeout after 2 seconds.
    	Child process exit status 4: lock_held
on several occasions recently, just before my Xserver was restarted and I w=
as kicked back to the login prompt. =20
I typically ran several parallel bitbake builds. Ubuntu 16.04, not using co=
ntainer. The last message in the syslog (first error message) was always:
Fatal IO error 11 (Resource temporarily unavailable) on X server :0

Possibly not related to this problem, nevertheless worth mentioning.

Thanks

Juro


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Seebs
> Sent: Tuesday, September 6, 2016 11:40 PM
> To: Fan, Wenzong (Wind River) <wenzong.fan@windriver.com>
> Cc: Patches and discussions about the oe-core layer <openembedded-
> core@lists.openembedded.org>
> Subject: Re: [OE-core] pseudo 1.8.1 doesn't work with docker & dumb-init
>=20
> On 7 Sep 2016, at 1:32, wenzong fan wrote:
>=20
> > Yes, I believe it's not a 100 reproducible issue. Maybe you could run
> > it with other builds in parallel and try it 3 times or more.
>=20
> I can try, but that might need bigger hardware than I have to hand at
> the moment.
>=20
> -s
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

