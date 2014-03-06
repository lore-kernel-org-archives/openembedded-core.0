Return-Path: <matt@arkanian.console-pimps.org>
Received: from arkanian.console-pimps.org (arkanian.console-pimps.org
	[212.110.184.194])
	by mail.openembedded.org (Postfix) with ESMTP id B8AD06E7D3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 11:02:12 +0000 (UTC)
Received: by arkanian.console-pimps.org (Postfix, from userid 1002)
	id B420C6C076; Thu,  6 Mar 2014 11:02:12 +0000 (GMT)
Received: from localhost (unknown [94.8.38.236])
	by arkanian.console-pimps.org (Postfix) with ESMTPSA id 7468E6C055;
	Thu,  6 Mar 2014 11:02:09 +0000 (GMT)
Date: Thu, 6 Mar 2014 11:02:08 +0000
From: Matt Fleming <matt@console-pimps.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20140306110208.GG17362@console-pimps.org>
References: <1394038191-26474-1-git-send-email-matt@console-pimps.org>
	<CADkTA4M=JH7cv+kxY58sCA7vgT5O+h-u-SgAgvzqXS=qb6heqA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4M=JH7cv+kxY58sCA7vgT5O+h-u-SgAgvzqXS=qb6heqA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Matt Fleming <matt.fleming@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: Inspect remote branches with git ls-remote
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
X-List-Received-Date: Thu, 06 Mar 2014 11:02:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 05 Mar, at 12:02:27PM, Bruce Ashfield wrote:
> Please cc' me directly on any kernel-yocto changes, I only noticed this
> by chance.
 
Noted.

> On Wed, Mar 5, 2014 at 11:49 AM, Matt Fleming <matt@console-pimps.org> wrote:
> >
> > Furthermore, the output of 'git branch' is subject to change and trying
> > to parse it could potentially lead to breakage in the future.
> 
> I've never had a problem with it in 7 years of the tools and their variants, so
> the point is arguable and could be dropped from the commit log.
 
I'm referring to this,

  http://git-blame.blogspot.co.uk/2013/06/checking-current-branch-programatically.html

> Good catch on the issue, like I said, I've never run into it .. but I
> can definitely see the need for the tweak.

OK, I'll send an updated version. Thanks for the review.

-- 
Matt Fleming, Intel Open Source Technology Center

