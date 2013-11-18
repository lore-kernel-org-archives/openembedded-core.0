Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 371806D01E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 13:11:53 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id rAIDBn2O026136;
	Mon, 18 Nov 2013 14:11:54 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0347.000; Mon, 18 Nov 2013 14:11:49 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Phil Blundell <pb@pbcl.net>
Thread-Topic: [OE-core] RPROVIDES not package specific with native and added
	package
Thread-Index: Ac7kW/uiPKrHrTmoRhqqcp3NSngBhv//9ZWAgAARVBg=
Date: Mon, 18 Nov 2013 13:11:48 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FD505BB@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FD50595@post.tritech.se>,
	<1384780059.23724.26.camel@phil-desktop.brightsign>
In-Reply-To: <1384780059.23724.26.camel@phil-desktop.brightsign>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RPROVIDES not package specific with native and added package
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
X-List-Received-Date: Mon, 18 Nov 2013 13:11:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It's not mine, it comes from native.bbclass.=0A=
=0A=
b.t.w. I should have said I'm running OE-core DORA distro-less.=0A=
=0A=
// Mats=0A=
________________________________________=0A=
From: Phil Blundell [pb@pbcl.net]=0A=
Sent: Monday, November 18, 2013 2:07 PM=0A=
To: Mats K=E4rrman=0A=
Cc: openembedded-core=0A=
Subject: Re: [OE-core] RPROVIDES not package specific with native and added=
 package=0A=
=0A=
On Mon, 2013-11-18 at 12:55 +0000, Mats K=E4rrman wrote:=0A=
> to the recipe but it makes no difference.=0A=
> Running bitbake with "-e" I find the line (independent of the above chang=
es):=0A=
>=0A=
> RPROVIDES =3D "${PN}"=0A=
=0A=
What are you trying to accomplish with that line?  Is there any reason=0A=
you can't just remove it?=0A=
=0A=
p.=0A=
=0A=
=0A=

