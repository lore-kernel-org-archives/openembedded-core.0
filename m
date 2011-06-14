Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWSvR-0004L5-SI for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 14:40:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5ECbXA3012581
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 13:37:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12190-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 13:37:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5ECbNlp012575
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 13:37:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308043725.25285.232.camel@phil-desktop>
References: <cover.1307937636.git.raj.khem@gmail.com>
	<1307955075.6879.11.camel@lenovo.internal.reciva.com>
	<BANLkTikbba0xTCB=eLZamP7LY6wJ8_Nkhw@mail.gmail.com>
	<1308043725.25285.232.camel@phil-desktop>
Date: Tue, 14 Jun 2011 13:37:03 +0100
Message-ID: <1308055023.15712.333.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Upgrade gcc 4.6.0 to latest on FSF 4.6 branch
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
X-List-Received-Date: Tue, 14 Jun 2011 12:40:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 10:28 +0100, Phil Blundell wrote:
> On Mon, 2011-06-13 at 10:12 -0700, Khem Raj wrote:
> > On Mon, Jun 13, 2011 at 1:51 AM, Phil Blundell <pb@pbcl.net> wrote:
> > > On Sun, 2011-06-12 at 21:03 -0700, Khem Raj wrote:
> > >> This patch brings in new patches from gcc 4.6 FSF branch
> > >> And refreshes the headers of existing backported patches
> > >> to not have git patch numbers in comments
> > >>
> > >> I am not sending the patch itself to mailing list due to its
> > >> large size so please review it on the contrib tree itself
> > >>
> > >
> > > Would we not be better off just pulling the tip of the 4.6 branch from
> > > FSF SVN, rather than having to keep all these patches in git?
> > >
> > 
> > there is dislike for this approach in oe-core. As the release point is preferred
> > I suggested to drop the minor release number and call the recipes 4.6
> > and use SVN
> > REVs to track the recipe updates but it did not fly :)
> 
> Where does that dislike come from?  Koen did make a comment about having
> liked svn checkouts for 4.5 "very, very much" but I couldn't quite
> figure out whether he was being sarcastic or not and, if so, what
> exactly his objection was.
>
> I could understand there being a preference for individual patchsets if
> we were just going to cherry-pick carefully selected bugfixes from the
> branch and patch them in.  But, if we're going to take the approach of
> just importing everything from the branch en masse, it seems like
> keeping them as patches is just making more work for ourselves.
> 
> We're using svn checkouts for eglibc, which seems to be working well
> enough and hasn't provoked any particular outrage that I noticed.

I think it was my dislike that Khem is referring to. I was under the
impression that we were going to be more selective that just taking
everything (e.g. the translation updates probably aren't essential to
us).

I realise its easier to just take everything though and if we are going
to do that it probably does make sense to use svn directly. I'll take a
patch to do that.

Cheers,

Richard




