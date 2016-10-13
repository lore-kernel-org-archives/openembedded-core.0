Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D7D6765D00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 10:49:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9DAnOM9024719
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Oct 2016 03:49:25 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.156]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Thu, 13 Oct 2016 03:49:24 -0700
From: "Hatle, Mark" <mark.hatle@windriver.com>
To: "TAN, YEE HONG" <raymond.tan@intel.com>
Thread-Topic: [OE-core] openssl: OpenSSL 1.1.x update
Thread-Index: AQHSH3rzS5JyVabeU0uGfYvimnKc3qCbMa4AgAC+jACAABD3gIAABPWAgAqrZoD//45pwA==
Date: Thu, 13 Oct 2016 10:49:23 +0000
Message-ID: <487B8B0E-5579-414F-945B-639184C11A5E@windriver.com>
References: <F0CA9E243F4F424B836EAC30E41BF4CF5DF514DB@PGSMSX104.gar.corp.intel.com>
	<a3c142bf-8c0b-3f90-dda9-7f72dd4da1cf@windriver.com>
	<CAMKF1spG=v7_wb_VYktNBL7NTan28NbB47G7u2B_-E43jBL8vQ@mail.gmail.com>
	<687e0950-a18a-5d44-aeae-18517df275e6@windriver.com>
	<4F081825-2EC8-4F85-9E55-1E24F215723D@gmail.com>
	<89015693-dfeb-5b47-7c2b-386c85571dec@windriver.com>,
	<F0CA9E243F4F424B836EAC30E41BF4CF5DF55A2F@PGSMSX104.gar.corp.intel.com>
In-Reply-To: <F0CA9E243F4F424B836EAC30E41BF4CF5DF55A2F@PGSMSX104.gar.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
X-List-Received-Date: Thu, 13 Oct 2016 10:49:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

While this is not a fully authoritative answer,=20
I believe what your wrote will be correct.  Latest 1.0.2 in 2.2.  Master (i=
n future) will have both 1.0.2 and 1.1.0.


> On Oct 13, 2016, at 12:36, Tan, Raymond <raymond.tan@intel.com> wrote:
>=20
> Warm Regards,=20
>=20
>  Raymond Tan
>=20
>> -----Original Message-----
>> From: Mark Hatle [mailto:mark.hatle@windriver.com]
>> Sent: Thursday, October 06, 2016 11:40 PM
>> To: Khem Raj <raj.khem@gmail.com>
>> Cc: Tan, Raymond <raymond.tan@intel.com>; openembedded-
>> core@lists.openembedded.org; Gupta, Rahul KumarXX
>> <rahul.kumarxx.gupta@intel.com>
>> Subject: Re: [OE-core] openssl: OpenSSL 1.1.x update
>>=20
>>> On 10/6/16 10:22 AM, Khem Raj wrote:
>>>=20
>>>> On Oct 6, 2016, at 7:21 AM, Mark Hatle <mark.hatle@windriver.com>
>> wrote:
>>>>=20
>>>>> On 10/5/16 9:59 PM, Khem Raj wrote:
>>>>> On Wed, Oct 5, 2016 at 7:33 PM, Mark Hatle <mark.hatle@windriver.com>
>> wrote:
>>>>>> On 10/5/16 9:11 PM, Tan, Raymond wrote:
>>>>>>> Greetings, I would like to know if there is any plan / schedule to =
upgrade
>> to openssl 1.1.0 into OE-core?
>>>>>>=20
>>>>>> Currently 1.0.2 is the LTS version of OpenSSL.  1.1.0 is not schedul=
ed to be
>> LTS.
>>>>>>=20
>>>>>> For the upcoming release (soon), I would NOT expect 1.1.0 to be in
>>>>>> it.  There are still too many incompatibilities with other component=
s.
>>>>>>=20
>>>>>> For the next version of OE, I think it is appropriate to include
>>>>>> 1.1.0, but I would also like to maintain 1.0.2 for the time being.
>>>>>> (Beside LTS, it also is still the only way to have FIPS-140-2
>>>>>> module, as there is currently no module in the 1.1.0 -- and there
>>>>>> may not be for a while.)
>>>>>=20
>=20
> This means earliest possible would be post morty? And 1.0.2 would still b=
e maintained in there due to the LTS status?
>=20
> The reason I'm checking is we are trying to integrate a new QAT openssl e=
ngine, which is developed for openssl 1.1.0.=20
>=20
>>>>> What do we get with 1.1.0 ?
>>>>=20
>>>> Latest and greatest code of course.. :)
>>>>=20
>>>> Reality, not a lot more over 1.0.2... there are some significant
>>>> redesigns that should help improve overall security of the OpenSSL
>>>> library and items using the library.  But various things will have to =
be
>> updated to make use of this.
>>>>=20
>>>> The OpenSSL community itself is looking at 1.1.0 as a transition to
>>>> newer and better design/api/etc... which is why it is not marked as a =
LTS
>> release.
>>>=20
>>> api changes can be a bothersome point from integration POV, do we know
>>> if there are some forwarded porting incompatibilities in APIs already?
>>=20
>> I have not investigated it, as my focus has been on the LTS version at t=
his point.
>>=20
>> --Mark
>>=20
>>>>=20
>>>> Beside my basic understanding (above) there should be information as
>>>> part of the
>>>> 1.1.0 release notes.
>>>>=20
>>>> --Mark
>>>>=20
>>>>>>=20
>>>>>> --Mark
>>>>>>=20
>>>>>>> Thanks!
>>>>>>>=20
>>>>>>> Raymond Tan
>>>>>>>=20
>>>>>>=20
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>=20
>>>=20
>=20

