Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RWd6n-0003S4-RL
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Dec 2011 01:05:37 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id pB2NwnC7009142
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Dec 2011 00:58:54 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Sat, 3 Dec 2011 00:58:50 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Coordinating inter-layer dependencies
Thread-Index: AQHMsGiFaImQ9oKiA02Wci/z9HMLkJXILfFkgAB8nYCAAEs4xA==
Date: Fri, 2 Dec 2011 23:58:49 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C401A4389@post.tritech.se>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net>	<1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
	<20111201130733.GF19917@jama.jama.net>	<1322771625.17484.149.camel@ted>
	<ED3E0BCACD909541BA94A34C4A164D4C401A404C@post.tritech.se>,
	<20111202161847.GF3770@jama.jama.net>
In-Reply-To: <20111202161847.GF3770@jama.jama.net>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.89.227.239]
MIME-Version: 1.0
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Sat, 03 Dec 2011 00:05:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> From: openembedded-core-bounces@lists.openembedded.org [openembedded-core=
-bounces@lists.openembedded.org] on behalf of Martin Jansa [martin.jansa@gm=
ail.com]=0A=
> Sent: Friday, December 02, 2011 5:18 PM=0A=
> To: Patches and discussions about the oe-core layer=0A=
> Subject: Re: [OE-core] Coordinating inter-layer dependencies=0A=
> =0A=
=0A=
...cut...=0A=
=0A=
> > As I understand it, the PRINC increases the PR of the appended recipe. =
Then the resulting package will have a version that is the same as "the nex=
t" version of the base recipe. Since many people (me included) hardly remem=
ber what they did a month ago, isn't there a big risk of confusion in your =
deployed systems if packages are upgraded there?=0A=
> >=0A=
> > I do something like  PR .=3D ".local0"  where "local" is the name of th=
e layer containing the .bbappend.=0A=
> > Of course this will create extensive version strings if multiple .bbapp=
ends are applied but the alternative is that you have no idea what layers t=
hat appended and what the the base version of the recipe really was.=0A=
> =0A=
> So if you have some layer adding=0A=
> layerB: PR .=3D ".b0"=0A=
> and other=0A=
> layerA: PR .=3D ".a0"=0A=
> =0A=
> and PR appends are evaluated in this order, then you will break upgrade=
=0A=
> patch forever if you have to remove layerB for some reason and you=0A=
> cannot even fix it by bumping numbers in your layerA unless you rename=0A=
> all PR appends as ".c0" right? That's why I prefer to use PRINC.=0A=
=0A=
I don't really see what is breaking but I'm guessing that the problem you d=
escribe has to do with feed based upgrades and automatic evaluation of whic=
h version is latest (?). I don't do things that way but instead explicitly =
download and replace packages and then I prefer to be able to see exactly w=
hat was built. Of course you can achieve that also by some external procedu=
re to make sure that you always no matter what produce increasing PR number=
s on your packages but if you fail there is no telling... =0A=
=0A=
> =0A=
> Yes it increases PR of desired number, but every time.. so if upper=0A=
> layer increments PR your .bbappend will again increment it so you still=
=0A=
> get always increasing sequence.=0A=
=0A=
Unless, again, I remove a layer, then I'll have to extra-bump another "inno=
cent" layer to keep the numbers up.=0A=
=0A=
=0A=
BR // Mats=0A=


