Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0CFC071C9B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2017 18:19:55 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170219181954483_0684;
	Sun, 19 Feb 2017 18:19:54 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=42364 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cfW5G-0005JP-MA; Sun, 19 Feb 2017 13:19:42 -0500
Date: Sun, 19 Feb 2017 13:19:42 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1487525710.30548.20.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1702191315090.8096@localhost.localdomain>
References: <alpine.LFD.2.20.1702181316120.26007@localhost.localdomain>
	<1487525710.30548.20.camel@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: possible consequences of adding "extraneous" layers to a build?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Feb 2017 18:19:56 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-338093792-1487528382=:8096"

--8323328-338093792-1487528382=:8096
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 19 Feb 2017, Richard Purdie wrote:

> On Sat, 2017-02-18 at 13:25 -0500, Robert P. J. Day wrote:
> >   (currently updating a pile of my OE online pages so i'm going to
> > ask a bunch of basic questions to make sure i'm not missing
> > anything.)
> >
> >   what are the basic rules for layer design such that you should
> > (theoretically) be able to toss a bunch of ostensibly superfluous
> > layers into a build, and it shouldn't make a difference? that is,
> > leaving aside obvious conflicts in having two layers trying to
> > define precisely the same thing, what are the only issues you
> > should worry about in throwing more layers into your
> > "bblayers.conf" file, even if you end up not using anything from
> > them?
> >
> >   first, it seems(?) clear that introducing new recipes or classes
> > or machines or distros in those additional layers should make no
> > difference -- if you weren't referring to any of those features
> > before, then if you don't change your configuration, you certainly
> > won't be referring to them now.
> >
> >   the most obvious consequence is that one or more .bbappend files
> > will tweak some recipes you were already building, so .bbappend
> > files strike me as, really, the only consequence of note.
> >
> >   the only thing that leaps to mind is if some really weird
> > content was placed in the new layers' "layer.conf" file, but that
> > strikes me as really bad design unless there's a good reason for
> > it.
> >
> >   so ... is there any other possible consequence of adding layers
> > to a build that i'm overlooking?
>
> A layer can do pretty much *anything* to the build. You can design
> layers not to have an impact, or the impact may be the whole purpose
> of the layer.
>
> With YP Compatible v2, we plan to detect "invasive" changes using
> the sstate checksums changing to show that the layer did something
> unexpected. But in general a layer can do pretty much anything.

  i understand that a layer can do pretty much *anything*, what i was
more interested in is what it *shouldn't* do unless it comes with huge
warning signs telling you about it. as a more concrete example, if
someone says, "hey, i have this great new layer that provides all
sorts of cool recipes," i'd want to to know that i can add it to
bblayers.conf and, unless i explicitly choose to start using content
from it, it shouldn't quietly change my current build.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-338093792-1487528382=:8096--
