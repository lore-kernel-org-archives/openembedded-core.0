Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D96E075E80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 13:08:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2015 06:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,186,1444719600"; d="scan'208";a="833844535"
Received: from fermanka-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.48])
	by fmsmga002.fm.intel.com with ESMTP; 23 Oct 2015 06:08:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 23 Oct 2015 14:08:13 +0100
Message-ID: <1661111.RNAJBORNki@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <alpine.LFD.2.20.1510230854570.5915@localhost>
References: <alpine.LFD.2.20.1510230754010.4583@localhost>
	<2338694.BfAL3tqMdu@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1510230854570.5915@localhost>
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 23 Oct 2015 13:08:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 23 October 2015 08:57:39 Robert P. J. Day wrote:
> On Fri, 23 Oct 2015, Paul Eggleton wrote:
> > Hi Robert,
> > 
> > On Friday 23 October 2015 08:02:11 Robert P. J. Day wrote:
> > >   side note: the first in a small set of posts where i simply want to
> > > 
> > > clarify minor oddities i run across in oe-core, not because they have
> > > any desperate need to be fixed, but more because when i'm teaching
> > > courses in oe/yocto, i run across the occasional weirdness that
> > > puzzles students, and forces me to try to explain it, and sometimes
> > > the explanation is, "that's just silly." so here's the first one.
> > > 
> > >   as i read in bitbake.conf, the default source directory for any
> > > 
> > > recipe is defined as:
> > >   S = "${WORKDIR}/${BP}"
> > > 
> > > which suggests that, as long as processing a recipe ends up using that
> > > value as the source directory, there is no need for a recipe to
> > > redefine S. kind of obvious, no?
> > > 
> > >   in the case of sysfsutils-2.1.0.bb, one sees the line:
> > > S = "${WORKDIR}/sysfsutils-${PV}"
> > > 
> > > which, given the standard definitions for variables BP and PV, seems
> > > to expand into precisely the default value given in bitbake.conf.
> > > 
> > >   so, unless i'm missing something, is there any actual need for that
> > > 
> > > line in the sysfsutils recipe file? is there something more subtle
> > > going on here that i don't understand?
> > 
> > I don't think so, it appears that line goes way back to the initial
> > population of the repository. Looks like we could just drop it.
> 
>   thanks for the clarification. i realize that stuff like this is
> annoyingly pedantic for developers and expert users, but it's
> *exactly* the kind of thing students in my classes occasionally point
> out and ask me to explain, and i stand there looking kind of baffled,
> muttering, "what the hell ..."

Indeed, having recently been in a classroom situation at the Yocto Project Dev 
Day (standing at the back helpling/heckling the presenter rather than teaching 
;) I know what you mean.

>   i'm about to update all my courseware so i'll just collect as many
> of those as i can find and submit as a single patch.

Great, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

