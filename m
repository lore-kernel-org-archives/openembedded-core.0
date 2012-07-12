Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SpQJe-00077N-7J
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 22:48:50 +0200
Received: from mail165-va3-R.bigfish.com (10.7.14.243) by
	VA3EHSOBE005.bigfish.com (10.7.40.25) with Microsoft SMTP Server id
	14.1.225.23; Thu, 12 Jul 2012 20:37:33 +0000
Received: from mail165-va3 (localhost [127.0.0.1])	by
	mail165-va3-R.bigfish.com (Postfix) with ESMTP id E16F3400382	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 20:37:33 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -16
X-BigFish: VS-16(z691L6caIzbb2dI98dI9371I936eI542M1432I4015I1447Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail165-va3 (localhost.localdomain [127.0.0.1]) by mail165-va3
	(MessageSwitch) id 1342125452444218_25605;
	Thu, 12 Jul 2012 20:37:32 +0000 (UTC)
Received: from VA3EHSMHS030.bigfish.com (unknown [10.7.14.250])	by
	mail165-va3.bigfish.com (Postfix) with ESMTP id 5BA01200A6	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 20:37:32 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS030.bigfish.com
	(10.7.99.40) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 12 Jul 2012 20:37:32 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Thu, 12 Jul 2012 15:37:34 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Upcoming Yocto 1.2.1 "denzil" release this week.
Thread-Index: AQHNX45V3Nni/t7D5UGCk4cmgKmTFpckst4AgAAN6gCAAB22AIAAAagAgAFX5oCAADjjAA==
Date: Thu, 12 Jul 2012 20:37:33 +0000
Message-ID: <CAEsOVNeA1egQoDq4Ohtc1k03Q0y9Kep4KgV+Yt5Xe3qhJQS9kw@mail.gmail.com>
References: <4FFD0425.7040004@intel.com> <1342004414.7934.11.camel@ted>
	<CAEsOVNfeZBjERBFsXSWqihHccROAR3N4kRGgW8XhpJd4iKzRdw@mail.gmail.com>
	<1625033.FUQGRG6suy@helios> <1342032628.11939.37.camel@ted>
	<4FFDE3E0.2040900@linux.intel.com>
	<CAEsOVNd9FejzyyXSEV-H8-3Aiir+-KsB76t0NV=j65S_zsjLYA@mail.gmail.com>
	<C6510F6D410BB64A8C15398EDC6B847C46AA7586@ORSMSX101.amr.corp.intel.com>
In-Reply-To: <C6510F6D410BB64A8C15398EDC6B847C46AA7586@ORSMSX101.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: Upcoming Yocto 1.2.1 "denzil" release this week.
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
X-List-Received-Date: Thu, 12 Jul 2012 20:48:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EEE3FDB9D280CE4CB11BE6AFEAEC3545@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 12, 2012 at 12:13 PM, Zhang, Jessica
<jessica.zhang@intel.com> wrote:
> Just a general update for 1.1.2 (Edison).  We're planning to release it n=
ext week and currently it is under QA testing.  There're bugs(10+) filed ag=
ainst it which are marked WON'T FIX (lots of them relate to multilib) due t=
o the facts of resources and amount of work involved to back port certain p=
atches, etc.  We'll add detailed information about these bugs in the releas=
e note. Also, as always, the community are welcome to step up and maintain =
it going forward.

Thanks for the update.

-M

>
> Thanks,
> Jessica
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-bounces@lists.openembedded.org] On Behalf Of McClintock Matthew-B29=
882
> Sent: Wednesday, July 11, 2012 1:43 PM
> To: Patches and discussions about the oe-core layer
> Cc: McClintock Matthew-B29882
> Subject: Re: [OE-core] Upcoming Yocto 1.2.1 "denzil" release this week.
>
> On Wed, Jul 11, 2012 at 3:36 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 07/11/2012 11:50 AM, Richard Purdie wrote:
>>>
>>> On Wed, 2012-07-11 at 19:00 +0100, Paul Eggleton wrote:
>>>>
>>>> On Wednesday 11 July 2012 17:55:18 McClintock Matthew-B29882 wrote:
>>>>>
>>>>> On Wed, Jul 11, 2012 at 6:00 AM, Richard Purdie
>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>>
>>>>>> On Wed, 2012-07-11 at 09:57 +0100, Jack Mitchell wrote:
>>>>>>>
>>>>>>> Are Khems eglibc patches going to make it in for this - 2.16 is
>>>>>>> playing havoc with my builds at the moment and surely will with
>>>>>>> everyone else when the major distros catch up.
>>>>>>
>>>>>>
>>>>>> Its too late to get those pieces into 1.2.1, they're not even in
>>>>>> master yet, let alone in a stable release branch.
>>>>>>
>>>>>> I'm proposing we get 1.2.1 out, get the 2.16 pieces tested in
>>>>>> master, then port them to the denzil branch quickly post release
>>>>>> so they'd make any 1.2.2 release and are available on the git
>>>>>> branch for people using the stable branch.
>>>>>
>>>>>
>>>>> Can you fill me in? Why would a point release include such a
>>>>> dramatic upgrade?
>>>>
>>>>
>>>> I think what we would be looking at would be just adding the fixes
>>>> to allow the native packages to build against eglibc 2.16 so it can
>>>> work on host distros that use it, not bringing eglibc 2.16 itself in
>>>> for the target.
>>>
>>>
>>> Right, this would just be to allow edison to work on systems that
>>> have a native eglibc 2.16. I'm not convinced we have the patches
>>> worked out yet though. Target eglibc would remain with whatever is in e=
dison (2.13?).
>>>
>> I assume you mean denzil, not edison, or do we also need to be
>> planning a 1.1.3?
>
> Personally, I'm hoping we at least keep accepted patches to the edison br=
anch... and decide about a release later.
>
> -M
>
>>
>> Sau!
>>
>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



