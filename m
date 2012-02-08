Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RvFef-00037B-TE
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 23:06:22 +0100
Received: from mail80-ch1-R.bigfish.com (10.43.68.230) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.23; Wed, 8 Feb 2012 21:58:17 +0000
Received: from mail80-ch1 (localhost [127.0.0.1])	by mail80-ch1-R.bigfish.com
	(Postfix) with ESMTP id 1229D480440	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2012 21:58:17 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h946hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail80-ch1 (localhost.localdomain [127.0.0.1]) by mail80-ch1
	(MessageSwitch) id 1328738295459039_27556;
	Wed,  8 Feb 2012 21:58:15 +0000 (UTC)
Received: from CH1EHSMHS029.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.232])	by mail80-ch1.bigfish.com (Postfix) with ESMTP id
	6AAFA460046 for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2012 21:58:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS029.bigfish.com
	(10.43.70.29) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 8 Feb 2012 21:58:15 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Wed, 8 Feb 2012 15:58:14 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Valgrind : Unhanded instructions mfatbu and mfatbl
Thread-Index: AQHM5qzBglfUX+3bB0mZb4xLfBkpBQ==
Date: Wed, 8 Feb 2012 21:58:13 +0000
Message-ID: <CAEsOVNfMs-CYjACvGhB+LCQ3J91Hmr7OVgWeGg08=5sbH8eatg@mail.gmail.com>
References: <60B477D225E93B419F9F82BF988B2449D99334@039-SN1MPN1-005.039d.mgd.msft.net>
	<CAMKF1srCh6T1b=Lie=XrWRkArgDc9Pqx5fF+ZoQ7b1YDXrEFPg@mail.gmail.com>
	<60B477D225E93B419F9F82BF988B2449D99946@039-SN1MPN1-005.039d.mgd.msft.net>
In-Reply-To: <60B477D225E93B419F9F82BF988B2449D99946@039-SN1MPN1-005.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Garg Vakul-B16394 <B16394@freescale.com>
Subject: Re: Valgrind : Unhanded instructions mfatbu and mfatbl
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
X-List-Received-Date: Wed, 08 Feb 2012 22:06:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <59FF150BE1B70243A55FFB7B60260ADB@freescale.net>
Content-Transfer-Encoding: quoted-printable

Aneesh,

Can you resubmit this patch using git-send-email?

-M

On Sun, Jan 15, 2012 at 11:42 PM, Bansal Aneesh-B39320
<B39320@freescale.com> wrote:
> Please find the patch attached in the mail.
>
>
>
> Regards,
>
> Aneesh Bansal
>
>
>
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Kh=
em
> Raj
> Sent: Friday, January 13, 2012 1:04 PM
> To: Patches and discussions about the oe-core layer
> Cc: Garg Vakul-B16394
> Subject: Re: [OE-core] Valgrind : Unhanded instructions mfatbu and mfatbl
>
>
>
>
>
> On Thu, Jan 12, 2012 at 9:43 PM, Bansal Aneesh-B39320 <B39320@freescale.c=
om>
> wrote:
>
> Hello,
>
>
>
> PowerPC uses two alternate time base registers which are read from user
> space
>
> by using PPC instructions mfatbu and mfatbl . However these instructions =
are
>
> not supported by Valgrind.
>
> CPU : e500mc
>
> Here are the logs when an application executing such instruction is execu=
ted
>
> with Valgrind 3.7.0:
>
>
>
> dis_proc_ctl(ppc)(mfspr,SPR)(0x20F)
>
> disInstr(ppc): unhandled instruction: 0x7C0F82A6
>
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 primary 31(0x1F), second=
ary 678(0x2A6)
>
> =3D=3D2204=3D=3D valgrind: Unrecognized instruction at address 0x10003dfc=
.
>
> =3D=3D2204=3D=3D=A0=A0=A0 at 0x10003DFC: ??? (in /usr/bin/simple_crypto)
>
> =3D=3D2204=3D=3D=A0=A0=A0 by 0x1000181B: ??? (in /usr/bin/simple_crypto)
>
> =3D=3D2204=3D=3D=A0=A0=A0 by 0xFE179E7: ??? (in /lib/libpthread-2.13.so)
>
> =3D=3D2204=3D=3D=A0=A0=A0 by 0x40EEA9B: ??? (in /lib/libc-2.13.so)
>
> =3D=3D2204=3D=3D Your program just tried to execute an instruction that V=
algrind
>
> =3D=3D2204=3D=3D did not recognise.=A0 There are two possible reasons for=
 this.
>
> =3D=3D2204=3D=3D 1. Your program has a bug and erroneously jumped to a no=
n-code
>
> =3D=3D2204=3D=3D=A0=A0=A0 location.=A0 If you are running Memcheck and yo=
u just saw a
>
> =3D=3D2204=3D=3D=A0=A0=A0 warning about a bad jump, it's probably your pr=
ogram's fault.
>
> =3D=3D2204=3D=3D 2. The instruction is legitimate but Valgrind doesn't ha=
ndle it,
>
> =3D=3D2204=3D=3D=A0=A0=A0 i.e. it's Valgrind's fault.=A0 If you think thi=
s is the case or
>
> =3D=3D2204=3D=3D=A0=A0=A0 you are not sure, please let us know and we'll =
try to fix it.
>
> =3D=3D2204=3D=3D Either way, Valgrind will now raise a SIGILL signal whic=
h will
>
> =3D=3D2204=3D=3D probably kill your program.
>
>
>
>
>
> We have developed a patch to fix the issue and submitted the patch upstre=
am
> to Valgrind community for processing.
>
>
>
> how about you also submit the patch to oe-core as well
> so we can use it until the upstream patch lands in a release
> that we will use
>
>
>
>
>
>
> Regards,
>
> Aneesh Bansal
>
> Error! Filename not specified.
>
> Plot No. =96 18 | Sector-16 A, Noida =96 201301
>
> Phone=A0 : 0120395 x3320
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=



