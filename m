Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1UVJ13-0007bH-Fp
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 12:03:09 +0200
Received: from mail120-co9-R.bigfish.com (10.236.132.240) by
	CO9EHSOBE005.bigfish.com (10.236.130.68) with Microsoft SMTP Server id
	14.1.225.23; Thu, 25 Apr 2013 08:59:57 +0000
Received: from mail120-co9 (localhost [127.0.0.1])	by
	mail120-co9-R.bigfish.com (Postfix) with ESMTP id 6AF2272017B;
	Thu, 25 Apr 2013 08:59:57 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zzbb2dI98dI9371I542I1432Izz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah1954cbh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0chbe9i1155h)
Received: from mail120-co9 (localhost.localdomain [127.0.0.1]) by mail120-co9
	(MessageSwitch) id 1366880395951283_14986;
	Thu, 25 Apr 2013 08:59:55 +0000 (UTC)
Received: from CO9EHSMHS010.bigfish.com (unknown [10.236.132.251])	by
	mail120-co9.bigfish.com (Postfix) with ESMTP id DC55F380061;
	Thu, 25 Apr 2013 08:59:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS010.bigfish.com
	(10.236.130.20) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 25 Apr 2013 08:59:55 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.193]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0328.011; Thu, 25 Apr 2013 08:59:55 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: "ml@communistcode.co.uk" <ml@communistcode.co.uk>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] connman: update to 1.13
Thread-Index: AQHOQPfIT3FNz3PZ+U2mwrkQU8LLhJjmLYkggABwaQCAAANrAIAAAb4w
Date: Thu, 25 Apr 2013 08:59:54 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E06828262@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1366813574-21199-1-git-send-email-ml@communistcode.co.uk>
	<B21730BB6DA1D24B83348D9301EA417E068280D6@039-SN2MPN1-022.039d.mgd.msft.net>
	<5178EAFC.5040704@communistcode.co.uk>
	<5178EDDA.30601@communistcode.co.uk>
In-Reply-To: <5178EDDA.30601@communistcode.co.uk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.249]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] connman: update to 1.13
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 10:03:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,
I can find a reference to TCGETS2 in my sysroot

The following information:
p5020ds-64b/usr/include/asm-generic/ioctls.h:60:#define TCGETS2         _IO=
R('T', 0x2A, struct termios2)
p5020ds-64b/usr/src/kernel/include/asm-generic/termios.h:114:#ifdef TCGETS2
p5020ds-64b/usr/src/kernel/include/asm-generic/termios.h:138:#else /* TCGET=
S2 */
p5020ds-64b/usr/src/kernel/include/asm-generic/termios.h:150:#endif /* TCGE=
TS2 */
p5020ds-64b/usr/src/kernel/include/asm-generic/ioctls.h:60:#define TCGETS2 =
             _IOR('T', 0x2A, struct termios2)
p5020ds-64b/usr/src/kernel/arch/parisc/include/asm/ioctls.h:49:#define TCGE=
TS2          _IOR('T',0x2A, struct termios2)
p5020ds-64b/usr/src/kernel/arch/xtensa/include/asm/ioctls.h:95:#define TCGE=
TS2          _IOR('T', 42, struct termios2)
p5020ds-64b/usr/src/kernel/arch/sh/include/asm/ioctls.h:82:#define TCGETS2 =
             _IOR('T', 42, struct termios2)
p5020ds-64b/usr/src/kernel/arch/sparc/include/asm/ioctls.h:18:#define TCGET=
S2           _IOR('T', 12, struct termios2)
p5020ds-64b/usr/src/kernel/arch/mips/include/asm/ioctls.h:80:#define TCGETS=
2            _IOR('T', 0x2A, struct termios2)
p5020ds-64b-tcbootstrap/usr/include/asm-generic/ioctls.h:60:#define TCGETS2=
             _IOR('T', 0x2A, struct termios2)


thanks,

chunrong

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Jack Mitchell
Sent: Thursday, April 25, 2013 4:48 PM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] connman: update to 1.13

On 25/04/13 09:36, Jack Mitchell wrote:
> On 25/04/13 03:13, Guo Chunrong-B40290 wrote:
>> Hello,
>>   I build connman with toolchain(64bit).
>>
>> [snip]
>>
>
> Looks like one for upstream, I'll chase it up.
>
> Cheers,
> Jack.
>

Could you do me a favour and see if you can find a reference to TCGETS2 in =
your sysroot?

--=20

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




