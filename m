Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SweKb-0003rw-Uk
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 21:11:42 +0200
Received: from mail162-tx2-R.bigfish.com (10.9.14.246) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.23; Wed, 1 Aug 2012 19:00:02 +0000
Received: from mail162-tx2 (localhost [127.0.0.1])	by
	mail162-tx2-R.bigfish.com (Postfix) with ESMTP id DC21B4E023E	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2012 19:00:02 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zzbb2dI98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail162-tx2 (localhost.localdomain [127.0.0.1]) by mail162-tx2
	(MessageSwitch) id 1343847579351388_24412;
	Wed,  1 Aug 2012 18:59:39 +0000 (UTC)
Received: from TX2EHSMHS001.bigfish.com (unknown [10.9.14.235])	by
	mail162-tx2.bigfish.com (Postfix) with ESMTP id 827001A00B6	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2012 18:59:35 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS001.bigfish.com
	(10.9.99.101) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 1 Aug 2012 18:59:35 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Wed, 1 Aug 2012 13:59:34 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] static busybox?
Thread-Index: AQHNcBfKMQGjJxQd806Sv9xDOQ6NUw==
Date: Wed, 1 Aug 2012 18:59:33 +0000
Message-ID: <CAEsOVNfbJAqrDf-+DQh3h0pWtf-qDuQqKfC+_oBRHgyY4B6Obg@mail.gmail.com>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<50183924.8010309@windriver.com>
	<CADkTA4N_mFVkWx7G=E8BoCDYktkNXxO-zLrw_r9e0sO-wE5FjQ@mail.gmail.com>
	<CALRxmdDzaizHQ8m1NFRp2-Ucn9Pm6vZJX=pTTdZ5aLx-61OUzw@mail.gmail.com>
	<50195AFF.1070507@windriver.com>
In-Reply-To: <50195AFF.1070507@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: static busybox?
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
X-List-Received-Date: Wed, 01 Aug 2012 19:11:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E6805C15F8D14A4BA679B2A377BE0ED6@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 1, 2012 at 11:36 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 8/1/12 11:21 AM, Stuart Yoder wrote:
>>
>> On Tue, Jul 31, 2012 at 3:07 PM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>>>
>>> On Tue, Jul 31, 2012 at 3:59 PM, Mark Hatle <mark.hatle@windriver.com>
>>> wrote:
>>>>
>>>> On 7/31/12 1:14 PM, Stuart Yoder wrote:
>>>>>
>>>>>
>>>>> We are doing some work with LXC (containers) and one of the templates
>>>>> is for busybox.  For LXC, the busybox package needs to be built
>>>>> statically
>>>>> and
>>>>> there is a config option for this.
>>>>>
>>>>> A couple possible approaches:
>>>>>
>>>>>      -create a new 'busybox_static' recipe that the lxc package
>>>>>       depends on that turns on the needed build options.   Pretty
>>>>>       straightforward, but now there are 2 variants of the busybox
>>>>>       package.
>>>>>
>>>>>      -somehow propagate some configuration options through to
>>>>>       the standard busybox recipe so it turns on the config
>>>>>       option to build things statically.   Not sure how to
>>>>>       do this, and seems like it could get pretty messy.
>>>>>
>>>>> Any thoughts?
>>>>
>>>>
>>>>
>>>> We've been talking about this as well..  I'm currently of the opinion
>>>> that
>>>> the kernel's config fragement processing be added to busybox.  This wa=
y
>>>> someone can simply add a configuration fragment via a bbappend, or oth=
er
>>>> approach and it'll pick it up.   That same can be used to specify how =
to
>>>> enable other optional pieces of busybox.
>>>
>>>
>>> merge_config.pl can be yanked out of the kernel source tree (it's
>>> upstream) and
>>> packaged as something for use by busy box.
>>>
>>> I wouldn't recommend all the scaffolding that the kernel has (it's
>>> overkill, since
>>> there are more configs, patches and git manipulations in play for the
>>> kernel), but a\
>>> simple scheme to collect the fragments from the SRC_URI and fire them
>>> through
>>> merge_config.pl would be a pretty simple python routine.
>>
>>
>> So how would this work from the user's point of view?   I somehow
>> need to get busybox's CONFIG_STATIC config option set.   Does the lxc
>> recipe somehow
>> specify this?   Or does the lxc recipe reference a busybox-static
>> dependency that sets the option?
>
>
> You would be able to add a .bbappend that would have a configuration
> fragment in it.  This fragment would be added to the busybox configuratio=
n
> to override any built in items.
>
> So you'd need to simply have a file that says:
>
> CONFIG_STATIC =3D y

This is one approach, to change busybox completely for a specific
added layer. But, what if we only want to make this change to busybox
if the lxc recipe is included in the image? What about other packages
also requesting changes?

-M

> --Mark
>
>
>> Stuart
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



