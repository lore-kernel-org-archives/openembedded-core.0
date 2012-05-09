Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSCxl-0006Zx-K3 for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 21:54:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49JiPEC025581
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 20:44:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23680-08 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2012 20:44:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49Jhjs6025573
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 20:43:46 +0100
Message-ID: <1336592624.2494.68.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 May 2012 20:43:44 +0100
In-Reply-To: <CADkTA4NG8Ncge_7miPc38tzConX0FxJN-By+RmzO01Y3j4F3Cg@mail.gmail.com>
References: <cover.1336535085.git.bruce.ashfield@windriver.com>
	<893d8018c655f70ada731eaf5f03b178f4dfe2b3.1336535085.git.bruce.ashfield@windriver.com>
	<4FAA8FEF.9050702@linux.intel.com>
	<CADkTA4PQbCqC6SrTA-v7vZ70ruqSSzxKObFudvMiYaXpCLMT1g@mail.gmail.com>
	<1336579353.5602.98.camel@phil-desktop>
	<CADkTA4OFZN+mH8e1ub+jcbhnvpqQf7nkU+D=sBiHj6oUoA3Pfw@mail.gmail.com>
	<CADkTA4NG8Ncge_7miPc38tzConX0FxJN-By+RmzO01Y3j4F3Cg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] kern-tools: checkpoint restoration for reset branches
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
X-List-Received-Date: Wed, 09 May 2012 19:54:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-09 at 12:42 -0400, Bruce Ashfield wrote:
> On Wed, May 9, 2012 at 12:11 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Wed, May 9, 2012 at 12:02 PM, Phil Blundell <philb@gnu.org> wrote:
> >> On Wed, 2012-05-09 at 11:48 -0400, Bruce Ashfield wrote:
> >>> On Wed, May 9, 2012 at 11:40 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> >>> >
> >>> >
> >>> > On 05/08/2012 08:48 PM, Bruce Ashfield wrote:
> >>> >> Updating the SRCREV to pickup the following fix:
> >>> >>
> >>> >>     createme: fix checkpoint restoration for reset branches
> >>> >>
> >>> >>     The meta branch can optionally be merged out to BSP branches. This removes
> >>> >>     the need to restore the checkpoint when working with the tree.  The way
> >>> >>     it detects the merge is by checking to see how many branches contain the
> >>> >>     meta data. If there's more than one, the branch was was merged out.
> >>> >>
> >>> >>     Unless you are a BSP that isn't tracking the latest meta, and you get
> >>> >>     meta and meta-orig created. That's two branches and the code opts to not
> >>> >>     restore the checkpoint, which leads to configuration errors.
> >>> >>
> >>> >>     The fix is simple. We allow for 2 or less branches with meta, and will
> >>> >>     still restore the checkpoint. Three and up, we won't.
> >>> >>
> >>> >
> >>> > Uhm... am I the only one for whom this language is really confusing?
> >>> > "merged out" ?
> >>> > "restore the checkpoint" ?
> >>>
> >>> I could be more verbose, but it's like reading a kernel -mm commit. I
> >>> don't grok everything they write, but they aren't writing it for me as a
> >>> -mm newbie.
> >>
> >> So, who exactly is the target audience for the above text?  I'm not sure
> >> that "really confusing" does it justice: from my point of view (though
> >> admittedly I am very far from being an eleet k3rn3l h4x0r) it just looks
> >> like gibberish.  If it's going into oe-core then I would have hoped that
> >> the checkin comment would be intelligible to oe-core users at large, not
> >> just those who are schooled in the mysterious ways of some particular
> >> subgroup.
> >
> > It's a quote from the kern-tools commit log. I could just put: 'fixes stuff',
> > but that's not good either. Writing a novel isn't good either.
> >
> > I'm not sure why everyone is having such an issue with this, there's many
> > other examples of commits like this, and everyone sits in a glass house
> > in this regard.
> >
> > I can re-work it of course, I wrote it very late at night to fix a
> 
> I rewrote the SRCREV update commit into something more legible. It's on
> the same branch as the original pull request.

Thanks, I think this is a timely reminder to everyone to think about the
people who might read a commit message and try and make it meaningful to
them. I've merged the revised version to master.

Cheers,

Richard



