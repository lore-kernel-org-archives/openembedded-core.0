Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THSJA-0003Sv-6o
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 06:36:12 +0200
Received: from mail93-am1-R.bigfish.com (10.3.201.226) by
	AM1EHSOBE010.bigfish.com (10.3.204.30) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 04:23:19 +0000
Received: from mail93-am1 (localhost [127.0.0.1])	by mail93-am1-R.bigfish.com
	(Postfix) with ESMTP id 8EB5B2600FC;
	Fri, 28 Sep 2012 04:23:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3h946hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail93-am1 (localhost.localdomain [127.0.0.1]) by mail93-am1
	(MessageSwitch) id 1348806197196229_18515;
	Fri, 28 Sep 2012 04:23:17 +0000 (UTC)
Received: from AM1EHSMHS002.bigfish.com (unknown [10.3.201.230])	by
	mail93-am1.bigfish.com (Postfix) with ESMTP id 2ABF1460056;
	Fri, 28 Sep 2012 04:23:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS002.bigfish.com
	(10.3.207.102) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 04:23:16 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0309.003; Thu, 27 Sep 2012 23:23:14 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] perl install error
Thread-Index: AQHNnSsJbPfdUfkH6UeNb9LQuJLCBZefcDgA//+u14CAAFskgP//rVAA
Date: Fri, 28 Sep 2012 04:23:14 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6B462F@039-SN1MPN1-001.039d.mgd.msft.net>
References: <9CAE2E57-84BE-44B7-A7BE-BCE8F728EFE8@gmail.com>
	<E416A48D-4E21-4353-BDDC-B3B15AA810C9@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B4252@039-SN1MPN1-001.039d.mgd.msft.net>
	<C4E52DF7-ECBD-4411-9DA6-5E7F920FE747@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B43AC@039-SN1MPN1-001.039d.mgd.msft.net>
	<C0194970-81E1-4713-A8EF-5BB842370C25@gmail.com>
In-Reply-To: <C0194970-81E1-4713-A8EF-5BB842370C25@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"openembedded-core@lists.openembedded.org oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: perl install error
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
X-List-Received-Date: Fri, 28 Sep 2012 04:36:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <30BA86A897423049B3A68F82E11ED3BC@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2012 at 11:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sep 27, 2012, at 8:52 PM, McClintock Matthew-B29882 <B29882@freescale.=
com> wrote:
>
>> On Thu, Sep 27, 2012 at 10:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Sep 27, 2012, at 8:40 PM, McClintock Matthew-B29882 <B29882@freescal=
e.com> wrote:
>>>
>>>> Khem,
>>>>
>>>> I'm just not looking at a similiar issue. Do this:
>>>>
>>>
>>>
>>> just 'not' or just 'now' ?
>>>
>>>> cat tmp/sstate-control/manifest-* | grep usr/lib/perl5
>>>>
>>>> And see which recipe is making this folder. It should be the perl
>>>> recipe, first not some other recipe=85
>>>
>>>
>>> cat sstate-control/manifest-* | grep usr/lib/perl5
>>>
>>> return nothing
>>
>> Maybe this is not the same root cause then.
>
> reverting that commit fixed it. before that I tried to cleans state clean=
 all perl and perl-native
> to no avail.

OK, well we got the same error and ours was from another sstate-cache
installing files in /usr/lib/perl5 before perl installed it's own
symlink. cleaning cache for perl did not help either.

Reverting that patch could have causes rebuilds and change of ordering
(possibly) that might mask the error a little longer. If ours are
related.

-M

>>
>>>
>>>>
>>>> Side question are you using FSL layers?
>>>
>>> yes
>>
>> Is libhugetlbfs getting built?
>
> No
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



