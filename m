Return-Path: <michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 8E306780D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 14:09:13 +0000 (UTC)
X-AuditID: 0a00029b-67dff70000003fa4-2a-593809073bd3
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	54.B0.16292.70908395; Wed,  7 Jun 2017 09:09:13 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 7 Jun 2017 09:09:11 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Fun with npm shrinkwrap
Thread-Index: AQHS34O/sUYxsXQk+k2WZWQUfRGswKIZoSeA///NmgA=
Date: Wed, 7 Jun 2017 14:09:10 +0000
Message-ID: <655290B7709079438B7932553958E60DA1312205@ESS-EX01.essvote.corp.local>
References: <15e918fb-c2e6-3005-6221-08601c804271@siemens.com>
	<a60f39a6-8355-82dc-20b2-5f7b3d6397b3@linux.intel.com>
	<af72aeb2-915e-0c63-60e9-18b6c7bce5ad@siemens.com>
	<615663ca-d13f-9bca-6e3d-e5dc22cfaebf@linux.intel.com>
	<3989e16e-7a69-5f0a-90e9-3fcd1ed8b14d@siemens.com>
In-Reply-To: <3989e16e-7a69-5f0a-90e9-3fcd1ed8b14d@siemens.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWyRiBPQ5eT0yLS4MEVeYv/j7exWdy7eZPZ
	4s7Pd+wWV2eJO7B4zDsZ6HFu4wpGj+0nJzEFMEdx2aSk5mSWpRbp2yVwZWz5sJCt4LJQxdyO
	j8wNjEv5uxg5OCQETCQeTczvYuTiEBI4yihxoWkiM4Qzk1HiQcsa1i5GTg42ASOJc9c3MYIk
	RAR2M0rs+nuGDSTBLGAosfTZRUaQScICehLtC+JBwiIC+hJzVveAhUUErCRWPhIGMVkEVCQ+
	bBUDqeAVCJLYe6ydHWLVLCaJJ6d+MoIkOAXsJU5//MYCYjMKiEl8P7WGCWKTuMStJ/PBbAkB
	AYkle84zQ9iiEi8f/2OFsOUk3jW1sULU60gs2P0J6kptiWULXzNDLBaUODnzCcsERtFZSMbO
	QtIyC0nLLCQtCxhZVjHy5RrppRYXl+WXpOol5+duYgRGDBcD0+wdjD1NsYcYBTgYlXh4BXaZ
	RQqxJpYVV+YeYpTmYFES5735TDVSSCA9sSQ1OzW1ILUovqg0J7X4ECMTByeI4JJqYNTfa/hO
	Q9zQM/3az6qFLId5zy47/3L3v9gP/KYnrk2KWXaf80qd6oYDExc/2/sydM2t9oAKG67qOa0N
	Z2fYXbkbLuHDqcF76du6VMPCHZ03ntV+47Q/s/uZZFqogmnke5lPx3bp/Fw7eXVayBnjHy+X
	M2hOvii0tjaU782R3oKG1CWxXSEbX25TYinOSDTUYi4qTgQA5p5ExX4CAAA=
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Fun with npm shrinkwrap
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
X-List-Received-Date: Wed, 07 Jun 2017 14:09:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If offline builds, license checking, or stable dependency versions are not =
important to you then you can use the meta-nodejs layer.  It just uses the =
yarn tool directly https://github.com/imyller/meta-nodejs.


On a hijacked side note has yarn been considered as a solution to some of o=
ur npm issues?
It seems to be npm with built in licnese checking and better version determ=
ination.
Might not cover 100% of our use cases, but then npm only seems to work 50% =
of the time without tweaking something anyways.



-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Jan Kiszka
Sent: Wednesday, June 07, 2017 7:04 AM
To: Alexander Kanavin; openembedded-core@lists.openembedded.org
Cc: Paul Eggleton
Subject: Re: [OE-core] Fun with npm shrinkwrap

On 2017-06-07 13:43, Alexander Kanavin wrote:
> On 06/06/2017 06:14 PM, Jan Kiszka wrote:
>=20
>> Yeah, good points. Probably this problem is also related to OE
>> reimplementing parts of the npm logic.
>>
>> But I suppose those concepts won't materialize very soon, will they? I'm
>> also looking for a short-term solution, at least some reasonable tactic
>> to generate such recipes in the meantime. Is there something in that
>> thread I should dig into?
>=20
> What I am getting at is that it would be awesome if you convince your
> management that npm support in Yocto is a problem that needs a better
> solution and work on it. Yes, this means you can't work on product
> development for quite some time; this is the price for using open source
> projects without a commercial support contract :)

We are such a instance support :) - but we also need to get paid / pay
our contractors.

>=20
> My apologies if this is not the answer you were seeking.
>=20

I'm getting your point, even more now as I ran into a package that does
not even install at all (node-red-contrib-opcua). Can't promise anything
at this point, but I will carry this forward, in all directions.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux
--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

