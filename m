Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
	helo=AM1EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RWD4V-0002RY-N3
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 21:17:31 +0100
Received: from mail88-am1-R.bigfish.com (10.3.201.250) by
	AM1EHSOBE006.bigfish.com (10.3.204.26) with Microsoft SMTP Server id
	14.1.225.22; Thu, 1 Dec 2011 19:55:39 +0000
Received: from mail88-am1 (localhost [127.0.0.1])	by mail88-am1-R.bigfish.com
	(Postfix) with ESMTP id 14E107002A2	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 19:55:39 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275chz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail88-am1 (localhost.localdomain [127.0.0.1]) by mail88-am1
	(MessageSwitch) id 1322769338979917_4098;
	Thu,  1 Dec 2011 19:55:38 +0000 (UTC)
Received: from AM1EHSMHS016.bigfish.com (unknown [10.3.201.254])	by
	mail88-am1.bigfish.com (Postfix) with ESMTP id EA50A6C0042	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 19:55:38 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS016.bigfish.com
	(10.3.207.154) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 1 Dec 2011 19:55:38 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Thu, 1 Dec 2011 13:55:39 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Coordinating inter-layer dependencies
Thread-Index: AQHMsGMywn2MhPc9yk+RQspKeHgOJw==
Date: Thu, 1 Dec 2011 19:55:38 +0000
Message-ID: <CAEsOVNcBUYn3K2hBoSGcGW5f4tqqn1rYg9w2U3u6RcdThgA6=g@mail.gmail.com>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
In-Reply-To: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Coordinating inter-layer dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 01 Dec 2011 20:17:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <96FCB0DA5F699D4B9C028151F74CAAEB@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2011 at 5:23 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> Hi,
>
> During the past month there have been a number of updates to OE-core reci=
pes that triggered parsing errors due to bbappend in other layers. A small =
seleciton:
>
> * netbase
> * libdrm
> * xserver-xorg
> * clutter
>
> My view is that layer maintainers need to keep an eye on potential breaka=
ge and have updates ready when patches land into OE-core. Looking back I ca=
n see that while the situation is improving a bit, it's still not working. =
The problem with slow updates to layers is that (with my angstrom hat on) u=
sers (and with my TI hat on) customers and coworkers can't do builds withou=
t rm'ing the bbappends or disabling the layer.
>
> This is bad for a number of reasons:
>
> 1) It creates unmanaged local diffs
> 2) it can cause PR to fluctuate back and forth if you rm is a bit overzea=
lous or if you disable the complete layer.
>
> My proposal is that OE-core recipe upgrades with known bbappends look lik=
e this:
>
> 1) add new version with a warning about bbappends
> 2) wait a N days (2 < N < 7)
> 3) delete old version
>
> To avoid stressing out RP and Sau! I would strongly urge layer maintainer=
s to respond to recipe update patches with "I have a bbappend, but my revie=
w process needs time, please use the above proposal" if you need time to te=
st and update =A0your bbappends.
>
> We're all human in the end and timezone differences aren't always helping=
 with these kinds of problems, so let's work together to minimize parsing b=
reakage.
>
> Related to that: Please include information on how to send patches upstre=
am in your layer/repo README. The meta-intel/emenlow lacks that and the top=
 level README doesn't mention that there are sublevel READMEs.

Why don't we make a version of bbappend that applies to all packages
with the same name? This would fix the constant changing
netbase_vXYZ.bbappend issue.

-M=



