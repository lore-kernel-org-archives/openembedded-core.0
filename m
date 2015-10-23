Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id A2CED60034
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 12:57:50 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20151023125748559_0484;
	Fri, 23 Oct 2015 12:57:48 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [173.38.117.71] (port=45416 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ZpbvT-0004vo-9o; Fri, 23 Oct 2015 08:58:31 -0400
Date: Fri, 23 Oct 2015 08:57:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <2338694.BfAL3tqMdu@peggleto-mobl.ger.corp.intel.com>
Message-ID: <alpine.LFD.2.20.1510230854570.5915@localhost>
References: <alpine.LFD.2.20.1510230754010.4583@localhost>
	<2338694.BfAL3tqMdu@peggleto-mobl.ger.corp.intel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: why does sysfsutils-2.1.0.bb set S = "${WORKDIR}/sysfsutils-${PV}"?
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
X-List-Received-Date: Fri, 23 Oct 2015 12:57:52 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Oct 2015, Paul Eggleton wrote:

> Hi Robert,
>
> On Friday 23 October 2015 08:02:11 Robert P. J. Day wrote:
> >   side note: the first in a small set of posts where i simply want to
> > clarify minor oddities i run across in oe-core, not because they have
> > any desperate need to be fixed, but more because when i'm teaching
> > courses in oe/yocto, i run across the occasional weirdness that
> > puzzles students, and forces me to try to explain it, and sometimes
> > the explanation is, "that's just silly." so here's the first one.
> >
> >   as i read in bitbake.conf, the default source directory for any
> > recipe is defined as:
> >
> >   S = "${WORKDIR}/${BP}"
> >
> > which suggests that, as long as processing a recipe ends up using that
> > value as the source directory, there is no need for a recipe to
> > redefine S. kind of obvious, no?
> >
> >   in the case of sysfsutils-2.1.0.bb, one sees the line:
> >
> > S = "${WORKDIR}/sysfsutils-${PV}"
> >
> > which, given the standard definitions for variables BP and PV, seems
> > to expand into precisely the default value given in bitbake.conf.
> >
> >   so, unless i'm missing something, is there any actual need for that
> > line in the sysfsutils recipe file? is there something more subtle
> > going on here that i don't understand?
>
> I don't think so, it appears that line goes way back to the initial
> population of the repository. Looks like we could just drop it.

  thanks for the clarification. i realize that stuff like this is
annoyingly pedantic for developers and expert users, but it's
*exactly* the kind of thing students in my classes occasionally point
out and ask me to explain, and i stand there looking kind of baffled,
muttering, "what the hell ..."

  i'm about to update all my courseware so i'll just collect as many
of those as i can find and submit as a single patch.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



