Return-Path: <lsorense@csclub.uwaterloo.ca>
Received: from caffeine.csclub.uwaterloo.ca (caffeine.csclub.uwaterloo.ca
	[129.97.134.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5706960068
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 19:58:41 +0000 (UTC)
Received: by caffeine.csclub.uwaterloo.ca (Postfix, from userid 20367)
	id A6DEBC1754; Wed, 11 Oct 2017 15:58:40 -0400 (EDT)
Date: Wed, 11 Oct 2017 15:58:40 -0400
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20171011195840.a5zdzlrm4rn2b2zl@csclub.uwaterloo.ca>
References: <20171011190313.ptqnubjcszlo23ns@csclub.uwaterloo.ca>
	<20171011191518.avvpmvug6pr7hafj@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20171011191518.avvpmvug6pr7hafj@mentor.com>
User-Agent: NeoMutt/20170113 (1.7.2)
From: lsorense@csclub.uwaterloo.ca (Lennart Sorensen)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Why is dnrd blacklisted?
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
X-List-Received-Date: Wed, 11 Oct 2017 19:58:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 11, 2017 at 03:15:18PM -0400, Joe MacDonald wrote:
> [Why is dnrd blacklisted?] On 17.10.11 (Wed 15:03) Lennart Sorensen wrote:
> 
> > There is a blacklist entry in the recipe for dnrd claiming there are QA
> > issues in the package.
> > 
> > However when the blacklist is removed and the package is built, there
> > are no QA warnings at all from the package and it seems to be working
> > perfectly fine.
> > 
> > Could this blacklist be removed since it makes it harder to build than
> > it has to be and there is apparently nothing wrong with the recipe in
> > the first place.
> 
> Even more so since it was actually removed about a month ago from the
> tree.  :-)
> 
> But yes, I'm happy to consider a patch that resurrects it if it seems to
> be working now.  I couldn't find the discussion around the QA error in
> the mailing list, so it was probably something that came up over IRC.  I
> don't know.  If it was something the world build found there's (almost?)
> always a link to the build log.

I certainly couldn't find anywhere explaining what the problem was either.

So far it appears fine.

We were using it in yocto 1.8, and now that we are moving to 2.3 we
want to keep using it, and other than the blacklist entry there does
not appear to be a problem.

It does not appear to have been removed from 2.3 of course, but I could
believe it was removed from the master tree (since I didn't check there).

It would certainly make my life easier if the blacklist was removed
(especially in 2.3.x) and the recipe stayed around.  It doesn't appear
to need any fixing at this time.

-- 
Len Sorensen

