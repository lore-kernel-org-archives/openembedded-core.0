Return-Path: <cshored@cshore.thecshore.com>
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
	by mail.openembedded.org (Postfix) with ESMTP id E03D677B06
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 01:38:13 +0000 (UTC)
Date: Fri, 17 Mar 2017 21:38:07 -0400
From: Daniel Dickinson <cshored@cshore.thecshore.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20170317213807.377236b9@danielf.thecshore.com>
In-Reply-To: <3a6a7bd6-a5e5-b139-bc2a-53d3b6b41da5@mlbassoc.com>
References: <20170317195515.35729bb7@danielf.thecshore.com>
	<3a6a7bd6-a5e5-b139-bc2a-53d3b6b41da5@mlbassoc.com>
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
X-List-Received-Date: Sat, 18 Mar 2017 01:38:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 18 Mar 2017 02:21:30 +0100
Gary Thomas <gary@mlbassoc.com> wrote:

> 
> Have you read this?
>    http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

I hadn't read in detail yet (I've seen similar before and from
skimming, it's about mechanics of the process), but I was looking more
in terms of coding and/or style guidelines for the meat of the patch,
and/or hints/tips on getting things accepted from the point of view of
things other than mechanics of patch submission.
 
> >
> > Also, in the layers list I'll be asking about some build issues
> > that I don't see with a manual bitbake, that look like missing
> > preqs on a build server, unless the layer should be requesting
> > installation of host files somewhere.  
> 
> Some tools required by ${HOSTTOOLS} are missing:
>    cpio chrpath gawk diffstat makeinfo

As mentioned these are openembedded.org autobuilds of submitted layers,
so I was kind of hoping there were something I could change in the
layer to make it work.  I guess the build host or chroot is missing
packges.

Regards,

Daniel

