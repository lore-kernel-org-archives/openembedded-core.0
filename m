Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihai.prica@intel.com>) id 1Te1FN-00047J-Kd
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 11:21:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Nov 2012 02:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,182,1355126400"; d="scan'208";a="173910909"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Nov 2012 02:06:07 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.13]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.74]) with mapi id
	14.01.0355.002; Thu, 29 Nov 2012 10:05:31 +0000
From: "Prica, Mihai" <mihai.prica@intel.com>
To: =?iso-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] meta-cloud layer
Thread-Index: AQHNzYMv6hD+nrknv0yyMh3txQVlx5f/bhqAgAARlQCAAQARAIAAFrbA
Date: Thu, 29 Nov 2012 10:05:30 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF8F14FE@IRSMSX101.ger.corp.intel.com>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com>
In-Reply-To: <50B71FD4.3090304@enea.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: discussions, layer <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 29 Nov 2012 10:21:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Great job!

I've done some work on integrating KVM into yocto. You can find it on git:/=
/git.yoctoproject.org/poky-contrib on the mihaip/meta-kvm.=20
It's functional but it requires a PU for libnl to the latest version that y=
ou can find on the mailing list (it hasn't been merged to master yet). Once=
 this happens I'll put the layer on the yocto repository page.
I support the idea of merging all these layers into one because there a lot=
 of common packages.

@ David: I don't know if you got the chance to look over the last patches t=
hat were merged these days to meta-xen. They make libvirt independent of th=
e hypervisor technology.

Thanks,
Mihai


-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of David Nystr=F6m
Sent: Thursday, November 29, 2012 10:42 AM
To: Bruce Ashfield
Cc: Patches; discussions about the oe-core layer
Subject: Re: [OE-core] meta-cloud layer

Adding Ray Danks to CC.

Ray, how do you want to go forward with the meta-xen layer ?

 From my perspective, having the actual hypervisor technology abstracted fr=
om the userspace virtualization stuff is preferable. So a user could pick-a=
nd-place hypervisor layer/s depending on needs. (And good for use-case benc=
hmarks as well).

libvirt package and others are smart enough to autodetect underlying hyperv=
isor tech capabilities, and should work out-of-the-box from that aspect.

As to where all this will finally end up, anything goes as far as I'm conce=
rned. I'll continue working in meta-cloud for now, until consensus is reach=
ed on the final whereabouts for the virtualization specific recipes.

If anyone want to join me on github, send me an email.

Best Regards,
David


On 11/28/2012 06:25 PM, Bruce Ashfield wrote:
> On Wed, Nov 28, 2012 at 11:22 AM, Richard Purdie <=20
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Wed, 2012-11-28 at 17:10 +0100, David Nystr=F6m wrote:
>>> Hello everyone,
>>>
>>> I'm working on getting a minimal Yocto/oe-core based OpenStack setup=20
>>> running with the meta-cloud layer, with bits and pieces "borrowed"=20
>>> from the meta-xen layer.
>>
>> Great news!
>>
>> It might be worth growing meta-xen into a meta-virtualisation layer=20
>> since kvm, openstack and xen all seem to be sharing a lot of pieces.
>> This depends on the maintainers but it would seem to be logical=20
>> rather than many small interdependent layers.
>>
>
> FWIW. I'd like to see this as well, and can contribute/help where possibl=
e.
> I
> was considering a meta-ovs (Open Virtualization Solutions), but if=20
> there are already plans afoot for a meta-virtualization, then anything=20
> I did could be pushed down keeping any other layers small.
>
> In particular I'm keen to drive some common kernel configuration, and=20
> work on consolidating kernel features in trees versus having a whole=20
> set of out of tree modules with better tie in's to userspace enabling=20
> features dynamically.
>
> So I'll keep an eye out for things as well and help where possible.
>
> Cheers,
>
> Bruce
>
>
>>
>>> Still in its infancy, and lots of stuff is still missing and/or not=20
>>> working properly.
>>>
>>> Have a look if your interested, not much to see yet though.
>>>
>>> https://github.com/nysan/meta-cloud.git
>>>
>>> Any thoughts on floating layer ML:s, i.e. an ML for so called=20
>>> "out-of-tree" layers ?  Or is the common thought that all new=20
>>> recipes should eventually go into oe-core ?
>>
>> The Yocto Project has been using the Yocto list for that and=20
>> OpenEmbedded has openembedded-devel. Its not expected for everything=20
>> to end up in OE-Core, quite the opposite.
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

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


