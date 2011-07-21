Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QjzuK-0000zV-65
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 22:31:44 +0200
Received: from STOEXMBXC03.domain01.net
	([fe80:0000:0000:0000:99c4:3913:164.170.217.90]) by
	stoexhubfe01.domain01.net
	([10.12.10.6]) with mapi; Thu, 21 Jul 2011 22:26:14 +0200
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jul 2011 22:28:13 +0200
Thread-Topic: [OE-core] kernels
Thread-Index: AcxH5G+ImOFvnRJCS8qTdKgjDJWTWw==
Message-ID: <4BC6918B-4BE3-43B9-BCCD-D6DE5E3CB203@chargestorm.se>
References: <1310736077.3805.37.camel@phil-desktop>
	<CADkTA4OYB0mch1SRSgidwGfZiWBeBuaWKH1BU1NgF9jPVa1Niw@mail.gmail.com>
	<1310742175.30326.1.camel@phil-desktop>
	<CADkTA4MoCmtKypORoGvShciAgiFsOJFLmSiAQiVdAxLAYKkyHQ@mail.gmail.com>
	<CADkTA4MetjKoZfS7gcKSm9wm3iQZoxaJPqmrJ6KBOWsXF1QVSQ@mail.gmail.com>
	<772ABCD3-A957-469A-A2AB-F2C27A0A5F0C@dominion.thruhere.net>
	<CADkTA4Mpg3bQfyq+NmhK2=ySM+9-7eQzj_HueMirrcV4rs2bWA@mail.gmail.com>
	<81ED61E2-5C03-4E01-B588-633B6F19B39D@chargestorm.se>
	<CADkTA4MY=qn1emEvVd6=tPNZJEfwPUKX7AkzdSDF7JtUqRYXbw@mail.gmail.com>
In-Reply-To: <CADkTA4MY=qn1emEvVd6=tPNZJEfwPUKX7AkzdSDF7JtUqRYXbw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: kernels
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
X-List-Received-Date: Thu, 21 Jul 2011 20:31:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


On 21 jul 2011, at 19:36, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote=
:

> On Thu, Jul 21, 2011 at 1:23 PM, Anders Darander <anders@chargestorm.se> =
wrote:
>>=20
>> On 20 jul 2011, at 22:18, "Bruce Ashfield" <bruce.ashfield@gmail.com> wr=
ote:
>>=20
>>> On Wed, Jul 20, 2011 at 11:45 AM, Koen Kooi <koen@dominion.thruhere.net=
> wrote:
>>>>=20
>>>> Op 20 jul 2011, om 17:42 heeft Bruce Ashfield het volgende geschreven:
>>>>=20
>>>>> On Fri, Jul 15, 2011 at 11:36 AM, Bruce Ashfield
>>>>> <bruce.ashfield@gmail.com> wrote:
>>>>>> On Fri, Jul 15, 2011 at 11:02 AM, Phil Blundell <philb@gnu.org> wrot=
e:
>>>>>>> On Fri, 2011-07-15 at 09:51 -0400, Bruce Ashfield wrote:
>>>>>>>> On Fri, Jul 15, 2011 at 9:21 AM, Phil Blundell <pb@pbcl.net> wrote=
:
>>>>>>>>> The other day I was working on a BSP layer for a fairly generic i=
586
>>>>>>>>> system and I was struck by the fact that we don't appear to have =
any
>>>>>>>>> vanilla kernel recipes in oe-core.  I had sort of expected that, =
to get
>>>>>>>>> a standard bzImage out, I would just need to ship an appropriate
>>>>>>>>> defconfig in my layer and everything else would "just work".
>>>>>>>>=20
>>>>>>>> Hmm. Perhaps it isn't documented clearly enough as such, but the l=
inux-yocto
>>>>>>>> kernel base can work in this mode, since that was a design goal of
>>>>>>>> 1.0.
>>>>>>>>=20
>>>>>>>> You pick a branch, throw in a config fragment (or defconfig if you=
 really
>>>>>>>> want)  and build. The base branches in the tree are generic enough=
 to
>>>>>>>> sort a range of boards out of the box, and should form a base.
>>>>>>>=20
>>>>>>> Okay, cool.  I'll give it a go and see how I get on.
>>>>>>>=20
>>>>>>> Is there a description anywhere of what the functional differences =
are
>>>>>>> between the code in linux-yocto git and the upstream kernel.org tre=
e?
>>>>>>=20
>>>>>> It varies, and the variables are many, so I can answer this in sever=
al ways.
>>>>>=20
>>>>> Following up on my own email. I'm just about to push out the 3.0
>>>>> kernel support / changes, so I'm seeing the light at the end of the t=
unnel
>>>>> and recalled that this is still hanging a bit.
>>>>>=20
>>>>> Is there anything tangible you wanted me to do here ?  Create an exam=
ple ?
>>>>> Write a short howto  .. or something else ?
>>>>=20
>>>> A guide to make your own setup that isn't based on linux-yocto but whi=
ch does work with the linux-yocto bbclass?
>>>=20
>>> That's reasonable. Once I get the imminent kernel uprev out the door, I=
'll
>>> focus on something along these lines.
>>=20
>> That sounds good. Upon re-reading the email, I wasn't really sure if the=
 intent was a guide on how to supply your own configuration, or whether it =
was intended to be about how to integrate a custom BSP-kernel (preferably b=
oth tarball and directly from a local git repo). If it was the first, then =
I hope that later on we'll be able to derive a guide for developing a custo=
m BSP-layer (it's the kernel part I'm interested in).
>=20
> It was more the first in this case, but it can actually encompass the
> second. What would be covered here would be a special case of developing
> a custom layer. Taking some arbitrary source, configuration, patches, git=
 trees
> and creating a kernel repo that would work with the linux-yocto tools and
> recipes.
>=20
> The second topic of creating a custom BSP layer, doesn't (and shouldn't
> normally) have to go so far. A simple branch reference, or reference to
> a tree based on a known linux-yocto is all you need to build with linux-y=
octo
> for most custom BSPs. As for the source of that custom BSP (tarball or
> git) that would be covered in how to create that custom branch reference.
>=20
>>=20
>> Preferably first a guide on how to get a custom BSP kernel built from gi=
t, and later on, when there both are time available as well as some more st=
abilization, how to base my own BSP kernel on linux-yocto (eg. using linux-=
yocto as the upstream repo). It's unfortunately not always that likely that=
 the BSP for some products will be mainlined...
>=20
> I experience this every day as well .. bsp patches that will largely
> live forever, so
> I completely understand. The structure of the repos is created to manage =
just
> this sort of nagging patch and any crimes they may have committed. So thi=
s
> topic can be explicitly called out and worked on.
>=20
> The basics are covered in the existing guides, but it sounds like some en=
d
> to end use cases might be in order.

Sounds good.

I'll try to have a new look at the existing guides in a few weeks, but I gu=
ess that some end-to-end use cases would be helpful. Not least when it come=
s to try to combine a custom git repo based both on a custom BSP and linux-=
yocto (at least trying to sync it up to linux-yocto).=20

I guess that I'm not alone in that I've not yet converted our old Linux rec=
ipes from oe-dev to be based on Linux-yocto (otoh, our developers are still=
 working on our oe-dev based tree), so I'm not in a real hurry.

Cheers,
Anders=


