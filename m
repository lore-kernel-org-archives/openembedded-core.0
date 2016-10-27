Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id C0ADA70178
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 13:56:38 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20161027135638221_0486;
	Thu, 27 Oct 2016 13:56:38 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=37598 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bzlAU-0006tQ-Qu; Thu, 27 Oct 2016 09:56:30 -0400
Date: Thu, 27 Oct 2016 09:55:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Olof Johansson <olof.johansson@axis.com>
In-Reply-To: <20161027132619.GJ20437@axis.com>
Message-ID: <alpine.LFD.2.20.1610270939290.16783@localhost.localdomain>
References: <alpine.LFD.2.20.1610270533590.12908@localhost.localdomain>
	<alpine.LFD.2.20.1610270833260.15014@localhost.localdomain>
	<20161027132619.GJ20437@axis.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how to add new perl modules to stock OE build?
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
X-List-Received-Date: Thu, 27 Oct 2016 13:56:40 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Oct 2016, Olof Johansson wrote:

> On 16-10-27 08:46 -0400, Robert P. J. Day wrote:
> >
> >   ack ... never mind, i see my fundamental misunderstanding. i
> > thought all of the recipes being processed via the "perl-modules"
> > package were being (if necessary) downloaded from CPAN, or
> > something like that, then turned into installable rpms. i didn't
> > look closely enough into the perl source to see that all the
> > modules listed in "perl-rdepends_5.22.1.inc" are already in the
> > perl source tree.
> >
> >   so i'm back to my original question -- what is the proper way to
> > add arbitrary perl modules to an image? if someone has a simple
> > example of how it's done, that'd be great. as proof-of-concept,
> > i'd like to add the Text::Template module to my "qemuppc" target.
> >
> >   thoughts? sorry for all the earlier noise, i thought i had it
> > figured out but ... no.
>
> Hi,
>
> Take a look at meta-perl in the meta-openembedded repository. It
> contains a lot of recipes for Perl modules (Text::Template isn't one
> of them though).

  yes, i *finally* clued in to how it's done ... i'll just start
whipping together recipes files for the modules i need, given that
most of them will be standard boilerplate, it shouldn't take that
long, just make a list and start writing.

> The cpan class in oe-core knows how to build Makefile.PL
> (ExtUtils::MakeMaker) based perl modules (like Text::Template), and
> cpan_build knows how to handle Build.PL (Module::Build) based perl
> modules.

  yup, i noticed that, too.

> Note also the naming convention of perl-module-foo is used by core
> modules (those shipped with perl itself); the convention used for
> third party cpan modules is "libfoo-perl", e.g.
> libtext-template-perl.

  ah, i was unaware of that, thanks. so i'll know how to name my
recipes now, thanks very much.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


