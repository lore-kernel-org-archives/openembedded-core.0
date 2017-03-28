Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id D264A77A8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 09:49:45 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20170328094943195_0484;
	Tue, 28 Mar 2017 09:49:43 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=47674 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1csnkt-00062L-C7; Tue, 28 Mar 2017 05:49:35 -0400
Date: Tue, 28 Mar 2017 05:49:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <a2a91404-5204-b9e8-0506-40d7680d64ab@windriver.com>
Message-ID: <alpine.LFD.2.20.1703280548410.30434@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703110315570.17105@localhost.localdomain>
	<97985b49-64ba-3fae-58a6-6eee4ad8126c@gmail.com>
	<alpine.LFD.2.20.1703110455070.18594@localhost.localdomain>
	<a2a91404-5204-b9e8-0506-40d7680d64ab@windriver.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how does files/fs-perms.txt affect building base-files rpm?
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
X-List-Received-Date: Tue, 28 Mar 2017 09:49:47 -0000
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Mar 2017, Mark Hatle wrote:

> On 3/11/17 3:57 AM, Robert P. J. Day wrote:
> > On Sat, 11 Mar 2017, Khem Raj wrote:
> >
> >> On 3/11/17 12:30 AM, Robert P. J. Day wrote:
> >>>
> >>>   potentially a dumb question, but do the settings in
> >>> files/fs-perms.txt affect the building of the base-files rpm just
> >>> as they would affect the building of any other rpm?
> >>
> >> it should be executing fixup_perms() in PKGD before splitting the
> >> package, so yes it should run for all recipes.
> >
> >   so it is possible that, despite the manual settings in the
> > base-files do_install() task, fs-perms.txt might override some of
> > those settings. i'm not saying i've seen anything like that, just
> > clarifying the possibility.
>
> Yes, same for all packages.
>
> At one point I thought there was a comment in both the base-files
> and fs-perms.txt files reminding people they should be kept in sync.
> I am not finding that comment.

  that would seem to be an important comment to have ... i'll let
someone else decide on the wording and add it.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


