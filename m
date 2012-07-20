Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SsEbW-0000Cj-LU
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 16:54:55 +0200
Received: from mail7-co1-R.bigfish.com (10.243.78.232) by
	CO1EHSOBE004.bigfish.com (10.243.66.67) with Microsoft SMTP Server id
	14.1.225.23; Fri, 20 Jul 2012 14:43:30 +0000
Received: from mail7-co1 (localhost [127.0.0.1])	by mail7-co1-R.bigfish.com
	(Postfix) with ESMTP id 650FBD00445;
	Fri, 20 Jul 2012 14:43:30 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zzbb2dI98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail7-co1 (localhost.localdomain [127.0.0.1]) by mail7-co1
	(MessageSwitch) id 1342795409327849_22312;
	Fri, 20 Jul 2012 14:43:29 +0000 (UTC)
Received: from CO1EHSMHS012.bigfish.com (unknown [10.243.78.254])	by
	mail7-co1.bigfish.com (Postfix) with ESMTP id 4207A660091;
	Fri, 20 Jul 2012 14:43:29 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS012.bigfish.com
	(10.243.66.22) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 20 Jul 2012 14:43:28 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Fri, 20 Jul 2012 09:43:27 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Scott Garman
	<scott.a.garman@intel.com>, Khem Raj <raj.khem@gmail.com>, Liu Ting-B28495
	<B28495@freescale.com>
Thread-Topic: [OE-core] [oe-core] linux-dtb: add multi-dtb build support
Thread-Index: AQHNWtwtIn2bs/LK9UedJs65xGih+A==
Date: Fri, 20 Jul 2012 14:43:26 +0000
Message-ID: <CAEsOVNfn0+nzcmJAgHKk1Ei44BAZjxHw4AtVK9n7PasUMqSqgg@mail.gmail.com>
References: <1340682796-11569-1-git-send-email-b19537@freescale.com>
	<4FEC908A.3000205@linux.intel.com>
	<CAEsOVNerdO8m=0LHYUy8sn+6W=aOiEQS18vOQy8DYqWQeDxA+Q@mail.gmail.com>
	<4FF5F219.8000103@intel.com>
	<CAEsOVNf0s+QBs_NYiquUTU8zew052PKx6uEwUEwPBBHzbnVLUA@mail.gmail.com>
	<4FF60815.4040909@intel.com>
	<CAEsOVNeMe1CQEj4V6et+uUsEct0HEETLs6yFL03YteBQyywT_A@mail.gmail.com>
	<4FF6101C.1070104@intel.com>
In-Reply-To: <4FF6101C.1070104@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: linux-dtb: add multi-dtb build support
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
X-List-Received-Date: Fri, 20 Jul 2012 14:54:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EF45549558E8AB48A1CC58A0F9DA4B96@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 5, 2012 at 5:07 PM, Scott Garman <scott.a.garman@intel.com> wro=
te:
> On 07/05/2012 02:37 PM, McClintock Matthew-B29882 wrote:
>>
>> On Thu, Jul 5, 2012 at 4:33 PM, Scott Garman <scott.a.garman@intel.com>
>> wrote:
>>>
>>> On 07/05/2012 01:52 PM, McClintock Matthew-B29882 wrote:
>>>>
>>>>
>>>> On Thu, Jul 5, 2012 at 2:59 PM, Scott Garman <scott.a.garman@intel.com=
>
>>>> wrote:
>>>>>
>>>>>
>>>>> On 07/05/2012 11:29 AM, McClintock Matthew-B29882 wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> Can we add this to denzil branch? (post 1.2.1 is fine) - I realize
>>>>>> this is somewhat a new feature though but it would be helpful to hav=
e
>>>>>> it in denzil.
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> Ok, I've now created a contrib branch to start tracking changes for
>>>>> 1.2.2,
>>>>> and have included this commit:
>>>>>
>>>>>
>>>>>
>>>>> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dsgarma=
n/denzil-next-1.2.2
>>>>>
>>>>> The usual caveats apply - I can rebase this branch at any time, etc.
>>>>
>>>>
>>>>
>>>> Are you missing a patch on this series? ChecksumError class does not
>>>> exist...
>>>>
>>>> commit 2f009e5b?
>>>
>>>
>>>
>>> What is the title of that commit? I'm not seeing it.
>>
>>
>> $ git show 2f009e5b
>> commit 2f009e5b1e4e0a4148ab7d5c60bf0e7a193faa2e
>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Date:   Sun May 13 12:00:45 2012 +0000
>>
>>      bitbake/fetch2: Improve visibility of checksum warnings when
>> fetching from mirrors
>>
>>      When fetching from mirrors, checksum errors would get buried in the
>>      logs. This raises their profile so a warning is logged on the conso=
le
>>      when fetcher checksum issues are encountered, even if other attempt=
s
>>      are made to get the file (which may or may not have the same issue)=
.
>>
>>      (Bitbake rev: d43fafd7f01b5534499b45213197d8ccececdbc4)
>>
>>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>
> Ok, this applies then to the poky-based tree, not the oe-core one.
>
> I just tried merging this in but I get conflicts with one of Khem's patch=
es.
> I'm leaving imminently for vacation so I will take a closer look at this
> early next week.

Scott,

Any update on the missing ChecksumError class?

-M


>
>
> Scott
>
> --
> Scott Garman
> Embedded Linux Engineer - Yocto Project
> Intel Open Source Technology Center
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



