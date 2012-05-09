Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SS9V2-0003OD-C4
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 18:12:24 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SS9LV-0005CA-J3
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 18:02:33 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 May 2012 17:02:32 +0100
In-Reply-To: <CADkTA4PQbCqC6SrTA-v7vZ70ruqSSzxKObFudvMiYaXpCLMT1g@mail.gmail.com>
References: <cover.1336535085.git.bruce.ashfield@windriver.com>
	<893d8018c655f70ada731eaf5f03b178f4dfe2b3.1336535085.git.bruce.ashfield@windriver.com>
	<4FAA8FEF.9050702@linux.intel.com>
	<CADkTA4PQbCqC6SrTA-v7vZ70ruqSSzxKObFudvMiYaXpCLMT1g@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1336579353.5602.98.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 09 May 2012 16:12:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-09 at 11:48 -0400, Bruce Ashfield wrote:
> On Wed, May 9, 2012 at 11:40 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> >
> >
> > On 05/08/2012 08:48 PM, Bruce Ashfield wrote:
> >> Updating the SRCREV to pickup the following fix:
> >>
> >>     createme: fix checkpoint restoration for reset branches
> >>
> >>     The meta branch can optionally be merged out to BSP branches. This removes
> >>     the need to restore the checkpoint when working with the tree.  The way
> >>     it detects the merge is by checking to see how many branches contain the
> >>     meta data. If there's more than one, the branch was was merged out.
> >>
> >>     Unless you are a BSP that isn't tracking the latest meta, and you get
> >>     meta and meta-orig created. That's two branches and the code opts to not
> >>     restore the checkpoint, which leads to configuration errors.
> >>
> >>     The fix is simple. We allow for 2 or less branches with meta, and will
> >>     still restore the checkpoint. Three and up, we won't.
> >>
> >
> > Uhm... am I the only one for whom this language is really confusing?
> > "merged out" ?
> > "restore the checkpoint" ?
> 
> I could be more verbose, but it's like reading a kernel -mm commit. I
> don't grok everything they write, but they aren't writing it for me as a
> -mm newbie.

So, who exactly is the target audience for the above text?  I'm not sure
that "really confusing" does it justice: from my point of view (though
admittedly I am very far from being an eleet k3rn3l h4x0r) it just looks
like gibberish.  If it's going into oe-core then I would have hoped that
the checkin comment would be intelligible to oe-core users at large, not
just those who are schooled in the mysterious ways of some particular
subgroup.

p.




