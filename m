Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 4C97F6EA3F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 07:54:23 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s317sH7F010528;
	Tue, 1 Apr 2014 09:54:22 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Tue, 1 Apr 2014 09:54:17 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [RFC PATCH] Make ppce300c3 tune hard-float by default
Thread-Index: Ac9KozMWp6mgzhUuTs+O79jHgwSqqQCuHmCAAAjSH6Y=
Date: Tue, 1 Apr 2014 07:54:16 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3AA247@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3A7EBE@post.tritech.se>,
	<CAMKF1spy5NzfaLVfnUL_tMS_iqT7EE6NE++SUnb4BvVatgpL+Q@mail.gmail.com>
In-Reply-To: <CAMKF1spy5NzfaLVfnUL_tMS_iqT7EE6NE++SUnb4BvVatgpL+Q@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] Make ppce300c3 tune hard-float by default
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
X-List-Received-Date: Tue, 01 Apr 2014 07:54:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Khem,=0A=
=0A=
Thanks for your feedback!=0A=
=0A=
On Tuesday, April 01, 2014 7:37 AM, Khem Raj wrote:=0A=
> On Fri, Mar 28, 2014 at 9:43 AM, Mats K=E4rrman <Mats.Karrman@tritech.se>=
 wrote:=0A=
>> +# glibc configure options to make use of 603e specific sqrt/sqrtf routi=
nes=0A=
>> +GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300=
c3", "--with-cpu=3De300c3", "", d)}"=0A=
>=0A=
> looks good, may be the comment above can be more explanatory saying that=
=0A=
> glibc aliases e300c3 sqrt/sqrtf to 600e versions=0A=
=0A=
The above statement depends on an added "Implies" file in eglibc and,=0A=
more important on a previous patch adding support for 603e/fpu sqrt.=0A=
=0A=
How is the new Implies file best added, as a patch to the previous patch=0A=
or as a new patch?=0A=
=0A=
BR // Mats=0A=

