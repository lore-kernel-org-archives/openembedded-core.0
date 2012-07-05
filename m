Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Smu9J-0007IX-TX
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 00:03:46 +0200
Received: from mail123-va3-R.bigfish.com (10.7.14.250) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	14.1.225.22; Thu, 5 Jul 2012 21:35:32 +0000
Received: from mail123-va3 (localhost [127.0.0.1])	by
	mail123-va3-R.bigfish.com (Postfix) with ESMTP id D40643600D4	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2012 21:35:31 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zzbb2dI98dI9371I1432I4015Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail123-va3 (localhost.localdomain [127.0.0.1]) by mail123-va3
	(MessageSwitch) id 1341524130444800_3610;
	Thu,  5 Jul 2012 21:35:30 +0000 (UTC)
Received: from VA3EHSMHS012.bigfish.com (unknown [10.7.14.235])	by
	mail123-va3.bigfish.com (Postfix) with ESMTP id 697391A013B	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2012 21:35:30 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS012.bigfish.com
	(10.7.99.22) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 5 Jul 2012 21:35:30 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.163]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Thu, 5 Jul 2012 16:37:35 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core] linux-dtb: add multi-dtb build support
Thread-Index: AQHNWtwtIn2bs/LK9UedJs65xGih+A==
Date: Thu, 5 Jul 2012 21:37:34 +0000
Message-ID: <CAEsOVNeMe1CQEj4V6et+uUsEct0HEETLs6yFL03YteBQyywT_A@mail.gmail.com>
References: <1340682796-11569-1-git-send-email-b19537@freescale.com>
	<4FEC908A.3000205@linux.intel.com>
	<CAEsOVNerdO8m=0LHYUy8sn+6W=aOiEQS18vOQy8DYqWQeDxA+Q@mail.gmail.com>
	<4FF5F219.8000103@intel.com>
	<CAEsOVNf0s+QBs_NYiquUTU8zew052PKx6uEwUEwPBBHzbnVLUA@mail.gmail.com>
	<4FF60815.4040909@intel.com>
In-Reply-To: <4FF60815.4040909@intel.com>
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
X-List-Received-Date: Thu, 05 Jul 2012 22:03:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AB91BDAD8EAA6F4D942CABC360626353@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 5, 2012 at 4:33 PM, Scott Garman <scott.a.garman@intel.com> wro=
te:
> On 07/05/2012 01:52 PM, McClintock Matthew-B29882 wrote:
>>
>> On Thu, Jul 5, 2012 at 2:59 PM, Scott Garman <scott.a.garman@intel.com>
>> wrote:
>>>
>>> On 07/05/2012 11:29 AM, McClintock Matthew-B29882 wrote:
>>>>
>>>>
>>>> Can we add this to denzil branch? (post 1.2.1 is fine) - I realize
>>>> this is somewhat a new feature though but it would be helpful to have
>>>> it in denzil.
>>>
>>>
>>>
>>> Ok, I've now created a contrib branch to start tracking changes for
>>> 1.2.2,
>>> and have included this commit:
>>>
>>>
>>> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dsgarman/=
denzil-next-1.2.2
>>>
>>> The usual caveats apply - I can rebase this branch at any time, etc.
>>
>>
>> Are you missing a patch on this series? ChecksumError class does not
>> exist...
>>
>> commit 2f009e5b?
>
>
> What is the title of that commit? I'm not seeing it.

$ git show 2f009e5b
commit 2f009e5b1e4e0a4148ab7d5c60bf0e7a193faa2e
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Sun May 13 12:00:45 2012 +0000

    bitbake/fetch2: Improve visibility of checksum warnings when
fetching from mirrors

    When fetching from mirrors, checksum errors would get buried in the
    logs. This raises their profile so a warning is logged on the console
    when fetcher checksum issues are encountered, even if other attempts
    are made to get the file (which may or may not have the same issue).

    (Bitbake rev: d43fafd7f01b5534499b45213197d8ccececdbc4)

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

-M

>
> Thanks,
>
> Scott
>
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



