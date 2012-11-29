Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <David.Nystrom@enea.com>) id 1Tdzuo-0000Fy-5f
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 09:56:22 +0100
Received: from [172.16.140.28] (172.16.140.28) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.2.318.1;
	Thu, 29 Nov 2012 09:41:58 +0100
Message-ID: <50B71FD4.3090304@enea.com>
Date: Thu, 29 Nov 2012 09:41:56 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
In-Reply-To: <CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
X-Originating-IP: [172.16.140.28]
Cc: Patches, discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-cloud layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 08:56:22 -0000
X-List-Received-Date: Thu, 29 Nov 2012 08:56:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

Adding Ray Danks to CC.

Ray, how do you want to go forward with the meta-xen layer ?

 From my perspective, having the actual hypervisor technology abstracted
from the userspace virtualization stuff is preferable. So a user could=20
pick-and-place hypervisor layer/s depending on needs. (And good for=20
use-case benchmarks as well).

libvirt package and others are smart enough to autodetect underlying=20
hypervisor tech capabilities, and should work out-of-the-box from that=20
aspect.

As to where all this will finally end up, anything goes as far as I'm=20
concerned. I'll continue working in meta-cloud for now, until consensus=20
is reached on the final whereabouts for the virtualization specific recipes=
.

If anyone want to join me on github, send me an email.

Best Regards,
David


On 11/28/2012 06:25 PM, Bruce Ashfield wrote:
> On Wed, Nov 28, 2012 at 11:22 AM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Wed, 2012-11-28 at 17:10 +0100, David Nystr=F6m wrote:
>>> Hello everyone,
>>>
>>> I'm working on getting a minimal Yocto/oe-core based OpenStack setup
>>> running with the meta-cloud layer, with bits and pieces "borrowed" from
>>> the meta-xen layer.
>>
>> Great news!
>>
>> It might be worth growing meta-xen into a meta-virtualisation layer
>> since kvm, openstack and xen all seem to be sharing a lot of pieces.
>> This depends on the maintainers but it would seem to be logical rather
>> than many small interdependent layers.
>>
>
> FWIW. I'd like to see this as well, and can contribute/help where possibl=
e.
> I
> was considering a meta-ovs (Open Virtualization Solutions), but if there =
are
> already plans afoot for a meta-virtualization, then anything I did could =
be
> pushed down keeping any other layers small.
>
> In particular I'm keen to drive some common kernel configuration, and wor=
k
> on consolidating kernel features in trees versus having a whole set of ou=
t
> of
> tree modules with better tie in's to userspace enabling features
> dynamically.
>
> So I'll keep an eye out for things as well and help where possible.
>
> Cheers,
>
> Bruce
>
>
>>
>>> Still in its infancy, and lots of stuff is still missing and/or not
>>> working properly.
>>>
>>> Have a look if your interested, not much to see yet though.
>>>
>>> https://github.com/nysan/meta-cloud.git
>>>
>>> Any thoughts on floating layer ML:s, i.e. an ML for so called
>>> "out-of-tree" layers ?  Or is the common thought that all new recipes
>>> should eventually go into oe-core ?
>>
>> The Yocto Project has been using the Yocto list for that and
>> OpenEmbedded has openembedded-devel. Its not expected for everything to
>> end up in OE-Core, quite the opposite.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>


