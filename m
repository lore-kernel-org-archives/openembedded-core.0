Return-Path: <cshored@cshore.thecshore.com>
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
	by mail.openembedded.org (Postfix) with ESMTP id EC4B171D9D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 19:05:06 +0000 (UTC)
Date: Sat, 18 Mar 2017 15:05:01 -0400
From: Daniel Dickinson <cshored@cshore.thecshore.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20170318150501.26819aee@danielf.thecshore.com>
In-Reply-To: <bdebc471-dded-69fb-1ae1-d27e1ec751ed@gmail.com>
References: <20170317195515.35729bb7@danielf.thecshore.com>
	<3a6a7bd6-a5e5-b139-bc2a-53d3b6b41da5@mlbassoc.com>
	<bdebc471-dded-69fb-1ae1-d27e1ec751ed@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Hints on submitting to OE-Core
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
X-List-Received-Date: Sat, 18 Mar 2017 19:05:07 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 18 Mar 2017 01:42:06 -0700
akuster808 <akuster808@gmail.com> wrote:

> On 03/17/2017 06:21 PM, Gary Thomas wrote:
> > On 2017-03-18 00:55, Daniel Dickinson wrote:  
> >> Hi all,
> >>
> >> I've got a pre-alpha 'distro' and some layers I think that could
> >> get to an interesting state.  The intent is to work them up to
> >> where they are suitable to be submitted as patches to oe-core
> >> rather than the current .bbappend and related files.
> >>
> >> There's rather a lot of reading (which is good in the sense that I
> >> like actually have documentation, although that's definitely an
> >> area I need to improve on for the layers I've got in the works),
> >> and I haven't nearly got through it all yet, but I was hoping for
> >> pointers on the most important bits to read for prepping patches
> >> submission.  
> >
> > Have you read this?
> > http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded  
> 
> To be honest, OE-core does not even comply to the basic standard of a 
> README. It missing patch submission info like many other layers do

Hmmm...just looked at master and there is a pointer to the wiki (which
I would considered the canonical location and better than duplicating
in multiple repos).

> nor does in include the Maintainer.

That's in 'meta/conf/bitbake.conf' or per-recipe (since there is no
single maintainer for the whole layer IIRC).

Regards,

Daniel

> 
> - armin
> >  
> >>
> >> Also, in the layers list I'll be asking about some build issues
> >> that I don't see with a manual bitbake, that look like missing
> >> preqs on a build server, unless the layer should be requesting
> >> installation of host files somewhere.  
> >
> > Some tools required by ${HOSTTOOLS} are missing:
> >   cpio chrpath gawk diffstat makeinfo
> >  
> 


