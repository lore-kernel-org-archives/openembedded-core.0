Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RYlP1-0008AJ-LF
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 22:21:16 +0100
Received: from mail16-tx2-R.bigfish.com (10.9.14.241) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.23; Thu, 8 Dec 2011 21:14:09 +0000
Received: from mail16-tx2 (localhost [127.0.0.1])	by mail16-tx2-R.bigfish.com
	(Postfix) with ESMTP id 3DAF74404F6;
	Thu,  8 Dec 2011 21:14:22 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail16-tx2 (localhost.localdomain [127.0.0.1]) by mail16-tx2
	(MessageSwitch) id 132337886213343_548;
	Thu,  8 Dec 2011 21:14:22 +0000 (UTC)
Received: from TX2EHSMHS042.bigfish.com (unknown [10.9.14.235])	by
	mail16-tx2.bigfish.com (Postfix) with ESMTP id DACDC4C0042;
	Thu,  8 Dec 2011 21:14:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS042.bigfish.com
	(10.9.99.142) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 8 Dec 2011 21:14:04 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Thu, 8 Dec 2011 15:14:18 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "ulf@emagii.com" <ulf@emagii.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] bitbake core-image-sato fails:
Thread-Index: AQHMte5Y5dRBJsGR2UGv4LCctNZe3g==
Date: Thu, 8 Dec 2011 21:14:17 +0000
Message-ID: <CAEsOVNfs+HayYVZ3Mm=k=ubnmUBeO88OKj1fKzZE0R5+Uw=6tQ@mail.gmail.com>
References: <4EDF9468.309@emagii.com>
In-Reply-To: <4EDF9468.309@emagii.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: bitbake core-image-sato fails:
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
X-List-Received-Date: Thu, 08 Dec 2011 21:21:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <62998D7283EA664683A258D3B9446905@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 7, 2011 at 10:29 AM, Ulf Samuelsson
<openembedded-core@emagii.com> wrote:
> Got the following error message when building core-image-sato:
>
> | Collected errors:
> | =A0* satisfy_dependencies_for: Cannot satisfy the following dependencie=
s for
> task-core-x11-sato:
> | =A0* =A0 =A0 ofono *
> | =A0* opkg_install_cmd: Cannot install package task-core-x11-sato.
> NOTE: package core-image-sato-1.0-r0: task do_rootfs: Failed
> ERROR: Task 8
> (/home/ulf/projects/OE_atmel/sources/openembedded-core/meta/recipes-sato/=
images/core-image-sato.bb,
> do_rootfs) failed with exit code '1'

The rpm for ofono was not generated, and something in
task-core-x11-sato depends on it. So rpm goes and tries to resolve its
dependency (which adds other packages) and it can't find one for
ofono. Some recipe in this task needs a DEPENDS +=3D "ofono"

-M=



