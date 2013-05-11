Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UbGrh-0000qY-Iv
	for openembedded-core@lists.openembedded.org;
	Sat, 11 May 2013 22:58:03 +0200
Received: by mail-oa0-f44.google.com with SMTP id n12so6240116oag.17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2013 13:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=S/w9rhX1VdiS5dRrZYygPViJalNKCmooQATjO1OEBr4=;
	b=OsGe+e1cjZquG0lzMYIvbbQJzaZ3MIWCs6NqkbL/2Ui5sTwgJJ+uc+xQ1qp1IkHM+u
	GIWOPbtJ9NVBqjANVzA+7jzhO+v+bJhKtBgHrOCQfjLIGsmwmoy92+RMmbVD/ccxKItV
	2hM76/MeNKP+uSD9tqicOtiADpuKRvtv6W5dFPKzeX2yUILGBikkhJX8KmBf7DW7Muti
	GtgfLP4JsdLLAJmb7sFns0bnfjuvMq9lKH8s8qeVn1fltTmZRQPkO0poXT7N3qD1JGB5
	Ys56HkS/ajxH3GP5oFjK449GHQCId3O1/MX9WL4d03M9sDfjqi+eEiNHd95ZxYcFY1OS
	38FA==
MIME-Version: 1.0
X-Received: by 10.60.133.240 with SMTP id pf16mr4031295oeb.28.1368304793663;
	Sat, 11 May 2013 13:39:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Sat, 11 May 2013 13:39:53 -0700 (PDT)
In-Reply-To: <1368224314.11129.65.camel@ted>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com> <1368185566.11129.28.camel@ted>
	<518D22CC.1040002@r-finger.com> <1368206371.11129.46.camel@ted>
	<CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
	<1368224314.11129.65.camel@ted>
Date: Sat, 11 May 2013 17:39:53 -0300
X-Google-Sender-Auth: 3SbPrY1bjuQfvOpMC3AcL9LMElU
Message-ID: <CAP9ODKo4Knb2Ho5+XS3dGJ2K7DuxSasfhbiMUsLp_SkeOwbkEg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 11 May 2013 20:58:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 10, 2013 at 7:18 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-05-10 at 17:22 -0300, Otavio Salvador wrote:
>> On Fri, May 10, 2013 at 2:19 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Fri, 2013-05-10 at 17:39 +0100, Tomas Frydrych wrote:
>> >> On 10/05/13 12:32, Richard Purdie wrote:
>> >> > On Fri, 2013-05-10 at 11:56 +0100, Tomas Frydrych wrote:
>> >> >> On 10/05/13 10:05, Richard Purdie wrote:
>> >> > The closely track upstream is the key part and I think the core can do
>> >> > this, apart from the ~six week stabilisation window.
>> >>
>> >> If you mean you are prepared to do frequent point releases to keep up
>> >> with clutter, that could work. But if you mean that those interested can
>> >> closely track oe-core master, then that is not that useful, there are
>> >> too many other changes happening at the same time. A small single
>> >> purpose layer means updates (and breakages) can be very contained.
>> >
>> > Point releases of what? I don't mind clutter in master changing quite a
>> > lot up to our stabilisation point. Once we've released, I don't mind
>> > someone else picking up a danny-clutter branch or something like that
>> > which is backporting specific changes.
>>
>> So we're going to have <branch>-<pet package> branches?
>
> There may be a time and a place for such things and its not different to
> the situation you'll end up in with a meta-clutter repository where
> you'll likely end up with danny-1.12 and danny-1.14 branches, or
> multiple sets of recipes in a single danny branch, thereby changing the
> definition of "stable" from that used in the core which will be
> confusing in itself.

I don't think we need separated branches in a clutter specific layer,
we just need to keep versions around so custom BSPs can stick to a
specific one. Putting multiple branches on OE-Core/Poky confuse all
users and also blocks on you for merges, fixes and like. It just does
not scale.

>>  I think this does not scale and I am at Tomas side. The layer seems
>> the right thing to do so it does not need to be done by branch and
>> avoid confusing users.
>
> You're swapping one set of problems for another set the way I see it.

No. We're making use of modular design and taking profit of it.

