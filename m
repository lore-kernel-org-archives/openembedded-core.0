Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1SpN9K-00082a-Mn
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 19:25:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jul 2012 10:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="176564231"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2012 10:13:39 -0700
Received: from orsmsx152.amr.corp.intel.com (10.22.226.39) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 12 Jul 2012 10:13:37 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.93]) by
	ORSMSX152.amr.corp.intel.com ([169.254.8.91]) with mapi id
	14.01.0355.002; Thu, 12 Jul 2012 10:13:37 -0700
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Upcoming Yocto 1.2.1 "denzil" release this week.
Thread-Index: AQHNXx+jipu+yOCzh0iR/rCdkETaNJckPXUAgAAiVgCAAHP4AIAAAYAAgAAN6gCAAB21AIAAAcKAgADgCIA=
Date: Thu, 12 Jul 2012 17:13:35 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C46AA7586@ORSMSX101.amr.corp.intel.com>
References: <4FFD0425.7040004@intel.com> <1342004414.7934.11.camel@ted>
	<CAEsOVNfeZBjERBFsXSWqihHccROAR3N4kRGgW8XhpJd4iKzRdw@mail.gmail.com>
	<1625033.FUQGRG6suy@helios> <1342032628.11939.37.camel@ted>
	<4FFDE3E0.2040900@linux.intel.com>
	<CAEsOVNd9FejzyyXSEV-H8-3Aiir+-KsB76t0NV=j65S_zsjLYA@mail.gmail.com>
In-Reply-To: <CAEsOVNd9FejzyyXSEV-H8-3Aiir+-KsB76t0NV=j65S_zsjLYA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: Upcoming Yocto 1.2.1 "denzil" release this week.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 12 Jul 2012 17:25:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just a general update for 1.1.2 (Edison).  We're planning to release it nex=
t week and currently it is under QA testing.  There're bugs(10+) filed agai=
nst it which are marked WON'T FIX (lots of them relate to multilib) due to =
the facts of resources and amount of work involved to back port certain pat=
ches, etc.  We'll add detailed information about these bugs in the release =
note. Also, as always, the community are welcome to step up and maintain it=
 going forward.

Thanks,
Jessica

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of McClintock Matthew-B2988=
2
Sent: Wednesday, July 11, 2012 1:43 PM
To: Patches and discussions about the oe-core layer
Cc: McClintock Matthew-B29882
Subject: Re: [OE-core] Upcoming Yocto 1.2.1 "denzil" release this week.

On Wed, Jul 11, 2012 at 3:36 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/11/2012 11:50 AM, Richard Purdie wrote:
>>
>> On Wed, 2012-07-11 at 19:00 +0100, Paul Eggleton wrote:
>>>
>>> On Wednesday 11 July 2012 17:55:18 McClintock Matthew-B29882 wrote:
>>>>
>>>> On Wed, Jul 11, 2012 at 6:00 AM, Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>
>>>>> On Wed, 2012-07-11 at 09:57 +0100, Jack Mitchell wrote:
>>>>>>
>>>>>> Are Khems eglibc patches going to make it in for this - 2.16 is
>>>>>> playing havoc with my builds at the moment and surely will with
>>>>>> everyone else when the major distros catch up.
>>>>>
>>>>>
>>>>> Its too late to get those pieces into 1.2.1, they're not even in
>>>>> master yet, let alone in a stable release branch.
>>>>>
>>>>> I'm proposing we get 1.2.1 out, get the 2.16 pieces tested in
>>>>> master, then port them to the denzil branch quickly post release
>>>>> so they'd make any 1.2.2 release and are available on the git
>>>>> branch for people using the stable branch.
>>>>
>>>>
>>>> Can you fill me in? Why would a point release include such a
>>>> dramatic upgrade?
>>>
>>>
>>> I think what we would be looking at would be just adding the fixes
>>> to allow the native packages to build against eglibc 2.16 so it can
>>> work on host distros that use it, not bringing eglibc 2.16 itself in
>>> for the target.
>>
>>
>> Right, this would just be to allow edison to work on systems that
>> have a native eglibc 2.16. I'm not convinced we have the patches
>> worked out yet though. Target eglibc would remain with whatever is in ed=
ison (2.13?).
>>
> I assume you mean denzil, not edison, or do we also need to be
> planning a 1.1.3?

Personally, I'm hoping we at least keep accepted patches to the edison bran=
ch... and decide about a release later.

-M

>
> Sau!
>
>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


