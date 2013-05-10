Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UarGN-0000QR-An for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 19:38:05 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4AHMEAE016984; Fri, 10 May 2013 18:22:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rZ1P7pAR5J0I; Fri, 10 May 2013 18:22:14 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4AHMBVI016975
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 10 May 2013 18:22:13 +0100
Message-ID: <1368206371.11129.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Fri, 10 May 2013 18:19:31 +0100
In-Reply-To: <518D22CC.1040002@r-finger.com>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com> <1368185566.11129.28.camel@ted>
	<518D22CC.1040002@r-finger.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 10 May 2013 17:38:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-05-10 at 17:39 +0100, Tomas Frydrych wrote:
> On 10/05/13 12:32, Richard Purdie wrote:
> > On Fri, 2013-05-10 at 11:56 +0100, Tomas Frydrych wrote:
> >> On 10/05/13 10:05, Richard Purdie wrote:
> > The closely track upstream is the key part and I think the core can do
> > this, apart from the ~six week stabilisation window.
> 
> If you mean you are prepared to do frequent point releases to keep up
> with clutter, that could work. But if you mean that those interested can
> closely track oe-core master, then that is not that useful, there are
> too many other changes happening at the same time. A small single
> purpose layer means updates (and breakages) can be very contained.

Point releases of what? I don't mind clutter in master changing quite a
lot up to our stabilisation point. Once we've released, I don't mind
someone else picking up a danny-clutter branch or something like that
which is backporting specific changes.

> > My argument for this is that I really do want to stress out the graphics
> > stack we have, clutter provides a good way to test some of those
> > components, particularly some of the more unusual parts. Currently its
> > mostly build test however we do have plans to make that runtime too. I
> > do think that clutters unusual usage of the stack makes it particular
> > useful in this role. I'd appreciate help from anyone who can help make
> > this all work.
> 
> I am all for this, but does using clutter for automated tests require
> for the clutter packages to be in oe-core? The only thing you can stress
> test in oe-core using clutter is mesa, which is only applicable to the
> i915/i965 chip sets. I think it would be useful if any such tests could
> be applied to other graphics stacks provided by BSPs; I think all of the
> BSPs would benefit from this.

We'd be able to test mesa and the software fallbacks under qemu which
would be a start. If we can get those working with a decent framework
for the tests, I'm hoping wider BSP testing would follow. I don't have
unlimited resources available but I can try and get the software
infrastructure to the point where doing the testing could be picked up
by someone else relatively easily.

It is a big help in trying to achieve this if we don't have many
different layers involved as that would complicate the problem, even
coordinating layer releases between different maintainers is tricky
right now and trying to develop something like this over layer
boundaries sounds like adding to the complexity to the point I'd rather
just scrap the idea :(.

> I'd really like for people to be able to just pick up uptodate and
> working clutter packages for the major platforms the actively maintained
> BSPs support.

Agreed.

>  Every so often someone asks about clutter for XYZ (usually
> the Beagleboard or RPi) on the clutter list: this should be readily
> available somewhere.

I'd hope the recipes in the core would be in a good state in this
regard.

Have a good weekend.

Cheers,

Richard




