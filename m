Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UUz8h-0004ge-4C; Wed, 24 Apr 2013 14:49:40 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3OCWtP7026662; Wed, 24 Apr 2013 13:32:55 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kw4fbNeCWsoD; Wed, 24 Apr 2013 13:32:55 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3OCWqNQ026652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 24 Apr 2013 13:32:53 +0100
Message-ID: <1366806700.23738.151.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Wed, 24 Apr 2013 13:31:40 +0100
In-Reply-To: <1366799976.14512.21.camel@phil-desktop.brightsign>
References: <CA+YB3rb6xwk2-rsSa=dQx19qp7jKAVBZiMmQB5DvrGOmLUFG2Q@mail.gmail.com>
	<20130424064319.GD3217@jama> <1366790466.23738.86.camel@ted>
	<1366799976.14512.21.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] OpenEmbedded TSC 8 April 2013
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
X-List-Received-Date: Wed, 24 Apr 2013 12:49:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-04-24 at 11:39 +0100, Phil Blundell wrote:
> It's maybe worth pointing out that this change was discussed on the
> mailing list at the time.  During that thread, two members of the
> TSC spoke in favour of the change and neither they nor anybody else
> pointed out that it was contrary to the TSC's stated policy. 

I read it as one backing, the other made some clarifications on some
comments rather than saying they were (or were not) in favour. 

> So, although I agree it is a bit unfortunate that meta-oe has decided
> to go off and plough its own furrow, it doesn't seem that the TSC made
> much of an effort to dissuade them at the time and I can understand how
> Martin might have interpreted the responses he got as approval.

The TSC as a whole was not aware of this or some of its other members
may have been more vocal. Unfortunately I don't manage to read as much
of the oe-devel list as I'd like, particularly around things like the
current release.

> >At this point I assume I'm free to ignore the TSC since we now have
> >precedent for it?
> 
> As far as I know you've always been free to do that.  It's up to the TSC
> to enforce its own decisions if it wishes to.

FWIW I've always tried to respect the TSC as the decision making body
for the OE architecture. 

The fact we've not had to really test "TSC Enforcement" is probably a
sign that we've managed many things well as a project and should be
taken as a positive.

> All that said, I have had a suspicion for a while that the TSC is
> perhaps becoming superfluous to requirements.  When the TSC was first
> set up, the environment within which OE operated was very different:
> this was a time before the Yocto Project and before oe-core, when
> everything was in a single tree, a vast number of people had
> indiscriminate commit access, and there was no identified maintainer who
> was empowered to make decisions about which patches went in and which
> didn't.

Certainly times have massively changed and some of the issues that used
to exist are now very different.

> Nowadays it seems (and I don't intend this as a criticism) that most of the
> technical direction is coming from the Yocto side and the OE project
> itself is mostly just going along for the ride.  Plus, every layer does
> now have its own maintainer so the original power vacuum that the TSC
> was created to fill no longer exists.  In this sort of scenario it seems
> as though OE is rather over-equipped with governance mechanisms (the
> TSC, the e.V. board and the e.V. membership itself) that aren't
> necessarily accomplishing very much.

Whilst times have changed, the fundamental problem with OE could be
distilled down to "How can OE make a decision?". The agreement reached
was that the membership elect two bodies, one effectively administrative
and the other a technical one who between then guide the project between
them.

I don't think that problem has changed. The mechanics of how code gets
developed has but ultimately, OE still needs to be able to make
decisions. Whilst the Yocto Project specifically adopted the
"OpenEmbedded Architecture", it has worked hard to try and ensure that
OE does continue to reflect what it always has. Its a complex balancing
act but I think its been a net positive for everyone.

> Also, now that we have a multiplicity of layers rather than a single
> monolithic tree, it isn't entirely obvious where the TSC's authority
> begins and ends.  I think everyone would agree that oe-core falls under
> the aegis of the TSC, but beyond that it isn't totally obvious which
> layers do and don't count as part of "OE" for that purpose.

I guess the ideas around "Yocto Project Compatible" are the YP's
approach to some of those questions although it clearly doesn't address
things from an OE perspective.

For the record I'd also state I don't think it wise to try and stifle
innovation. I sometimes worry we do seemingly end up doing that although
it has never been anybody's intent. It is ok to do something
differently, experiment and innovate. Equally I do hope we can
ultimately maintain one great ecosystem rather than having multiple
semi-incompatible competing components so a natural pressure for
compatibility is a good thing.

> And finally, it's been apparent during the last few TSC and board
> elections that it is a bit of a struggle to attract high-quality
> candidates to stand for membership of either body.  I don't think we've
> had an election which was actually contested for quite some time: this
> makes the elections themselves seem like just a waste of everybody's
> time.
> 
> So, maybe it's time that we as a project had a bit of a re-think
> regarding what sort of governance structures we actually need and want
> in this day and age.

The problem of "quality candidates" also applies to layer maintainership
in general and submaintainers for OE-Core itself. I've talked about this
a lot with people in person but probably not much on list. Basically I'd
love to have more people acting as dedicated maintainers for areas,
collecting up patches and so on. I scale really badly. The trouble is
the role of layer maintainer is a lot of work and pretty thankless so
attracting those quality candidates is hard. Its not something you can
dip into and out of, its a pretty hefty commitment. People often only
want the positive parts, not the dull work.

The TSC has become less of a decision making body and more an interest
group which meets and tries to help the various parts of the project
keep moving and on track to the best interests of everyone. It struggles
as there is nobody the TSC can delegate "work" to other than its own
members. Those members do a lot of random things for the project which
do make a significant difference but are not the "technical decision"
remit of the TSC role (e.g. Paul's work in cleaning up the OE wiki). The
changes there were significant and possibly needed to be TSC sanctioned
however the TSC members ended up doing the work too. I think its good
work, the TSC also gives some oversight to the maintainership of OE-Core
so there is value there. Whether it now needs refactoring and into what
form, I don't know.

At this point I'd be interested to hear from others and to hear
proposals for what we do going forward.

I'd note that my seat on the TSC is due for re-election shortly too with
the process starting next month.

We are at an interesting point with the project. There are a lot of new
people using the system and slowly becoming more involved and more
knowledgeable. Many newcomers aren't probably ready to take on
maintainership roles or TSC seats right now. The position could be very
different in say 24 months time...

Cheers,

Richard



