Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7965860556
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:55:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 19 Feb 2015 08:48:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="456839455"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Feb 2015 08:40:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 Feb 2015 16:55:44 +0000
Message-ID: <3100587.NflBacsYxf@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.6-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <CADkTA4NYnGhGUmi9ZSZZU3PYf7wA2Zj-u7HM8GhQbO5sU9AoTg@mail.gmail.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
	<CADkTA4NYnGhGUmi9ZSZZU3PYf7wA2Zj-u7HM8GhQbO5sU9AoTg@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] devtool and externalsrc improvements
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
X-List-Received-Date: Thu, 19 Feb 2015 16:55:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 19 February 2015 11:47:01 Bruce Ashfield wrote:
> On Thu, Feb 19, 2015 at 11:39 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > I've been attempting to enable usage of devtool with the kernel (which
> > effectively means using the externalsrc class with the kernel). This
> > doesn't really work yet due to lack of handling the kernel configuration,
> 
> I've always insisted/argued and designed in that externalsrc shouldn't touch
> the kernel configuration at all.
> 
> You are building a tree that is completely managed outside of the build
> system, and getting the kernel configuration in place is part of that
> management.
> 
> So I'm not convinced it is a problem that needs to be solved.

So, externalsrc still doesn't touch the configuration, and it is not my plan to 
make it do so. However, users do need some way of setting up that configuration 
when checking out those sources for the first time, and if that's to be of any 
use to someone who just wants to make some minor changes, it should be the 
exact same configuration you get when you build the recipe as normal. That is 
what I believe "devtool modify" (at least with -x) should be doing, given that 
it is one means you can use to set up a development environment if you do not 
have one already.

We can certainly talk about the mechanism and work out the best way to do it, 
such that it fits in with how linux-yocto works and meets user expectations. My 
intent with this series was to get us to the point where we can at least 
experiment and have that discussion.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

