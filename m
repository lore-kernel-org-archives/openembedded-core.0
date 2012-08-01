Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SwiwD-0008Ig-0o
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 02:06:49 +0200
Received: from mail43-am1-R.bigfish.com (10.3.201.234) by
	AM1EHSOBE009.bigfish.com (10.3.204.29) with Microsoft SMTP Server id
	14.1.225.23; Wed, 1 Aug 2012 23:40:07 +0000
Received: from mail43-am1 (localhost [127.0.0.1])	by mail43-am1-R.bigfish.com
	(Postfix) with ESMTP id 72A456010D	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2012 23:40:07 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail43-am1 (localhost.localdomain [127.0.0.1]) by mail43-am1
	(MessageSwitch) id 134386440559270_31971;
	Wed,  1 Aug 2012 23:40:05 +0000 (UTC)
Received: from AM1EHSMHS014.bigfish.com (unknown [10.3.201.243])	by
	mail43-am1.bigfish.com (Postfix) with ESMTP id 0CA364004B	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2012 23:40:05 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS014.bigfish.com
	(10.3.207.152) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 1 Aug 2012 23:40:04 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Wed, 1 Aug 2012 18:40:00 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] using an external (arm) toolchain - just checking i
	did this properly
Thread-Index: AQHNcD73+LPg+GmvuUavMbOummfkBQ==
Date: Wed, 1 Aug 2012 23:40:00 +0000
Message-ID: <CAEsOVNfHoY3gbwJoVCUfS61LeN_idZpNMtU3aOmZLVs7=BDQmA@mail.gmail.com>
References: <alpine.DEB.2.02.1208011831540.5168@oneiric>
In-Reply-To: <alpine.DEB.2.02.1208011831540.5168@oneiric>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: using an external (arm) toolchain - just checking i did this properly
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
X-List-Received-Date: Thu, 02 Aug 2012 00:06:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <47E0CA0BCE99CC41BC3F31C0EADED458@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 1, 2012 at 6:36 PM, Robert P. J. Day <rpjday@crashcourse.ca> wr=
ote:
>
>   having never used an external toolchain to build an OE image, i
> figured i'd give it a shot to build for qemuarm so, based on *minutes*
> of research to see what it would take to use one from code sourcery,
> what i came up with was:
>
> 1) download arm-2009q1-203-arm-none-linux-gnueabi.bin and run it to
> install arm toolchain into a personal directory
>
> 2) add the following to my local.conf:
>
>   TCMODE =3D "external-sourcery"
>   EXTERNAL_TOOLCHAIN =3D "/home/rpjday/CodeSourcery/Sourcery_G++_Lite"
>
> and that would appear to be it.  i'm going to poke around the recipe
> files to see *how* using an external toolchain is supported but is the
> above fundamentally correct for just using this one?  thanks.

That worked for me.

-M

>
> rday
>
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



