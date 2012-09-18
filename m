Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TE6Xi-0000Sb-Tb
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:45:23 +0200
Received: from mail53-ch1-R.bigfish.com (10.43.68.250) by
	CH1EHSOBE020.bigfish.com (10.43.70.77) with Microsoft SMTP Server id
	14.1.225.23; Tue, 18 Sep 2012 22:32:41 +0000
Received: from mail53-ch1 (localhost [127.0.0.1])	by mail53-ch1-R.bigfish.com
	(Postfix) with ESMTP id 50A58420142;
	Tue, 18 Sep 2012 22:32:41 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail53-ch1 (localhost.localdomain [127.0.0.1]) by mail53-ch1
	(MessageSwitch) id 1348007558991948_20836;
	Tue, 18 Sep 2012 22:32:38 +0000 (UTC)
Received: from CH1EHSMHS027.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.246])	by mail53-ch1.bigfish.com (Postfix) with ESMTP id
	EF0132C00D3;	Tue, 18 Sep 2012 22:32:38 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS027.bigfish.com
	(10.43.70.27) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 18 Sep 2012 22:32:38 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Tue, 18 Sep 2012 17:32:31 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] eglibc_2.16.bb: replace patch with updated
	version that supportds e6500
Thread-Index: AQHNleqzPTbAYSB8AEa+y/CUgrNCKZeQ/muA//+uK4CAAFW8gP//rLmA
Date: Tue, 18 Sep 2012 22:32:30 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A68B723@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
	<70CC66F5C30A414DADDA6973E4CA391A68B581@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAMKF1sqSCx4pc_mH6a9VoACPyn6RyLiSgqEoCjbfVgStz=PADw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A68B656@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAMKF1spFAru3unZSvd18cu555mgOCLgFf4on0xkZx=xeBM+5Xw@mail.gmail.com>
In-Reply-To: <CAMKF1spFAru3unZSvd18cu555mgOCLgFf4on0xkZx=xeBM+5Xw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc_2.16.bb: replace patch with updated version that supportds e6500
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 22:45:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <85BF71D954FCF54FA9E928B5155A813C@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 5:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Sep 18, 2012 at 3:23 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>>
>> It's just renaming the patch, so it's replacing ppc-sqrt.patch with
>> glibc.fix_sqrt2.patch - and these are not authored by me... which I
>> realize I forgot to add upstream-status as well.
>>
>
> OK now I see. The shadowing is there. I dont like renaming the patch.
> Is there any reason
> why its renamed to glibc.fix_sqrt2.patch ? its easy to spot changes if
> it was not renamed

Internal patch name. I can change it if needed. But, then I have to
track patch names differences between internal and external.

-M=