>> >> > My argument for this is that I really do want to stress out the graphics
>> >> > stack we have, clutter provides a good way to test some of those
>> >> > components, particularly some of the more unusual parts. Currently its
>> >> > mostly build test however we do have plans to make that runtime too. I
>> >> > do think that clutters unusual usage of the stack makes it particular
>> >> > useful in this role. I'd appreciate help from anyone who can help make
>> >> > this all work.
>> >>
>> >> I am all for this, but does using clutter for automated tests require
>> >> for the clutter packages to be in oe-core? The only thing you can stress
>> >> test in oe-core using clutter is mesa, which is only applicable to the
>> >> i915/i965 chip sets. I think it would be useful if any such tests could
>> >> be applied to other graphics stacks provided by BSPs; I think all of the
>> >> BSPs would benefit from this.
>> >
>> > We'd be able to test mesa and the software fallbacks under qemu which
>> > would be a start. If we can get those working with a decent framework
>> > for the tests, I'm hoping wider BSP testing would follow. I don't have
>> > unlimited resources available but I can try and get the software
>> > infrastructure to the point where doing the testing could be picked up
>> > by someone else relatively easily.
>>
>> You could do just the same but adding meta-clutter to the AB setup for
>> testing. One thing does not conflict with the another.
>
> I've always been extremely clear that I believe the core needs to stand
> on its own, including being testable. I appreciate some people disagree
> with that however I believe that without this, the quality in the core
> would drop substantially. Even maintaining the testability of what we
> have now is actually an incredible challenge. Anyone who thinks
> otherwise should spend a week triaging the autobuilder failures.

And I fully agree but this does not mean we should have core growing.
We can have core and also a small set of layers which are added to
some tests, this also helps to uncover layer related issues and is
also import to test.

Nobody thinks it is easy but being hard doesn't mean it is right.
Yocto community is growing and we will always have good and bad
layers. The bad ones shouldn't be part of the test base, just it.

> Adding mode dimensions to a problem we already struggle with seems like
> a bad idea to me.

This sounds like you're against the modular design and it is no sense
for me. These dimensions also need test and if it cannot be done, we
have a design flaw.

>> > It is a big help in trying to achieve this if we don't have many
>> > different layers involved as that would complicate the problem, even
>> > coordinating layer releases between different maintainers is tricky
>> > right now and trying to develop something like this over layer
>> > boundaries sounds like adding to the complexity to the point I'd rather
>> > just scrap the idea :(.
>>
>> Well if layers make life harder it invalidates one of points of Yocto
>> which I always liked and depends on heavily - modular design.
>
> The layer model has its risks as well as its advantages. The risk is
> that we end up too fragmented, with too many maintainers who don't
> communicate and nothing ever works together.
>
> Even as the model stands today, its showing signs of strain. I posted
> patches near enough three weeks ago for meta-raspberrypi, no response. I
> know there are reasons why but they're not visible. The meta-fsl layers
> appear to spend more of their time not building than building and
> getting people to fix those in a timely fashion can sometimes be
> challenging, particularly with the split between arm and ppc and some of
> the transitions going on there etc.

It is all about community, as I said above we will always have the
good and bad layers. This does not mean the design is wrong neither
that layers is a bad thing but that you should choose carefully the
ones to depends on.

I can only talk by myself so I think the meta-fsl-arm is in a very
good shape and I've been quite responsive to fix issues. We had
problems of course and we tried very hard to fix them. I am sure you
know it.

> Right now, I think there are enough splits causing enough
> interoperability issues to be going on with in the layers and no, to be
> quite honest I don't think more layers is the right answer right now.

I disagree. More specialized layers allow for community grow around
them and centering it around core seems the wrong direction for me.

> I do continue to believe in the layer model but it is still evolving and
> I'd really like us to focus on the current issues.

Sure and I agree but bear on mind people issues are not always the
same. Some people are involved in customer projects, other busy with
his/her pet project, with a deadline in horizon or prefer a more up to
date clutter package set. As result these people focus on the issues
with high priority for them and it may not be the issues you think it
has higher priority.

It seems, checking commit logs, clutter have not been touch since last
year so as I said previously it was not being of use in regular test.
People seem to have forked it over and over again and I think
community will gain a lot of a central layer to share all this work.

>> I am sure we all want a solid release so I am also sure Tomas wouldn't
>> put experimental version of clutter near of release.
>
> From what I read of Tomas' emails, I actually think his plans differ
> from that as he finds that aspect of OE-Core frustrating.

He wants a more up to date clutter but he also wants people using his
recipes and contributing to it so he won't do crazy things.

He can add the new release and set D_P as -1, for example. This hurts
no one and allow for easy testing and sharing of work.

>>  We are eating our
>> own dog food so we are all interested in make it work, not the
>> opposed. In this case I think it can be well coordinated.
>>
>> One possible thing is you could require AB used layers to be at
>> git.yoctoproject.org so in case of broken recipes (bbappend or so) you
>> could  rename it.
>
> I don't touch layers I don't maintain. If I did that, I would get hung,
> drawn and quartered. Please at least think through things like this
> before saying them :(. Can you imagine what you'd say to me if I pushed
> commits to meta-fsl-arm?

For version upgrades, for example, I think it would be acceptable
(rename bbappends and so on) and you could do it for non active layers
in case it starts to cause problems, not as a rule but the exception.

> This isn't even hypothetical, I have already been "told off" for pushing
> to repos I am not the official maintainer for in much less controversial
> circumstances than this. The offence was not writing a detailed enough
> commit message to conform to that repository's guidelines. FWIW, I
> believe the maintainer was right to object.

I fully agree. However if the layer is not being maintained it might
justify a fix for a build failure for example.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


