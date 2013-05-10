Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Uavvo-00034b-QZ for openembedded-core@lists.openembedded.org;
	Sat, 11 May 2013 00:36:54 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4AMLJnS032413; Fri, 10 May 2013 23:21:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5mYLzofo4yEi; Fri, 10 May 2013 23:21:19 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4AMLFbY032403
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 10 May 2013 23:21:17 +0100
Message-ID: <1368224314.11129.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 10 May 2013 23:18:34 +0100
In-Reply-To: <CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com> <1368185566.11129.28.camel@ted>
	<518D22CC.1040002@r-finger.com> <1368206371.11129.46.camel@ted>
	<CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Patches, about the oe-core layer <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 10 May 2013 22:36:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-05-10 at 17:22 -0300, Otavio Salvador wrote:
> On Fri, May 10, 2013 at 2:19 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2013-05-10 at 17:39 +0100, Tomas Frydrych wrote:
> >> On 10/05/13 12:32, Richard Purdie wrote:
> >> > On Fri, 2013-05-10 at 11:56 +0100, Tomas Frydrych wrote:
> >> >> On 10/05/13 10:05, Richard Purdie wrote:
> >> > The closely track upstream is the key part and I think the core can do
> >> > this, apart from the ~six week stabilisation window.
> >>
> >> If you mean you are prepared to do frequent point releases to keep up
> >> with clutter, that could work. But if you mean that those interested can
> >> closely track oe-core master, then that is not that useful, there are
> >> too many other changes happening at the same time. A small single
> >> purpose layer means updates (and breakages) can be very contained.
> >
> > Point releases of what? I don't mind clutter in master changing quite a
> > lot up to our stabilisation point. Once we've released, I don't mind
> > someone else picking up a danny-clutter branch or something like that
> > which is backporting specific changes.
> 
> So we're going to have <branch>-<pet package> branches?

There may be a time and a place for such things and its not different to
the situation you'll end up in with a meta-clutter repository where
you'll likely end up with danny-1.12 and danny-1.14 branches, or
multiple sets of recipes in a single danny branch, thereby changing the
definition of "stable" from that used in the core which will be
confusing in itself.

>  I think this does not scale and I am at Tomas side. The layer seems
> the right thing to do so it does not need to be done by branch and
> avoid confusing users.

You're swapping one set of problems for another set the way I see it.

> >> > My argument for this is that I really do want to stress out the graphics
> >> > stack we have, clutter provides a good way to test some of those
> >> > components, particularly some of the more unusual parts. Currently its
> >> > mostly build test however we do have plans to make that runtime too. I
> >> > do think that clutters unusual usage of the stack makes it particular
> >> > useful in this role. I'd appreciate help from anyone who can help make
> >> > this all work.
> >>
> >> I am all for this, but does using clutter for automated tests require
> >> for the clutter packages to be in oe-core? The only thing you can stress
> >> test in oe-core using clutter is mesa, which is only applicable to the
> >> i915/i965 chip sets. I think it would be useful if any such tests could
> >> be applied to other graphics stacks provided by BSPs; I think all of the
> >> BSPs would benefit from this.
> >
> > We'd be able to test mesa and the software fallbacks under qemu which
> > would be a start. If we can get those working with a decent framework
> > for the tests, I'm hoping wider BSP testing would follow. I don't have
> > unlimited resources available but I can try and get the software
> > infrastructure to the point where doing the testing could be picked up
> > by someone else relatively easily.
> 
> You could do just the same but adding meta-clutter to the AB setup for
> testing. One thing does not conflict with the another.

I've always been extremely clear that I believe the core needs to stand
on its own, including being testable. I appreciate some people disagree
with that however I believe that without this, the quality in the core
would drop substantially. Even maintaining the testability of what we
have now is actually an incredible challenge. Anyone who thinks
otherwise should spend a week triaging the autobuilder failures.

Adding mode dimensions to a problem we already struggle with seems like
a bad idea to me.

> > It is a big help in trying to achieve this if we don't have many
> > different layers involved as that would complicate the problem, even
> > coordinating layer releases between different maintainers is tricky
> > right now and trying to develop something like this over layer
> > boundaries sounds like adding to the complexity to the point I'd rather
> > just scrap the idea :(.
> 
> Well if layers make life harder it invalidates one of points of Yocto
> which I always liked and depends on heavily - modular design.

The layer model has its risks as well as its advantages. The risk is
that we end up too fragmented, with too many maintainers who don't
communicate and nothing ever works together.

Even as the model stands today, its showing signs of strain. I posted
patches near enough three weeks ago for meta-raspberrypi, no response. I
know there are reasons why but they're not visible. The meta-fsl layers
appear to spend more of their time not building than building and
getting people to fix those in a timely fashion can sometimes be
challenging, particularly with the split between arm and ppc and some of
the transitions going on there etc.

Right now, I think there are enough splits causing enough
interoperability issues to be going on with in the layers and no, to be
quite honest I don't think more layers is the right answer right now.

I do continue to believe in the layer model but it is still evolving and
I'd really like us to focus on the current issues.

> I am sure we all want a solid release so I am also sure Tomas wouldn't
> put experimental version of clutter near of release.

From what I read of Tomas' emails, I actually think his plans differ
from that as he finds that aspect of OE-Core frustrating.

>  We are eating our
> own dog food so we are all interested in make it work, not the
> opposed. In this case I think it can be well coordinated.
>
> One possible thing is you could require AB used layers to be at
> git.yoctoproject.org so in case of broken recipes (bbappend or so) you
> could  rename it.

I don't touch layers I don't maintain. If I did that, I would get hung,
drawn and quartered. Please at least think through things like this
before saying them :(. Can you imagine what you'd say to me if I pushed
commits to meta-fsl-arm? 

This isn't even hypothetical, I have already been "told off" for pushing
to repos I am not the official maintainer for in much less controversial
circumstances than this. The offence was not writing a detailed enough
commit message to conform to that repository's guidelines. FWIW, I
believe the maintainer was right to object.

Cheers,

Richard




