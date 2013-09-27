Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A3C6E61005
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 14:21:38 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Sep 2013 07:21:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,993,1371106800"; d="scan'208";a="300147235"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Sep 2013 07:21:39 -0700
Message-ID: <1380291699.31937.46.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 27 Sep 2013 09:21:39 -0500
In-Reply-To: <CAP9ODKpYNSJs-T=GTpa725A6GK32GykgPbv7w5KeiwPhXVLfzw@mail.gmail.com>
References: <cover.1380234931.git.tom.zanussi@linux.intel.com>
	<8dbedc35cbce3319722c012af0dad737773446f6.1380234931.git.tom.zanussi@linux.intel.com>
	<CAP9ODKpYNSJs-T=GTpa725A6GK32GykgPbv7w5KeiwPhXVLfzw@mail.gmail.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] wic: Initial code for wic (OpenEmbedded Image Creator)
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
X-List-Received-Date: Fri, 27 Sep 2013 14:21:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Otavio,

On Fri, 2013-09-27 at 11:01 -0300, Otavio Salvador wrote:
> Hello Tom,
> 
> On Thu, Sep 26, 2013 at 11:17 PM, Tom Zanussi
> <tom.zanussi@linux.intel.com> wrote:
> > Initial implementation of the 'wic' command.
> >
> > The 'wic' command generates partitioned images from existing
> > OpenEmbedded build artifacts.  Image generation is driven by
> > partitioning commands contained in an 'Openembedded kickstart' (.wks)
> > file specified either directly on the command-line or as one of a
> > selection of canned .wks files (see 'wic list images').  When applied
> > to a given set of build artifacts, the result is an image or set of
> > images that can be directly written onto media and used on a
> > particular system.
> >
> > 'wic' is based loosely on the 'mic' (Meego Image Creator) framework,
> > but heavily modified to make direct use of OpenEmbedded build
> > artifacts instead of package installation and configuration, things
> > already incorporated int the OE artifacts.
> >
> > The name 'wic' comes from 'oeic' with the 'oe' diphthong promoted to
> > the letter 'w', because 'oeic' is impossible to remember or pronounce.
> >
> > This covers the mechanics of invoking and providing help for the
> > command and sub-commands; it contains hooks for future commits to
> > connect with the actual functionality, once implemented.
> >
> > Help is integrated into the 'wic' command - see that for details on
> > usage.
> >
> > Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
> 
> Could you please elaborate why to make a new command instead of using
> the class system?
> 

This isn't an either/or thing - the initial requirements were that the
overall deployment effort end up being something that would be usable
both from an external tool as well as from within the class system.

This just happens to be the initial (easier) part of that, the external
tool, and I expect in 1.6 to be doing a lot of the harder part,
integration with the build system.

The most important part, I think, is that this provides a high-level
user-oriented 'language' (the kickstart files) that users can use to
define custom images, rather than having to muck around in class files
or variable settings, or write specialized scripts such as mkefidisk.sh
for example.

Making that available from a standalone tool such as 'wic' is
straightforward, doing the same from within the build system will
require more thought and work, but that's what I'm hoping to do in
1.6...

Tom





