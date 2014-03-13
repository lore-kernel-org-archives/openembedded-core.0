Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 73FAB6F7EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 07:45:23 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s2D7jFdT029509;
	Thu, 13 Mar 2014 08:45:20 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Thu, 13 Mar 2014 08:45:15 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] libm accuracy, eglibc compared to glibc
Thread-Index: Ac8+BQu6b+elda9pTAWbBsq3s0UQDf///PgAgAAYDBw=
Date: Thu, 13 Mar 2014 07:45:15 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B181C86@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B18163B@post.tritech.se>,
	<CAJTo0LZeuTEU4My3N=Ux6QR2eU09ct-Kah_XbJrPYrHBx3aOCw@mail.gmail.com>
In-Reply-To: <CAJTo0LZeuTEU4My3N=Ux6QR2eU09ct-Kah_XbJrPYrHBx3aOCw@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libm accuracy, eglibc compared to glibc
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
X-List-Received-Date: Thu, 13 Mar 2014 07:45:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday, March 12, 2014 4:58 PM, Burton, Ross wrote:=0A=
> On 12 March 2014 15:30, Mats K=E4rrman <Mats.Karrman@tritech.se> wrote:=
=0A=
>> Does anyone know if this is a known "feature" of eglibc or know any othe=
r reason=0A=
>> for this difference?=0A=
>=0A=
> I expect the standard response from upstream here would be that=0A=
> floating point mathematics isn't exact and if you want exact answers=0A=
> then you should use a different representation. The differences start=0A=
> at the first sqrt():=0A=
> =0A=
> Test 1 and 2:=0A=
> sqrt(2.00000000000000000000) =3D 1.41421356237309514547=0A=
> Test 3:=0A=
> sqrt(2.00000000000000000000) =3D 1.41421356237309492343=0A=
> Test using bc and scale=3D30 (bc is fixed-point not floating-point):=0A=
> sqrt(2.00000000000000000000) =3D 1.414213562373095048801688724209=0A=
> =0A=
> The output from bc is a truncation of the "real" value of sqrt(2)=0A=
> whereas both values from C's sqrt() function using floats are=0A=
> approximations, both equally close.  Why does your test case expect=0A=
> the answer to be 2.0?  That's a massive assumption to make, floats can=0A=
> trivially lose accuracy rapidly as=0A=
> http://en.wikipedia.org/wiki/Floating_point#Accuracy_problems=0A=
> explains.=0A=
=0A=
I am aware of the problems with floating point math. The test cases are fro=
m IBM=0A=
and used to validate their J9 JVM on new platforms. AfaIk they normally wor=
k (as=0A=
they do for my old OE-classic system and for my Debian PC).=0A=
=0A=
Any reason that EGLIBC should be different from GLIBC?=0A=
=0A=
// Mats=0A=

