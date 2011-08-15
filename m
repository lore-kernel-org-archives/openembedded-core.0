Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Qt4Dm-0005Nj-Vf
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 22:57:19 +0200
Received: by yxi19 with SMTP id 19so3324645yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 13:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=rETiJhW3a0Whs9Fjy+bHmop0jzxNg4hPdnVOh4igdA0=;
	b=X7ReCr9/NuvBK+7LwxVinux5QlTTs/lLjgYOVm2cQiBDp30sSpfoj+HM86bRC9R/2J
	EQhdUZGjLPmh3PZ6BIQ2yoof3A1fV2JTtKnea0jUKuT+4OIUpCr0bLbvsdNZuQrn9bEm
	eS187VnGO7BVgNG6fSUriPy9jqlmIwZTJVjQk=
MIME-Version: 1.0
Received: by 10.101.132.34 with SMTP id j34mr4274878ann.142.1313441561958;
	Mon, 15 Aug 2011 13:52:41 -0700 (PDT)
Received: by 10.100.95.3 with HTTP; Mon, 15 Aug 2011 13:52:41 -0700 (PDT)
In-Reply-To: <CADkTA4MY=qn1emEvVd6=tPNZJEfwPUKX7AkzdSDF7JtUqRYXbw@mail.gmail.com>
References: <1310736077.3805.37.camel@phil-desktop>
	<CADkTA4OYB0mch1SRSgidwGfZiWBeBuaWKH1BU1NgF9jPVa1Niw@mail.gmail.com>
	<1310742175.30326.1.camel@phil-desktop>
	<CADkTA4MoCmtKypORoGvShciAgiFsOJFLmSiAQiVdAxLAYKkyHQ@mail.gmail.com>
	<CADkTA4MetjKoZfS7gcKSm9wm3iQZoxaJPqmrJ6KBOWsXF1QVSQ@mail.gmail.com>
	<772ABCD3-A957-469A-A2AB-F2C27A0A5F0C@dominion.thruhere.net>
	<CADkTA4Mpg3bQfyq+NmhK2=ySM+9-7eQzj_HueMirrcV4rs2bWA@mail.gmail.com>
	<81ED61E2-5C03-4E01-B588-633B6F19B39D@chargestorm.se>
	<CADkTA4MY=qn1emEvVd6=tPNZJEfwPUKX7AkzdSDF7JtUqRYXbw@mail.gmail.com>
Date: Mon, 15 Aug 2011 16:52:41 -0400
Message-ID: <CADkTA4NdgvX8+y4fO7-7L3YcexSUA3f4oJ=YGKywVuG3DM=J7A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 15 Aug 2011 20:57:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2011 at 1:36 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Thu, Jul 21, 2011 at 1:23 PM, Anders Darander <anders@chargestorm.se> =
wrote:
>>
>> On 20 jul 2011, at 22:18, "Bruce Ashfield" <bruce.ashfield@gmail.com> wr=
ote:
>>
>>> On Wed, Jul 20, 2011 at 11:45 AM, Koen Kooi <koen@dominion.thruhere.net=
> wrote:
>>>>
>>>> Op 20 jul 2011, om 17:42 heeft Bruce Ashfield het volgende geschreven:
>>>>
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
>>>>>>>>> vanilla kernel recipes in oe-core. =A0I had sort of expected that=
, to get
>>>>>>>>> a standard bzImage out, I would just need to ship an appropriate
>>>>>>>>> defconfig in my layer and everything else would "just work".
>>>>>>>>
>>>>>>>> Hmm. Perhaps it isn't documented clearly enough as such, but the l=
inux-yocto
>>>>>>>> kernel base can work in this mode, since that was a design goal of
>>>>>>>> 1.0.
>>>>>>>>
>>>>>>>> You pick a branch, throw in a config fragment (or defconfig if you=
 really
>>>>>>>> want) =A0and build. The base branches in the tree are generic enou=
gh to
>>>>>>>> sort a range of boards out of the box, and should form a base.
>>>>>>>
>>>>>>> Okay, cool. =A0I'll give it a go and see how I get on.
>>>>>>>
>>>>>>> Is there a description anywhere of what the functional differences =
are
>>>>>>> between the code in linux-yocto git and the upstream kernel.org tre=
e?
>>>>>>
>>>>>> It varies, and the variables are many, so I can answer this in sever=
al ways.
>>>>>
>>>>> Following up on my own email. I'm just about to push out the 3.0
>>>>> kernel support / changes, so I'm seeing the light at the end of the t=
unnel
>>>>> and recalled that this is still hanging a bit.
>>>>>
>>>>> Is there anything tangible you wanted me to do here ? =A0Create an ex=
ample ?
>>>>> Write a short howto =A0.. or something else ?
>>>>
>>>> A guide to make your own setup that isn't based on linux-yocto but whi=
ch does work with the linux-yocto bbclass?
>>>
>>> That's reasonable. Once I get the imminent kernel uprev out the door, I=
'll
>>> focus on something along these lines.
>>
>> That sounds good. Upon re-reading the email, I wasn't really sure if the=
 intent was a guide on how to supply your own configuration, or whether it =
was intended to be about how to integrate a custom BSP-kernel (preferably b=
oth tarball and directly from a local git repo). If it was the first, then =
I hope that later on we'll be able to derive a guide for developing a custo=
m BSP-layer (it's the kernel part I'm interested in).
>
> It was more the first in this case, but it can actually encompass the
> second. What would be covered here would be a special case of developing
> a custom layer. Taking some arbitrary source, configuration, patches, git=
 trees
> and creating a kernel repo that would work with the linux-yocto tools and
> recipes.
>
> The second topic of creating a custom BSP layer, doesn't (and shouldn't
> normally) have to go so far. A simple branch reference, or reference to
> a tree based on a known linux-yocto is all you need to build with linux-y=
octo
> for most custom BSPs. As for the source of that custom BSP (tarball or
> git) that would be covered in how to create that custom branch reference.

bumping this old thread (by replying to myself), this hasn't been forgotten=
,
and I spent considerable time on some docs last week. I've got a few small
sections remaining to complete (but important sections), and I'll have some
reasonable docs that I can send out in the next day or so.

Cheers,

Bruce

>
>>
>> Preferably first a guide on how to get a custom BSP kernel built from gi=
t, and later on, when there both are time available as well as some more st=
abilization, how to base my own BSP kernel on linux-yocto (eg. using linux-=
yocto as the upstream repo). It's unfortunately not always that likely that=
 the BSP for some products will be mainlined...
>
> I experience this every day as well .. bsp patches that will largely
> live forever, so
> I completely understand. The structure of the repos is created to manage =
just
> this sort of nagging patch and any crimes they may have committed. So thi=
s
> topic can be explicitly called out and worked on.
>
> The basics are covered in the existing guides, but it sounds like some en=
d
> to end use cases might be in order.
>
> Bruce
>
>>
>> Cheers,
>> Anders
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
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


