Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Pv9aQ-0002Oy-EE
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 15:33:02 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Mar 2011 06:31:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,258,1297065600"; d="scan'208";a="396963539"
Received: from unknown (HELO [10.255.17.39]) ([10.255.17.39])
	by azsmga001.ch.intel.com with ESMTP; 03 Mar 2011 06:31:22 -0800
From: Joshua Lock <josh@linux.intel.com>
To: Chris Larson <clarson@kergoth.com>
In-Reply-To: <AANLkTikBJWF_azi5NzsOrSJLWGvcj+Fr+nm0+kFzdT-b@mail.gmail.com>
References: <4D6E7EB1.5080602@windriver.com>
	<41F9E0FC-E0A1-4C7F-8999-3E1B53FDDEE1@dominion.thruhere.net>
	<1299157757.2550.5.camel@scimitar>
	<E900D076-3678-445D-89D2-973EC3A558A8@dominion.thruhere.net>
	<1299161111.2550.8.camel@scimitar>
	<AANLkTinAUZ72Tfmm4K8F5kJDLUrfO6AmzEKaLfG9NX5x@mail.gmail.com>
	<AANLkTikBJWF_azi5NzsOrSJLWGvcj+Fr+nm0+kFzdT-b@mail.gmail.com>
Date: Thu, 03 Mar 2011 14:31:16 +0000
Message-ID: <1299162676.2550.21.camel@scimitar>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 (2.32.1-1.fc14) 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: oe-core cleanup...
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
X-List-Received-Date: Thu, 03 Mar 2011 14:33:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 07:21 -0700, Chris Larson wrote:
On Thu, Mar 3, 2011 at 7:14 AM, Chris Larson <clarson@kergoth.com>
wrote:
> > On Thu, Mar 3, 2011 at 7:05 AM, Joshua Lock <josh@linux.intel.com>
wrote:
> >> I agree, in fact yesterday I discovered we have the beginnings of
such a
> >> tool (bitbake-layers) written by Chris. Currently it prints out
which
> >> recipes are being modified by a .bbappend and .bbappend files for
which
> >> no recipe exists.
> 
> Note that it also warns about bbappending to a non-preferred version
> of a recipe, but not bbappending to the preferred version of the
> recipe, to cover the case where a bump of an earlier layer adds a new
> version without removing the old.  I was trying to catch all the cases
> where your local changes might seem "lost" when updating things.

Ah, that's a nice feature that I'd missed (I don't have any such recipes
in the layers I'm using).

> On another note, I was really surprised at just how painless it was to
> create a new standalone tool to do this, considering it bypasses much
> of the infrastructure which the main bitbake tool uses.  There are
> definitely still some hiccups in bitbake we should fix to make it
> easier, but it wasn't bad at all, which was great to see, and we'll
> have to think about what other standalone tools might be useful in the
> long term.
>
Yes indeed. I was pleased when I discovered bitbake-layers and even more
pleased when I saw how concise a program it is.

I'd love to see a wiki-page or some such where we can collaborate on
tools ideas. I'm slowly understanding more and more of BitBake and
gaining an increased appreciation of Python so little hack project ideas
would be welcome.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



