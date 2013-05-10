Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UauLd-0007QB-M0
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 22:55:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4AKbJev006487
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 13:37:20 -0700 (PDT)
Received: from msp-dhcp6.wrs.com (172.25.34.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 10 May 2013 13:37:18 -0700
Message-ID: <518D5A7D.20606@windriver.com>
Date: Fri, 10 May 2013 15:37:17 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com> <1368185566.11129.28.camel@ted>
	<518D22CC.1040002@r-finger.com> <1368206371.11129.46.camel@ted>
	<CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
In-Reply-To: <CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Fri, 10 May 2013 20:55:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/10/13 3:22 PM, Otavio Salvador wrote:
> On Fri, May 10, 2013 at 2:19 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2013-05-10 at 17:39 +0100, Tomas Frydrych wrote:
>>> On 10/05/13 12:32, Richard Purdie wrote:
>>>> On Fri, 2013-05-10 at 11:56 +0100, Tomas Frydrych wrote:
>>>>> On 10/05/13 10:05, Richard Purdie wrote:
>>>> The closely track upstream is the key part and I think the core can do
>>>> this, apart from the ~six week stabilisation window.
>>>
>>> If you mean you are prepared to do frequent point releases to keep up
>>> with clutter, that could work. But if you mean that those interested can
>>> closely track oe-core master, then that is not that useful, there are
>>> too many other changes happening at the same time. A small single
>>> purpose layer means updates (and breakages) can be very contained.
>>
>> Point releases of what? I don't mind clutter in master changing quite a
>> lot up to our stabilisation point. Once we've released, I don't mind
>> someone else picking up a danny-clutter branch or something like that
>> which is backporting specific changes.
>
> So we're going to have <branch>-<pet package> branches? I think this
> does not scale and I am at Tomas side. The layer seems the right thing
>   to do so it does not need to be done by branch and avoid confusing
> users.
>
>>>> My argument for this is that I really do want to stress out the graphics
>>>> stack we have, clutter provides a good way to test some of those
>>>> components, particularly some of the more unusual parts. Currently its
>>>> mostly build test however we do have plans to make that runtime too. I
>>>> do think that clutters unusual usage of the stack makes it particular
>>>> useful in this role. I'd appreciate help from anyone who can help make
>>>> this all work.
>>>
>>> I am all for this, but does using clutter for automated tests require
>>> for the clutter packages to be in oe-core? The only thing you can stress
>>> test in oe-core using clutter is mesa, which is only applicable to the
>>> i915/i965 chip sets. I think it would be useful if any such tests could
>>> be applied to other graphics stacks provided by BSPs; I think all of the
>>> BSPs would benefit from this.
>>
>> We'd be able to test mesa and the software fallbacks under qemu which
>> would be a start. If we can get those working with a decent framework
>> for the tests, I'm hoping wider BSP testing would follow. I don't have
>> unlimited resources available but I can try and get the software
>> infrastructure to the point where doing the testing could be picked up
>> by someone else relatively easily.
>
> You could do just the same but adding meta-clutter to the AB setup for
> testing. One thing does not conflict with the another.
>
>> It is a big help in trying to achieve this if we don't have many
>> different layers involved as that would complicate the problem, even
>> coordinating layer releases between different maintainers is tricky
>> right now and trying to develop something like this over layer
>> boundaries sounds like adding to the complexity to the point I'd rather
>> just scrap the idea :(.
>
> Well if layers make life harder it invalidates one of points of Yocto
> which I always liked and depends on heavily - modular design.

One of the key pieces of the oe-core, it must be able to work without any 
additional layers.  It also much be able to be tested without any additional layers.

I personally don't have a preference for the clutter and related items on where 
they live... but I do want to make sure that oe-core can standalone as a 
starting point for people to develop devices.  Part of being standalone means 
that it is capable of being tested.

--Mark

> I am sure we all want a solid release so I am also sure Tomas wouldn't
> put experimental version of clutter near of release. We are eating our
> own dog food so we are all interested in make it work, not the
> opposed. In this case I think it can be well coordinated.
>
> One possible thing is you could require AB used layers to be at
> git.yoctoproject.org so in case of broken recipes (bbappend or so) you
> could  rename it.
>
>>> I'd really like for people to be able to just pick up uptodate and
>>> working clutter packages for the major platforms the actively maintained
>>> BSPs support.
>>
>> Agreed.
>>
>>>   Every so often someone asks about clutter for XYZ (usually
>>> the Beagleboard or RPi) on the clutter list: this should be readily
>>> available somewhere.
>>
>> I'd hope the recipes in the core would be in a good state in this
>> regard.
>
> Good weekend for everyone :-)
>
> Regards,
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



