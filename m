Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Syw0D-0001Bk-63
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 04:28:05 +0200
Received: from mail256-tx2-R.bigfish.com (10.9.14.242) by
	TX2EHSOBE009.bigfish.com (10.9.40.29) with Microsoft SMTP Server id
	14.1.225.23; Wed, 8 Aug 2012 02:16:17 +0000
Received: from mail256-tx2 (localhost [127.0.0.1])	by
	mail256-tx2-R.bigfish.com (Postfix) with ESMTP id 0B178280258;
	Wed,  8 Aug 2012 02:16:17 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail256-tx2 (localhost.localdomain [127.0.0.1]) by mail256-tx2
	(MessageSwitch) id 1344392175122783_14517;
	Wed,  8 Aug 2012 02:16:15 +0000 (UTC)
Received: from TX2EHSMHS012.bigfish.com (unknown [10.9.14.242])	by
	mail256-tx2.bigfish.com (Postfix) with ESMTP id 1240B1E4004E;
	Wed,  8 Aug 2012 02:16:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS012.bigfish.com
	(10.9.99.112) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 8 Aug 2012 02:16:14 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Tue, 7 Aug 2012 21:16:14 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] linux-yocto-3.4: Disable extra slang header
	search path
Thread-Index: AQHNdQvJCdKsIeWQgEiXDWd+SVNF2g==
Date: Wed, 8 Aug 2012 02:16:14 +0000
Message-ID: <CAEsOVNeQX9uwB_QNdhodJqjprU2ygoMN=_DbEzudcb9GiF+wzg@mail.gmail.com>
References: <1344338236.9756.218.camel@ted> <50211706.1050707@windriver.com>
	<1344347435.9756.251.camel@ted> <50211F3B.6010601@windriver.com>
In-Reply-To: <50211F3B.6010601@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
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
X-List-Received-Date: Wed, 08 Aug 2012 02:28:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <53975344E9DAA2439B3CAC90B32E2BC5@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 7, 2012 at 8:59 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 12-08-07 09:50 AM, Richard Purdie wrote:
>>
>> On Tue, 2012-08-07 at 09:24 -0400, Bruce Ashfield wrote:
>>>
>>> On 12-08-07 07:17 AM, Richard Purdie wrote:
>>>>
>>>> Add in a workaround to avoid host infection detection build failures
>>>> from the slang include directory in perf. I'll defer to Bruce to
>>>> fix this properly but we need a workaround now as this is breaking
>>>> builds.
>>>
>>>
>>> I just followed up on a patch from 3 days ago, but I'll follow up here
>>> as well .. just to make sure the message gets through.
>>>
>>> We had a pending patch to fix this issue from Liang Li here @ windriver=
.
>>>
>>> Did that patch not fix the problem, or did it fall through the cracks ?
>>
>>
>> It is not correct. It adds in another search path and just hides the
>> issue. We should *never* be putting -I/usr/include/slang on the compiler
>> commandline at all period.
>
>
> I'd argue that it's more correct than commenting out the upstream
> include path.
>
> It fixes the problem, doesn't require a patch to the kernel and give
> us time to work upstream and get a real fix.
>
> So I'd really prefer that we take that fix, versus the kernel patch
> if it actually fixes the problem.
>
>
>>
>> I'd assumed in all the email traffic that this was clear and that
>> another solution was being worked on that would be acceptable upstream
>> too.
>
>
> Exactly what I referred to above. But we don't want a temporary
> kernel path, we want the temporary recipe patch.
>
>
>>
>> Perhaps a better option might be: -I=3D/usr/include/slang ? That assumes
>> that all kernel gcc versions would accept the =3D notation, that should =
be
>> true by now?
>
>
> Not in my experience when dealing with the upstream kernel and tools,
> there are plenty of old compilers floating around.

Sorry, I'm not following this thread super close.. will all kernel
trees need to apply this patch? That does not seem ideal...

-M=



