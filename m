Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DE9F86CA71
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 15:56:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 08 Jan 2014 07:56:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,625,1384329600"; d="scan'208";a="455509740"
Received: from unknown (HELO helios.localnet) ([10.252.122.128])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2014 07:56:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 08 Jan 2014 15:56:04 +0000
Message-ID: <1759035.6JVm74GdRW@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-35-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52CC470A.9030302@linaro.org>
References: <52CC470A.9030302@linaro.org>
MIME-Version: 1.0
Subject: Re: Qt in OE-core
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
X-List-Received-Date: Wed, 08 Jan 2014 15:56:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

On Tuesday 07 January 2014 13:27:22 Trevor Woerner wrote:
> question:
> Should some version of Qt be included in openembedded-core, or should
> all recipes to add Qt be part of their own version-specific Qt layer?
> 
> background:
> openembedded-core[1] used to include recipes for Qt3, but as Qt3 became
> old these recipes were replaced with Qt4 and the Qt3 support was broken
> out into its own layer[2]. We're now at a point where Qt4 is getting old
> and Qt5 is "current". At some point we'll have to replace the Qt4
> support in [1] with support for Qt5. But we expect users will still want
> to use Qt4, so if the Qt4 support in [1] is replaced by support for Qt5,
> the Qt4 support will need to be broken out into its own layer. Qt5
> support is currently being developed on it's own layer[3].
> 
> This email thread is *not* to discuss when we should replace Qt4 with
> Qt5, then question is: should [1] include *any* Qt support, or should Qt
> be always in its own layer to be added as required by the distribution?
> 
> If we decide [1] should provide some Qt support, then we can discuss
> when we should replace the Qt4 support with Qt5 in [1]. But for now it
> would be nice to reach a consensus on whether or not [1] should include
> any Qt support at all or if it wouldn't just be easier to always have Qt
> support in its own version-specific layers to be added as required (if
> needed) by the distribution configuration.

I can see some benefits to having Qt in a separate layer, and this is not the 
first time this question has come up. However, one concern I have always had 
with Qt being moved out of OE-Core though is that I very much doubt the same 
will happen with GTK+ and GNOME UI components that we carry, which I think 
will lead to the (perhaps erroneous, but logical) assumption in new users' 
minds that we support or recommend these more than we do Qt. Given Qt's 
popularity in the embedded space I don't think this would be the right message 
to be sending out.

Any concrete ideas on how we would address this perception issue?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

