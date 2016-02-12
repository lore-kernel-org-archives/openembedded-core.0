Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 82ACA62137
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 22:08:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 12 Feb 2016 14:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,437,1449561600"; d="scan'208";a="651467200"
Received: from dmcerlea-mobl1.ger.corp.intel.com (HELO
	jlock-mobl1.gar.corp.intel.com) ([10.252.13.227])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2016 14:08:23 -0800
Message-ID: <1455314901.3546.31.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 22:08:21 +0000
In-Reply-To: <1455282644.16142.313.camel@linuxfoundation.org>
References: <1455279342-5458-1-git-send-email-dmitry.rozhkov@intel.com>
	<1455280112.3546.7.camel@linux.intel.com>
	<1455282644.16142.313.camel@linuxfoundation.org>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH] os-release: remove double-quotes around VERSION_ID value
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
X-List-Received-Date: Fri, 12 Feb 2016 22:08:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-02-12 at 13:10 +0000, Richard Purdie wrote:
> On Fri, 2016-02-12 at 12:28 +0000, Joshua G Lock wrote:
> > On Fri, 2016-02-12 at 14:15 +0200, Dmitry Rozhkov wrote:
> > > man 5 os-release states that VERSION_ID is
> > > 
> > > "
> > > a lower-case string (mostly numeric, no spaces or other
> > > characters outside of 0-9, a-z, ".", "_" and "-")
> > > identifying the operating system version
> > > "
> > > 
> > > This becomes crucial when ClearLinux's software
> > > update mechanism is integrated into builds, because
> > > its client side ignores VERSION_ID's value if it
> > > doesn't conform the definition.
> > > 
> > > Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@intel.com>
> > 
> > I think we probably want this change, but we will also need to
> > change
> > the default assignment of VERSION_ID to match the rules:
> > 
> > "Variable assignment values must be enclosed in double or single
> > quotes
> > if they include spaces, semicolons or other special characters
> > outside
> > of A-Z, a-z, 0-9."
> > 
> > By default VERSION_ID is assigned DISTRO_VERSION, which contains
> > invalid characters for this field in both OE Core (defaultsetup
> > distro
> > uses "nodistro.0") and meta-yocto (poky distro uses something like
> > "2.0+snapshot-${DATE}" during development and something like
> > "1.8.1"
> > on
> > a release).
> > 
> > Thoughts on changing these?
> 
> nodistro.0 is ok isn't it?

It is yes, I wasn't paying enough attention earlier.

> 
> We should probably manipulate the string when writing this, "+" -> "-
> "
> and "A-Z" -> "a-z"?

That sounds like a good solution to me.

Regards,

Joshua

