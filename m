Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 117F160E79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 07:51:13 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s2D7p8i9029538;
	Thu, 13 Mar 2014 08:51:13 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Thu, 13 Mar 2014 08:51:08 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] libm accuracy, eglibc compared to glibc
Thread-Index: Ac8+BQu6b+elda9pTAWbBsq3s0UQDQAEML0AAB6lubE=
Date: Thu, 13 Mar 2014 07:51:08 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B181CA5@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B18163B@post.tritech.se>,
	<CAMKF1sq-vbPkBJvHk08ZzM2AUHd3APs2mn_-D3fsenWT0Ls2vw@mail.gmail.com>
In-Reply-To: <CAMKF1sq-vbPkBJvHk08ZzM2AUHd3APs2mn_-D3fsenWT0Ls2vw@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Mar 2014 07:51:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday, March 12, 2014 7:09 PM, Khem Raj wrote:=0A=
> On Wed, Mar 12, 2014 at 8:30 AM, Mats K=E4rrman <Mats.Karrman@tritech.se>=
 wrote:=0A=
>> I face a problem with libm. With my Dora build the following assertion d=
oesn't hold:=0A=
>>=0A=
>> sqrt( pow( sqrt( 2.0 ), 4.0 ) ) =3D=3D 2.0=0A=
>>=0A=
<snip>=0A=
>> Does anyone know if this is a known "feature" of eglibc or know any othe=
r reason=0A=
>> for this difference?=0A=
>>=0A=
> We have done changes since OE-Classic days in the FPU area for ppc.=0A=
> what ppc machine is it ? I have access to p2020 based machine (e500v2)=0A=
> and it works as expected with=0A=
> dora/eglibc-2.18=0A=
=0A=
My machine is an e300c4.=0A=
I will try running the libm internal tests on my machine as Phil Blundell s=
uggested.=0A=
=0A=
BR // Mats=0A=

