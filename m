Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RiIFG-0001zj-VN
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 05:14:35 +0100
Received: from mail154-ch1-R.bigfish.com (10.43.68.243) by
	CH1EHSOBE014.bigfish.com (10.43.70.64) with Microsoft SMTP Server id
	14.1.225.23; Wed, 4 Jan 2012 04:07:10 +0000
Received: from mail154-ch1 (localhost [127.0.0.1])	by
	mail154-ch1-R.bigfish.com (Postfix) with ESMTP id 6193E2A02AD;
	Wed,  4 Jan 2012 04:07:10 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail154-ch1 (localhost.localdomain [127.0.0.1]) by mail154-ch1
	(MessageSwitch) id 1325650028325823_3269;
	Wed,  4 Jan 2012 04:07:08 +0000 (UTC)
Received: from CH1EHSMHS008.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.248])	by mail154-ch1.bigfish.com (Postfix) with ESMTP id
	4C32EC0045;	Wed,  4 Jan 2012 04:07:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS008.bigfish.com
	(10.43.70.8) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 4 Jan 2012 04:07:08 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Tue, 3 Jan 2012 22:07:07 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Garg Vakul-B16394 <B16394@freescale.com>
Thread-Topic: [OE-core] [PATCH oe-core] valgrind: add powerpc to the
	compatible host and add eglibc-dbg in rdepends
Thread-Index: AQHMxS0fRftJ7JTB3UGUwYEWT6pqiJXxXI6AgAC57QD///6vEIAI3xkAgACpPHCAAGlGAA==
Date: Wed, 4 Jan 2012 04:07:06 +0000
Message-ID: <CAEsOVNe0j=Kq+irY3wnP46pbDywRtM1g-8jNnfsHRZXWuU0avA@mail.gmail.com>
References: <1325055308-17731-1-git-send-email-b19537@freescale.com>
	<8285067.9cfZeAKmYZ@helios>
	<1325103622.3089.8.camel@lenovo.internal.reciva.com>
	<CA452391058F6D4E9715FB2C29D9312A010BD995@039-SN2MPN1-023.039d.mgd.msft.net>
	<1325591055.24417.330.camel@phil-desktop>
	<065BBB7616BCE543832A2EF096986B94018AA0@039-SN2MPN1-011.039d.mgd.msft.net>
In-Reply-To: <065BBB7616BCE543832A2EF096986B94018AA0@039-SN2MPN1-011.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Phil Blundell <philb@gnu.org>, Patches,
	Luo Zhenhua-B19537 <B19537@freescale.com>,
	layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH oe-core] valgrind: add powerpc to the compatible host and add eglibc-dbg in rdepends
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
X-List-Received-Date: Wed, 04 Jan 2012 04:14:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <796BF0AF92C601439739D56676368127@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 3, 2012 at 9:52 PM, Garg Vakul-B16394 <B16394@freescale.com> wr=
ote:
> Hi
>
> Valgrind's requirements from packaging are listed at:
>
> http://valgrind.org/docs/manual/dist.readme-packagers.html
>
> It recommends to have at least debuginfo pkg of ld.so installed.
> On some targets such as ppc32-linux and ppc64-linux, valgrind stops if it=
 does not find debug symbols.

Would adding these packages to RDEPENDS_powerpc and RDEPENDS_powerpc64
be more the best solution then?

-M=



