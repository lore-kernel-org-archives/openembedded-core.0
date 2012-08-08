Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Syw8o-0001OK-6c
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 04:36:58 +0200
Received: from mail6-co1-R.bigfish.com (10.243.78.253) by
	CO1EHSOBE009.bigfish.com (10.243.66.72) with Microsoft SMTP Server id
	14.1.225.23; Wed, 8 Aug 2012 02:25:10 +0000
Received: from mail6-co1 (localhost [127.0.0.1])	by mail6-co1-R.bigfish.com
	(Postfix) with ESMTP id 71FE2C002B4	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2012 02:25:10 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -8
X-BigFish: VS-8(zz98dI9371I936eI1432I1453Mzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail6-co1 (localhost.localdomain [127.0.0.1]) by mail6-co1
	(MessageSwitch) id 13443927091431_15383; Wed,  8 Aug 2012 02:25:09 +0000
	(UTC)
Received: from CO1EHSMHS006.bigfish.com (unknown [10.243.78.240])	by
	mail6-co1.bigfish.com (Postfix) with ESMTP id F2E34AC004F	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2012 02:25:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS006.bigfish.com
	(10.243.66.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 8 Aug 2012 02:25:08 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0298.005;
	Tue, 7 Aug 2012 21:25:07 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] linux-yocto-3.4: Disable extra slang header
	search path
Thread-Index: AQHNdQvJCdKsIeWQgEiXDWd+SVNF2pdPgf+AgAABHQCAAACRgA==
Date: Wed, 8 Aug 2012 02:25:07 +0000
Message-ID: <CAEsOVNdA6of4efDpVsMhakmYavJW1-SRg9t1_SXDZ0ivZA35jQ@mail.gmail.com>
References: <1344338236.9756.218.camel@ted> <50211706.1050707@windriver.com>
	<1344347435.9756.251.camel@ted> <50211F3B.6010601@windriver.com>
	<CAEsOVNeQX9uwB_QNdhodJqjprU2ygoMN=_DbEzudcb9GiF+wzg@mail.gmail.com>
	<5021CC85.20005@windriver.com>
	<CADkTA4P1EsaaJOyjB7ke__QaOKOHGn3C_XVYwa=NbwioKN_CBQ@mail.gmail.com>
In-Reply-To: <CADkTA4P1EsaaJOyjB7ke__QaOKOHGn3C_XVYwa=NbwioKN_CBQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] linux-yocto-3.4: Disable extra slang header search path
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
X-List-Received-Date: Wed, 08 Aug 2012 02:36:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <39853EE75636EA4CB2151DDA7D3FC9C6@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 7, 2012 at 9:22 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On Tue, Aug 7, 2012 at 10:18 PM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> On 12-08-07 10:16 PM, McClintock Matthew-B29882 wrote:
>>>
>>> On Tue, Aug 7, 2012 at 8:59 AM, Bruce Ashfield
>>> <bruce.ashfield@windriver.com>  wrote:
>>>>
>>>> On 12-08-07 09:50 AM, Richard Purdie wrote:
>>>>>
>>>>>
>>>>> On Tue, 2012-08-07 at 09:24 -0400, Bruce Ashfield wrote:
>>>>>>
>>>>>>
>>>>>> On 12-08-07 07:17 AM, Richard Purdie wrote:
>>>>>>>
>>>>>>>
>>>>>>> Add in a workaround to avoid host infection detection build failure=
s
>>>>>>> from the slang include directory in perf. I'll defer to Bruce to
>>>>>>> fix this properly but we need a workaround now as this is breaking
>>>>>>> builds.
>>>>>>
>>>>>>
>>>>>>
>>>>>> I just followed up on a patch from 3 days ago, but I'll follow up he=
re
>>>>>> as well .. just to make sure the message gets through.
>>>>>>
>>>>>> We had a pending patch to fix this issue from Liang Li here @
>>>>>> windriver.
>>>>>>
>>>>>> Did that patch not fix the problem, or did it fall through the crack=
s ?
>>>>>
>>>>>
>>>>>
>>>>> It is not correct. It adds in another search path and just hides the
>>>>> issue. We should *never* be putting -I/usr/include/slang on the compi=
ler
>>>>> commandline at all period.
>>>>
>>>>
>>>>
>>>> I'd argue that it's more correct than commenting out the upstream
>>>> include path.
>>>>
>>>> It fixes the problem, doesn't require a patch to the kernel and give
>>>> us time to work upstream and get a real fix.
>>>>
>>>> So I'd really prefer that we take that fix, versus the kernel patch
>>>> if it actually fixes the problem.
>>>>
>>>>
>>>>>
>>>>> I'd assumed in all the email traffic that this was clear and that
>>>>> another solution was being worked on that would be acceptable upstrea=
m
>>>>> too.
>>>>
>>>>
>>>>
>>>> Exactly what I referred to above. But we don't want a temporary
>>>> kernel path, we want the temporary recipe patch.
>>>>
>>>>
>>>>>
>>>>> Perhaps a better option might be: -I=3D/usr/include/slang ? That assu=
mes
>>>>> that all kernel gcc versions would accept the =3D notation, that shou=
ld be
>>>>> true by now?
>>>>
>>>>
>>>>
>>>> Not in my experience when dealing with the upstream kernel and tools,
>>>> there are plenty of old compilers floating around.
>>>
>>>
>>> Sorry, I'm not following this thread super close.. will all kernel
>>> trees need to apply this patch? That does not seem ideal...
>>
>>
>> They would, once we get the patch merged upstream. And you are right,
>> linux-yocto is easy enough, but that's one set of kernel trees.
>
> I should add, that not all trees, and only builds that use a
> particular set of perf
> features out of master would see this problem (as far as I know), so I di=
dn't
> mean to make this sound bigger than it is ... it's just something that ma=
ster
> was hitting on the autobuilders (and who knows, maybe I'm mischaracterizi=
ng
> the problem as well :)
>
> Cheers,
>
> Bruce
>
>>
>> The patch that we proposed to the perf recipe would fix it for all
>> users of that recipe, with a suitable set of kernels (say 3.0 to
>> 3.6 (I haven't checked).
>>
>> Honestly, that's why we proposed a perf recipe fix, while working on the
>> right fix for the upstream kernel.

It seems wrong to need a kernel patch to fix this issue, kernels are
built outside of oe-core and it seems better to fix things in one
place. By the way, I'm seeing this on our kernel recipe in
meta-fsl-ppc too.

-M=



