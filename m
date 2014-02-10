Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 6FDBC6EC9E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 11:14:37 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s1ABEV3V008119;
	Mon, 10 Feb 2014 12:14:36 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Mon, 10 Feb 2014 12:14:31 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Chris Larson <clarson@kergoth.com>
Thread-Topic: [OE-core] Premirrors and local VCS server
Thread-Index: Ac8kD6shFuj4vLvFRJ+liH1sEuiwVAAAf/sAAI8YyBs=
Date: Mon, 10 Feb 2014 11:14:30 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B15DE24@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B15D3EA@post.tritech.se>,
	<CABcZANmYSBxirpEVNsX2zF6rpzv3LR0Xiay6uckaod+s0UHy+w@mail.gmail.com>
In-Reply-To: <CABcZANmYSBxirpEVNsX2zF6rpzv3LR0Xiay6uckaod+s0UHy+w@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Premirrors and local VCS server
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
X-List-Received-Date: Mon, 10 Feb 2014 11:14:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On  Friday, February 07, 2014, Chris Larson [clarson@kergoth.com] wrote:=0A=
=0A=
> > I have also tried "svn://.*/.* svn://myserver" but this just goes mayhe=
m,=0A=
> > some recursion i guess; 9140 ERROR messages shown...=0A=
> =0A=
> I'm not sure if this use case is supported, but if it is, this would be t=
he method to support it. I'd suggest opening a bug in the yocto bug trackin=
g system.=0A=
>=0A=
=0A=
Thanks for the feedback!=0A=
=0A=
It is indeed a recursion where the file name is getting prepended with the =
=0A=
mirror server name again and again... And the fetcher still tries to fetch=
=0A=
a tarball, not do the original check-out as I intended.=0A=
=0A=
I wonder; would it make sense to add a new conf variable, something like:=
=0A=
=0A=
BB_FETCH_NETWORKWHITELIST =3D " \=0A=
    10.64.0.0/16 \=0A=
    ${MY_LOCAL_MIRROR} \=0A=
    www.some-domain.org \=0A=
"=0A=
=0A=
It would allow more fine-grained control of what is acceptable and at=0A=
least it would not clash with (but perhaps make obsolete) the existing:=0A=
=0A=
BB_FETCH_PREMIRRORONLY=0A=
BB_NO_NETWORK=0A=
=0A=
I was at first thinking about a simpler "BB_FETCH_LOCALNETWORKONLY"=0A=
but that doesn't blend well with the existing options.=0A=
=0A=
BR // Mats=0A=

