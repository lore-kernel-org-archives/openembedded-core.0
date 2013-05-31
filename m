Return-Path: <B19537@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe004.messaging.microsoft.com [216.32.180.187])
	by mail.openembedded.org (Postfix) with ESMTP id B7E3860655
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:19:49 +0000 (UTC)
Received: from mail41-co1-R.bigfish.com (10.243.78.247) by
	CO1EHSOBE010.bigfish.com (10.243.66.73) with Microsoft SMTP Server id
	14.1.225.23; Fri, 31 May 2013 08:19:49 +0000
Received: from mail41-co1 (localhost [127.0.0.1])	by mail41-co1-R.bigfish.com
	(Postfix) with ESMTP id C8D74A602EF;
	Fri, 31 May 2013 08:19:49 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zz1443Izz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffhbe9i1155h)
Received: from mail41-co1 (localhost.localdomain [127.0.0.1]) by mail41-co1
	(MessageSwitch) id 1369988388666688_3777;
	Fri, 31 May 2013 08:19:48 +0000 (UTC)
Received: from CO1EHSMHS020.bigfish.com (unknown [10.243.78.254])	by
	mail41-co1.bigfish.com (Postfix) with ESMTP id 967F224005F;
	Fri, 31 May 2013 08:19:48 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS020.bigfish.com
	(10.243.66.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 31 May 2013 08:19:48 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.137]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0328.011; Fri, 31 May 2013 08:20:49 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yocto@yoctoproject.org"
	<yocto@yoctoproject.org>
Thread-Topic: Differnt build result of same u-boot source with differnet
	binutils
Thread-Index: Ac5d15j7nzXsrurcQamAouulJ/3pJA==
Date: Fri, 31 May 2013 08:19:26 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A0157947F@039-SN2MPN1-021.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: DLsn FpcE GcZe G2jw IYTl JMVE Le94 LhBG NT9m RuXp UNlp
	V8Ug XgGN XmYQ X7Sy YXq5; 2;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBjAG8AcgBlAEAAbABpAHMAdABzAC4AbwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALgBvAHIAZwA7AHkAbwBjAHQAbwBAAHkAbwBjAHQAbwBwAHIAbwBqAGUAYwB0AC4AbwByAGcA;
	Sosha1_v1; 7; {0B31DBC8-809C-411B-B9D0-EE6FFFAF9E4C};
	YgAxADkANQAzADcAQABmAHIAZQBlAHMAYwBhAGwAZQAuAGMAbwBtAA==; Fri,
	31 May 2013 08:19:40 GMT;
	RABpAGYAZgBlAHIAbgB0ACAAYgB1AGkAbABkACAAcgBlAHMAdQBsAHQAIABvAGYAIABzAGEAbQBlACAAdQAtAGIAbwBvAHQAIABzAG8AdQByAGMAZQAgAHcAaQB0AGgAIABkAGkAZgBmAGUAcgBuAGUAdAAgAGIAaQBuAHUAdABpAGwAcwA=
x-cr-puzzleid: {0B31DBC8-809C-411B-B9D0-EE6FFFAF9E4C}
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Wienskoski Edmar-RA8797 <RA8797@freescale.com>,
	Udma Catalin-Dan-B32721 <B32721@freescale.com>
Subject: Differnt build result of same u-boot source with differnet binutils
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
X-List-Received-Date: Fri, 31 May 2013 08:19:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

When the u-boot(HEAD of master in git://git.freescale.com/ppc/sdk/u-boot.gi=
t) of p1022ds is built with different binutils in Yocto, the result is diff=
erent.=20

With binutils-2.23.1(last version in Yocto), u-boot can be built correctly.=
=20
With binutils-2.23.2(current version in Yocto), the build failed as followi=
ng:
| release.S: Assembler messages:
| release.S:236: Error: value of 4294963524 too large for field of 2 bytes =
at 170
| release.S:237: Error: operand out of range (0xfffffffffffff144 is not bet=
ween 0x0000000000000000 and 0x000000000000ffff)
| release.S:237: Error: value of 4294963524 too large for field of 2 bytes =
at 174
| release.S:365: Error: value of 4294963524 too large for field of 2 bytes =
at 206
| release.S:366: Error: operand out of range (0xfffffffffffff144 is not bet=
ween 0x0000000000000000 and 0x000000000000ffff)
| release.S:366: Error: value of 4294963524 too large for field of 2 bytes =
at 210
| release.S:390: Error: value of 4294963520 too large for field of 2 bytes =
at 278
| release.S:391: Error: operand out of range (0xfffffffffffff140 is not bet=
ween 0x0000000000000000 and 0x000000000000ffff)
| release.S:391: Error: value of 4294963520 too large for field of 2 bytes =
at 282

Below is the failed code section:
[..snip..]
233 #define toreset(x) (x - __secondary_start_page + 0xfffff000)
234=20
235         /* get our PIR to figure out our table entry */
236         lis     r3,toreset(__spin_table_addr)@h
237         ori     r3,r3,toreset(__spin_table_addr)@l
238         lwz     r3,0(r3)
[..snip..]

Seems like the build error is related to binutils, can somebody shed some l=
ight on the issue? Thanks in advance.=20


Best Regards,

Zhenhua


