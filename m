Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1UVJwG-0002KP-27
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 13:02:09 +0200
Received: from mail113-tx2-R.bigfish.com (10.9.14.247) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.23; Thu, 25 Apr 2013 10:14:16 +0000
Received: from mail113-tx2 (localhost [127.0.0.1])	by
	mail113-tx2-R.bigfish.com (Postfix) with ESMTP id 99B5B100358;
	Thu, 25 Apr 2013 10:14:16 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -5
X-BigFish: VS-5(zzbb2dI98dI9371I542I1432I4015Izz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah1954cbh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0chbe9i1155h)
Received: from mail113-tx2 (localhost.localdomain [127.0.0.1]) by mail113-tx2
	(MessageSwitch) id 1366884834137445_8936;
	Thu, 25 Apr 2013 10:13:54 +0000 (UTC)
Received: from TX2EHSMHS036.bigfish.com (unknown [10.9.14.245])	by
	mail113-tx2.bigfish.com (Postfix) with ESMTP id 89D8B18041E;
	Thu, 25 Apr 2013 10:09:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS036.bigfish.com
	(10.9.99.136) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 25 Apr 2013 10:09:29 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.193]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0328.011; Thu, 25 Apr 2013 10:09:28 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: "ml@communistcode.co.uk" <ml@communistcode.co.uk>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] connman: update to 1.13
Thread-Index: AQHOQPfIT3FNz3PZ+U2mwrkQU8LLhJjmLYkggABwaQCAAANrAIAAAb4wgAAFDACAAAoiYA==
Date: Thu, 25 Apr 2013 10:09:28 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E0682833A@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1366813574-21199-1-git-send-email-ml@communistcode.co.uk>
	<B21730BB6DA1D24B83348D9301EA417E068280D6@039-SN2MPN1-022.039d.mgd.msft.net>
	<5178EAFC.5040704@communistcode.co.uk>
	<5178EDDA.30601@communistcode.co.uk>
	<B21730BB6DA1D24B83348D9301EA417E06828262@039-SN2MPN1-022.039d.mgd.msft.net>
	<5178F38C.3010100@communistcode.co.uk>
In-Reply-To: <5178F38C.3010100@communistcode.co.uk>
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
X-List-Received-Date: Thu, 25 Apr 2013 11:02:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


1) p5020ds-64b/usr/include/sys/ioctls.h and it includes bits/ioctl-types.h
2) p5020ds-64b/usr/include/bits/ioctl-types.h and it doesn't include asm/io=
ctls.h

3) p5020ds-64b/usr/include/asm/ioctls.h and it includes asm/ioctls.h

BTW,  I modify TIST =3D "--disable-tist" in meta/recipes-connectivity/connm=
an/connman.inc"
      And build Connman for p5020ds-64b  successfully.

-----Original Message-----
From: Jack Mitchell [mailto:ml@communistcode.co.uk]=20
Sent: Thursday, April 25, 2013 5:13 PM
To: Guo Chunrong-B40290; Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH] connman: update to 1.13

Interesting, could you check the following for me please:

1) p5020ds-64b/usr/include/sys/ioctls.h and see if it includes bits/ioctl-t=
ypes.h

2) p5020ds-64b/usr/include/bits/ioctl-types.h and see if it includes asm/io=
ctls.h

3) p5020ds-64b/usr/include/asm/ioctls.h and see if it includes includes asm=
-generic/ioctls.h


Thanks,
Jack.


On 25/04/13 09:59, Guo Chunrong-B40290 wrote:
> Hello,
> I can find a reference to TCGETS2 in my sysroot
>
> The following information:
> p5020ds-64b/usr/include/asm-generic/ioctls.h:60:#define TCGETS2         _=
IOR('T', 0x2A, struct termios2)
> p5020ds-64b/usr/src/kernel/include/asm-generic/termios.h:114:#ifdef=20
> TCGETS2=20
> p5020ds-64b/usr/src/kernel/include/asm-generic/termios.h:138:#else /* TCG=
ETS2 */ p5020ds-64b/usr/src/kernel/include/asm-generic/termios.h:150:#endif=
 /* TCGETS2 */
> p5020ds-64b/usr/src/kernel/include/asm-generic/ioctls.h:60:#define TCGETS=
2              _IOR('T', 0x2A, struct termios2)
> p5020ds-64b/usr/src/kernel/arch/parisc/include/asm/ioctls.h:49:#define TC=
GETS2          _IOR('T',0x2A, struct termios2)
> p5020ds-64b/usr/src/kernel/arch/xtensa/include/asm/ioctls.h:95:#define TC=
GETS2          _IOR('T', 42, struct termios2)
> p5020ds-64b/usr/src/kernel/arch/sh/include/asm/ioctls.h:82:#define TCGETS=
2              _IOR('T', 42, struct termios2)
> p5020ds-64b/usr/src/kernel/arch/sparc/include/asm/ioctls.h:18:#define TCG=
ETS2           _IOR('T', 12, struct termios2)
> p5020ds-64b/usr/src/kernel/arch/mips/include/asm/ioctls.h:80:#define TCGE=
TS2            _IOR('T', 0x2A, struct termios2)
> p5020ds-64b-tcbootstrap/usr/include/asm-generic/ioctls.h:60:#define TCGET=
S2             _IOR('T', 0x2A, struct termios2)
>
>
> thanks,
>
> chunrong
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org=20
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of=20
> Jack Mitchell
> Sent: Thursday, April 25, 2013 4:48 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] connman: update to 1.13
>
> On 25/04/13 09:36, Jack Mitchell wrote:
>> On 25/04/13 03:13, Guo Chunrong-B40290 wrote:
>>> Hello,
>>>    I build connman with toolchain(64bit).
>>>
>>> [snip]
>>>
>> Looks like one for upstream, I'll chase it up.
>>
>> Cheers,
>> Jack.
>>
> Could you do me a favour and see if you can find a reference to TCGETS2 i=
n your sysroot?
>


--=20

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--





