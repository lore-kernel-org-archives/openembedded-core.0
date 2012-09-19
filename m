Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TEAcp-0007tf-Cg
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 05:06:55 +0200
Received: from mail202-co1-R.bigfish.com (10.243.78.234) by
	CO1EHSOBE010.bigfish.com (10.243.66.73) with Microsoft SMTP Server id
	14.1.225.23; Wed, 19 Sep 2012 02:39:08 +0000
Received: from mail202-co1 (localhost [127.0.0.1])	by
	mail202-co1-R.bigfish.com (Postfix) with ESMTP id 7F66BD800CB;
	Wed, 19 Sep 2012 02:39:08 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail202-co1 (localhost.localdomain [127.0.0.1]) by mail202-co1
	(MessageSwitch) id 1348022346230951_25920;
	Wed, 19 Sep 2012 02:39:06 +0000 (UTC)
Received: from CO1EHSMHS018.bigfish.com (unknown [10.243.78.240])	by
	mail202-co1.bigfish.com (Postfix) with ESMTP id 367C440068;
	Wed, 19 Sep 2012 02:39:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS018.bigfish.com
	(10.243.66.28) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 19 Sep 2012 02:39:05 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Tue, 18 Sep 2012 21:39:04 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] eglibc_2.16.bb: replace patch with updated
	version that supportds e6500
Thread-Index: AQHNleqzPTbAYSB8AEa+y/CUgrNCKQ==
Date: Wed, 19 Sep 2012 02:39:03 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A68BB02@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
	<70CC66F5C30A414DADDA6973E4CA391A68B581@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAMKF1sqSCx4pc_mH6a9VoACPyn6RyLiSgqEoCjbfVgStz=PADw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A68B656@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAMKF1spFAru3unZSvd18cu555mgOCLgFf4on0xkZx=xeBM+5Xw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A68B723@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAMKF1soL2o+CmBxevKcLPXjvcuwEvgLuFeQ8hY916_rzQVbdhg@mail.gmail.com>
	<CAEsOVNc5H63GDPb1otYddyC3Rgujv=uAXGp=ttxhHskAzE6TiA@mail.gmail.com>
In-Reply-To: <CAEsOVNc5H63GDPb1otYddyC3Rgujv=uAXGp=ttxhHskAzE6TiA@mail.gmail.com>
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
X-List-Received-Date: Wed, 19 Sep 2012 03:06:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EA238C46AD77FF438EAF28AA557D1EE4@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 5:35 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> On Tue, Sep 18, 2012 at 5:33 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Sep 18, 2012 at 3:32 PM, McClintock Matthew-B29882
>> <B29882@freescale.com> wrote:
>>>
>>> Internal patch name. I can change it if needed. But, then I have to
>>> track patch names differences between internal and external.
>>
>> Not that I am opposed to it but its hard to review as I said.
>> cant internal be changed ?
>
> Ha ha ha...

Please hold off on this patch - I believe I've found some more issues
(besides the sign-off and upstream-status on the patch)

-M

>
> ;)
>
> -M=



