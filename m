Return-Path: <raymond.tan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DB86D71A90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 10:35:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 13 Oct 2016 03:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,339,1473145200"; d="scan'208";a="1053252547"
Received: from pgsmsx105.gar.corp.intel.com ([10.221.44.96])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2016 03:35:59 -0700
Received: from pgsmsx104.gar.corp.intel.com ([169.254.3.75]) by
	PGSMSX105.gar.corp.intel.com ([169.254.4.63]) with mapi id
	14.03.0248.002; Thu, 13 Oct 2016 18:35:58 +0800
From: "Tan, Raymond" <raymond.tan@intel.com>
To: "Hatle, Mark G (Wind River)" <mark.hatle@windriver.com>, Khem Raj
	<raj.khem@gmail.com>
Thread-Topic: [OE-core] openssl: OpenSSL 1.1.x update
Thread-Index: AdIfdbrhyJZXjVcGT8iRVZfchXpupf//gpIAgAAHJwCAAL6MAIAAEPeAgAAE9YD/9NFoMA==
Date: Thu, 13 Oct 2016 10:35:57 +0000
Message-ID: <F0CA9E243F4F424B836EAC30E41BF4CF5DF55A2F@PGSMSX104.gar.corp.intel.com>
References: <F0CA9E243F4F424B836EAC30E41BF4CF5DF514DB@PGSMSX104.gar.corp.intel.com>
	<a3c142bf-8c0b-3f90-dda9-7f72dd4da1cf@windriver.com>
	<CAMKF1spG=v7_wb_VYktNBL7NTan28NbB47G7u2B_-E43jBL8vQ@mail.gmail.com>
	<687e0950-a18a-5d44-aeae-18517df275e6@windriver.com>
	<4F081825-2EC8-4F85-9E55-1E24F215723D@gmail.com>
	<89015693-dfeb-5b47-7c2b-386c85571dec@windriver.com>
In-Reply-To: <89015693-dfeb-5b47-7c2b-386c85571dec@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "Gupta, Rahul KumarXX" <rahul.kumarxx.gupta@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl: OpenSSL 1.1.x update
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
X-List-Received-Date: Thu, 13 Oct 2016 10:35:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Warm Regards,=20

=A0Raymond Tan

> -----Original Message-----
> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> Sent: Thursday, October 06, 2016 11:40 PM
> To: Khem Raj <raj.khem@gmail.com>
> Cc: Tan, Raymond <raymond.tan@intel.com>; openembedded-
> core@lists.openembedded.org; Gupta, Rahul KumarXX
> <rahul.kumarxx.gupta@intel.com>
> Subject: Re: [OE-core] openssl: OpenSSL 1.1.x update
>=20
> On 10/6/16 10:22 AM, Khem Raj wrote:
> >
> >> On Oct 6, 2016, at 7:21 AM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
> >>
> >> On 10/5/16 9:59 PM, Khem Raj wrote:
> >>> On Wed, Oct 5, 2016 at 7:33 PM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
> >>>> On 10/5/16 9:11 PM, Tan, Raymond wrote:
> >>>>> Greetings, I would like to know if there is any plan / schedule to =
upgrade
> to openssl 1.1.0 into OE-core?
> >>>>
> >>>> Currently 1.0.2 is the LTS version of OpenSSL.  1.1.0 is not schedul=
ed to be
> LTS.
> >>>>
> >>>> For the upcoming release (soon), I would NOT expect 1.1.0 to be in
> >>>> it.  There are still too many incompatibilities with other component=
s.
> >>>>
> >>>> For the next version of OE, I think it is appropriate to include
> >>>> 1.1.0, but I would also like to maintain 1.0.2 for the time being.
> >>>> (Beside LTS, it also is still the only way to have FIPS-140-2
> >>>> module, as there is currently no module in the 1.1.0 -- and there
> >>>> may not be for a while.)
> >>>

This means earliest possible would be post morty? And 1.0.2 would still be =
maintained in there due to the LTS status?

The reason I'm checking is we are trying to integrate a new QAT openssl eng=
ine, which is developed for openssl 1.1.0.=20

> >>> What do we get with 1.1.0 ?
> >>
> >> Latest and greatest code of course.. :)
> >>
> >> Reality, not a lot more over 1.0.2... there are some significant
> >> redesigns that should help improve overall security of the OpenSSL
> >> library and items using the library.  But various things will have to =
be
> updated to make use of this.
> >>
> >> The OpenSSL community itself is looking at 1.1.0 as a transition to
> >> newer and better design/api/etc... which is why it is not marked as a =
LTS
> release.
> >
> > api changes can be a bothersome point from integration POV, do we know
> > if there are some forwarded porting incompatibilities in APIs already?
>=20
> I have not investigated it, as my focus has been on the LTS version at th=
is point.
>=20
> --Mark
>=20
> >>
> >> Beside my basic understanding (above) there should be information as
> >> part of the
> >> 1.1.0 release notes.
> >>
> >> --Mark
> >>
> >>>>
> >>>> --Mark
> >>>>
> >>>>> Thanks!
> >>>>>
> >>>>> Raymond Tan
> >>>>>
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >


